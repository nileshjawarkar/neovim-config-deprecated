local cmd = vim.cmd

cmd([[
		if (empty($TMUX))
		  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
		  if (has("termguicolors"))
		    set termguicolors
		  endif
		endif
]])

cmd('colorscheme onedark')
cmd('set guifont=Monospace:h12')


