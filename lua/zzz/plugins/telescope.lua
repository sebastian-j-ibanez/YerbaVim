return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
      },
    },
  },
}
