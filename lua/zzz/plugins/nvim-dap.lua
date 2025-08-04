return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function ()
        local dap = require "dap"
        local ui = require "dapui"

        require("dapui").setup()

        dap.adapters.go = {
          type = "server",
          port = "${port}",
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}" },
          },
        }

        dap.configurations.go = {
            {
                type = 'go';
                name = 'Launch file';
                request = 'launch';
                program = '${file}';
            },
            {
                type = 'go';
                name = 'Launch package';
                request = 'launch';
                program = '${workspaceFolder}';
            },
            {
                type = 'go';
                name = 'Launch file with args';
                request = 'launch';
                program = '${file}';
                args = function()
                    local args_str = vim.fn.input({
                        prompt = 'Enter command line arguments: ',
                        default = '',
                    })
                    return dap.utils.splitstr(args_str)
                end,
            },
            {
                type = 'go';
                name = 'Launch package with args';
                request = 'launch';
                projectDir = '${workspaceFolder}';
                args = function()
                    local args_str = vim.fn.input({
                        prompt = 'Enter command line arguments: ',
                        default = '',
                    })
                    return dap.utils.splitstr(args_str)
                end,
            },
        }

        vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F1>", dap.continue)
        vim.keymap.set("n", "<F2>", dap.step_into)
        vim.keymap.set("n", "<F3>", dap.step_over)
        vim.keymap.set("n", "<F4>", dap.step_out)
        vim.keymap.set("n", "<F5>", dap.step_back)
        vim.keymap.set("n", "<F13>", dap.restart)

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end
}
