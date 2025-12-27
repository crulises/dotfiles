-- ============================================================================
-- LAZY.LUA - Plugin Manager Bootstrap and Configuration
-- ============================================================================
-- Bootstraps lazy.nvim and loads all plugin specifications
-- See `:help lazy.nvim.txt` for more information
-- ============================================================================

-- ============================================================================
-- Bootstrap lazy.nvim
-- ============================================================================
-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable',
		lazyrepo,
		lazypath
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out,                            'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Load Plugins
-- ============================================================================
-- Setup lazy.nvim with plugin specifications
-- Plugins are organized in separate files in lua/plugins/
require('lazy').setup({
	-- Load all plugin specs from lua/plugins/ directory
	{ import = 'plugins' },
}, {
	-- Lazy.nvim UI Configuration
	ui = {
		-- Icons used in the lazy.nvim UI
		icons = vim.g.have_nerd_font and {} or {
			cmd = '⌘',
			config = '🛠',
			event = '📅',
			ft = '📂',
			init = '⚙',
			keys = '🗝',
			plugin = '🔌',
			runtime = '💻',
			require = '🌙',
			source = '📄',
			start = '🚀',
			task = '📌',
			lazy = '💤 ',
		},
	},

	-- Performance
	performance = {
		rtp = {
			-- Disable some not-in-use-built-in plugins
			disabled_plugins = {
				'gzip',
				'matchit',
				'matchparen',
				'netrwPlugin',
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin',
			},
		},
	},

	-- Change Detection
	change_detection = {
		enabled = true, -- Automatically check for config changes
		notify = false, -- This can be annoying if enabled
	},
})

-- vim: ts=2 sts=2 sw=2 et
