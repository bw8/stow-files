-- -------------------- Plugin manager --------------------
-- Protected call so we don't error out if packer isn't available
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Use popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border  = "rounded" }
        end,
    },
}

-- Install plugins
return packer.startup(function(use)
--require('packer').startup(function()
    -- Package Manager
    use 'wbthomason/packer.nvim'

    -- Greeter
    use 'glepnir/dashboard-nvim'

    -- Xresources colors
    use 'nekonako/xresources-nvim'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Preview hex color by changing its background
    -- vim-css-color change background of hex colors (#FFFFFF).
    use 'ap/vim-css-color'

    -- VimWiki
    use {
	'vimwiki/vimwiki',
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
    -- use {
    --     'goolord/alpha-nvim',
    --     requires = { 'kyazdani42/nvim-web-devicons' },
    --     config = function ()
    --         require'alpha'.setup(require'alpha.themes.startify'.config)
    --         -- Add custom entries
    --         local startify = require("alpha.themes.startify")
    --         startify.section.top_buttons.val = {
    --             startify.button("e", "New file", ":ene<CR>"),
    --             startify.button("c", "Nvim config", ":e ~/.config/nvim/init.lua<CR>"),
    --         }
    --         vim.api.nvim_set_keymap('n', '<C-n>', ":Alpha<CR>", {noremap = true})
    --     end
    -- }

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Playground
    use 'nvim-treesitter/playground'

    -- Lsp-config
    use {
        'neovim/nvim-lspconfig',            -- Enable LSP
        'williamboman/nvim-lsp-installer',  -- Simple to use language server installer
    }
    -- Completion
    use 'hrsh7th/nvim-cmp'          -- Completion plugin
    use 'hrsh7th/cmp-buffer'        -- buffer completions
    use 'hrsh7th/cmp-path'          -- path completions
    use 'hrsh7th/cmp-cmdline'       -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip'  -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp'      -- provide completions from LSP
    use 'hrsh7th/cmp-nvim-lua'      -- provide completions from neovim lua

    -- Snippets
    use "L3MON4D3/LuaSnip"          -- Snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)
