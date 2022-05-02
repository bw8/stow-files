-- Xresources
-- require('xresources')
local status_ok, xcolor = pcall(require, "xresources")
if not status_ok then
    return
end

-- Colors
-- Properties       Xresources
-- fg               foreground
-- bg               background
-- black            color0
-- red              color1
-- green            color2
-- yellow           color3
-- blue             color4
-- purple           color5
-- cyan             color6
-- white            color7
-- light_black      color8
-- light_red        color9
-- light_green      color10
-- light_yellow     color11
-- light_blue       color12
-- light_purple     color13
-- light_cyan       color14
-- light_white      color15
-- grey             background + 0xf0f10
-- grey1            background + 0x363940
-- none             NONE

-- Color integration with xresources
-- TODO: find better way to set highlighting groups without vim.cmd

-- Colorscheme
vim.o.termguicolors =     true
vim.o.background =        'dark'

-- Visual selection
vim.cmd(string.format("hi Visual guibg=%s", xcolor.black))

-- Comments
vim.cmd(string.format("hi Comment ctermfg=8 guifg=%s", xcolor.light_black))

-- Folds
vim.cmd(string.format("hi Folded ctermfg=7 ctermbg=8 guifg=%s guibg=%s", xcolor.white, xcolor.light_black))

-- Highlight cursor line
vim.opt.cursorline =        true     -- Highlight current line
vim.cmd(string.format("hi CursorLine term=NONE cterm=bold ctermbg=0 ctermfg=NONE gui=bold guibg=%s", xcolor.black))
vim.cmd(string.format("hi CursorLineNR term=NONE cterm=bold ctermbg=0 ctermfg=11 gui=%s", xcolor.none))

-- Highlight column number
vim.opt.colorcolumn =       "80"
vim.cmd(string.format("hi ColorColumn ctermbg=0 guibg=%s", xcolor.black))
