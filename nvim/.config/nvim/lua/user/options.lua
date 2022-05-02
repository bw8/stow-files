-- -------------------- General --------------------
-- Show line number (relative)
vim.opt.number =            true    -- Set numbered lines
vim.opt.relativenumber =    true    -- Set relative numbered lines

vim.opt.wrap =              false   -- Display lines as one line

vim.opt.tabstop =           4       -- Insert N spaces for a tab
vim.opt.shiftwidth =        4       -- Number of spaces inserted for each identation
vim.opt.softtabstop =       4       -- change the set expandtab
vim.opt.expandtab =         true    -- insert spaces instead of tabs
vim.opt.shiftround =        true    -- round indent to a multiple of shiftwidth
-- vim.opt.autoindent = true -- vim.opt.smartindent = true

vim.opt.showcmd =           true    --* Show (partial) command in the last line
-- vim.opt.history =        1000    --* Save last N :cmdline commands
vim.opt.showmode =          false    -- Show current mode at bottom
-- vim.opt.autoread =       true    -- Reload files changed outside

vim.opt.scrolloff =         4       -- Start scrolling N lines before edge
vim.opt.sidescrolloff =     4       -- Start scrolling horizontally N characters before edge

-- Search down into subfolders
-- Provides tab-completion for all file-related tasks
-- TODO: local pth = { '**' }
-- vim.opt.t.path = vim.o.path + '**'
-- vim.cmd ('path += "**"')

-- Display all matching files when we tab complete
vim.opt.wildmenu =          true    --* Enhanced mode of command-line completion
vim.opt.showmatch =         true
vim.opt.incsearch =         true    --* Highlight search results while typing
vim.opt.smartcase =         true    -- case-insensitive search if only lowercase

-- -------------------- Search Highlight --------------------
-- vim.opt.syntax =            "on"    -- Enable syntax highlighting

-- vim.cmd('au BufNewFile,BurRead /*.rasi setf css')   -- Rofi syntax highlight

vim.opt.hlsearch =          true    --*

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false

-- -------------------- Spell check --------------------
vim.opt.spelllang =         "en,es_es"        -- Set languages for spelling

-- -------------------- Lil tweaks --------------------
-- Remove any trailing spaces before writing a file.
vim.api.nvim_exec([[ autocmd BufWritePre * %s/\s\+$//e ]], true)

-- -------------------- VimWiki --------------------
vim.cmd("let g:vimwiki_list = [{'path': '~/docs/vimwiki/','syntax': 'markdown', 'ext': '.md'}]")

