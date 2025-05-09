-- PLACEHOLDER, NOT WORKING ANYMORE

-- Pollution added to chunk per singular lightning strike
local POLLUTION_PER_LIGHTNING_STRIKE = 0.1



-- Script-Trigger when lightning hits something this gets called and executed
script.on_event("on_script_trigger_effect", function(event)
    if (event.effect_id == "pollution_trigger") then
        game.surfaces["arrakis"].pollute(event.target_position, POLLUTION_PER_LIGHTNING_STRIKE, humidity)



    end

end)


