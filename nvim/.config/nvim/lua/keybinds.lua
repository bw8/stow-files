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
keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', opts) -- <C-l> to correct word

-- -------------------- Skeletons --------------------
keymap('n', ',html', ':-1read $HOME/.config/nvim/skel/skel.tex', opts)
keymap('n', ',md', ':0read $HOME/.config/nvim/skel/skel.md<CR>j$i', opts)


-- -------------------- LSP --------------------
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<CR>', opts)
keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>', opts)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)

