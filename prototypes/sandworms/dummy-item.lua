data:extend({

 {
    type = "capsule",
    name = "worm_grenade",
    icon = "__arrakis_my_dune__/graphics/sandworms/debug_worm_grenade.png",
    stack_size = 10,
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 15,
        ammo_type =
        {
          target_type = "position",
          action =
          {
            {
              type = "direct",
              action_delivery =
              {
                type = "projectile",
                projectile = "grenade",
                starting_speed = 0.3
              }
            },
            {
              type = "direct",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "create-explosion",
                    entity_name = "worm-spawn-animation"
                  }
                }
              }
            }
          }
        }
      }
    }
  }

})