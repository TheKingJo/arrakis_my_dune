data:extend({ -- TARGET PRIORITIES ARE DEFINED IN PROTOTYPES/-config.lua
{
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

    created_effect = {
        type = "direct",
        action_delivery = {
            type = "instant",
            target_effects = {{
                type = "damage-tile",
                damage = {
                    amount = 10,
                    type = "explosion"
                },
                radius = 8
            }}
        }
    },
    strike_effect = {
        type = "direct",
        action_delivery = {
            type = "instant",
            target_effects = {{
                type = "script",
                effect_id = "script_trigger_worm_attack"
            }, {
                type = "create-explosion",
                entity_name = "worm-spawn-animation"
            }}
        }
    }
}})
