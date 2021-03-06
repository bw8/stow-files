-- --------------- nvim-LSP-installer ---------------
-- Check availability of lsp-installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("user/lsp/handlers").on_attach,
        capabilities = require("user/lsp/handlers").capabilities,
    }
    -- Lua
    if server.name == "sumneko_lua" then
        local sumneko_opts = require("user/lsp/settings/sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end
    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)



-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.settings({
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗",
--         }
--     }
-- })
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--     if server.name == "sumneko_lua" then
--         opts = {
--             settings = {
--                 Lua = {
--                     diagnostics = {
--                         globals = { 'vim', 'use' }
--                     },
--                 }
--             }
--         }
--     end
--     server:setup(opts)
-- end)
