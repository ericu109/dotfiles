local git_dir = vim.fs.root(vim.loop.cwd(), '.git');

if git_dir ~= nil then
  local project_path = vim.fs.dirname(vim.fs.find({'angular.json'}, {path = git_dir})[1])

  if project_path ~= nul then
    local node_modules_path = vim.fs.joinpath(project_path, 'node_modules')
    local ngServerPath = vim.fs.joinpath(node_modules_path, '@angular', 'language-server', 'bin', 'ngserver')

    local ngls_cmd = {
      ngServerPath,
      '--stdio',
      '--tsProbeLocations',
      node_modules_path,
      '--ngProbeLocations',
      node_modules_path
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    require('lspconfig').angularls.setup({
      cmd = ngls_cmd,
      on_new_config = function(new_config)
        new_config.cmd = ngls_cmd
      end,
      on_attach = on_attach,
      capabilities = capabilities
    })
  end
end
