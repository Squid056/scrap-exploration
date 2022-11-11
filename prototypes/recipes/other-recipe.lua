local data_util = require( "__space-exploration__.data_util" )


data:extend({
    {
    type = "recipe",
    name = "scrap-furnace",
    order = "c[electric-furnace]-c",
    energy_required = 5,
    enabled = true, -- lock behind technology later.
    category = "crafting",
    subgroup = "smelting-machine",
    icon = data.raw["item"]["electric-furnace"].icon,
    icon_size = 32,
    ingredients = {
        {"se-heat-shielding", 5},
        {"copper-cable", 20},
        {"steel-plate", 10},
        {"engine-unit", 5},
        {"iron-gear-wheel", 10},
    },
    results = {
        {name = "scrap-furnace", amount = 1},
    }
    },
    {
        type = "recipe",
        name = "iron-stick-melting",
        order = "b[recycling]-a",
        energy_required = 1,
        enabled = true, -- lock behind technology later.
        category = "scrap-smelting",
        subgroup = "recycling",
        icons = data_util.transition_icons(
            {
                icon = data.raw.item["iron-stick"].icon,
                icon_size = data.raw.item["iron-stick"].icon_size, scale = 0.5
            },
            {
                icon = data.raw.item["iron-plate"].icon,
                icon_size = data.raw.item["iron-plate"].icon_size, scale = 0.5
            }),  
        ingredients = {
            {"iron-stick", 4}
        },
        results = {
            {name = "iron-plate", amount = 1},
            {name = "raw-scrap", amount = 1},
        }
    },
    {
        type = "recipe",
        name = "copper-cable-melting",
        order = "b[recycling]-b",
        energy_required = 1,
        enabled = true, -- lock behind technology later.
        category = "scrap-smelting",
        subgroup = "recycling",
        icons = data_util.transition_icons(
            {
                icon = data.raw.item["copper-cable"].icon,
                icon_size = data.raw.item["copper-cable"].icon_size, scale = 0.5
            },
            {
                icon = data.raw.item["copper-plate"].icon,
                icon_size = data.raw.item["copper-plate"].icon_size, scale = 0.5
            }),  
        ingredients = {
            {"copper-cable", 4}
        },
        results = {
            {name = "copper-plate", amount = 1},
            {name = "raw-scrap", amount = 1},
        }
    }
})
