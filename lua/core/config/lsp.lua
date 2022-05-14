local req_servers = {
	'pyright', 'clangd',
	'tsserver', 'cssls', 'dockerls', 'html', 'bashls',
	'jsonls', 'lemminx', 'yamlls', 'sumneko_lua'
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

local util = require("core.util")

local ng_leaderkey_map = {
	l = {
		name = "Lsp",
		e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic - Open float" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostic - Set local list" },
		p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Diagnostic - Previous" },
		n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Diagnostic - Next" },
	}
}
util.map_nkey("<leader>", ng_leaderkey_map)

local nb_leaderkey_map = {
	l = {
		name = "Lsp",
		A = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder" },
		R = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder" },
		L = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folders" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
		d = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format code" },
	}
}

local nb_key_map = {
	['gr'] = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
	['gD'] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
	['gd'] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
	['gi'] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
	['K'] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
}

local setboption = vim.api.nvim_buf_set_option
local on_attach = function(_, bufnr)
	setboption(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	util.map_key("<leader>", "n", bufnr, nb_leaderkey_map)
	util.map_key(nil, "n", bufnr, nb_key_map)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_config = require('lspconfig')
local setup_opts = {
	on_attach = on_attach,
	capabilities = capabilities,
}

for _, lsp_server in pairs(req_servers) do
	lsp_config[lsp_server].setup(setup_opts)
end
