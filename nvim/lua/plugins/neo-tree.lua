return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window = opts.window or {}
      opts.window.mappings = opts.window.mappings or {}

      opts.window.mappings["-"] = {
        function()
          require("neo-tree.command").execute({ dir = ".." })
        end,
        desc = "Neo-tree: go up one directory",
      }
      opts.window.mappings["_"] = {
        function()
          local state = require("neo-tree.sources.manager").get_state("filesystem")
          local node = state.tree:get_node()
          if not node then return end
          local path = node.path
          local is_dir = node.type == "directory"
          require("neo-tree.command").execute({
            dir = is_dir and path or vim.fn.fnamemodify(path, ":h"),
          })
        end,
        desc = "Neo-tree: open selected directory",
      }

      return opts
    end,
  },
}

