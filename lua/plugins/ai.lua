local stage = require("stage")

if stage == "personal" then
  return {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  }
end

if stage == "work" then
  return {
    "github/copilot.vim",
  }
end


return {}
