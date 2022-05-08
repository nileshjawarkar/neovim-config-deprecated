local wk = require("which-key")
local cmd = vim.cmd

cmd( "let g:vimwiki_list = [{'path': '~/vimwiki/', \'syntax': 'markdown', 'ext': '.md'}]" )

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local keymapping = {
	v = {
		name = "wiki",
		i = {"<cmd>VimwikiIndex<CR>", "Index"},
		d = {"<cmd>VimwikiDiaryIndex<CR>", "Diary index"},
	}
}

wk.register( keymapping, opts)

