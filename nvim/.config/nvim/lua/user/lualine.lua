local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn"},
    symbols = { error = "", warn = "" },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
    "filetype",
    icons_enabled = true,
}


lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { "dashboard" },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
    },
    inactive_sections = {
    },
    tabline = {},
    extensions = {}
}
