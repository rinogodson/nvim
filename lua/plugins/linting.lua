return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {
      markdown = { "vale" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    local lint_autocmd_group = vim.api.nvim_create_augroup("BunLinterAutoGroup", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group = lint_autocmd_group,
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
      callback = function()
        local status, lint_module = pcall(require, "lint")
        if status and lint_module then
          lint_module.try_lint()
        end
      end,
    })
  end,
}
