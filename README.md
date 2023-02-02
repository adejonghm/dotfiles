# My Config Repository

> This is a ReadMe template to help save you time and effort.

## Table of Contents

- [Installation](#installation)
  - [NeoVim configuration](#neovim-configuration)
- [Author Info](#author-info)

## Installation

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/adejonghm/dotfiles/main/fedora.sh)"
```

### NeoVim configuration

#### Dependencies

- Install npm
- Install ripgrep
- Clone fzf repository
- Use any Nerd Font (Fira Code NF Regular)

#### Color Scheme

##### Nightfly

```lua
-- In plugins-setup.lua file
use("bluz71/vim-nightfly-guicolors")

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
```

##### Nightfox

```lua
-- In plugins-setup.lua file
use("EdenEast/nightfox.nvim")

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme nightfox")
```

##### Sonokai

```lua
-- In plugins-setup.lua file
use("sainnhe/sonokai")

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme sonokai")
```

##### Tokyonight

```lua
-- In plugins-setup.lua file
use("folke/tokyonight.nvim")

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
```

##### Bluloco

```lua
-- In plugins-setup.lua file
use({ "uloco/bluloco.nvim", requires = { "rktjmp/lush.nvim" } })

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme bluloco-dark")
```

##### Halcyon

```lua
-- In plugins-setup.lua file
use("kwsp/halcyon-neovim")

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme halcyon")
```

##### Ayu

```lua
-- In plugins-setup.lua file
use("ayu-theme/ayu-vim")

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme ayu")
```

##### OneDark

```lua
-- In plugins-setup.lua file
use("navarasu/onedark.nvim")

-- In core/colorscheme.lua file
local status, _ = pcall(vim.cmd, "colorscheme onedark")
```

Optional: *install starship*

[Back To The Top](#my-config-repository)

---

## Author Info

[LinkedIn](https://www.linkedin.com/in/adejonghm/) | [Telegram](https://t.me/adejonghm) | [email](mailto:dejongh.morell@gmail.com)

[Back To The Top](#my-config-repository)
