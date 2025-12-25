-- ============================================================================
-- COMPLETION.LUA - Auto-completion Configuration
-- ============================================================================
-- Blink.cmp provides fast auto-completion with snippets
-- See `:help blink.cmp` for more information
-- ============================================================================

return {
  'saghen/blink.cmp',
  version = '*',

  dependencies = {
    'L3MON4D3/LuaSnip',  -- Snippet engine
    'rafamadriz/friendly-snippets',  -- Snippet collection
  },

  opts = {
    -- ========================================================================
    -- Keymap Configuration
    -- ========================================================================
    keymap = {
      preset = 'default',
      -- Available presets:
      -- 'default' - Standard mappings
      -- 'super-tab' - Tab for everything
      -- 'enter' - Enter to accept
      --
      -- Default mappings:
      -- <C-space> - Show completion menu
      -- <C-n>/<C-p> or <Down>/<Up> - Select next/previous
      -- <C-e> - Close menu
      -- <C-y> - Accept selection
      -- <Tab>/<S-Tab> - Snippet navigation
    },

    -- ========================================================================
    -- Appearance
    -- ========================================================================
    appearance = {
      nerd_font_variant = 'mono',  -- Use 'normal' if not using Nerd Font Mono
    },

    -- ========================================================================
    -- Sources
    -- ========================================================================
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },

      providers = {
        -- Special provider for Neovim Lua development
        lazydev = {
          module = 'lazydev.integrations.blink',
          name = 'LazyDev',
          score_offset = 100,  -- Show above other sources
        },
      },
    },

    -- ========================================================================
    -- Snippets
    -- ========================================================================
    snippets = {
      preset = 'luasnip',
    },

    -- ========================================================================
    -- Completion Behavior
    -- ========================================================================
    completion = {
      menu = {
        border = 'rounded',
        draw = {
          columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
        },
      },

      documentation = {
        auto_show = true,  -- Show documentation automatically
        auto_show_delay_ms = 500,
        window = {
          border = 'rounded',
        },
      },

      -- Ghost text (inline suggestions)
      ghost_text = {
        enabled = true,
      },
    },

    -- ========================================================================
    -- Signature Help
    -- ========================================================================
    signature = {
      enabled = true,
      window = {
        border = 'rounded',
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
