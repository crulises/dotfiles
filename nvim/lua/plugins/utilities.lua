-- ============================================================================
-- UTILITIES.LUA - Small Utility Plugins
-- ============================================================================
-- Collection of small, focused plugins that enhance editing
-- ============================================================================

return {
  -- ==========================================================================
  -- Automatic Indentation Detection
  -- ==========================================================================
  {
    'tpope/vim-sleuth',
    event = { 'BufReadPost', 'BufNewFile' },
  },
  
  -- ==========================================================================
  -- Git Signs in Gutter
  -- ==========================================================================
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        
        -- Navigation
        map('n', ']h', gs.next_hunk, 'Next git hunk')
        map('n', '[h', gs.prev_hunk, 'Previous git hunk')
        
        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
        map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
        map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
        map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
        map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
        map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
        map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame line')
        map('n', '<leader>hd', gs.diffthis, 'Diff this')
        map('n', '<leader>hD', function() gs.diffthis('~') end, 'Diff this ~')
        
        -- Text objects
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Select git hunk')
      end,
    },
  },
  
  -- ==========================================================================
  -- Which-key: Show Available Keybindings
  -- ==========================================================================
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 500,  -- Time before popup shows (ms)
      
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
        },
      },
      
      -- Document leader key groups
      spec = {
        { '<leader>f', group = 'Find (Telescope)' },
        { '<leader>h', group = 'Git hunks' },
        { '<leader>d', group = 'Diagnostics' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>c', group = 'Code/Quickfix' },
        { '<leader>b', group = 'Buffer' },
      },
    },
  },
  
  -- ==========================================================================
  -- Mini.nvim: Collection of Small Modules
  -- ==========================================================================
  {
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      -- Better text objects (around/inside)
      -- Examples: va), yinq, ci'
      require('mini.ai').setup({ n_lines = 500 })
      
      -- Add/delete/replace surroundings
      -- Examples: saiw), sd', sr)'
      require('mini.surround').setup()
      
      -- Simple statusline
      local statusline = require('mini.statusline')
      statusline.setup({
        use_icons = vim.g.have_nerd_font,
        set_vim_settings = false,
      })
      
      -- Customize cursor location section
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  
  -- ==========================================================================
  -- Todo Comments
  -- ==========================================================================
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,  -- Don't show signs in gutter
      
      -- Keywords recognized as todo comments
      keywords = {
        FIX  = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
