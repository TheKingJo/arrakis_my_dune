--This script removes dropping ice via cargo pod
script.on_event(defines.events.on_cargo_pod_finished_descending, function(event)
    local pod = event.cargo_pod
    if pod and pod.valid and (pod.surface.name == "arrakis") then
        -- Get the inventory of the cargo pod
        local inv = pod.get_inventory(defines.inventory.chest)
        if inv then
        -- Remove all "ice" items
            local removed = inv.remove({name = "ice", count = 999999})
            if removed > 0 then
                game.print("Your " .. removed .. " ice dropped on Arrakis have melted in the Atmosphere! Its too hot! ")
            end
        end
    end
end)
