local packages = {
  'bash-language-server',
  'clangd',
  'docker-compose-language-service',
  'dockerfile-language-server',
  'gopls',
  'html-lsp',
  'lua-language-server',
  'python-lsp-server',
  'typescript-language-server',
  'tinymist',
  'harper-ls',
}

local function install(pack, version)
  local install_msg = version and ('[%s] installing version %s...'):format(pack.name, version)
        or ('[%s] installing...'):format(pack.name)
  vim.defer_fn(function()
    vim.notify(install_msg, vim.log.levels.INFO, { group = 'mason', key = pack.name, ttl = math.huge })
  end, 0)

  pack:once('install:success', function()
    local success_msg = ('[%s] installed'):format(pack.name)
    vim.defer_fn(function()
      vim.notify(success_msg, vim.log.levels.INFO, { group = 'mason', key = pack.name, ttl = 0 })
    end, 0)
  end)

  pack:once('install:failed', function()
    local error_msg = ('[%s] Failed to install'):format(pack.name)
    vim.defer_fn(function()
      vim.notify(error_msg, vim.log.levels.ERROR, { group = 'mason', key = pack.name, ttl = 0 })
    end, 0)
  end)

  pack:install({ version = version })
end

local function update(pack, version)
  local update_msg = ('[%s] updating to version %s...'):format(pack.name, version)
  vim.defer_fn(function()
    vim.notify(update_msg, vim.log.levels.INFO, { group = 'mason', key = pack.name, ttl = math.huge })
  end, 0)

  pack:once('install:success', function()
    local success_msg = ('[%s] updated'):format(pack.name)
    vim.defer_fn(function()
      vim.notify(success_msg, vim.log.levels.INFO, { group = 'mason', key = pack.name, ttl = 0 })
    end, 0)
  end)

  pack:once('install:failed', function()
    local error_msg = ('[%s] Failed to update'):format(pack.name)
    vim.defer_fn(function()
      vim.notify(error_msg, vim.log.levels.ERROR, { group = 'mason', key = pack.name, ttl = 0 })
    end, 0)
  end)

  pack:install({ version = version })
end

local function syncPackages(ensurePacks)
  local masonReg = require('mason-registry')

  local function refreshCallback()
    vim.iter(ensurePacks):each(function(packName)
      local name, pinnedVersion = packName:match('([^@]+)@?(.*)')
      if not masonReg.has_package(name) then
        return
      end
      local pack = masonReg.get_package(name)
      if pack:is_installed() then
        if pinnedVersion == "" then
          local latest_version = pack:get_latest_version()
          if latest_version and latest_version ~= pack:get_installed_version() then
            update(pack, latest_version)
          end
        end
      else
        install(pack, pinnedVersion ~= "" and pinnedVersion or nil)
      end
    end)

    local installedPackages = masonReg.get_installed_package_names()
    vim.iter(installedPackages):each(function(packName)
      local isEnsured = vim.iter(ensurePacks):any(function(ensurePack)
        local name = ensurePack:match('([^@]+)')
        return name == packName
      end)

      if not isEnsured then
        masonReg.get_package(packName):uninstall()
        local uninstall_msg = ('[%s] uninstalled'):format(packName)
        vim.defer_fn(function()
          vim.notify(uninstall_msg, nil, { group = 'mason' })
        end, 0)
      end
    end)
  end

  masonReg.refresh(refreshCallback)
end

return {
  {
    'mason-org/mason.nvim',
    event = { 'VeryLazy' },
    init = function()
      vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH
      vim.env.npm_config_cache = vim.env.HOME .. "/.cache/npm"
    end,
    opts = {},
    config = function(_, opts)
      require('mason').setup(opts)
      vim.defer_fn(function()
        syncPackages(packages)
      end, 3000)
    end
  },
}
