local data_util = require("__space-exploration__/data_util")
local util = require("util")
for i, effect in pairs(data.raw["technology"]["se-recycling-facility"].effects)
do
    if effect.type == "unlock-recipe" and effect.recipe == "landfill-se-scrap"
    then
        table.remove(data.raw["technology"]["se-recycling-facility"].effects, i)
    end
end
-- move old scrap to new subgroup
data.raw.item["se-scrap"].subgroup = "scrap"
data.raw.item["se-contaminated-scrap"].subgroup = "scrap"
-- scrap order edits (make raw scrap first)
data.raw.item["se-scrap"].order = "02"
data.raw.item["se-contaminated-scrap"].order = "03"

-- RECIPE EDITS
Redefine_results_table("se-broken-data-scrapping", {
    {type = "item", name = "se-scrap", probability = 0.9, amount = 5},
    {type = "item", name = "sc-raw-scrap", probability = 0.1, amount_min = 1, amount_max = 10}
})

-- mess around with normal se scrap recycling 
Redefine_results_table("se-scrap-recycling", {
    {type = "item", name = "sc-raw-scrap", amount = 10},
    {type = "fluid", name = "heavy-oil", probability = 0.25, amount = 1}
})
data.raw.recipe["se-scrap-recycling"].subgroup = "scrap"
data.raw.recipe["se-scrap-recycling"].icons = data_util.transition_icons(
    {
        icon = data.raw.item["se-scrap"].icon,
        icon_size = data.raw.item["se-scrap"].icon_size, scale = 0.5
    },
    {
        icon = data.raw.item["sc-raw-scrap"].icon,
        icon_size = data.raw.item["sc-raw-scrap"].icon_size, scale = 0.5
    }  
)

Redefine_results_table("se-scrap-decontamination", {
    {type = "item", name = "se-scrap", amount = 20},
    {type = "fluid", name = "se-contaminated-bio-sludge", amount = 1},
    {type = "fluid", name = "se-contaminated-space-water", amount = 1},
    {type = "item", name = "uranium-ore", probability = 0.001, amount = 1},
})
data.raw.recipe["se-scrap-decontamination"].subgroup = "scrap"

if not mods["Krastorio2"] then
    Redefine_results_table("se-rocket-fuel-from-water-copper", {
        {type = "item", name = "rocket-fuel", amount = 1},
        {type = "item", name = "sc-raw-scrap", amount_min = 50, amount_max = 100},
    })
end 

Redefine_results_table("se-bio-sludge-decontamination", {
    {type = "item", name = "se-contaminated-scrap", probability = 0.1, amount_min = 1, amount_max = 5},
    {type = "fluid", name = "se-bio-sludge", amount = 99}
})

Redefine_results_table("se-space-water-decontamination", {
    {type = "item", name = "se-contaminated-scrap", probability = 0.1, amount_min = 1, amount_max = 5},
    {type = "fluid", name = "se-space-water", amount = 99},
    {type = "fluid", name = "se-contaminated-bio-sludge", amount = 1}
})

Redefine_results_table("se-data-storage-substrate", {
    {type = "item", name = "sc-raw-scrap", amount_min = 1, amount_max = 5},
    {type = "item", name = "se-data-storage-substrate", amount = 1},
    {type = "item", name = "iron-stick", amount = 2},
})

Redefine_results_table("se-data-storage-substrate-cleaned", {
    {type = "item", name = "se-scrap", probability = 0.01, amount = 1},
    {type = "item", name = "se-data-storage-substrate-cleaned", amount = 1},
    {type = "fluid", name = "se-contaminated-space-water", amount = 5},
})

Redefine_results_table("se-machine-learning-data", {
    {type = "item", name = "se-machine-learning-data", amount = 1},
    {type = "item", name = "se-scrap", amount_min = 0, amount_max = 2},
    {type = "fluid", name = "se-space-coolant-hot", amount = 5},
    {type = "item", name = "copper-cable", amount_min = 2, amount_max = 6},
})

data.raw.recipe["se-cargo-pod-scrapping"].main_product = "sc-compressed-scrap"
Redefine_results_table("se-cargo-pod-scrapping", {
    {type = "item", name = "sc-compressed-scrap", amount = 5},
})

Redefine_results_table("se-canister", {
    {type = "item", name = "se-canister", amount = 1},
    {type = "item", name = "se-scrap", probability = 0.5, amount_min = 2, amount_max = 5},
})
--[[ disabled for balacned -- no contaminated scrap on ground
Redefine_results_table("se-used-lifesupport-canister-cleaning", {
    {type = "item", name = "se-empty-lifesupport-canister", amount = 1},
    {type = "item", name = "se-contaminated-scrap", probability = 0.8, amount_min = 1, amount_max = 5},
})
]]

