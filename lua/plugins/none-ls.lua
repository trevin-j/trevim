return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvimtools/none-ls-extras.nvim',
  },
  config = function()
    local null_ls = require('null-ls')
    local b = null_ls.builtins

    null_ls.setup {
      sources = {
        require('none-ls.code_actions.eslint'),
        b.code_actions.gitsigns,
        b.diagnostics.codespell,
        b.diagnostics.commitlint,
        b.diagnostics.dotenv_linter,
        b.diagnostics.editorconfig_checker,
        require('none-ls.diagnostics.eslint'),
        b.diagnostics.gdlint,
        b.diagnostics.gitlint,
        b.diagnostics.hadolint,
        b.diagnostics.ltrs,
        b.diagnostics.markdownlint,
        b.diagnostics.proselint,
        b.diagnostics.pydoclint,
        b.diagnostics.pylint,
        b.diagnostics.sqlfluff,
        b.diagnostics.stylelint,
        b.diagnostics.write_good,
        b.diagnostics.zsh,
        b.formatting.biome,
        b.formatting.black,
        b.formatting.cbfmt,
        b.formatting.codespell,
        require('none-ls.formatting.eslint'),
        b.formatting.isort,
        b.formatting.leptosfmt,
        b.formatting.ocdc,
        b.formatting.prettier,
        b.formatting.remark,
        b.formatting.rustywind,
        b.formatting.shellharden,
        b.formatting.shfmt,
        b.formatting.sqlfluff,
        b.formatting.stylelint,
        b.formatting.stylua,
        b.hover.dictionary,
        b.hover.printenv,
      },
    }
  end,
}
