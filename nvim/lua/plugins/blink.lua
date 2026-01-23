-- BLINK.lua 
-- Here we manage the snippet engines.

return {
  'saghen/blink.cmp',
  version = '*',

  dependencies = {
    'rafamadriz/friendly-snippets',  -- Snippet collection
  },

  opts = {
    -- Keymap Configuration
    keymap = {
      preset = 'default',
    },

    -- Sources
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },

      providers = {
        snippets = {
          opts = {
            friendly_snippets = true,
            -- extended_filetypes = {
            --  markdown = {'jekyll'}
            -- }
          } -- opts
        } -- snippets
      } -- providers
    } -- sources
  } -- opts
}

-- vim: ts=2 sts=2 sw=2 et
