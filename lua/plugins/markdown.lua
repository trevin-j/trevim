-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
        preview = {
            hybrid_modes = {'i', 'n'},
            linewise_hybrid_mode = true,
        }
    }
};
