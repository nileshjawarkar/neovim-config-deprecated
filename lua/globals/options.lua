local o = vim.o
local wo = vim.wo
local bo = vim.bo

--##########################################################
o.laststatus = 3
o.cmdheight = 2
-- set the tab size to length of 4 spaces
-- shiftwidth set the indentation length
o.tabstop = 4
o.shiftwidth = 4

-- remove highlighting after search is done
o.hlsearch = false

-- auto code folding when openeing new file at level 1
o.foldlevelstart = 4

-- auto wrap after 80 characters in the line
o.textwidth = 110

-- 'backup' 'writebackup'	action	~
-- off	     off	no backup made
-- off	     on		backup current file, deleted afterwards (default)
-- on	     off	delete old backup, backup current file
-- on	     on		delete old backup, backup current file
o.backup = false
o.writebackup = true
o.swapfile = false

-- write changes to swap file after "n" ms
-- for some reason when the updatetime is high, autocompletion in coc nvim
-- takes a long time
o.updatetime = 300

-- controls how short messages are displayed in status bar section
o.shortmess = vim.o.shortmess .. 'c'

-- open completion menu even for single item
-- do not auto insert items from completion menu
-- @warning - preview is removed. when it's on, default lsp opens a vertical tab
o.completeopt = 'menuone,noinsert,noselect'

-- stop showing the current mode
o.showmode = false
-- stop showing the current line and cursor position in the status bar
o.ruler = false

-- set the font for GUI clients like neovide
o.guifont='Cascadia Code, FiraCode, Nerd Font'

-- highlight the current cursor line.
o.cursorline = true

o.smartcase = true
o.ignorecase = true

-- shows the effects of a command incrementally
o.inccommand = 'nosplit'

-- where to place the new split windows
o.splitright = true
o.splitbelow = true

-- hide unsaved file when closing the buffer
-- usually vim doesn't allow closing unsaved buffer unless you force it
-- but with hidden option, buffer will be hidden when you close it
-- vim will prompt you to save when closing vim editor
o.hidden = true

o.background = 'dark'
o.termguicolors = true

-- assign unnamedplus register to clipboard
-- anything in the clipboard can be pasted directly
-- any yanked text will be copied to clipboard
o.clipboard ='unnamedplus'

--##########################################################

-- shows the number bar in left hand side of the window
wo.number = true

-- shows numbers relative to the current cursor position
wo.relativenumber = true

-- code folding method to syntax
-- common methods will be used such as curly braces 
-- foldmethod = 'syntax',

-- error signs and warnings will be displayed in the number line
-- usually it adds new column when signs, moving buffer to right side.
-- adding a column create weird effect that's little bit hard for the eye
wo.signcolumn = 'number'

-- vim try to keep 100 lines below and above when scrolling
-- if buffer cannot display more than 200 lines, cursor will stay in center
-- and scroll the buffer
wo.scrolloff=15

--##########################################################

-- set the tab size to length of 4 spaces
-- shiftwidth set the indentation length
bo.shiftwidth = 4


local cmd = vim.cmd
cmd([[
	let g:clipboard = {
	\   'name': 'myClipboard',
	\   'copy': {
	\      '+': {lines, regtype -> extend(g:, {'xyzclipbord': [lines, regtype]}) },
	\      '*': {lines, regtype -> extend(g:, {'xyzclipbord': [lines, regtype]}) },
	\    },
	\   'paste': {
	\      '+': {-> get(g:, 'xyzclipbord', [])},
	\      '*': {-> get(g:, 'xyzclipbord', [])},
	\   },
	\ }
]])

