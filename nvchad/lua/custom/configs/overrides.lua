local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "dart",
  },
  indent = {
    enable = true,
    disable = {
      "dart",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "prettier",

    -- python
    "pyright",
    "black",

    -- rust
    "rust-analyzer",
    -- "rustfmt", is deprecated

    -- dart
    "dart_format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  auto_reload_on_write = true,
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    full_name = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  modified = {
    enable = true,
  },

  view = {
    preserve_window_proportions = true,
  },
}

M.cmp = {
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  sources = {
    { name = "copilot",  group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip",  group_index = 2 },
    { name = "buffer",   group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path",     group_index = 2 },
    { name = "crates",   group_index = 2 },
  },
  mapping = {
    ["<CR>"] = require("cmp").mapping.confirm {
      behavior = require("cmp").ConfirmBehavior.Insert,
      select = false,
    },
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        row = 0.25,
        col = 0,
        width = 0.75,
        height = 0.75,
      },
    },
  },
}

M.copilot = {
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

return M