return {
    'sindrets/diffview.nvim',
    config = function()
        local actions = require("diffview.actions")
        require('diffview').setup({
            enhanced_diff_hl = true,
            keymaps = {
                file_panel = {
                    { "n", "<c-u>", actions.scroll_view(-0.5), { desc = "Scroll the view up half a page" } },
                    { "n", "<c-d>", actions.scroll_view(0.5),  { desc = "Scroll the view down half a page" } },
                }
            }
        })

        local last_tabpage = vim.api.nvim_get_current_tabpage()
        function DiffviewToggle()
            local lib = require 'diffview.lib'
            local view = lib.get_current_view()
            if view then
                vim.cmd(":DiffviewClose")
            else
                vim.cmd(":DiffviewOpen")
            end
        end

        vim.keymap.set('n', '<leader>d', DiffviewToggle)
    end
}
