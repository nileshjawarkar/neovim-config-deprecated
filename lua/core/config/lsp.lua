local req_servers = {
	'sumneko_lua', 'pyright', 'rust_analyzer', 'tsserver',
	'clangd', 'cssls', 'dockerls', 'html', 'bashls',
	'jsonls', 'lemminx', 'yamlls'
}

require("nvim-lsp-installer").setup({
	ensure_installed = req_servers,
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "*",
			server_pending = "$",
			server_uninstalled = "?"
		}
	}
})

local setgkey = vim.api.nvim_set_keymap
local setbkey = vim.api.nvim_buf_set_keymap
local setboption = vim.api.nvim_buf_set_option

local opts = { noremap = true, silent = true }
setgkey('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
setgkey('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
setgkey('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
setgkey('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
	setboption(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	setbkey(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	setbkey(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	setbkey(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	setbkey(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	setbkey(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	setbkey(bufnr, 'n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	setbkey(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	setbkey(bufnr, 'n', '<leader>lr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	setbkey(bufnr, 'n', '<leader>lw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	setbkey(bufnr, 'n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	setbkey(bufnr, 'n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	setbkey(bufnr, 'n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	setbkey(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in pairs(req_servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
