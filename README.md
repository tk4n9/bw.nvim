# bw.nvim

A monochromatic Neovim colorscheme plugin.

## Features

- **bw-grayscale**: A purely grayscale theme with no saturation (R=G=B). Differentiates elements using varying shades of gray.
- **bw-binary**: A strictly binary theme using only `#000000` and `#ffffff`. Differentiates elements using Bold, Italic, Reverse, and Underline attributes.

Both themes support Light and Dark modes.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "tk4n9/bw.nvim",
    config = function()
        -- Optional: setup options
        require("bw").setup({})
        
        -- Load a theme
        -- vim.cmd.colorscheme("bw-grayscale")
        -- or
        -- vim.cmd.colorscheme("bw-binary")
    end
}
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use {
    "tk4n9/bw.nvim",
    config = function()
        require("bw").setup({})
        -- vim.cmd.colorscheme("bw-grayscale")
    end
}
```

## Usage

Set the background (optional, defaults to `light` if unset):
```vim
set background=light
" or
set background=dark
```

Load the colorscheme:
```vim
colorscheme bw-grayscale
" or
colorscheme bw-binary
```

## Configuration

Configure options via `setup()`:

```lua
require("bw").setup({
    bold = true,   -- Enable bold styles (default: true)
    italic = true, -- Enable italic styles (default: true)
})
```
