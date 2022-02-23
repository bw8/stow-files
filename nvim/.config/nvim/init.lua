--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
--
-- Comments with --* at the end are neovim defaults

-- vim.o.autoindent = true --
vim.o.smartindent = true


-- -------------------- General --------------------
-- Show line number (relative)
vim.o.number =			true
vim.o.relativenumber =	true

vim.o.wrap =			false

vim.o.tabstop =			4		-- Set width of tabs
vim.o.shiftwidth =		4		-- without actually
vim.o.softtabstop =		4		-- change the set expandtab
vim.o.expandtab =		false	-- insert spaces instead of tabs
vim.o.shiftround =		true	-- round indent to a multiple of shiftwidth

vim.o.showcmd =			true    --* Show (partial) command in the last line
-- vim.o.history =		1000	--* Save last N :cmdline commands
vim.o.showmode =		true	-- Show current mode at bottom
-- vim.o.autoread =		true	-- Reload files changed outside

vim.o.scrolloff =		4		-- Start scrolling 4 lines before edge

-- Search down into subfolders
-- Provides tab-completion for all file-related tasks
-- TODO: local pth = { '**' }
-- vim.opt.path = vim.o.path + '**'
-- vim.cmd ('path += "**"')

-- Display all matching files when we tab complete
vim.o.wildmenu =		true	--* Enhanced mode of command-line completion
vim.o.showmatch =		true
vim.o.incsearch =		true	--* Highlight search results while typing
vim.o.smartcase =		true	-- case-insensitive search if only lowercase

-- -------------------- Highlight --------------------
vim.cmd('filetype plugin on')
--vim.o.filetype = "plugin on"
vim.o.syntax =			"on"    -- Enable syntax highlighting

-- vim.cmd('au BufNewFile,BurRead /*.rasi setf css')   -- Rofi syntax highlight

vim.o.hlsearch =		true	--*

-- --------------- Highlight cursor line ---------------
vim.o.cursorline = true
vim.cmd("hi CursorLine term=NONE cterm=bold ctermbg=0 ctermfg=NONE gui=NONE")
vim.cmd("hi CursorLineNR term=NONE cterm=bold ctermbg=0 ctermfg=11 gui=NONE")
-- --------------- Highlight column number ---------------
vim.o.colorcolumn = "90"
vim.cmd("hi ColorColumn ctermbg=0")

-- -------------------- Keybinds --------------------
-- Map leader key to space
vim.g.mapleader = ' '

-- Keymaps
-- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Move across windows
keymap('n', '<leader>h', ':wincmd h<CR>', opts)
keymap('n', '<leader>j', ':wincmd j<CR>', opts)
keymap('n', '<leader>k', ':wincmd k<CR>', opts)
keymap('n', '<leader>l', ':wincmd l<CR>', opts)

-- Open explorer
keymap('n', '<leader>f', ':wincmd v<bar> :Ex <bar> :vertical resize 30<CR>', opts)

-- -------------------- Spell check --------------------
vim.o.spelllang = "en,es_es"        -- Set languages
keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', opts) -- <C-l> to correct word

-- -------------------- Skeletons --------------------
keymap('n', ',html', ':-1read $HOME/.config/nvim/skel/skel.tex', opts)
keymap('n', ',md', ':0read $HOME/.config/nvim/skel/skel.md<CR>j$i', opts)

-- -------------------- --------------------
-- Remove any trailing spaces before writing a file.
vim.api.nvim_exec([[
autocmd BufWritePre * %s/\s\+$//e
]], true)

