local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

local kop = { noremap = true, silent = true };


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
