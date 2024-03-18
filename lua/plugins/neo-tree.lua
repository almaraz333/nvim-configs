return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 25,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = {},
      },
    },
  },
}
