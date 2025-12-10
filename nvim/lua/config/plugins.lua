-- Plugin Manager: lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "cpp",
          "tsx",
          "json",
          "c",
          "haskell"
        },
        highlight = { enable = true },
      })
    end,
  },

  -- LSP core (we’re still using vim.lsp.enable, but this stays ready)
  { "neovim/nvim-lspconfig" },

  -- Telescope + plenary, with keymaps and buffer delete mappings
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local ok_builtin, builtin = pcall(require, "telescope.builtin")
      if ok_builtin then
        local map = vim.keymap.set
        map("n", "<leader>ff", builtin.find_files, { desc = "Telescope: files" })
        map("n", "<leader>fg", builtin.live_grep,  { desc = "Telescope: live grep" })
        map("n", "<leader>fb", builtin.buffers,    { desc = "Telescope: buffers" })
        map("n", "<leader>fo", builtin.oldfiles,   { desc = "Telescope: recent files" })
      end

      local ok_telescope, telescope = pcall(require, "telescope")
      if ok_telescope then
        local actions = require("telescope.actions")
        telescope.setup({
          pickers = {
            buffers = {
              sort_lastused = true,
              mappings = {
                i = {
                  ["<C-d>"] = actions.delete_buffer, -- delete in insert mode
                },
                n = {
                  ["dd"] = actions.delete_buffer,    -- delete in normal mode
                },
              },
            },
          },
        })
      end
    end,
  },

  -- Lualine statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local ok_lualine, lualine = pcall(require, "lualine")
      if not ok_lualine then
        return
      end

      lualine.setup({
        options = {
          icons_enabled = false,
          theme = "auto",
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "filename" },
          lualine_c = { "branch" },
          lualine_x = { "diagnostics" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Quick Comment: gcc/gbc/gc5j...
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Autopair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Embedded terminal
{
  "numToStr/FTerm.nvim",
  config = function()
    local fterm = require("FTerm")

    -- Toggle terminal with <leader>tt in normal or terminal mode
    vim.keymap.set({ "n", "t" }, "<leader>tt", function()
      fterm:toggle()
    end, { desc = "[T]oggle [T]erminal (FTerm)" })
  end,
},
})
