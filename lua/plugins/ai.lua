local stage = require("config.stage")

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


error("File `lua/config/stage.lua` has no exported stage with enum `personal` or `work`")
