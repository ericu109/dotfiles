local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('ts_ls', {
  capabilities = capabilities
})
vim.lsp.enable('ts_ls')
