local WORM_SCALE = 2 --WORM SCALE SIZE
local WORM_SHADOW_SCALE = WORM_SCALE * 0.85 --WORM SHADOW SCALE SIZE, ~0.85 feels good
local WORM_SHADOW_OFFSET = 7 --SHADOW OFFSET TO WORM POSITION, shadow normally is 7 tiles too far left



data:extend({
{
    --Explosion animation on Worm appearance
    type = "explosion",
    name = "worm-spawn-animation_with_particles",
    flags = {"not-on-map"},
    animations = {
        layers = {{
            width = 960,
            height = 960,
            frame_count = 255,
            animation_speed = 0.5,
            scale = 3,
            shift = {0, -4},
            stripes = {{
                filename = "__arrakis_my_dune__/graphics/sandworms/particle_attack/worm-1.png",
                width_in_frames = 8,
                height_in_frames = 8
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/particle_attack/worm-2.png",
                width_in_frames = 8,
                height_in_frames = 8
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/particle_attack/worm-3.png",
                width_in_frames = 8,
                height_in_frames = 8
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/particle_attack/worm-4.png",
                width_in_frames = 8,
                height_in_frames = 8
            }}
        }, 
        --[[
        
        {
            width = 800,
            height = 600,
            draw_as_shadow = true,
            frame_count = 134,
            animation_speed = 0.5,
            scale = WORM_SHADOW_SCALE,
            shift = {WORM_SHADOW_OFFSET, -4},
            stripes = {{
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet1.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet2.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet3.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet4.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet5.png",
                width_in_frames = 5,
                height_in_frames = 3
            }}
        }
    ]]
    }
    }
},























    --OLD AND UNUSED CAN BE REMOVED IS JUST FOR REFERENCE RIGHT NOW
    {
    --Explosion animation on Worm appearance
    type = "explosion",
    name = "worm-spawn-animation",
    flags = {"not-on-map"},
    animations = {
        layers = {{
            width = 500,
            height = 600,
            frame_count = 134,
            animation_speed = 0.5,
            scale = WORM_SCALE,
            shift = {0, -4},
            stripes = {{
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/Spritesheet1.png",
                width_in_frames = 6,
                height_in_frames = 5
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/Spritesheet2.png",
                width_in_frames = 6,
                height_in_frames = 5
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/Spritesheet3.png",
                width_in_frames = 6,
                height_in_frames = 5
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/Spritesheet4.png",
                width_in_frames = 6,
                height_in_frames = 5
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/Spritesheet5.png",
                width_in_frames = 6,
                height_in_frames = 3
            }}
        }, {
            width = 800,
            height = 600,
            draw_as_shadow = true,
            frame_count = 134,
            animation_speed = 0.5,
            scale = WORM_SHADOW_SCALE,
            shift = {WORM_SHADOW_OFFSET, -4},
            stripes = {{
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet1.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet2.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet3.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet4.png",
                width_in_frames = 5,
                height_in_frames = 6
            }, {
                filename = "__arrakis_my_dune__/graphics/sandworms/attack/ShadowSpritesheet5.png",
                width_in_frames = 5,
                height_in_frames = 3
            }}
        }}
    }
}})
