local config = require("TheUnderground.config")



local function createGeneralCategory(page)
    local category = page:createCategory{
        label = "General Settings"
    }

    -- Create option to capture debug mode.
    category:createOnOffButton{
        label = "Enable Debug Messages",
        description = "If enabled, Morrowind will show all debug messages related to this mod in-game and in the MWSE.log.",
        variable = mwse.mcm.createTableVariable{
            id = "debug",
            table = config
        }
    }

    -- Create option to capture debug mode.
    category:createOnOffButton{
        label = "Enable Better Companion Script",
        description = "If enabled, enhanced MWSE companion functionality will be applied to Synda / Johhny.",
        variable = mwse.mcm.createTableVariable{
            id = "betterCompanion",
            table = config
        },
        restartRequired = true
    }

    return category
end

local function createGeneralPage(template)
    local page = template:createSideBarPage{
        label = "General Settings",
        description = "Hover over a setting to learn more about it."
    }

    createGeneralCategory(page)
end



-- Handle mod config menu.
local template = mwse.mcm.createTemplate("The Underground")
template:saveOnClose("TheUnderground", config)

createGeneralPage(template)

mwse.mcm.register(template)