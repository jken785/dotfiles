return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        on_colors = function(colors)
            colors.comment = colors.dark5
        end,
        on_highlights = function(highlights, colors)
            highlights.LineNr = {
                fg = colors.dark5
            }
            highlights.CursorLineNr = {
                fg = colors.teal
            }
        end
    },
    config = function(_, opts)
        require('tokyonight').setup(opts)
        vim.cmd.colorscheme 'tokyonight-night'
    end,
}
