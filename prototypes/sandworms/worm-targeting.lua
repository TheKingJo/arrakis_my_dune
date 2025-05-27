-- Definition of what happens when a worm attack is triggered
local shared_action_delivery = {{
    type = "direct",
    action_delivery = {
        type = "instant",
        target_effects = {{
            type = "script",
            effect_id = "script_trigger_worm_attack"
        }, {
            type = "create-explosion",
            entity_name = "worm-spawn-animation_with_particles"
        }, {

            type = "set-tile",
            tile_name = "arrakis-deep-desert",
            apply_projection = true,
            tile_collision_mask = {
                layers = {
                    water_tile = true
                }
            },
            radius = 16
        }, {
            type = "destroy-cliffs",
            radius = 18,
            explosion_at_trigger = "explosion"
        }}
    }
}, {
    type = "area",
    radius = 16,
    ignore_collision_condition = true,
    action_delivery = {
        type = "instant",
        target_effects = {
            type = "damage",
            vaporize = true,
            damage = {
                amount = settings.startup["worm_attacks_damage"].value,
                type = "physical"
            }
        }
    }
}}

data:extend({ -- TARGET PRIORITIES ARE DEFINED IN PROTOTYPES/-config.lua
--[[{
    -- Lightning Strike definition for worm targeting, this causes the worm to attack when lightning strikes somewhere. config for targeting is in -config.lua
    type = "lightning",
    name = "worm_attack",
    icon = "__space-age__/graphics/icons/lightning.png",
    subgroup = "obstacles",
    damage = 0,
    energy = "0W",
    time_to_damage = 8,
    effect_duration = 36,
    source_offset = {0, -25},
    source_variance = {30, 6},
    strike_effect = shared_action_delivery

},]]
{
    -- Debug Worm Grenade Item to cause worm attack
    type = "capsule",
    name = "worm_grenade",
    icon = "__arrakis_my_dune__/graphics/sandworms/debug_worm_grenade.png",
    stack_size = 10,
    capsule_action = {
        type = "throw",
        attack_parameters = {
            type = "projectile",
            activation_type = "throw",
            ammo_category = "grenade",
            cooldown = 30,
            projectile_creation_distance = 0.6,
            range = 15,
            ammo_type = {
                target_type = "position",
                action = shared_action_delivery
            }
        }
    }
}})
