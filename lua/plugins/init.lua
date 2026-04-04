return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save --wrong this is for loading plugin
    opts = require "configs.conform",
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^9", -- Recommended
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
  -- 04/04/2026: I basically stole the new conf for nvim v0.12 from here (https://mhpark.me/posts/update-treesitter-main/)
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- this plugin doesn't support lazy loading
    build = ":TSUpdate",
    branch = "main",
 config = function()
        local ts = require 'nvim-treesitter'
        local parsers = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "printf",
    "python",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "rust",
    "diff",
    "dockerfile",
    "git_config",
    "gitcommit",
    "gitignore",
    "sql",
        }

        for _, parser in ipairs(parsers) do
            ts.install(parser)
        end

        -- Not every tree-sitter parser is the same as the file type detected
        -- So the patterns need to be registered more cleverly
        local patterns = {}
        for _, parser in ipairs(parsers) do
            local parser_patterns = vim.treesitter.language.get_filetypes(parser)
            for _, pp in pairs(parser_patterns) do
                table.insert(patterns, pp)
            end
        end

        vim.treesitter.language.register("groovy", "Jenkinsfile")
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'

        vim.api.nvim_create_autocmd('FileType', {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = require("configs.smear-cursor"),
  },
}
