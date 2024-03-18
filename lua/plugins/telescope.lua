local telescope = require("telescope")

vim.api.nvim_set_keymap(
  "n",
  "<leader>gf",
  '<cmd>lua require("telescope.builtin").git_files()<cr>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  '<cmd>lua require("telescope.builtin").find_files()<cr>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  '<cmd>lua require("telescope.builtin").live_grep()<cr>',
  { noremap = true, silent = true }
)

return {
  telescope.setup({
    defaults = {
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

      vimgrep_arguments = {
        "rg",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--ignore-case",
      },
    },
  }),
}
