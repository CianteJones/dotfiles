local lspconfig = require'lspconfig'
local completion = require'completion'

local function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = true,
    }
  )
end
-- add setup_diagnostics() to our custom_on_attach


local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  setup_diagnostics()
  completion.on_attach(client)
end

local default_config = {
  on_attach = custom_on_attach,
}
-- setup language servers here
lspconfig.tsserver.setup(default_config)
lspconfig.gopls.setup(default_config)
lspconfig.jedi_language_server.setup(default_config)
lspconfig.clangd.setup(default_config)
lspconfig.html.setup(default_config)
-- lspconfig.sumneko_lua(default_config)

