-- Formatting!!
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre"},
    keys = {
        {
            "<leader>fa",
            function()
                require("conform").format { async = true, lsp_format = "fallback" }
            end,
            mode = "",
            desc = "[F]ormat buffer",
        },
        {
            "<leader>uf",
            function()
                vim.b.disable_autoformat = not vim.b.disable_autoformat
                print("Format on save: " .. (vim.b.disable_autoformat and "OFF" or "ON"))
            end,
            desc = "Toggle [f]ormat on save",
        }
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            -- Respect the toggle
            if vim.b[bufnr].disable_autoformat then
                return
            end

            local disable_filetypes = { c = true, cpp = true, erl = true }
            local lsp_format_opt
            if disable_filetypes[vim.bo[bufnr].filetype] then
                lsp_format_opt = "never"
            else
                lsp_format_opt = "fallback"
            end
            return {
                timeout_ms = 500,
                lsp_format = lsp_format_opt,
            }
        end,
        formatters_by_ft = {
            lua = { "stylua" },
        },
    },
}
