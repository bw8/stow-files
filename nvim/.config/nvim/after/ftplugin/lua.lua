-- This let us press 'gf' hovering any word and if a file with this 'word'+.lua exists in
-- this directory or subdirectories opens it up.
vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config')..'/lua')
