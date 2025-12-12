local M = {}

M.config = {
    bold = true,
    italic = true,
}

function M.setup(opts)
    M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load(variant)
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "bw-" .. variant
    vim.o.termguicolors = true

    local mode = vim.o.background -- "light" or "dark"
    local palette = require("bw.palette").get_palette(variant, mode)
    local highlights = require("bw.theme").get_highlights(palette, variant, M.config)

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
