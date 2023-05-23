---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "oxocarbon",
  theme_toggle = { "oxocarbon", "github_dark" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {},
  telescope = { style = "bordered" },

  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"
      local fn = vim.fn
      local sep_l = ""
      return {
        cursor_position = function()
          -- default cursor_position module
          local line = fn.line "."
          local col = fn.virtcol "."
          local total_line = fn.line "$"

          local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "
          local chad = string.format(" %d:%d", line, col) .. " │ "
          local text = math.modf((line / total_line) * 100) .. tostring "%%"
          text = string.format("%4s", text)
          text = (line == 1 and "Top") or text
          text = (line == total_line and "Bot") or text

          return left_sep .. "%#St_pos_text#" .. chad .. text .. " "
        end,
      }
    end,
  },

  tabufline = {
    show_numbers = true,
  },

  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
