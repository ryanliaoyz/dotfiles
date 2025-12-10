-- Enable LSP servers
vim.lsp.enable("ts_ls")
vim.lsp.enable("clangd")

-- Buffer-local LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local opts = { buffer = buf, silent = true, noremap = true }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition,  opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references,  opts)
    vim.keymap.set("n", "K",  vim.lsp.buf.hover,       opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,   opts)
    vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>ca",  vim.lsp.buf.code_action, opts)
  end,
})

-- Global diagnostics navigation
vim.keymap.set("n", "<leader>e", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
vim.keymap.set("n", "[d",        vim.diagnostic.goto_prev,  { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d",        vim.diagnostic.goto_next,  { desc = "Next diagnostic" })

-- Format on-demand via LSP
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format buffer via LSP" })

-- Optional: close current buffer quickly (keep window)
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
