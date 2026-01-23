# Installation
```bash
git clone git@github.com:crulises/dotfiles.git ~/.config
```

# Basic structure
```bash
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua      # 
│   │   ├── options.lua       # All vim settings
│   │   ├── keymaps.lua       # All keybindings
│   │   └── lazy.lua          # All keybindings
│   └── plugins/
│       └── [Individual plugin configs as needed]
```

