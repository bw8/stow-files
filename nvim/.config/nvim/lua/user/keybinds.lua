-- -------------------- Keybinds --------------------
-- Map leader key to space
vim.g.mapleader = ' '

-- Keymaps
-- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


-- Mode
--  normal_mode = 'n'
--  insert_mode = 'i'
--  visual_mode = 'v'
--  visual_block_mode = 'x'
--  terminal_mode = 't'
--  command_mode = 'c'


-- ================================== Normal ==================================
-- Move across windows
keymap('n', '<leader>h', ':wincmd h<CR>', opts)
keymap('n', '<leader>j', ':wincmd j<CR>', opts)
keymap('n', '<leader>k', ':wincmd k<CR>', opts)
keymap('n', '<leader>l', ':wincmd l<CR>', opts)

-- Resize windows
keymap('n', '<leader>H', ':vertical resize -2<CR>', opts)
keymap('n', '<leader>J', ':resize +2<CR>', opts)
keymap('n', '<leader>K', ':resize -2<CR>', opts)
keymap('n', '<leader>L', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<leader>n', ':bnext<CR>', opts)
keymap('n', '<leader>p', ':bprevious<CR>', opts)

-- Move across windows
keymap('n', '<C-j>', ':cnext<CR>', opts)
keymap('n', '<C-k>', ':cprevious<CR>', opts)

-- Open eXplorer
keymap('n', '<leader>x', '<CMD>Lex 30<CR>', opts)


-- -------------------- Skeletons --------------------
keymap('n', ',html', ':-1read $HOME/.config/nvim/skel/skel.tex', opts)
keymap('n', ',md', ':0read $HOME/.config/nvim/skel/skel.md<CR>j$i', opts)


-- -------------------- Telescope --------------------
keymap('n', '<C-_>', '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy())<CR>', opts)
keymap('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>', opts)
keymap('n', '<leader>fg', '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts)
keymap('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
keymap('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', opts)


-- ================================= Insert ===================================
-- -------------------- Spell check --------------------
keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', opts) -- <C-l> to correct word


-- ================================= Visual ===================================
-- Keep selected after indent
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
