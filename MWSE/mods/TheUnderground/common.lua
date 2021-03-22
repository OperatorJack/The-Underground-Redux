local config = require("TheUnderground.config")
local common = {}


function common.debug(message)
    if (config.debug == true) then
        tes3.messageBox(message)
        mwse.log("[The Underground: Debug] %s", message)
    end
end

function common.getKeyFromValueFunc(tbl, func)
    for key, value in pairs(tbl) do
        if (func(value) == true) then return key end
    end
    return nil
end

return common