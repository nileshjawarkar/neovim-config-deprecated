local wk = require("which-key")
wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		presets = {
			operators = false, -- adds help for operators like d, y, ...
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
		spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		["<leader>"] = "LEADER",
		["<CR>"] = "RET",
		["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scrol_down = '<c-d>', -- binding to scroll down inside the popup
		scroll_up = '<c-u>', -- binding to scroll up inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
		winblend = 0
	},
	layout = {
		height = { min = 4, max = 20 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = false, -- show help message on the command line when the popup is visible
	triggers = { "<leader>" },
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

local n_opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local n_mappings = {
	[";"] = { "<cmd>Telescope find_files<cr>", "Find files" },
	["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in buffer" },
	['.'] = {'<cmd>Telescope live_grep<cr>', "Find in files" },
	[','] = {'<cmd>Telescope buffers<cr>', "List buffers"},
	['h'] = {'<cmd>Telescope help_tags<cr>', "Help"},
	['<CR>'] = {"<cmd>NvimTreeFindFile<CR>", "Find in tree"},

	f = {
		name = "Files",
		f = {"<cmd>Telescope find_files<cr>", "Find files"},
		b = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in buffer"},
		g = {"<cmd>Telescope live_grep<cr>", "Find in files"},
		l = {"<cmd>Telescope buffers<cr>", "List buffers"},
		t = {"<cmd>NvimTreeFindFile<CR>", "Find in tree"},
	},

	t = {
		name = "Tree",
		t = {"<cmd>NvimTreeToggle<CR>", "Toggle tree"},
		f = {"<cmd>NvimTreeFindFile<CR>", "Find in tree"},
	},

	w = {
		name = "Windows",
		h = {"<c-w>h", "Move to right"},
		l = {"<c-w>l", "Move to left"},
		j = {"<c-w>j", "Move down"},
		k = {"<c-w>k", "Move up"},
	},
}

wk.register(n_mappings, n_opts)
