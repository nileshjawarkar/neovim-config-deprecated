local util = require("core.util")

--------------------------
-- Normal mode mappings --
--------------------------
local leader_nkey_map = {
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
		c = {'<cmd>let @+ = expand("%:p")<CR>', "Copy file path"},
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
		i = {"<cmd>vertical resize +10<cr>", "Increase column size"},
		d = {"<cmd>vertical resize -10<cr>", "Decrease column size"},
	},
}

util.map_nkey("<leader>", leader_nkey_map)

--------------------------
-- Terminal mode mappings --
--------------------------
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local global_tkey_map = {
	w = {
		name = "Terminal",
		e = {t("<c-\\><c-n>"), "Normal mode"},
		h = {t("<c-\\><c-n><c-w>h"), "Move right"},
		l = {t("<c-\\><c-n><c-w>l"), "Move left"},
		j = {t("<c-\\><c-n><c-w>j"), "Move down"},
		k = {t("<c-\\><c-n><c-w>k"), "Move up"},
	},
}

util.map_tkey("<leader>", global_tkey_map)

local global_nkey_map = {
	["<M-+>"] = {"<cmd>vertical resize +10<cr>", "Increase column size"},
	["<M-_>"] = {"<cmd>vertical resize -10<cr>", "Decrease column size"},
}

util.map_tkey(nil, global_nkey_map)

--------------------------
-- Visual mode mappings --
--------------------------
local global_vkey_map = {
	['<'] = {'<gv', "Indent left"},
	['>'] = {'>gv', "Indent right"},
}

util.map_vkey(nil, global_vkey_map)

--------------------------
-- Global mappings --
--------------------------
local global_key_map = {
	['<F6>'] = {"<cmd>setlocal spell! spelllang=en_us<cr>", "Enable spell check"},
}
util.map_key(nil, nil, nil, global_key_map)

