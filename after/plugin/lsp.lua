local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.configure('csharp_ls', {
    handlers = {
        ["textDocument/definition"] = require('csharpls_extended').handler,
    },
    on_attach = function(client, bufnr)
        require('lsp_signature').on_attach({ bind=true }, bufnr)
    end
})

lsp.preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    set_extra_mappings = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').qmlls.setup({})

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-a>'] = cmp.mapping.confirm({select=true}),
    ['<C-Space>'] = cmp.mapping.complete(),
  })
})

vim.keymap.set('n', '<leader>hh', ":ClangdSwitchSourceHeader<CR>")

lsp.setup()