Add_result("nuclear-fuel-reprocessing",
    {type = "item", name = "sc-radiation-scrap", amount_min = 1, amount_max = 2}
)
data.raw.recipe["se-delivery-cannon-pack-se-scrap"].icon = "__space-exploration-graphics__/graphics/icons/scrap-stacked.png"
data.raw.recipe["se-delivery-cannon-pack-se-contaminated-scrap"].hidden = true
Redefine_ingredients_table("se-delivery-cannon-pack-se-scrap", {
    {type = "item", name = "se-delivery-cannon-capsule", amount = 1},
    {type = "item", name = "sc-compressed-scrap", amount = 20},
})

--#region material science changes
Redefine_results_table("se-impact-shielding-data", {
    {type = "item", name = "se-impact-shielding-data", amount = 25},
    {type = "item", name = "se-heavy-girder", probability = 0.5, amount = 1},
    {type = "item", name = "se-iridium-plate", probability = 0.25, amount = 1},
    {type = "item", name = "sc-compressed-scrap", amount = 50},
    {type = "item", name = "se-scrap", amount = 500},
    {type = "fluid", name = "se-contaminated-space-water", amount = 1},
})

Add_result("se-experimental-alloys-data",
    {type = "item", name = "sc-compressed-scrap", probability = 0.05, amount = 1}
)

Add_result("se-material-testing-pack",
    {type = "item", name = "se-scrap", probability = 0.05, amount_min = 1, amount_max = 2}
)

data_util.replace_or_add_result("se-radiation-shielding-data", "se-contaminated-scrap", "sc-radiation-scrap", 8)

data_util.replace_or_add_result("se-pressure-containment-data", "se-scrap", "sc-compressed-scrap", 2)
Add_result("se-pressure-containment-data",
    {type = "item", name = "se-scrap", amount = 10}
)

data_util.replace_or_add_result("se-rigidity-data", "se-scrap", "sc-compressed-scrap", nil, false, 1, 1, 0.5)

data_util.replace_or_add_result("se-explosion-shielding-data", "se-scrap", "sc-compressed-scrap", nil, false, 1, 1, 0.50)

-- ballistic data rework
Redefine_ingredients_table("se-ballistic-shielding-data", {
    {type = "item", name = "se-empty-data", amount = 5},
    {type = "item", name = "se-material-testing-pack", amount = 5},
    {type = "item", name = "se-heavy-girder", amount = 2},
    {type = "item", name = "se-iridium-plate", amount = 2},
    {type = "item", name = "cannon-shell", amount = 4},
    --{type = "fluid", name = "lubricant", amount = 5},
    {type = "item", name = "concrete-wall", amount = 1},
})
Redefine_results_table("se-ballistic-shielding-data", {
    {type = "item", name = "se-ballistic-shielding-data", amount = 5},
    {type = "item", name = "se-heavy-girder", probability = 0.75, amount = 2},
    {type = "item", name = "se-iridium-plate", probability = 0.25, amount = 2},
    --{type = "fluid", name = "se-contaminated-space-water", amount = 1},
    {type = "item", name = "concrete-wall", probability = 0.9, amount = 1},
    {type = "item", name = "sc-compressed-scrap", amount = 2},
})
data.raw.recipe["se-ballistic-shielding-data"].energy_required = 50

--#endregion

--#region energy science changes (minor-ish)

