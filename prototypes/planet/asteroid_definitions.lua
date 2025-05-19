local asteroid_functions = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")


--This file is loaded in planet.lua as asteroid definition for the planet & space connection
-- Arrakis space-connection asteroid spawn_definitions
local arrakis_asteroids = {}


--
arrakis_asteroids.vulcanus_arrakis = {
    probability_on_range_chunk = {{
        position = 0.1,
        probability = asteroid_functions.nauvis_chunks,
        angle_when_stopped = asteroid_functions.chunk_angle
    }, {
        position = 0.9,
        probability = asteroid_functions.vulcanus_chunks,
        angle_when_stopped = asteroid_functions.chunk_angle
    }},
    probability_on_range_medium = {{
        position = 0.1,
        probability = 0,
        angle_when_stopped = asteroid_functions.medium_angle
    }, {
        position = 0.5,
        probability = asteroid_functions.vulcanus_medium * 3,
        angle_when_stopped = asteroid_functions.medium_angle
    }, {
        position = 0.9,
        probability = asteroid_functions.vulcanus_medium,
        angle_when_stopped = asteroid_functions.medium_angle
    }},
    type_ratios = {{
        position = 0.1,
        ratios = {5, 2, 1 , 0}
    }, {
        position = 0.9,
        ratios = {3, 3, 0 , 0} -- THIS LINE CHANGES IN WHAT RATIO ASTEROIDS SPAWN IN ARRAKIS ORBIT (METALLIC, CARBONIC, OXIDE, PROMETHIUM)
    }}
}







return arrakis_asteroids