-- Script-Trigger when lightning hits something this gets called and executed
script.on_event("on_script_trigger_effect", function(event)
    if (event.effect_id == "script_trigger_worm_attack") then
        --game.surfaces["arrakis"].pollute(event.target_position, POLLUTION_PER_LIGHTNING_STRIKE, humidity)
        game.print("Attack was triggered on Arrakis at Coordinate X: " .. event.target_position.x .. " Y: " .. event.target_position.y, {volume_modifier = 0})


    end

end)


