-- bw-grayscale.lua
if vim.o.background == "" then
    vim.o.background = "light"
end

require("bw").load("grayscale")
