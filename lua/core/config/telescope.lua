local actions = require('telescope.actions')

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
			disable_devicons = true,
			previewer = false,
		}
	}
}
