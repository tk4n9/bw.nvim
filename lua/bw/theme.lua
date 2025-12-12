local M = {}

function M.get_highlights(palette, variant, opts)
    local p = palette
    local highlights = {}
    opts = opts or { bold = true, italic = true }

    -- Common utilities
    local none = "NONE"

    if variant == "grayscale" then
        highlights = {
            -- UI elements
            Normal       = { fg = p.fg, bg = p.bg },
            NormalFloat  = { fg = p.fg, bg = p.bg },
            FloatBorder  = { fg = p.gray08, bg = p.bg },
            Cursor       = { fg = p.bg, bg = p.fg },
            CursorLine   = { bg = p.gray14 }, -- Very subtle gray
            CursorLineNr = { fg = p.fg, bold = true },
            LineNr       = { fg = p.gray10 },
            SignColumn   = { fg = p.gray10, bg = p.bg },
            StatusLine   = { fg = p.bg, bg = p.gray04 },
            StatusLineNC = { fg = p.gray10, bg = p.gray14 },
            VertSplit    = { fg = p.gray12 },
            WinSeparator = { fg = p.gray12 },
            Pmenu        = { fg = p.fg, bg = p.gray14 },
            PmenuSel     = { fg = p.bg, bg = p.gray06 },
            Visual       = { bg = p.gray13 },
            Search       = { fg = p.bg, bg = p.gray08 },
            IncSearch    = { fg = p.bg, bg = p.fg },
            MatchParen   = { fg = p.bg, bg = p.gray06, bold = true },

            -- Standard UI extended
            Directory    = { fg = p.gray04, bold = true },
            Title        = { fg = p.fg, bold = true },
            NonText      = { fg = p.gray12 },
            SpecialKey   = { fg = p.gray12 },
            Conceal      = { fg = p.gray10 },
            Folded       = { fg = p.gray08, bg = p.gray14 },
            FoldColumn   = { fg = p.gray10, bg = p.bg },
            QuickFixLine = { bg = p.gray13, bold = true },
            ErrorMsg     = { fg = p.fg, bg = p.gray04, bold = true },
            MoreMsg      = { fg = p.gray06, bold = true },
            Question     = { fg = p.gray06, bold = true },

            -- Syntax
            Comment      = { fg = p.gray08, italic = true },
            Constant     = { fg = p.gray05 },
            String       = { fg = p.gray06 },
            Character    = { fg = p.gray06 },
            Number       = { fg = p.gray05 },
            Boolean      = { fg = p.gray05 },
            Float        = { fg = p.gray05 },
            Identifier   = { fg = p.fg },
            Function     = { fg = p.gray03, bold = true },
            Statement    = { fg = p.gray04, bold = true },
            Conditional  = { fg = p.gray04, bold = true },
            Repeat       = { fg = p.gray04, bold = true },
            Label        = { fg = p.gray04 },
            Operator     = { fg = p.gray06 },
            Keyword      = { fg = p.gray04, bold = true },
            Exception    = { fg = p.gray04, bold = true },
            PreProc      = { fg = p.gray07 },
            Include      = { fg = p.gray07 },
            Define       = { fg = p.gray07 },
            Macro        = { fg = p.gray07 },
            Type         = { fg = p.gray04 },
            StorageClass = { fg = p.gray04 },
            Structure    = { fg = p.gray04 },
            Typedef      = { fg = p.gray04 },
            Special      = { fg = p.gray06 },
            Todo         = { fg = p.bg, bg = p.gray04, bold = true },
            Error        = { fg = p.fg, bg = p.gray04, bold = true }, -- No red allowed
            WarningMsg   = { fg = p.gray06 },

            -- Diff
            DiffAdd      = { fg = p.gray06, bg = p.gray14 },
            DiffChange   = { fg = p.gray06, bg = p.gray14 },
            DiffDelete   = { fg = p.gray10, bg = p.gray14 },
            DiffText     = { fg = p.fg, bg = p.gray12 },
        }
    elseif variant == "binary" then
        highlights = {
            -- UI elements
            Normal       = { fg = p.fg, bg = p.bg },
            NormalFloat  = { fg = p.fg, bg = p.bg },
            FloatBorder  = { fg = p.fg, bg = p.bg },
            Cursor       = { fg = p.bg, bg = p.fg },
            CursorLine   = { underline = true }, -- Cannot change bg, use underline
            CursorLineNr = { fg = p.fg, bold = true },
            LineNr       = { fg = p.fg }, -- Can't dim
            SignColumn   = { fg = p.fg, bg = p.bg },
            StatusLine   = { fg = p.bg, bg = p.fg },
            StatusLineNC = { fg = p.fg, bg = p.bg, reverse = true }, -- use reverse check
            VertSplit    = { fg = p.fg },
            WinSeparator = { fg = p.fg },
            Pmenu        = { fg = p.fg, bg = p.bg, reverse = true },
            PmenuSel     = { fg = p.fg, bg = p.bg, bold = true, reverse = false },
            Visual       = { reverse = true },
            Search       = { reverse = true },
            IncSearch    = { reverse = true, bold = true },
            MatchParen   = { bold = true, underline = true },

            -- Standard UI extended
            Directory    = { fg = p.fg, bold = true },
            Title        = { fg = p.fg, bold = true },
            NonText      = { fg = p.fg },
            SpecialKey   = { fg = p.fg },
            Conceal      = { fg = p.fg },
            Folded       = { fg = p.fg, bg = p.bg, reverse = true },
            FoldColumn   = { fg = p.fg, bg = p.bg },
            QuickFixLine = { reverse = true },
            ErrorMsg     = { fg = p.bg, bg = p.fg, bold = true },
            MoreMsg      = { fg = p.fg, bold = true },
            Question     = { fg = p.fg, bold = true },

            -- Syntax
            Comment      = { fg = p.fg, italic = true },
            Constant     = { fg = p.fg, bold = true },
            String       = { fg = p.fg, italic = true },
            Character    = { fg = p.fg },
            Number       = { fg = p.fg },
            Boolean      = { fg = p.fg, bold = true },
            Float        = { fg = p.fg },
            Identifier   = { fg = p.fg },
            Function     = { fg = p.fg, bold = true },
            Statement    = { fg = p.fg, bold = true },
            Conditional  = { fg = p.fg, bold = true, italic = true },
            Repeat       = { fg = p.fg, bold = true, italic = true },
            Label        = { fg = p.fg },
            Operator     = { fg = p.fg },
            Keyword      = { fg = p.fg, bold = true },
            Exception    = { fg = p.fg, bold = true },
            PreProc      = { fg = p.fg, italic = true },
            Type         = { fg = p.fg, bold = true },
            Special      = { fg = p.fg, bold = true },
            Todo         = { fg = p.bg, bg = p.fg, bold = true },
            Error        = { fg = p.bg, bg = p.fg },
            WarningMsg   = { fg = p.fg, bold = true },

            -- Diff
            DiffAdd      = { underline = true },
            DiffChange   = { italic = true },
            DiffDelete   = { strikethrough = true },
            DiffText     = { reverse = true },
        }
    end

    -- Filter styles
    for group, conf in pairs(highlights) do
        if opts.bold == false then
            conf.bold = nil
        end
        if opts.italic == false then
            conf.italic = nil
        end
    end

    return highlights
end

return M
