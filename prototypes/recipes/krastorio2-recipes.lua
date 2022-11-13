local data_util = require( "__space-exploration__.data_util" )

data:extend({
    {
        type = "recipe",
        name = "mineral-water-filtration",
        order = "a",
        energy_required = 5,
        enabled = false, 
        category = "fluid-filtration",
        subgroup = "resources",
        icons = data_util.transition_icons(
        {
            icon = data.raw.fluid["mineral-water"].icon,
            icon_size = data.raw.fluid["mineral-water"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["raw-scrap"].icon,
            icon_size = data.raw.item["raw-scrap"].icon_size, scale = 0.5
        }),
        ingredients = {
            {type = "fluid", name = "mineral-water", amount = 100},
        },
        results = {
            {name = "raw-scrap", amount_min = 1, amount_max = 30 },
            {type = "fluid", name = "water", amount = 95},
        }
    },

})