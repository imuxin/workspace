---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>z"] = {":TagbarToggle<CR>", "toggle tagbar"},

    -- ["gb"] = {
    --   function()
    --     package.loaded.gitsigns.blame_line({ full = true })
    --   end,
    --   "Blame line",
    -- },
  },
}

-- more keybinds!

return M
