local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

local kop = { noremap = true, silent = true };

vim.api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("telescope.builtin").find_files()<cr>', kop)
vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', kop)
vim.api.nvim_set_keymap('n', '<leader>.', '<cmd>lua require("telescope.builtin").live_grep()<cr>', kop)
vim.api.nvim_set_keymap('n', '<leader>,', '<cmd>lua require("telescope.builtin").buffers()<cr>', kop)
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', kop)

require('telescope').setup {
	defaults = {
		prompt_prefix = ' > ',
		mappings = {
			i = {
				["jk"] = actions.close,
			},
		},
		set_env = { ['COLORTERM'] = 'truecolor' },
	},

	pickers = {
		find_files = {
			previewer = false,
			disable_devicons = true
		},

		live_grep = {
			disable_devicons = true
		},

		buffers = {
			sort_lastused = true,
			disable_devicons = true
		}
	}
}
