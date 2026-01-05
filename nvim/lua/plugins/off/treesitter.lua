-- TREESITTER.LUA - Syntax Highlighting and Code Understanding
-- For Neovim 0.11+ with modern nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.10.0',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'vim', 'vimdoc', 'yaml', 'json', },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
