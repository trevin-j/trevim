return {
  'saecki/crates.nvim',
  tag = 'stable',
  event = { "BufRead Cargo.toml" },
  opts = {
    lsp = {
      enabled = true,
      on_attach = function(client, bufnr)
      end,
      actions = true,
      completion = true,
      hover = true,
    },
  },
  init = function()
    local crates = require("crates")
    local opts = { silent = true }

    vim.keymap.set("n", "<leader>rt", crates.toggle, opts)
    vim.keymap.set("n", "<leader>rr", crates.reload, opts)

    vim.keymap.set("n", "<leader>rv", crates.show_versions_popup, opts)
    vim.keymap.set("n", "<leader>rf", crates.show_features_popup, opts)
    vim.keymap.set("n", "<leader>rd", crates.show_dependencies_popup, opts)

    vim.keymap.set("n", "<leader>ru", crates.update_crate, opts)
    vim.keymap.set("v", "<leader>ru", crates.update_crates, opts)
    vim.keymap.set("n", "<leader>ra", crates.update_all_crates, opts)
    vim.keymap.set("n", "<leader>rU", crates.upgrade_crate, opts)
    vim.keymap.set("v", "<leader>rU", crates.upgrade_crates, opts)
    vim.keymap.set("n", "<leader>rA", crates.upgrade_all_crates, opts)

    vim.keymap.set("n", "<leader>rx", crates.expand_plain_crate_to_inline_table, opts)
    vim.keymap.set("n", "<leader>rX", crates.extract_crate_into_table, opts)

    vim.keymap.set("n", "<leader>rH", crates.open_homepage, opts)
    vim.keymap.set("n", "<leader>rR", crates.open_repository, opts)
    vim.keymap.set("n", "<leader>rD", crates.open_documentation, opts)
    vim.keymap.set("n", "<leader>rC", crates.open_crates_io, opts)
    vim.keymap.set("n", "<leader>rL", crates.open_lib_rs, opts)
  end,
}
