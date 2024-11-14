local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end


local servers = {
    "angularls",
    "ts_ls",
    "cssls", 
    "eslint", 
    "html", 
    "jsonls", 
    "tailwindcss",
}

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}


mason.setup()
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local util = require("lspconfig.util")

local opts = {}

for _, server in pairs(servers) do
    opts = {
        -- getting "on_attach" and capabilities from handlers
        on_attach = require("tortuga_gris.lsp.handlers").on_attach,
        capabilities = require("tortuga_gris.lsp.handlers").capabilities,
    }

    -- get the server name
    server = vim.split(server, "@")[1]
    if(server=="angularls")
    then
        opts.root_dir = util.root_pattern("project.json", "angular.json")
    end
    -- pass them to lspconfig
    lspconfig[server].setup(opts)
end
