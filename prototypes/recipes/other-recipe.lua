local data_util = require( "__space-exploration__.data_util" )
local mod_prefix = "sc-"

local observationchanges = not settings.startup["broken-observation-changes"].value
local landfill_coal = not settings.startup["landfill-from-coal"].value

data:extend({
    {
        type = "recipe",
        name = mod_prefix .. "iron-stick-melting",
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
            {name = "sc-raw-scrap", amount = 1},
        },
        allow_decomposition = false
    },
    {
        type = "recipe",
        name = mod_prefix .. "copper-cable-melting",
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
            {name = "sc-raw-scrap", amount = 1},
        },
        allow_decomposition = false
    },
    {
        type = "recipe",
        name = mod_prefix .. "quantum-phenomenon-data",
        order = "a-05",
        energy_required = 20,
        enabled = false, 
        category = "space-laser",
        always_show_made_in = true,
        main_product = "se-quantum-phenomenon-data",
        icons = data_util.sub_icons(data.raw.item["se-quantum-phenomenon-data"].icon, data.raw.item["logistic-robot"].icon),
        subgroup = "data-energy",
        ingredients = {
            {type = "item", name = "se-empty-data", amount = 5},
            {type = "fluid", name = "se-space-coolant-cold", amount = 25},
            {type = "item", name = "logistic-robot", amount = 1},
        },
        results = {
            {type = "item", name = "se-quantum-phenomenon-data", amount = 5},
            {type = "fluid", name = "se-space-coolant-hot", amount = 25},
            {type = "item", name = "construction-robot", probability = 0.15, amount = 1},
            {type = "item", name = "logistic-robot", probability = 0.84, amount = 1},
            {type = "item", name = "sc-radiation-scrap", amount = 2}
        }
    },
    {
        type = "recipe",
        name = mod_prefix .. "observation-frame-broken",
        order = "z-01",
        energy_required = 10,
        enabled = false,
        category = "space-manufacturing",
        icons = data_util.transition_icons(
        {
            icon = data.raw.item["sc-observation-frame-broken"].icon,
            icon_size = data.raw.item["sc-observation-frame-broken"].icon_size, scale = 0.5
        },
        {
            icon = data.raw.item["se-observation-frame-blank"].icon,
            icon_size = data.raw.item["se-observation-frame-blank"].icon_size, scale = 0.5
        }),
        subgroup = "observation-frame",
        main_product = "se-observation-frame-blank",
        ingredients = {
            {type = "item", name = "sc-observation-frame-broken", amount = 5},
            {type = "fluid", name = "light-oil", amount = 5},
            {type = "item", name = "glass", amount = 1},
        },
        results = {
            {type = "item", name = "se-observation-frame-blank", probability = 0.9, amount = 5},
            {type = "item", name = "se-scrap", probability = 0.1, amount = 8},
        },
        hidden = observationchanges -- Disable recipe if the changes are off
    },
    {
        type = "recipe",
        name = mod_prefix .. "experimental-fish-growth",
        order = "",
        energy_required = 60,
        enabled = false,
        category = "space-growth",
        subgroup = "specimen",
        icons = data_util.sub_icons("__base__/graphics/icons/fish.png", data.raw.item["se-experimental-bioculture"].icon),
        ingredients = {
            {name = "se-experimental-bioculture", amount = 10},
            {type = "fluid", name = "se-nutrient-gel", amount = 100}
        },
        results = {
            {type = "item", name = "raw-fish", amount_min = 0, amount_max = 55},
            {type = "fluid", name = "se-contaminated-bio-sludge", amount_min = 50, amount_max = 150},
        }
    },
    {
        type = "recipe",
        name = mod_prefix .. "landfill-from-coal",
        order = "z-b-coal",
        energy_required = 1,
        enabled = true,
        category = "hard-recycling",
        subgroup = "terrain",
        main_product = "landfill",
        icons = data_util.sub_icons(data.raw.item["landfill"].icon, data.raw.item["coal"].icon),
        ingredients = {
            {name = "coal", amount = 50},
            
        },
        results = {
            {type = "item", name = "landfill", amount = 1}
        },
        hidden = landfill_coal
    },
    {
        type = "recipe",
        name = mod_prefix .. "landfill-from-compressed-scrap",
        order = "z-b-compressed-scrap",
        energy_required = 1,
        enabled = true,
        category = "hard-recycling",
        subgroup = "terrain",
        main_product = "landfill",
        icons = data_util.sub_icons(data.raw.item["landfill"].icon, data.raw.item["sc-compressed-scrap"].icon),
        ingredients = {
            {name = "sc-compressed-scrap", amount = 5},
            
        },
        results = {
            {type = "item", name = "landfill", amount = 1}
        },
        hidden = true -- not sure if this recipe is wanted as it simplifies the landfill processing
    },
})

data_util.tech_lock_recipes("se-space-catalogue-4", "sc-experimental-fish-growth")
data_util.tech_lock_recipes("se-space-telescope", "sc-observation-frame-broken")