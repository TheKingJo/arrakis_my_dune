-- config.lua, this contains config settings for other machines in /machines/*.lua and other stuff that needs to be configured
local config = {}

--NIGHTLY HUMIDITY PRODUCTION - part of scripts/humidity-generation.lua
config.MINIMUM_POLLUTION_FOR_OPERATION = 0.01 --water condensers set to produce water only when humidity in chunk > 0.01
config.ADDED_POLLUTION_PER_CHUNK = 0.1
config.POLLUTION_ADD_INTERVAL_SECONDS = 5 --How long does the script wait after adding humidity in chunk
config.MAX_POLLUTION_PER_NIGHT = 10


--HUMIDITY SETTINGS FOR MACHINES - part of prototypes/machines/*.lua
config.HUMIDITY_WATER_CONDENSER = -0.5
config.HUMIDITY_DEW_COLLECTOR = -0.5
config.HUMIDITY_SAND_REFINERY = 0.25








--WORM TARGETING CONFIG
config.lightning_properties = {
    lightnings_per_chunk_per_tick = 1 / (60 * 200), --cca once per chunk every 200 seconds
    search_radius = 10.0,
    lightning_types = {"worm_attack"},
    priority_rules =
    {
      {
        type = "prototype",
        string = "arrakis-low-dunes2",
        priority_bonus = 1000
      },
      {
        type = "prototype",
        string = "arrakis-low-sand2",
        priority_bonus = 1000
      },
      {
        type = "prototype",
        string = "arrakis-high-dust",
        priority_bonus = 1000
      },
      {
        type = "prototype",
        string = "arrakis-high-dunes",
        priority_bonus = 1000
      },
      {
        type = "prototype",
        string = "arrakis-high-sand",
        priority_bonus = 1000
      },
      {
        type = "prototype",
        string = "arrakis-high-rock",
        priority_bonus = 1000
      }
    }
}





















return config