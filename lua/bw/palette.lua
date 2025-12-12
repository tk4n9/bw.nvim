local M = {}

-- Helper to invert color
local function invert_color(hex)
    local num = tonumber(hex:sub(2), 16)
    local r = math.floor(num / 65536)
    local g = math.floor((num % 65536) / 256)
    local b = num % 256
    return string.format("#%02x%02x%02x", 255 - r, 255 - g, 255 - b)
end

function M.get_palette(variant, style)
    local p = {}

    if variant == "binary" then
        -- Binary: Strictly #000000 and #FFFFFF
        if style == "light" then
            p.bg = "#ffffff"
            p.fg = "#000000"
        else -- dark
            p.bg = "#000000"
            p.fg = "#ffffff"
        end
        -- All other UI elements must match bg or fg
        p.cursor = p.fg
        p.comment = p.fg -- Use bold/italic in theme to differentiate
        p.selection = p.fg -- Invert bg/fg in theme for selection
        p.border = p.fg
        p.line = p.fg -- Visual cues might be limited
    elseif variant == "grayscale" then
        -- Grayscale: Monochromatic but with shades
        -- No saturation: R=G=B
        if style == "light" then
            p.bg = "#ffffff"
            p.fg = "#000000"
            p.black   = "#000000"
            p.gray01  = "#111111"
            p.gray02  = "#222222"
            p.gray03  = "#333333"
            p.gray04  = "#444444"
            p.gray05  = "#555555"
            p.gray06  = "#666666"
            p.gray07  = "#777777"
            p.gray08  = "#888888"
            p.gray09  = "#999999"
            p.gray10  = "#aaaaaa"
            p.gray11  = "#bbbbbb"
            p.gray12  = "#cccccc"
            p.gray13  = "#dddddd"
            p.gray14  = "#eeeeee"
            p.white   = "#ffffff"
        else -- dark (inversion of light)
            -- We can algorithmically invert or define explicitly.
            -- Explicit is clearer for 'main' definition.
            p.bg = "#000000"
            p.fg = "#ffffff"
            p.black   = "#ffffff"
            p.gray01  = "#eeeeee"
            p.gray02  = "#dddddd"
            p.gray03  = "#cccccc"
            p.gray04  = "#bbbbbb"
            p.gray05  = "#aaaaaa"
            p.gray06  = "#999999"
            p.gray07  = "#888888"
            p.gray08  = "#777777"
            p.gray09  = "#666666"
            p.gray10  = "#555555"
            p.gray11  = "#444444"
            p.gray12  = "#333333"
            p.gray13  = "#222222"
            p.gray14  = "#111111"
            p.white   = "#000000"
        end
    end

    return p
end

return M
