local orig_on_attach = (vim.lsp.config['eslint'] or {}).on_attach

vim.lsp.config('eslint', {
  on_attach = function(client, bufnr)
    if orig_on_attach then
      orig_on_attach(client, bufnr)
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})
vim.lsp.enable('eslint')
