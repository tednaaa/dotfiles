return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        ---@type lspconfig.options
        gitlab_ci_ls = {},
        nginx_language_server = {},

        ruff = { mason = false, enabled = false },
        basedpyright = { settings = { basedpyright = { analysis = { typeCheckingMode = "basic" } } } },
      },
    },
  },
  -- {
  --   "mason-org/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       "flake8",
  --       "black",
  --     },
  --   },
  -- },
}
