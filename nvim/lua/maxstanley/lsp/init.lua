local Remap = require("maxstanley.keymap")
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local luasnip = require("luasnip")
local rust_tools = require("rust-tools")

local nnoremap = Remap.nnoremap

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<Up>"] = cmp.mapping.scroll_docs(-4),
		["<Down>"] = cmp.mapping.scroll_docs(4),
	 	["<Esc>"] = cmp.mapping.abort(),
	 	["<CR>"] = cmp.mapping.confirm({ select = true }),
	 	["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			  cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
			  luasnip.expand_or_jump()
			else
			  fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			  cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
			  luasnip.jump(-1)
			else
			  fallback()
			end
		end, { "i", "s" }),
	}),
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	}),
	-- completion = {
	-- 	completeopt = "menu,menuone,noinsert",
	-- 	autocomplete = true,
	-- },
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
	}, _config or {})
end

lspconfig.rust_analyzer.setup(config({
	cargo = {
		allFeatures = true
	},
	checkOnSave = {
		command = "clippy"
	},
}))

rust_tools.setup({})

