local function get_root()
    local lib = require('neotest.lib')

    local home = os.getenv("HOME")

    local prev_dir
    local curr_dir = vim.fn.expand('%:p:h')
    print('curr_dir is: ', curr_dir)

    while prev_dir ~= home do
        print('checking dir: ', curr_dir)
        local exists = lib.files.exists(curr_dir .. '/pubspec.yaml')
        print(exists)
        if exists then
            print('returning ', curr_dir)
            return curr_dir
        end

        prev_dir = curr_dir
        curr_dir = lib.files.parent(curr_dir)
    end
end

return {

    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        -- "sidlatau/neotest-dart",
        { dir = "~/dev/code/neotest-dart" }
    },
    config = function()
        require('neotest').setup {
            adapters = {
                require('neotest-dart') {
                    command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
                    -- Change it to `fvm flutter` if using FVM
                    -- change it to `dart` for Dart only tests
                    use_lsp = true, -- When set Flutter outline information is used when constructing test name.
                    -- Useful when using custom test names with @isTest annotation
                    custom_test_method_names = { 'testGoldens' },
                }
            }
        }
    end,
    keys = {
        {
            "<leader>tt",
            function()
                print('here')
                local async = require "plenary.async"

                local prev_cwd = vim.fn.getcwd()
                local root = get_root()
                print('changing dir to, ', root)
                vim.api.nvim_set_current_dir(root)

                async.run(async.void(function() require("neotest").run.run(vim.fn.expand("%")) end),
                    function()
                        print('returning dir to: ', prev_cwd)
                        vim.api.nvim_set_current_dir(prev_cwd)
                    end)
            end,
            desc =
            "Run File"
        },
        {
            "<leader>tT",
            function() require("neotest").run.run(vim.loop.cwd()) end,
            desc =
            "Run All Test Files"
        },
        {
            "<leader>tr",
            function() require("neotest").run.run() end,
            desc =
            "Run Nearest"
        },
        {
            "<leader>ts",
            function() require("neotest").summary.toggle() end,
            desc =
            "Toggle Summary"
        },
        {
            "<leader>to",
            function() require("neotest").output.open({ enter = true, auto_close = true }) end,
            desc =
            "Show Output"
        },
        {
            "<leader>tO",
            function() require("neotest").output_panel.toggle() end,
            desc =
            "Toggle Output Panel"
        },
        {
            "<leader>tS",
            function() require("neotest").run.stop() end,
            desc =
            "Stop"
        },
    },
}
