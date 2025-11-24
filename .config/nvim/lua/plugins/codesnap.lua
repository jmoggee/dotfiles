return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Code Snapshot" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Code Snapshot Save" },
  },
  opts = {
    save_path = "~/Pictures",
    has_breadcrumbs = true,
    bg_theme = "bamboo",
  },
}
