-- ============================================================================
-- TELESCOPE.LUA - Fuzzy Finder
-- ============================================================================
-- Telescope is a fuzzy finder for files, text, and more
-- See `:help telescope` for more information
-- ============================================================================

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  
  dependencies = {
    'nvim-lua/plenary.nvim',
    
    -- Faster native fuzzy finder (optional, requires build tools)
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    
    -- Icons (optional)
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    
    telescope.setup({
      defaults = {
        -- ======================================================================
        -- Appearance
        -- ======================================================================
        prompt_prefix = '🔍 ',
        selection_caret = '➜ ',
        
        -- ======================================================================
        -- Behavior
        -- ======================================================================
        mappings = {
          i = {  -- Insert mode mappings
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<Esc>'] = actions.close,

            -- Split keymaps (these are default, but listing for clarity)
            ['<C-x>'] = actions.select_horizontal,  -- Open in horizontal split
            ['<C-l>'] = actions.select_vertical,    -- Open in vertical split
            ['<C-t>'] = actions.select_tab,         -- Open in new tab
          },
        },
        
        -- File ignore patterns
        file_ignore_patterns = {
          'node_modules',
          '.git/',
          'dist/',
          'build/',
          '%.lock',
        },
      },
      
      pickers = {
        find_files = {
          hidden = true,  -- Show hidden files
        },
      },
    })
    
    -- Load extensions
    pcall(telescope.load_extension, 'fzf')
    
    -- ========================================================================
    -- Keymaps
    -- ========================================================================
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap.set
    
    -- File search
    keymap('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    keymap('n', '<leader>fg', builtin.git_files, { desc = 'Find git files' })
    keymap('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recent files' })
    
    -- Text search
    keymap('n', '<leader>fw', builtin.grep_string, { desc = 'Find word under cursor' })
    keymap('n', '<leader>fs', builtin.live_grep, { desc = 'Find string (live grep)' })
    
    -- Other pickers
    keymap('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    keymap('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
    keymap('n', '<leader>fc', builtin.commands, { desc = 'Find commands' })
    keymap('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
    
    -- Resume last picker
    keymap('n', '<leader>f.', builtin.resume, { desc = 'Resume last search' })
    
    -- Current buffer fuzzy find
    keymap('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = 'Fuzzy find in current buffer' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