Add_result("se-radiation-data",
    {type = "item", name = "sc-radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)

Add_result("se-quantum-phenomenon-data",
    {type = "item", name = "sc-radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)

Redefine_ingredients_table("se-quantum-phenomenon-data", {
    {type = "item", name = "se-empty-data", amount = 5},
    {type = "fluid", name = "se-space-coolant-cold", amount = 25},
    {type = "item", name = "construction-robot", amount = 1},
})
Redefine_results_table("se-quantum-phenomenon-data", {
    {type = "item", name = "se-quantum-phenomenon-data", amount = 5},
    {type = "fluid", name = "se-space-coolant-hot", amount = 25},
    {type = "item", name = "construction-robot", probability = 0.84, amount = 1},
    {type = "item", name = "logistic-robot", probability = 0.15, amount = 1},
    {type = "item", name = "sc-radiation-scrap", amount = 2}
})
data.raw.recipe["se-quantum-phenomenon-data"].energy_required = 20
data.raw.recipe["se-quantum-phenomenon-data"].icons = data_util.sub_icons(data.raw.item["se-quantum-phenomenon-data"].icon, data.raw.item["construction-robot"].icon)

data_util.tech_lock_recipes("se-space-catalogue-energy-2", "sc-quantum-phenomenon-data")

Redefine_ingredients_table("se-conductivity-data", {
    {type = "item", name = "electronic-circuit", amount = 2},
    {type = "item", name = "copper-cable", amount = 14},
    {type = "item", name = "se-holmium-plate", amount = 1},
    {type = "item", name = "se-empty-data", amount = 1},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
})

Add_result("se-conductivity-data",
    {type = "item", name = "copper-cable", probability = 0.5, amount = 6}
)

--#endregion

--#region gamma ray detector changes & space mirror changes

Add_ingredient("se-gammaray-detector",
    {type = "item", name = "se-aeroframe-pole", amount = 6}
)

Add_result("se-gammaray-detector",
    {type = "item", name = "se-aeroframe-pole", probability = 0.98, amount = 6}
)
Add_result("se-gammaray-detector",
    {type = "item", name = "se-scrap", probability = 0.02, amount = 12}
)

Add_result("se-space-mirror", 
    {type = "item", name = "iron-stick", amount = 12}
)
Add_result("se-space-mirror-alternate", 
    {type = "item", name = "iron-stick", amount = 12}
)

--#endregion

--#region bio changes (minor)

data_util.tech_lock_recipes("se-space-catalogue-biological-4", "sc-experimental-fish-growth")

Add_result("se-radiation-exposure-data",
    {type = "item", name = "sc-radiation-scrap", probability = 0.1, amount = 1}
)

Add_result("se-radiation-exposure-resistance-data",
    {type = "item", name = "sc-radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)

Add_result("se-bioelectrics-data",
{type = "item", name = "se-contaminated-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)

Add_result("se-experimental-genetic-data",
{type = "item", name = "se-contaminated-scrap", probability = 0.1, amount = 1}
)

Redefine_ingredients_table("se-neural-anomaly-data", {
    {type = "item", name = "processing-unit", amount = 1},
    {type = "item", name = "se-empty-data", amount = 3},
    {type = "fluid", name = "se-neural-gel-2", amount = 20},
    {type = "item", name = "raw-fish", amount = 1}
})

Redefine_results_table("se-neural-anomaly-data", {
    {type = "item", name = "processing-unit", probability = 0.75, amount = 1},
    {type = "item", name = "se-neural-anomaly-data", probability = 0.85, amount = 3},
    {type = "item", name = "se-junk-data", probability = 0.14, amount = 3},
    {type = "fluid", name = "se-neural-gel-2", amount = 15},
    {type = "item", name = "raw-fish", probability = 0.5, amount = 1}
})

--#endregion

--#region DSS changes (WIP)

if settings.startup["naquium-plate-tank"].value == true then
    Redefine_ingredients_table("se-naquium-ingot-to-plate", {
        {type = "item", name = "se-naquium-ingot", amount = 2},
        {type = "item", name = "tank", amount = 1},
        {type = "item", name = "explosive-uranium-cannon-shell", amount = 1},
        {type = "item", name = "se-heavy-girder", amount = 10},
    })
    Redefine_results_table("se-naquium-ingot-to-plate", {
        {type = "item", name = "se-naquium-plate", amount = 20},
        {type = "item", name = "tank", probability = 0.999, amount = 1},
        {type = "item", name = "se-heavy-girder", amount = 9},
        {type = "item", name = "sc-radiation-scrap", probability = 0.5, amount_min = 1, amount_max = 5}

    })
end

data_util.replace_or_add_result("se-naquium-energy-data", "se-contaminated-scrap", "sc-radiation-scrap", 15)
Add_result("se-naquium-energy-data", 
    {type = "item", name = "se-contaminated-scrap", amount = 10}
)

--#endregion

--#region Matter fusion changes (mostly just scrap swaps), optional 

if settings.startup["matter-fusion-swaps"].value == true then

    data_util.replace_or_add_result("se-matter-fusion-iron", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-copper", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-stone", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-uranium", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-vulcanite", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-cryonite", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-beryllium", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-holmium", "se-contaminated-scrap", "sc-radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-iridium", "se-contaminated-scrap", "sc-radiation-scrap", 1)

end
--#endregion

--#region astro observation data changes 

if settings.startup["broken-observation-changes"].value == true then

    data_util.tech_lock_recipes("se-space-telescope", "sc-observation-frame-broken")

    local function replace_observation_data(type)
        local data = "se-observation-frame-" .. type
        data_util.replace_or_add_result(data, data, data, nil, false, 1, 1, 0.98)
        Add_result(data, {type = "item", name = "sc-observation-frame-broken", probability = 0.02, amount = 1})   
    end
    -- basic observation 
    replace_observation_data("radio")
    replace_observation_data("microwave")
    replace_observation_data("infrared")
    replace_observation_data("visible")
    replace_observation_data("uv")

    -- xray and gamma observation
    data_util.replace_or_add_result("se-observation-frame-xray", "se-observation-frame-xray", "se-observation-frame-xray", nil, false, 12, 12, 0.92)
    Add_result("se-observation-frame-xray", {type = "item", name = "sc-observation-frame-broken", probability = 0.08, amount = 12})

    data_util.replace_or_add_result("se-observation-frame-gammaray", "se-observation-frame-gammaray", "se-observation-frame-gammaray", nil, false, 12, 12, 0.92)
    Add_result("se-observation-frame-gammaray", {type = "item", name = "sc-observation-frame-broken", probability = 0.08, amount = 12})
end
--#endregion