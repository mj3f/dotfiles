return {
  "nvim-neotest/neotest",
  dependencies = {
    "Issafalcon/neotest-dotnet",
  },
  opts = {
    adapters = {
      require("neotest-dotnet"),
    },
  },
}
