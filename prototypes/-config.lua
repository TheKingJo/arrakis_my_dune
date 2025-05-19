-- config.lua, this contains config settings for other machines in /machines/*.lua and other stuff that needs to be configured
local config = {}

-- NIGHTLY HUMIDITY PRODUCTION - part of scripts/humidity-generation.lua
config.ADDED_POLLUTION_PER_CHUNK = 0.33 -- how much pollution is added per chunk in one mapwide operation (currently 2/m)
config.POLLUTION_ADD_INTERVAL_SECONDS = 10 -- How long does the script wait after adding humidity in chunk
config.MAX_POLLUTION_PER_NIGHT = 10 -- how much pollution can at max be generated in every chunk through nighttime humidity (does not include machine emissions)


-- HUMIDITY SETTINGS FOR MACHINES - part of prototypes/machines/*.lua
-- ALL SETTINGS ARE PER MINUTE!!!
config.MINIMUM_POLLUTION_FOR_OPERATION = 0.01 -- water condensers set to produce water only when humidity in chunk > 0.01
config.HUMIDITY_WATER_CONDENSER = -0.1 -- emission setting of water condenser: negative emissions = consumes humidity
config.HUMIDITY_DEW_COLLECTOR = -0.1 -- emission setting of dew collector: negative emissions = consumes humidity
config.HUMIDITY_SAND_COLLECTOR = 0.01 -- emission setting of sand collector
config.HUMIDITY_SAND_REFINERY = 0.01 -- emission setting of sand refinery
config.HUMIDITY_BASIC_SAND_REFINERY = 0.05 -- emission setting of basic sand refinery
config.HUMIDITY_WATER_PURIFICATION_FACILITY = 0.1 -- emission setting of water purification facility: negative emissions = consumes humidity


-- ABSORPTION SETTINGS FOR TILES - part of prototypes/terrain.lua
-- ALL SETTINGS ARE ABSORPTION PER SECOND!!! (0.000025 absorption at 60 ticks equals -1.54/absorption per minute)
config.ABSORPTION_ARRAKIS_HIGH_DUST     = { humidity = 0.000022 }
config.ABSORPTION_ARRAKIS_HIGH_DUNES    = { humidity = 0.000021 }
config.ABSORPTION_ARRAKIS_HIGH_SAND     = { humidity = 0.000020 }
config.ABSORPTION_ARRAKIS_HIGH_ROCK     = { humidity = 0.000013 }
config.ABSORPTION_ARRAKIS_LOW_DUNES2    = { humidity = 0.000026 }
config.ABSORPTION_ARRAKIS_LOW_SAND2     = { humidity = 0.000027 }





-- WORM TARGETING CONFIG
config.lightning_properties = {
    -- adjust lightning frequency in ingame settings or settings.lua, right now set to 200s per attack per chunk
    lightnings_per_chunk_per_tick = 1 / (60 * settings.startup["worm_attacks_frequency"].value),
    search_radius = 10.0,
    lightning_types = {"worm_attack"},
    priority_rules = {{
        type = "prototype",
        string = "arrakis-low-dunes2",
        priority_bonus = 1000
    }, {
        type = "prototype",
        string = "arrakis-low-sand2",
        priority_bonus = 1000
    }, {
        type = "prototype",
        string = "arrakis-high-dust",
        priority_bonus = 1000
    }, {
        type = "prototype",
        string = "arrakis-high-dunes",
        priority_bonus = 1000
    }, {
        type = "prototype",
        string = "arrakis-high-sand",
        priority_bonus = 1000
    }, {
        type = "prototype",
        string = "arrakis-high-rock",
        priority_bonus = 1000
    }},
    exemption_rules = {{
        type = "prototype",
        string = "water-condenser"
    }, {
        type = "prototype",
        string = "dew-collector"
    }, {
        type = "prototype",
        string = "sand-refinery"
    }}
}

return config
