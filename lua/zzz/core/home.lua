vim.api.nvim_create_user_command(
  'Home',
  function()
    vim.cmd('cd $HOME/Code/')
  end,
  {}
)

