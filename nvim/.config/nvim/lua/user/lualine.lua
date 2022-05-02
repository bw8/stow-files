-- Xresources colors
local status_ok, xcolors = pcall(require, 'xresources')
if not status_ok then
    local xcolors = {
        black        = '#282828',
        white        = '#ebdbb2',
        red          = '#fb4934',
        green        = '#b8bb26',
        blue         = '#83a598',
        yellow       = '#fe8019',
        gray         = '#a89984',
        darkgray     = '#3c3836',
        lightgray    = '#504945',
        inactivegray = '#7c6f64',
    }
end

-- Lualine
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


-- Config
lualine.setup {
    options = {
        icons_enabled = true,
        -- theme = 'auto',
        theme = {
            normal = {
                a = { fg = xcolors.light_white, bg = xcolors.blue},
                b = { fg = xcolors.light_white, bg = xcolors.bg},
                c = { fg = xcolors.light_white, bg = xcolors.black},
                x = { fg = xcolors.light_white, bg = xcolors.black},
                y = { fg = xcolors.light_white, bg = xcolors.bg},
                z = { fg = xcolors.light_white, bg = xcolors.blue}
            },
            insert = {
                a = { fg = xcolors.light_white, bg = xcolors.purple},
                b = { fg = xcolors.light_white, bg = xcolors.bg},
                c = { fg = xcolors.white, bg = xcolors.black}
            },
            visual = {
                a = { fg = xcolors.bg, bg = xcolors.cyan},
                b = { fg = xcolors.light_white, bg = xcolors.bg},
                c = { fg = xcolors.light_white, bg = xcolors.black}
            },
            command = {
                a = { fg = xcolors.bg, bg = xcolors.yellow},
                b = { fg = xcolors.white, bg = xcolors.bg},
                c = { fg = xcolors.white, bg = xcolors.black}
            },
        },
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = { "dashboard" },
        globalstatus = true,    -- Only 1 status line at the bottom
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'branch', 'diff', 'diagnostics'},
    },
    inactive_sections = {
    },
    tabline = {},
    extensions = {}
}
