vim.cmd( "let g:vimwiki_list = [{'path': '~/vimwiki/', \'syntax': 'markdown', 'ext': '.md'}]" )

local util = require("core.util")
local keymapping = {
	v = {
		name = "wiki",
		i = {"<cmd>VimwikiIndex<CR>", "Index"},
		d = {"<cmd>VimwikiDiaryIndex<CR>", "Diary index"},
	}
}
util.map_nkey("<leader>", keymapping)
