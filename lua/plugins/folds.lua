return {
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        opts = {},
        init = function()
            vim.o.foldcolumn = '1'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Using ufo provider need remap `zR` and `zM` to prevent changes to foldlevel.
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
            vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
            vim.keymap.set('n', 'K', function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end)

            -- Use LSP capabilities (add on top of capabilities, not replace).
            local ufo_capabilities = vim.lsp.protocol.make_client_capabilities()
            ufo_capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }

            local function enhance_capabilities(capabilities)
                capabilities.textDocument = capabilities.textDocument or {}
                capabilities.textDocument.foldingRange = vim.tbl_deep_extend(
                    "force",
                    capabilities.textDocument.foldingRange or {},
                    ufo_capabilities.textDocument.foldingRange
                )
            end

            -- Hook into LSP attach to modify capabilities
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client then
                        enhance_capabilities(client.server_capabilities)
                    end
                end
            })
        end,

    },
    {
        'chrisgrieser/nvim-origami',
        event = "VeryLazy",
        opts = {},
        init = function()
            -- Also use left and right arrows for opening/closing folds while keeping origami's default map of h and l.
            vim.keymap.set("n", "<Left>", function() require("origami").h() end)
            vim.keymap.set("n", "<Right>", function() require("origami").l() end)
        end,
    }
}
