--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('jsonls',{
  capabilities = capabilities,
})
vim.lsp.enable('jsonls')
