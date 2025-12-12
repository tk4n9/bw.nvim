-- test_config.lua
vim.opt.rtp:prepend(".")

local function test_config_off()
    print("Testing config { bold = false, italic = false }")
    require("bw").setup({ bold = false, italic = false })
    vim.cmd("colorscheme bw-binary")
    
    -- Check a highlight group that should have bold/italic by default
    -- e.g., 'Comment' is italic, 'Statement' is bold in binary theme
    
    local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
    if comment_hl.italic then
        print("ERROR: Comment should not be italic")
        os.exit(1)
    end
    
    local stmt_hl = vim.api.nvim_get_hl(0, { name = "Statement" })
    if stmt_hl.bold then
        print("ERROR: Statement should not be bold")
        os.exit(1)
    end
    
    print("SUCCESS: Bold and Italic disabled correctly")
end

test_config_off()
os.exit(0)
