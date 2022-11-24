local data_util = require( "__space-exploration__.data_util" )
local mod_prefix = "sc-"
data:extend({
    {
        type = "recipe",
        name = mod_prefix .. "mineral-water-filtration",
        order = "a",
        energy_required = 15,
        enabled = false, 
        category = "fluid-filtration",
        subgroup = "raw-resource",
        allow_decomposition = false,
        icons = data_util.transition_icons(
        {
            icon = data.raw.fluid["mineral-water"].icon,
            icon_size = data.raw.fluid["mineral-water"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["sc-raw-scrap"].icon,
            icon_size = data.raw.item["sc-raw-scrap"].icon_size, scale = 0.5
        }),
        ingredients = {
            {type = "fluid", name = "mineral-water", amount = 100},
        },
        results = {
            {name = "sc-raw-scrap", amount_min = 1, amount_max = 30 },
            {type = "fluid", name = "water", amount = 95},
        }
    },
    {
        type = "recipe",
        name = "sc-dirty-water-filtration-holmium",
        order = "a-b-2",
        energy_required = 4,
        enabled = false, 
        category = "fluid-filtration",
        subgroup = "holmium",
        icons = {
            {icon = data.raw.fluid["dirty-water"].icon, icon_size = data.raw.fluid["dirty-water"].icon_size},
            {icon = data.raw.item["se-holmium-ore-crushed"].icon, icon_size = data.raw.item["se-holmium-ore-crushed"].icon_size, scale = 0.20*64/data.raw.item["se-holmium-ore-crushed"].icon_size}
        },
        ingredients = {
            {type = "fluid", name = "dirty-water-ho", amount = 100},
            {name = "se-cryonite-ion-exchange-beads", amount = 1},
        },
        results = {
            {name = "se-cryonite-ion-exchange-beads", probability = 0.9, amount = 1},
            {name = "se-holmium-ore-crushed",probability = 0.5, amount = 1},
            {name = "stone",probability = 0.3, amount = 1},
            {type = "fluid", name = "water", amount = 70},
        }
    },
    {
        type = "recipe",
        name = "sc-dirty-water-filtration-iridium",
        order = "a-b-2",
        energy_required = 4,
        enabled = false, 
        category = "fluid-filtration",
        subgroup = "iridium",
        icons = {
            {icon = data.raw.fluid["dirty-water"].icon, icon_size = data.raw.fluid["dirty-water"].icon_size},
            {icon = data.raw.item["se-iridium-ore-crushed"].icon, icon_size = data.raw.item["se-iridium-ore-crushed"].icon_size, scale = 0.20*64/data.raw.item["se-iridium-ore-crushed"].icon_size}
        },
        ingredients = {
            {type = "fluid", name = "dirty-water-ir", amount = 100},
            {name = "se-vulcanite-ion-exchange-beads", amount = 1},
        },
        results = {
            {name = "se-vulcanite-ion-exchange-beads", probability = 0.9, amount = 1},
            {name = "se-iridium-ore-crushed",probability = 0.5, amount = 1},
            {name = "stone",probability = 0.3, amount = 1},
            {type = "fluid", name = "water", amount = 70},
        }
    },

})

data_util.tech_lock_recipes("se-processing-holmium", "sc-dirty-water-filtration-holmium")
data_util.tech_lock_recipes("se-processing-iridium", "sc-dirty-water-filtration-iridium")
data_util.tech_lock_recipes("kr-mineral-water-gathering", "sc-mineral-water-filtration")

