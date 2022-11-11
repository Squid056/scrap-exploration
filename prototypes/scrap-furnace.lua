
-- recipe catagoey
data:extend({
    {
        type = "recipe-category",
        name = "scrap-smelting"
    }
})

--scrap furnace machine

data:extend({
    {
        name = "scrap-furnace",
        type = "assembling-machine",
        crafting_categories = {"scrap-smelting"},
        crafting_speed = 3,
        flags = { "placeable-neutral", "placeable-player", "player-creation" },
        minable = { mining_time = 0.2, result = "scrap-furnace" },
        max_healt = 400,
        icons = {
            
            {icon = data.raw["furnace"]["electric-furnace"].icon, icon_size = data.raw["furnace"]["electric-furnace"].icon_size},
            {icon = data.raw["item"]["raw-scrap"].icon, icon_size = data.raw["item"]["raw-scrap"].icon_size, scale = 0.33}
        },
        corpse = data.raw["furnace"]["electric-furnace"].corpse,
        dying_explosion = data.raw["furnace"]["electric-furnace"].dying_explosion;
        animation = data.raw["furnace"]["electric-furnace"].animation,
        resistances = data.raw["furnace"]["electric-furnace"].resistances,
        collision_box = data.raw["furnace"]["electric-furnace"].collision_box,
        selection_box = data.raw["furnace"]["electric-furnace"].selection_box,
        working_visualisations = data.raw["furnace"]["electric-furnace"].working_visualisations,
        working_sound = data.raw["furnace"]["electric-furnace"].working_sound,
        water_reflection = data.raw["furnace"]["electric-furnace"].water_reflection,
        energy_usage = "100kW",
        module_specification = {
            module_slots = 3
        },
        allowed_effects = {"consumption", "speed", "productivity", "pollution"},
        se_allow_in_space = true,
        energy_source =
        {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = 3
        },
        fast_replace_group = "electric-furnace",

    }
})

