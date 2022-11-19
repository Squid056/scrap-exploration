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
        category = "smelting",
        subgroup = "iron",
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
        category = "smelting",
        subgroup = "copper",
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
    },
    {
        type = "recipe",
        name = "se-quantum-phenomenon-data-alternate",
        order = "a-05",
        energy_required = 20,
        enabled = false, 
        category = "space-laser",
        always_show_made_in = true,
        main_product = "se-quantum-phenomenon-data",
        icons = data_util.sub_icons(data.raw.item["se-quantum-phenomenon-data"].icon, data.raw.item["logistic-robot"].icon),
        subgroup = "data-energy",
        ingredients = {
            {type = "item", name = "se-empty-data", amount = 3},
            {type = "fluid", name = "se-space-coolant-cold", amount = 25},
            {type = "item", name = "logistic-robot", amount = 1},
        },
        results = {
            {type = "item", name = "se-quantum-phenomenon-data", probability = 0.85, amount = 3},
            {type = "item", name = "se-junk-data", probability = 0.10, amount = 1},
            {type = "fluid", name = "se-space-coolant-hot", amount = 25},
            {type = "item", name = "construction-robot", probability = 0.15, amount = 1},
            {type = "item", name = "logistic-robot", probability = 0.84, amount = 1},
            {type = "item", name = "radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
        }
    },
    {
        type = "recipe",
        name = "se-observation-frame-broken",
        order = "z-01",
        energy_required = 10,
        enabled = false,
        category = "space-manufacturing",
        icons = data_util.transition_icons(
        {
            icon = data.raw.item["se-observation-frame-broken"].icon,
            icon_size = data.raw.item["se-observation-frame-broken"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["se-observation-frame-blank"].icon,
            icon_size = data.raw.item["se-observation-frame-blank"].icon_size, scale = 0.5
        }),
        subgroup = "observation-frame",
        main_product = "se-observation-frame-blank",
        ingredients = {
            {type = "item", name = "se-observation-frame-broken", amount = 5},
            {type = "fluid", name = "light-oil", amount = 5},
            {type = "item", name = "glass", amount = 1},
        },
        results = {
            {type = "item", name = "se-observation-frame-blank", probability = 0.9, amount = 5},
            {type = "item", name = "se-scrap", probability = 0.1, amount = 8},
        }
    },
--[[    {
        type = "recipe",
        name = "experimental-fish-growth",
        order = "",
        energy_required = 30,
        enabled = false,
        category = "space-growth",
        subgroup = "specimen",
        icons = data_util.sub_icons(data.raw.item["raw-fish"].icon, data.raw.item["se-experimental-bioculture"].icon),
        ingredients = {
            {name = "se-experimental-bioculture", amount = 10},
            {type = "fluid", name = "se-nutrient-gel", amount = 100}
        },
        results = {
            {type = "item", name = "raw-fish", amount_min = 1, amount_max = 10},
            {type = "fluid", name = "se-contaminated-bio-sludge", amount = 50},
            {type = "fluid", name = "se-contaminated-space-water", amount = 50}
        }
    },]]
})
