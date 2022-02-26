--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- Comments with --* at the end are neovim defaults

require('keybinds')
require('packages')
require('treesitter')
require('lsp')
require('completion')

-- vim.opt.autoindent = true -- vim.opt.smartindent = true

-- -------------------- General --------------------
-- Show line number (relative)
vim.opt.number =			true
vim.opt.relativenumber =	true

vim.opt.wrap =			false

vim.opt.tabstop =			4		-- Set width of tabs
vim.opt.shiftwidth =		4		-- without actually
vim.opt.softtabstop =		4		-- change the set expandtab
vim.opt.expandtab =			true	-- insert spaces instead of tabs
vim.opt.shiftround =		true	-- round indent to a multiple of shiftwidth

vim.opt.showcmd =			true    --* Show (partial) command in the last line
-- vim.opt.history =		1000	--* Save last N :cmdline commands
vim.opt.showmode =		true	-- Show current mode at bottom
-- vim.opt.autoread =		true	-- Reload files changed outside

vim.opt.scrolloff =		4		-- Start scrolling 4 lines before edge

-- Search down into subfolders
-- Provides tab-completion for all file-related tasks
-- TODO: local pth = { '**' }
-- vim.opt.t.path = vim.o.path + '**'
-- vim.cmd ('path += "**"')

-- Display all matching files when we tab complete
vim.opt.wildmenu =		true	--* Enhanced mode of command-line completion
vim.opt.showmatch =		true
vim.opt.incsearch =		true	--* Highlight search results while typing
vim.opt.smartcase =		true	-- case-insensitive search if only lowercase

-- -------------------- Highlight --------------------
-- vim.opt.syntax =			"on"    -- Enable syntax highlighting

-- vim.cmd('au BufNewFile,BurRead /*.rasi setf css')   -- Rofi syntax highlight

vim.opt.hlsearch =		true	--*

-- --------------- Highlight cursor line ---------------
vim.opt.cursorline = true
vim.cmd("hi CursorLine term=NONE cterm=bold ctermbg=0 ctermfg=NONE gui=NONE")
vim.cmd("hi CursorLineNR term=NONE cterm=bold ctermbg=0 ctermfg=11 gui=NONE")

-- --------------- Highlight column number ---------------
vim.opt.colorcolumn = "90"
vim.cmd("hi ColorColumn ctermbg=0")

-- -------------------- Spell check --------------------
vim.opt.spelllang = "en,es_es"        -- Set languages for spelling

-- -------------------- Lil tweaks --------------------
-- Remove any trailing spaces before writing a file.
vim.api.nvim_exec([[ autocmd BufWritePre * %s/\s\+$//e ]], true)
