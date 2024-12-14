return {
  name = "elixirls",
  cmd = { "elixir-ls" },
  settings = {
    elixirLs = {
      dialyzerEnabled = true,
      fetchDeps = true,
      suggestSpecs = true,
    },
  },
}
