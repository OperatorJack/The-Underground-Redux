-- Check MWSE Build --
if (mwse.buildDate == nil) or (mwse.buildDate < 20200122) then
    local function warning()
        tes3.messageBox(
            "[The Underground: ERROR] Your MWSE is out of date!"
            .. " You will need to update to a more recent version to use this mod."
        )
    end
    event.register("initialized", warning)
    event.register("loaded", warning)
    return
end
----------------------------

local config = require("TheUnderground.config")
local common = require("TheUnderground.common")

-- Register the mod config menu (using EasyMCM library).
event.register("modConfigReady", function()
    dofile("Data Files\\MWSE\\mods\\TheUnderground\\mcm.lua")
end)

require("TheUnderground.modules.betterCompanion")


event.register("initialized", function(e)
    mwse.log("[The Underground] Initialized.")
end)