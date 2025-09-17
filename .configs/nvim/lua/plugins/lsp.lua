return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        ---@type lspconfig.options
        gitlab_ci_ls = {},
        basedpyright = {},
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
