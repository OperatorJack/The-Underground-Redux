local config = require("TheUnderground.config")

local ref
local function onSimulate()
    ref = ref or tes3.getReference("AASynda_Rains")
    if ref.context and ref.context.Companion == 1  then
        if (ref.cell ~= tes3.player.cell or tes3.player.position:distance(ref.position) > 650) then
            tes3.positionCell({
                reference = ref,
                position = tes3.player.position,
                orientation = tes3.player.orientation
            })
        end
    end
end

if config.betterCompanion == true then
    event.register("simulate", onSimulate)
end