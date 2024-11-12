local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_filetypes = { "javascriptreact", "typescriptreact" }, -- for React
            extra_args = { "--single-quote", "--jsx-single-quote" }, -- optional Prettier args
        }),
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
            vim.api.nvim_command [[augroup END]]
        end
    end,
})


