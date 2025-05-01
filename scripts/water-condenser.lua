local common = require("common")
local Public = {}


-- this is not working out, i am not having a good day lmao
-- goal is to track all water condensers, grab pollution level on their xy pos since factorio docs say that in a chunk all tiles have the same pollution value
-- when pollution level (humidity) below x amount, turn off the water condenser in that chunk
-- give the water condensers a 32x32 radius in which no other condenser can be placed, easy fix only one condenser in every chunk and they will work depending if enough Moisture (or humidity) is available in the chunk.










    for _, surface in pairs(game.surfaces) do
        --looping through all the chunks on surface
        for chunk in surface.get_chunks() do
            local x = (chunk.x)
            local y = (chunk.y)
            global.all_chunks[surface.index..":"..x..":"..y] = {position = {x=x,y=y}, surface=surface.index}
            local chunk_pollution_level = surface.get_pollution(chunk.area.left_top)
            if chunk_pollution_level > 0 then
                global.polluted_chunks[surface.index..":"..x..":"..y] = {position = {x=x,y=y}, r_id={}, surface=surface.index}
            










end










-- Helper: get chunk position from world position
local function get_chunk_pos(pos)
    return {
        x = math.floor(pos.x / CHUNK_SIZE),
        y = math.floor(pos.y / CHUNK_SIZE)
    }
end

-- Initialize tables
script.on_init(function()
    global.condensers = {}
    global.chunk_occupancy = {}  -- key = surface_index..":"..chunk_x..","..chunk_y
end)

-- Generate a unique key for a chunk
local function chunk_key(surface_index, chunk_pos)
    return surface_index .. ":" .. chunk_pos.x .. "," .. chunk_pos.y
end

-- Handle condenser placement
script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity}, function(event)
    local entity = event.created_entity or event.entity
    if entity and entity.valid and entity.name == "water-condenser" then
        local chunk_pos = get_chunk_pos(entity.position)
        local key = chunk_key(entity.surface.index, chunk_pos)

        -- Check for existing condenser in this chunk
        if global.chunk_occupancy[key] then
            -- Cancel placement
            entity.surface.create_entity{
                name = "flying-text",
                position = entity.position,
                text = "Only one water condenser per chunk!",
                color = {r=1, g=0.3, b=0.3}
            }
            entity.destroy()
            return
        end

        -- Register condenser
        global.condensers[#global.condensers+1] = entity
        global.chunk_occupancy[key] = entity
    end
end)

-- Handle removal of condenser
script.on_event({
    defines.events.on_entity_died,
    defines.events.on_player_mined_entity,
    defines.events.on_robot_mined_entity
}, function(event)
    local entity = event.entity
    if entity and entity.valid and entity.name == "water-condenser" then
        local chunk_pos = get_chunk_pos(entity.position)
        local key = chunk_key(entity.surface.index, chunk_pos)

        -- Remove from tracking
        for i, e in ipairs(global.condensers) do
            if e == entity then
                table.remove(global.condensers, i)
                break
            end
        end

        if global.chunk_occupancy[key] == entity then
            global.chunk_occupancy[key] = nil
        end
    end
end)

-- Pollution check
script.on_nth_tick(60, function()
    if not global.condensers then return end

    for i = #global.condensers, 1, -1 do
        local condenser = global.condensers[i]
        if not (condenser and condenser.valid) then
            table.remove(global.condensers, i)
        else
            local pollution = condenser.surface.get_pollution(condenser.position)
            condenser.active = pollution >= POLLUTION_THRESHOLD
        end
    end
end)