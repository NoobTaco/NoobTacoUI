-- NoobTacoUI Helper Commands
-- Author: NoobTaco
-- Description: Additional slash commands for ease of use

-- Register /rl and /reloadui as aliases for ReloadUI()
SLASH_RELOADUI1 = "/rl"
SLASH_RELOADUI2 = "/reloadui"
SlashCmdList["RELOADUI"] = function()
  ReloadUI()
end
