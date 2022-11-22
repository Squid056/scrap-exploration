local data_util = require( "__space-exploration__.data_util" )

data:extend({
    {
        type = "recipe",
        name = "raw-scrap-1",
        order = "r-s-a",
        energy_required = 8,
        allow_decomposition = false,
        enabled = false, 
        category = "pulverising",
        subgroup = "scrap",
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = 32,
        ingredients = {
            {"raw-scrap", 10}
        },
        results = {
            {name = "iron-ore", probability = 0.25 , amount = 1 },
            {name = "copper-ore", probability = 0.25 , amount = 1 },
            {name = "stone", probability = 0.25 , amount = 1 },
            {name = "coal", probability = 0.25 , amount = 1 },
        }
    },
    {
        type = "recipe",
        name = "raw-scrap-2",
        order = "r-s-b",
        energy_required = 15,
        allow_decomposition = false,
        enabled = false, 
        category = "smelting",
        subgroup = "scrap",
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = 32,
        ingredients = {
            {"raw-scrap", 20}
        },
        results = {
            {name = "iron-plate", probability = 0.15 , amount = 1 },
            {name = "copper-plate", probability = 0.20 , amount = 1 },
            {name = "stone-brick", probability = 0.10 , amount = 1 },
            {name = "steel-plate", probability = 0.05 , amount = 1 },
            {name = "iron-stick", probability = 0.50 , amount = 1 },
            {name = "glass", probability = 0.10 , amount = 1 },
            {name = "copper-cable", probability = 0.50 , amount = 1 },
        }
    },
    {
        type = "recipe",
        name = "raw-scrap-3",
        order = "r-s-c",
        energy_required = 1,
        enabled = true,
        allow_decomposition = false,
        category = "pulverising",
        subgroup = "scrap",
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = 32,
        ingredients = {
            {"raw-scrap", 10},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {
            {name = "iron-ore", probability = 0.05 , amount = 1 },
            {name = "copper-ore", probability = 0.05 , amount = 1 },
            {name = "stone", probability = 0.05 , amount = 1 },
            {name = "coal", probability = 0.05 , amount = 1 },
            {name = "raw-scrap", probability = 0.72, amount = 10},
        }
    },
    {
        type = "recipe",
        name = "scrap-to-raw-scrap",
        --order = ""
        energy_required = 1,
        enabled = false,
        allow_decomposition = false,
        category = "hard-recycling",
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = 64,
        subgroup = "scrap",
        ingredients = {
            {"se-scrap", 1}
        },
        results = {
            {name = "raw-scrap", amount = 10 },
            {type = "fluid", name = "heavy-oil", probability = 0.15, amount = 1},
        },
        hidden = true -- currently unused code as original se code has been altered for this purpose 

    },
    {
        type = "recipe",
        name = "scrap-plate",
        --order = ""
        energy_required = 20,
        enabled = false,
        allow_decomposition = false,
        hidden = true, -- CHANGE LATER? possibly remove from mod.
        category = "smelting",
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = 64,
        subgroup = "raw-resource",
        ingredients = {
            {"se-scrap", 10},
            {type = "fluid", name = "se-pyroflux", amount = 10},
            {type = "fluid", name = "water", amount = 100},
        },
        results = {
            {name = "scrap-plate", probability = 0.9, amount = 5 },            
            {name = "se-scrap", probability = 0.1, amount = 10},
            {type = "fluid", name = "steam", amount = 98},
            
        }
    },
    {
        type = "recipe",
        name = "scrap-compression",
        order = "s-c",
        energy_required = 10,
        enabled = false,
        allow_decomposition = false,
        category = "pulverising",
        icons = data_util.transition_icons(
        {
            icon = data.raw.item["se-scrap"].icon,
            icon_size = data.raw.item["se-scrap"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["compressed-scrap"].icon,
            icon_size = data.raw.item["compressed-scrap"].icon_size, scale = 0.5
        }),
        subgroup = "scrap",
        ingredients = {
            {type = "item", name = "se-scrap", amount = 20},
        },
        results = {
        {type = "item", name = "compressed-scrap", amount = 1},
        }
    },
    {
        type = "recipe",
        name = "scrap-decompression",
        order = "s-c",
        energy_required = 5,
        enabled = false,
        allow_decomposition = false,
        category = "pulverising",
        icons = data_util.transition_icons(
        {
            icon = data.raw.item["compressed-scrap"].icon,
            icon_size = data.raw.item["compressed-scrap"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["se-scrap"].icon,
            icon_size = data.raw.item["se-scrap"].icon_size, scale = 0.5
        }),
        subgroup = "scrap",
        ingredients = {
            {type = "item", name = "compressed-scrap", amount = 1},
        },
        results = {
            {type = "item", name = "se-scrap", probability = 0.98, amount = 20},
            {type = "item", name = "compressed-scrap", probability = 0.01, amount = 1},
        }
    },
    {
        type = "recipe",
        name = "radiation-scrap-cleaning-slow",
        order = "rd-s-a",
        energy_required = 120,
        enabled = false,
        allow_decomposition = false,
        category = "space-decontamination",
        icons = data_util.transition_icons(
        {
            icon = data.raw.item["radiation-scrap"].icon,
            icon_size = data.raw.item["radiation-scrap"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["se-contaminated-scrap"].icon,
            icon_size = data.raw.item["se-contaminated-scrap"].icon_size, scale = 0.5
        }),
        subgroup = "scrap",
        ingredients = {
            {type = "item", name = "radiation-scrap", amount = 10},
            {type = "fluid", name = "se-space-water", amount = 1000},

        },
        results = {
            {type = "item", name = "se-contaminated-scrap", amount = 10},
            {type = "fluid", name = "se-contaminated-space-water", amount = 998},
            {type = "fluid", name = "se-contaminated-bio-sludge", amount = 2},
            {type = "item", name = "sand", amount_min = 1, amount_max = 8},
            {type = "item", name = "uranium-238", probability = 0.05, amount = 1},
            {type = "item", name = "uranium-235", probability = 0.001, amount = 1},
        }
    },
    {
        type = "recipe",
        name = "radiation-scrap-cleaning-fast",
        order = "rd-s-b",
        energy_required = 10,
        enabled = false,
        allow_decomposition = false,
        category = "space-decontamination",
        icons = data_util.transition_icons(
        {
            icon = data.raw.item["radiation-scrap"].icon,
            icon_size = data.raw.item["radiation-scrap"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["se-contaminated-scrap"].icon,
            icon_size = data.raw.item["se-contaminated-scrap"].icon_size, scale = 0.5
        }),
        subgroup = "scrap",
        ingredients = {
            {type = "item", name = "radiation-scrap", amount = 10},
            {type = "fluid", name = "se-chemical-gel", amount = 250},
            {type = "fluid", name = "sulfuric-acid", amount = 25},
            {type = "item", name = "sand", amount = 25},
        },
        results = {
            {type = "item", name = "se-contaminated-scrap", amount = 10},
            {type = "fluid", name = "se-contaminated-space-water", amount = 125},
            {type = "fluid", name = "se-contaminated-bio-sludge", amount = 25},
            {type = "item", name = "sand", amount_min = 5, amount_max = 10},
            {type = "item", name = "uranium-238", probability = 0.05, amount = 1},
            {type = "item", name = "uranium-235", probability = 0.001, amount = 1},
            {type = "item", name = "uranium-ore", probability = 0.25, amount = 1},
        }
    },
    
})
-- lock recipes to x 
data_util.tech_lock_recipes("se-recycling-facility", "scrap-to-raw-scrap")
data_util.tech_lock_recipes("se-space-decontamination-facility", "scrap-decontamination-ground")
data_util.tech_lock_recipes("se-space-mechanical-laboratory", {"scrap-compression", "scrap-decompression"})
data_util.tech_lock_recipes("se-space-decontamination-facility", {"radiation-scrap-cleaning-slow", "radiation-scrap-cleaning-fast"})

local function raw_scrap_smelting(ore_name, count, probability, outcount)
    local scrap_name = "raw-scrap-" .. ore_name
    data:extend({
        {
        type = "recipe",
        name = scrap_name,
        energy_required = 5,
        allow_decomposition = false,
        category = "pulverising",
        order = "r-r-" .. ore_name,
        enabled = true, -- change later
        icons = data_util.transition_icons(
        {
            icon = data.raw.item["raw-scrap"].icon,
            icon_size = data.raw.item["raw-scrap"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item[ore_name].icon,
            icon_size = data.raw.item[ore_name].icon_size, scale = 0.5
        }),
        ingredients =
        {
            {"raw-scrap", count }
        },
        results = {
            {name = ore_name, probability = probability, amount = outcount}
        }

        }   
    })

    --data_util.tech_lock_recipes("scrap-furnace", scrap_name)
end

raw_scrap_smelting("iron-ore", 10, 0.15, 1)
raw_scrap_smelting("copper-ore", 10, 0.15, 1)
raw_scrap_smelting("stone", 10, 0.15, 1)
raw_scrap_smelting("coal", 10, 0.15, 1)

