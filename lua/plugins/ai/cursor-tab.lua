return {
  "leonardcser/cursortab.nvim",
  build = "cd server && go build",
  config = function()
    require("cursortab").setup({
      provider = {
        type = "sweep",
        url = "http://localhost:11434",
        model = "sweep-next-edit",
      },
    })
  end,
}
