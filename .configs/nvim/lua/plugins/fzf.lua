return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      fullscreen = true,
      preview = {
        layout = "vertial",
        vertical = "down:60%",

        -- layout = "horizontal",
        -- horizontal = "right:60%",
      },
    },

    grep = {
      actions = {
        ["ctrl-g"] = false,
        ["alt-f"] = { require("fzf-lua.actions").grep_lgrep },
      },
    },

    oldfiles = { cwd_only = true },
  },
  keys = {
    {
      "<leader>/",
      function()
        require("fzf-lua").grep_project()
      end,
    },
  },
}
