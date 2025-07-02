return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        config = function()
            local lspconf = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            lspconf.lua_ls.setup({ capabilities = capabilities })
            lspconf.phpactor.setup({ capabilities = capabilities })
            lspconf.ts_ls.setup({ capabilities = capabilities })
            lspconf.cssls.setup({ capabilities = capabilities })
            lspconf.html.setup({ capabilities = capabilities })
            lspconf.pyright.setup({ capabilities = capabilities })
            lspconf.clangd.setup({ capabilities = capabilities })
            lspconf.gopls.setup({ capabilities = capabilities, })
            lspconf.templ.setup({ capabilities = capabilities })
            lspconf.htmx.setup({ capabilities = capabilities })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then return end

                    ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
                    if client.supports_method("textDocument/formatting") then
                        -- Format the current buffer on save
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                            end,
                        })
                    end
                end
            })
        end
    }
}
