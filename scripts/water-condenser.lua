local MINIMUM_POLLUTION_FOR_OPERATION = 10


script.on_init(function()
    local water_condensers = {}
end)
  
script.on_configuration_changed(function()
    local water_condensers = {}
end)

--Run once a second to update water condensators
script.on_nth_tick(120, function()
    --Check if Arrakis even exists
    if game.surfaces["arrakis"] then
        local pos_list = {}

        
        for key, entity in pairs(game.surfaces["arrakis"].find_entities_filtered({name="water-condenser"})) do
            --game.print("test")
            --game.print(key)
            --game.print(entity.position)
            --game.print(entity)
            
            if (game.surfaces["arrakis"].get_pollution(entity.position)) > MINIMUM_POLLUTION_FOR_OPERATION then
                entity.disabled_by_script = false
            else
                local status = {
                    diode = defines.entity_status_diode.red,
                    label = {"arrakis-tooltip.no-moisture"}
                }
                entity.custom_status = status
                entity.disabled_by_script = true
            end        
        end
    end
end)



