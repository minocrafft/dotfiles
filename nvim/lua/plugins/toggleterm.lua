-- Setup nvim-cmp.
local setup, toggleterm = pcall(require, "toggleterm")
if not setup then
  return
end


toggleterm.setup {
  float_opts = {
    border = 'double',
    width = 200,
    height = 50,
  },
}
