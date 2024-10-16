require('lspconfig').eslint.setup({
  filetypes = {
    "typescript",
    "html"
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
