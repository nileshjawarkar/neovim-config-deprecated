local kop = { noremap = true, silent = true };

--[[
#------------------------------------------------------------------------------#
#                                    CONFIG                                    #
#------------------------------------------------------------------------------#
--]]
-- reload nvim configuration file
vim.api.nvim_set_keymap('n', ',r', ':luafile $MYVIMRC<cr>', {})

-- edit nvim configuration file
vim.api.nvim_set_keymap('n', ',e', ':vsp $MYVIMRC<cr>', {})


--[[
#------------------------------------------------------------------------------#
#                                  CURSOR MOVE                                 #
#------------------------------------------------------------------------------#
--]]
vim.api.nvim_set_keymap('n', '<leader>wh', '<c-w>h', {})
vim.api.nvim_set_keymap('n', '<leader>wl', '<c-w>l', {})
vim.api.nvim_set_keymap('n', '<leader>wj', '<c-w>j', {})
vim.api.nvim_set_keymap('n', '<leader>wk', '<c-w>k', {})

vim.api.nvim_set_keymap('n', '<leader>wp', ':vertical resize +3<cr>', kop)
vim.api.nvim_set_keymap('n', '<leader>wm', ':vertical resize -3<cr>', kop)

--[[
#------------------------------------------------------------------------------#
#                               BUFFER READ WRITE                              #
#------------------------------------------------------------------------------#
--]]
-- [ ctrl + s ] save the current buffer
vim.api.nvim_set_keymap('n', '<c-s>', ':w<cr>', {})

-- [ ctrl + q ] quite the current buffer
vim.api.nvim_set_keymap('n', '<c-q>', ':bd<cr>', {})


--[[ #------------------------------------------------------------------------------#
#                                COPY PASTE                                #
#------------------------------------------------------------------------------#
--]]
-- [ Y ] copy until the end of the line
vim.api.nvim_set_keymap('n', 'Y', 'y$', {})

-- [ ctrl + y ] copy current line and paste next line
vim.api.nvim_set_keymap('n', '<c-y>', 'yyp', {})



--[[
#--------------------------------------------------------------------------------#
#                          INDENTATION                                           #
#--------------------------------------------------------------------------------#
--]]
vim.api.nvim_set_keymap('v', '<', '<gv', kop)
vim.api.nvim_set_keymap('v', '>', '>gv', kop)


--[[
#------------------------------------------------------------------------------#
#                                    TERMINAL                                  #
#------------------------------------------------------------------------------#
--]]
vim.api.nvim_set_keymap('t', '<esc>', [[<c-\><c-n>]], {})

-- [ ctrl + k ] to change the window from terminal
vim.api.nvim_set_keymap('t', '<c-k>', [[<c-\><c-n><c-w>k]], {})

-- [ ctrl + j ] move cursor to bottom window from terminal
vim.api.nvim_set_keymap('t', '<c-j>', [[<c-\><c-n><c-w>j]], {})

-- [ ctrl + h ] move cursor to left window from terminal
vim.api.nvim_set_keymap('t', '<c-j>', [[<c-\><c-n><c-w>h]], {})

-- [ ctrl + l ] move cursor to right window from terminal
vim.api.nvim_set_keymap('t', '<c-j>', [[<c-\><c-n><c-w>l]], {})


--[[
#------------------------------------------------------------------------------#
#                                     OTHER                                    #
#------------------------------------------------------------------------------#
--]]

-- [ <F6> ] to go enable spell checker
vim.api.nvim_set_keymap('', '<F6>', ':setlocal spell! spelllang=en_us<cr>', kop)
