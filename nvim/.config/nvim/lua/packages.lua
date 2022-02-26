-- -------------------- Package manager --------------------
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use { 'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = '~/docs/vimwiki',
                    syntax = 'markdown',
                    ext = '.md',
                }
            }
            vim.g.vimwiki_ext2syntax = {
                ['.md'] = 'markdown',
                ['.markdown'] = 'markdown',
                ['.mdown'] = 'markdown',
            }
        end
    }
    use { 'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
            -- Add custom entries
            local startify = require("alpha.themes.startify")
            startify.section.top_buttons.val = {
                startify.button("e", "New file", ":ene <bar> startinsert <CR>"),
                startify.button("c", "Nvim config", ":e ~/.config/nvim/init.lua<CR>"),
            }
            vim.api.nvim_set_keymap('n', '<C-n>', ":Alpha<CR>", {noremap = true})
        end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
end)
