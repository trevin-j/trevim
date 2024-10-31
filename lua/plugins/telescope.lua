return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim", -- A dependency of telescope.
        "nvim-telescope/telescope-ui-select.nvim", -- Turn general UI selections into telescope UI.
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }, -- Pretty icons :).
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search Files" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end,
}
