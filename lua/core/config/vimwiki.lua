vim.cmd("let g:vimwiki_list = [{'path': '~/vimwiki/', \'syntax': 'markdown', 'ext': '.md'}]")

local util = require("core.util")
local keymapping = {
	v = {
		name = "wiki",
		i = { "<cmd>VimwikiIndex<CR>", "Index" },
		d = { "<cmd>VimwikiDiaryIndex<CR>", "Diary index" },
		n = { "<cmd>VimwikiMakeDiaryNote<CR>", "New diary note" },
		y = { "<cmd>VimwikiMakeYesterdayDiaryNote<CR>", "Yesterday's new diary note" },
		t = { "<cmd>VimwikiMakeTomorrowDiaryNote<CR>", "Tomorrow's new diary note" },
		g = { "<cmd>VimwikiDiaryGenerateLinks<CR>", "Generate diary links" },
	}
}
util.map_nkey("<leader>", keymapping)
