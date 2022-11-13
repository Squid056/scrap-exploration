local data_util = require( "__space-exploration__.data_util" )

data:extend({
    {
        type = "recipe",
        name = "raw-scrap-1",
        order = "a[recycling]-a",
        energy_required = 5,
        allow_decomposition = false,
        enabled = false, 
        category = "scrap-smelting",
        subgroup = "recycling",
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
        order = "a[recycling]-b",
        energy_required = 15,
        allow_decomposition = false,
        enabled = false, 
        category = "scrap-smelting",
        subgroup = "recycling",
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
        order = "a[recycling]",
        energy_required = 1,
        enabled = true, -- lock behind technology later.
        allow_decomposition = false,
        category = "pulverising",
        subgroup = "recycling",
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
            {name = "raw-scrap", probability = 0.33, amount = 5},
        }
    },
    {
        type = "recipe",
        name = "scrap-to-raw-scrap",
        --order = ""
        energy_required = 1,
        enabled = false,
        category = "hard-recycling",
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = 64,
        subgroup = "recycling",
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
        name = "scrap-decontamination-ground",
        --order = ""
        energy_required = 10,
        enabled = false,
        category = "chemistry",
        
        icons =  data_util.sub_icons(data.raw.item["se-contaminated-scrap"].icon, data.raw.fluid["water"].icon),
        subgroup = "recycling",
        ingredients = {
            {type = "item", name = "se-contaminated-scrap", amount = 10},
            {type = "fluid", name = "sulfuric-acid", amount = 2},
            {type = "fluid", name = "water", amount = 500},
        },
        results = {
        {type = "item", name = "se-scrap", amount = 10},
        {type = "item", name = "raw-scrap",probability = 0.20, amount_min = 1, amount_max = 5},
        {type = "item", name = "uranium-ore",probability = 0.01, amount_min = 1, amount_max = 2},     
        {type = "item", name = "copper-cable", probability = 0.5, amount_min = 2, amount_max = 4}
        }
    },
--[[    {                                                                EDIT LATER?
        type = "recipe",
        name = "scrap-decontamination-ground-steam",
        --order = ""
        energy_required = 10,
        enabled = false,
        category = "chemistry",
        icons = data.raw.recipe["se-scrap-decontamination"].icons,
        subgroup = "recycling",
        ingredients = {
            {type = "item", name = "se-contaminated-scrap", amount = 10},
            {type = "fluid", name = "sulfuric-acid", amount = 2},
            {type = "fluid", name = "water", amount = 500},
        },
        results = {
        {type = "item", name = "se-scrap", amount = 10},
        {type = "item", name = "raw-scrap",probability = 0.20, amount_min = 1, amount_max = 5},
        {type = "item", name = "uranium-ore",probability = 0.01, amount_min = 1, amount_max = 2},     
        {type = "item", name = "copper-cable", probability = 0.5, amount_min = 2, amount_max = 4}
        }
    },]]
    {
        type = "recipe",
        name = "scrap-compression",
        --order = ""
        energy_required = 10,
        enabled = false,
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
        subgroup = "recycling",
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
        --order = ""
        energy_required = 5,
        enabled = false,
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
        subgroup = "recycling",
        ingredients = {
            {type = "item", name = "compressed-scrap", amount = 20},
        },
        results = {
        {type = "item", name = "se-scrap", probability = 0.96, amount = 20},
        {type = "item", name = "raw-scrap",probability = 0.04, amount = 10},
        }
    },
    {
        type = "recipe",
        name = "radiation-scrap-cleaning-slow",
        --order = ""
        energy_required = 120,
        enabled = false,
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
        subgroup = "recycling",
        ingredients = {
            {type = "item", name = "radiation-scrap", amount = 10},
            {type = "fluid", name = "se-space-water", amount = 1000},

        },
        results = {
            {type = "item", name = "se-contaminated-scrap", amount = 10},
            {type = "fluid", name = "se-contaminated-space-water", amount = 990},
            {type = "fluid", name = "se-contaminated-bio-sludge", amount = 10},
            {type = "item", name = "sand", amount_min = 1, amount_max = 10},
            {type = "item", name = "uranium-238", probability = 0.1, amount = 1},
            {type = "item", name = "uranium-235", probability = 0.01, amount = 1},
        }
    },
    {
        type = "recipe",
        name = "radiation-scrap-cleaning-fast",
        --order = ""
        energy_required = 10,
        enabled = false,
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
        subgroup = "recycling",
        ingredients = {
            {type = "item", name = "radiation-scrap", amount = 10},
            {type = "fluid", name = "se-chemical-gel", amount = 250},
            {type = "fluid", name = "sulfuric-acid", amount = 25},
            {type = "item", name = "sand", amount = 25},
        },
        results = {
            {type = "item", name = "se-contaminated-scrap", amount = 10},
            {type = "fluid", name = "se-contaminated-space-water", amount = 250},
            {type = "item", name = "sand", amount_min = 5, amount_max = 10},
            {type = "item", name = "uranium-238", probability = 0.1, amount = 1},
            {type = "item", name = "uranium-235", probability = 0.01, amount = 1},
            {type = "item", name = "uranium-ore", probability = 0.25, amount = 1},
        }
    },
    
})
-- lock recipes to x 
data_util.tech_lock_recipes("se-recycling-facility", "scrap-to-raw-scrap")
data_util.tech_lock_recipes("se-space-decontamination-facility", "scrap-decontamination-ground")
data_util.tech_lock_recipes("se-space-mechanical-laboratory", {"scrap-compression", "scrap-decompression"})
--data_util.tech_lock_recipes("se-space-mechanical-laboratory", "scrap-decompression")
data_util.tech_lock_recipes("se-space-decontamination-facility", {"radiation-scrap-cleaning-slow", "radiation-scrap-cleaning-fast"})
--data_util.tech_lock_recipes("se-space-decontamination-facility", "radiation-scrap-cleaning-fast")


local function raw_scrap_smelting(name, count, probability, outcount)
    data:extend({
        {
        type = "recipe",
        name = "raw-scrap-" .. name,
        energy_required = 5,
        category = "scrap-smelting",
        order = "a[recycling]-a" .. name,
        enabled = false, -- change later
        icons = {
            {icon = data.raw["item"]["se-scrap"].icon, icon_size = data.raw["item"]["se-scrap"].icon_size},
            {icon = data.raw["item"][name].icon, icon_size = data.raw["item"][name].icon_size, scale = 0.33}
        },
        ingredients =
        {
            {"raw-scrap", count }
        },
        results = {
            {name = name, probability = probability, amount = outcount}
        }

        }   
    })
end

raw_scrap_smelting("iron-ore", 10, 0.15, 1)
raw_scrap_smelting("copper-ore", 10, 0.15, 1)
raw_scrap_smelting("stone", 10, 0.15, 1)
raw_scrap_smelting("coal", 10, 0.15, 1)

