-- ============================================================================
-- LSP.LUA - Language Server Protocol Configuration
-- ============================================================================
-- LSP provides features like auto-completion, go-to-definition, and more
-- See `:help lsp` for more information
-- ============================================================================

return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  
  dependencies = {
    -- Automatically install LSP servers
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },
    
    -- Neovim Lua LSP configuration
    { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
  },
  
  config = function()
    -- ========================================================================
    -- LSP Attach Callback
    -- ========================================================================
    -- This function runs when an LSP server attaches to a buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        
        -- Navigation
        map('gd', require('telescope.builtin').lsp_definitions, 'Go to definition')
        map('gr', require('telescope.builtin').lsp_references, 'Go to references')
        map('gI', require('telescope.builtin').lsp_implementations, 'Go to implementation')
        map('gD', vim.lsp.buf.declaration, 'Go to declaration')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type definition')
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document symbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace symbols')
        
        -- Actions
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
        map('<leader>f', vim.lsp.buf.format, 'Format document')
        
        -- Documentation
        map('K', vim.lsp.buf.hover, 'Hover documentation')
        
        -- Highlight references under cursor
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
    
    -- ========================================================================
    -- LSP Server Capabilities
    -- ========================================================================
    -- Capabilities advertised to LSP servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())
    
    -- ========================================================================
    -- Server Configurations
    -- ========================================================================
    -- Configure each LSP server here
    local servers = {
      -- Lua
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = {
              disable = { 'missing-fields' },
            },
          },
        },
      },
      
      -- Python
      -- pyright = {},
      
      -- JavaScript/TypeScript
      -- tsserver = {},
      
      -- Add more servers as needed
    }
    
    -- ========================================================================
    -- Mason Setup
    -- ========================================================================
    require('mason').setup()
    
    -- List of servers to auto-install
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',  -- Lua formatter
      -- Add more tools here
    })
    
    require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
    
    require('mason-lspconfig').setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
