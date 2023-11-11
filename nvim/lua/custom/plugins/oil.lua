return {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require('oil').setup({
            use_default_keymaps = false,
            keymaps = {
                ["<CR>"] = "actions.select",
                ["g?"] = "actions.show_help",
                ["gr"] = "actions.refresh",
                ["gs"] = "actions.change_sort",
                ["g."] = "actions.toggle_hidden",
                ["<C-c>"] = "actions.close",
            },
            -- view_options = {
            --     show_hidden = true,
            -- }
        })
        vim.keymap.set('n', '<leader><CR>', vim.cmd.Oil)
    end
}
