-- test_load.lua
vim.opt.rtp:prepend(".")

local function test_scheme(scheme, mode)
    print("Testing " .. scheme .. " (" .. mode .. ")")
    vim.o.background = mode
    local status, err = pcall(vim.cmd.colorscheme, scheme)
    if not status then
        print("ERROR: Failed to load " .. scheme .. ": " .. err)
        os.exit(1)
    end
    if vim.g.colors_name ~= scheme then
        print("ERROR: vim.g.colors_name is " .. tostring(vim.g.colors_name) .. ", expected " .. scheme)
        os.exit(1)
    end
    print("SUCCESS: Loaded " .. scheme)
end

test_scheme("bw-grayscale", "light")
test_scheme("bw-grayscale", "dark")
test_scheme("bw-binary", "light")
test_scheme("bw-binary", "dark")

print("All tests passed!")
os.exit(0)
