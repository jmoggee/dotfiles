return {
  "oribarilan/lensline.nvim",
  tag = "1.0.0",
  event = "LspAttach",
  config = function()
    require("lensline").setup()
  end,
}
