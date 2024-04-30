require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "markdown_oxide"}
})

require("lspconfig").lua_ls.setup {}
