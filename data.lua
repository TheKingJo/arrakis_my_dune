mod = "__arrakis_my_dune__"
icons = "__arrakis_my_dune__/graphics/icons/"

-- add this to recipe/entity surface_conditions
--arrakis_exlusive = {{ property = "temperature-celcius", min = 77, max = 77}},



--Planet and Environment Prototypes
require "prototypes.terrain"
require "prototypes.decoratives"
require "prototypes.resources"
require "prototypes.chunk-humidity"
require "prototypes.planet"
--require "prototypes.music"    -- The music Prototype is commented out because the files are missing


--Technology/Recipe/Item Prototypes
require "prototypes.technology"
require "prototypes.items"
require "prototypes.recipes"


--Enemy Prototypes
require "prototypes.sandworms.worm-targeting"
require "prototypes.sandworms.attack"


--Machine Prototypes
require "prototypes.machines.dew-collector"
require "prototypes.machines.water-condenser"
require "prototypes.machines.sand-refinery"
require "prototypes.machines.basic-sand-refinery"
require "prototypes.machines.sand-collector"
require "prototypes.machines.water-purification-facility"
