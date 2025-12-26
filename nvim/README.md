# Simple Neovim Configuration

A dead simple, well-organized Neovim configuration.

## 📁 Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua        # All vim settings
│   │   └── keymaps.lua        # All keybindings
│   └── plugins/
│       └── init.lua           # Plugin specifications
```

## ✨ Features

- **Single source of truth** for keybindings (`keymaps.lua`)
- **Single source of truth** for settings (`options.lua`)
- **Easy plugin management** - just edit `plugins/init.lua`
- **Lazy loading** for fast startup
- **Well documented** with clear sections

## 🚀 Installation

1. Backup your current config:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone or copy this config:
```bash
mkdir -p ~/.config/nvim
cp -r nvim-simple/* ~/.config/nvim/
```

3. Start Neovim:
```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## ⌨️ Key Bindings

Leader key: `Space`

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>x` - Save and quit
- `<Esc>` - Clear search highlights

### Window Navigation
- `<C-h/j/k/l>` - Move between windows

### Window Management
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>se` - Make splits equal
- `<leader>sx` - Close current split

### Buffer Management
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bd` - Delete buffer

### File Explorer
- `<leader>e` - Toggle file explorer

### Fuzzy Finding (Telescope)
- `<leader>ff` - Find files
- `<leader>fg` - Find in files (grep)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help
- `<leader>fr` - Recent files

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action

### Diagnostics
- `<leader>e` - Show diagnostic error
- `[d` - Previous diagnostic
- `]d` - Next diagnostic

## 🔧 Adding Plugins

Just add a new entry to `lua/plugins/init.lua`:

```lua
{
  'author/plugin-name',
  config = function()
    -- Plugin configuration
  end,
},
```

## 🎨 Changing Colorscheme

Edit the colorscheme section in `lua/plugins/init.lua`:

```lua
{
  'your-colorscheme/repo',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('your-colorscheme')
  end,
},
```

## 📝 Adding Keybindings

All keybindings are in `lua/config/keymaps.lua`. Just add:

```lua
keymap('n', '<leader>X', '<cmd>YourCommand<CR>', { desc = 'Description' })
```

## 🛠️ Adding Language Servers

In `lua/plugins/init.lua`, find the LSP configuration and:

1. Add to `ensure_installed`: `ensure_installed = { 'lua_ls', 'your_ls' }`
2. Add server setup:
```lua
lspconfig.your_ls.setup({
  capabilities = capabilities,
})
```

## 📦 Included Plugins

- **tokyonight** - Colorscheme
- **telescope** - Fuzzy finder
- **neo-tree** - File explorer
- **gitsigns** - Git integration
- **nvim-cmp** - Autocompletion
- **nvim-lspconfig** - LSP support
- **mason** - LSP installer
- **treesitter** - Better syntax highlighting
- **lualine** - Statusline
- **autopairs** - Auto close brackets
- **Comment** - Easy commenting
- **which-key** - Keybinding hints

## 💡 Tips

- Use `:Lazy` to manage plugins
- Use `:Mason` to install language servers
- Use `:checkhealth` to verify installation
- Press `<leader>` and wait to see available keybindings (which-key)
