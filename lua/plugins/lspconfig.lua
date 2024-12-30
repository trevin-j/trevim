return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} }, -- LSP Status Updates.
    'hrsh7th/cmp-nvim-lsp', -- extra capabilities by nvim-cmp.
  },
  config = function()
    -- Execute this on LSP Attach to buffer.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        -- Make adding keymaps a bit easier/quicker
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        t_b = require 'telescope.builtin'

        map('gd', t_b.lsp_definitions, '[G]oto [D]efinition')
        map('gr', t_b.lsp_references, '[G]oto [R]eferences')
        map('gi', t_b.lsp_implementations, '[G]oto [I]mplementations')
        map('<leader>td', t_b.lsp_type_definitions, '[T]ype [D]efinition')
        map('<leader>ds', t_b.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', t_b.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rs', vim.lsp.buf.rename, '[R]ename [S]ymbol') -- Easy refactoring! :)
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration') -- Declaration, not definition :/

        -- Temporarily highlight references of the word under the cursor! :-)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- Inline hints hmm
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- Tell LSPs what capabilities we have :)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Put LSPs to always install here :D
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      -- rust_analyzer = {
      --   procMacro = {
      --     enable = true
      --   },
      --   cargo = {
      --     features = "all"
      --   }
      -- }
    }

    local lspconfig = require('lspconfig')

    -- GDScript LSP - connect to Godot!
    lspconfig['gdscript'].setup {
      name = 'godot',
      cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
      on_attach = function(client, bufnr)
        local _notify = client.notify
        client.notify = function(method, params)
          -- Godot LSP doesn't support `textDocument/didClose` yet.
          if method == 'textDocument/didClose' then
            return
          end
          _notify(method, params)
        end
      end,
    }

    -- Rust analyzer configs
    -- lspconfig.rust_analyzer.setup {
    --   settings = {
    --     ['rust-analyzer'] = {
    --       procMacro = {
    --         -- enable = true,
    --         ignored = {
    --           leptos_macro = {
    --             "component",
    --             "server",
    --           }
    --         }
    --       },
    --       cargo = {
    --         features = {"ssr"},
    --       },
    --     }
    --   }
    -- }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup {
            settings = {
              ['rust-analyzer'] = {
                procMacro = {
                  -- enable = true,
                  ignored = {
                    leptos_macro = {
                      -- "component",
                      "server",
                    }
                  }
                },
                cargo = {
                  features = {"ssr"},
                },
              }
            }
          }
        end,
      },
    }
  end,
}
