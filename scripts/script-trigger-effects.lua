local POLLUTION_PER_LIGHTNING_STRIKE = 5




script.on_event("on_script_trigger_effect", function(event)
    if (event.effect_id == "pollution_trigger") then
        game.surfaces["arrakis"].pollute(event.target_position, POLLUTION_PER_LIGHTNING_STRIKE, humidity)



    end

end)


