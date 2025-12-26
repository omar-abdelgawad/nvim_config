return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save --wrong this is for loading plugin
    opts = require "configs.conform",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    -- init = function ()
    --   vim.g.rustaceanvim = {
    --     server = {
    --       default_settings = {
    --         ["rust-analyzer"] = {
    --           cargo = {
    --             allFeatures = true,
    --           },
    --         },
    --       },
    --     },
    --   }
    -- end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- {
  --   "williamboman/mason.nvim"
  -- },
  -- Turns out I had to explicity tell lazy to load This
  -- config even though configs.lspconfig is part of the ensure_install
  -- I think that nvchad comes preinstalled with some plugins but you have
  -- to enable them here like treesitter as well.
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  -- Edited default treesitter in 23/04/2025
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.nvim-treesitter"
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = require("configs.smear-cursor"),
  },
}
