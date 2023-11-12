return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.5,
          },
        },
        sorting_strategy = "ascending",
      },
    },
  },
}
