-- Home command
-- Takes user to their $HOME folder 
vim.api.nvim_create_user_command(
  'Home',
  function()
    vim.cmd('cd $HOME')
  end,
  {}
)

-- Code command
-- Takes user to their $HOME/Code folder 
vim.api.nvim_create_user_command(
  'Code',
  function()
    vim.cmd('cd $HOME/Code/')
  end,
  {}
)

-- Config command
-- cd to the nvim config folder
vim.api.nvim_create_user_command(
    'Config',
    function()
        if jit.os == "Windows" then
            vim.cmd('cd $HOME/AppData/Local/nvim/')
        else
            vim.cmd('cd $HOME/.config/nvim/')
        end
    end,
    {}
)

