-- --------------- Highlight cursor line ---------------
vim.opt.cursorline =        true
vim.cmd("hi CursorLine term=NONE cterm=bold ctermbg=0 ctermfg=NONE gui=bold guibg=#0e2628")   -- TODO: make it lua
vim.cmd("hi CursorLineNR term=NONE cterm=bold ctermbg=0 ctermfg=11 gui=NONE")   -- TODO: make it lua
-- --------------- Highlight column number ---------------
vim.opt.colorcolumn =       "80"
vim.cmd("hi ColorColumn ctermbg=0 guibg=#0e2628") -- TODO: make it lua
-- -------------------- Colors --------------------
-- Comments
vim.cmd("hi Comment ctermfg=8 guifg=#153d38")
-- Folds
vim.cmd("hi Folded ctermfg=7 ctermbg=8 guifg=#818384 guibg=#153d38")

