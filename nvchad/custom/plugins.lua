local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
    },
    opts = overrides.cmp,
  },

  -----------------------
  -- Better experience --
  -----------------------
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup({
        width = 15,
      })
    end,
    keys = {
      { "<leader><Tab>", "<cmd>SymbolsOutline<CR>" },
    },
  },

  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        width = 120,
        height = 40,
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = overrides.noice,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- codeium
  {
    "Exafunction/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup()
    end,
  },

  -- Note-takings
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = "Telekasten",
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/SecondBrain"),
      })
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
  },

  { "renerocksai/calendar-vim" },
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },

  ----------------------------
  -- For specific languages --
  ----------------------------
  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
  },

  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require("rust-tools").setup()
    end,
  },

  { "mfussenegger/nvim-dap" },

  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup()
      require("crates").show()
    end,
  },
}

return plugins
