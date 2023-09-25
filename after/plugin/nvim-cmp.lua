local cmp = require("cmp")
local lusnip = require("luasnip")

require("luasnip/loaders/from_vscode").load()

cmp.setup({
	completion = {
		completeopt = "menu,menuone,preview,noselect",
	},
	snippet = {
		expand = function(args)
			lusnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
		}),
		["C-f"] = cmp.mapping.scroll_docs(-4),
		["C-b"] = cmp.mapping.scroll_docs(4),
	}),

	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})
