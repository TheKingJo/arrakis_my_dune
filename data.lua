mod = "__arrakis_my_dune__"
icons = "__arrakis_my_dune__/graphics/icons/"

-- add this to recipe/entity surface_conditions
arrakis_exlusive = {{ property = "temperature-celcius", min = 77, max = 77}},


-- The music Prototype is commented out because the files are missing
require "prototypes.terrain"
require "prototypes.decoratives"
require "prototypes.resources"
require "prototypes.pollution"
require "prototypes.planet"
--require "prototypes.music"
require "prototypes.technology"
require "prototypes.machines"
require "prototypes.items"
require "prototypes.recipes"
