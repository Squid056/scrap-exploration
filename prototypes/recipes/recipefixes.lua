local data_util = require("__space-exploration__/data_util")


for i, effect in pairs(data.raw["technology"]["se-recycling-facility"].effects)
do
    if effect.type == "unlock-recipe" and effect.recipe == "landfill-se-scrap"
    then
        table.remove(data.raw["technology"]["se-recycling-facility"].effects, i)
    end
end
-- scrap order edits (make raw scrap first)
data.raw.item["se-scrap"].order = "z-02"
data.raw.item["se-contaminated-scrap"].order = "z-03"

-- RECIPE EDITS

local function redefine_results_table_sub(recipe, new_results, difficulty)
    if difficulty == recipe then
        if data.raw.recipe[recipe].results ~= nil then
            data.raw.recipe[recipe].results = new_results
        else
            local current_result = recipe.result
            data.raw.recipe[recipe].result = nil
            table.insert(new_results, current_result)
            data.raw.recipe[recipe].results = new_results
        end
    elseif difficulty == recipe.normal then
        if data.raw.recipe[recipe].normal.results ~= nil then
            data.raw.recipe[recipe].normal.results = new_results
        else
            local current_result = recipe.normal.result
            data.raw.recipe[recipe].normal.result = nil
            table.insert(new_results, current_result)
            data.raw.recipe[recipe].normal.results = new_results
        end
    elseif difficulty == recipe.expensive then
        if data.raw.recipe[recipe].expensive.results ~= nil then
            data.raw.recipe[recipe].expensive.results = new_results
        else
            local current_result = recipe.expensive.result
            data.raw.recipe[recipe].expensive.result = nil
            table.insert(new_results, current_result)
            data.raw.recipe[recipe].expensive.results = new_results
        end
    else return 
    end
end

local function redefine_results_table(recipe, new_results)
    local difficulties = {recipe or nil, recipe.normal or nil, recipe.expensive or nil}
    
    for _, difficulty in pairs(difficulties) do
        redefine_results_table_sub(recipe, new_results, difficulty)
    end
end

local function add_result(recipe, new_result)
    local difficulties = {data.raw.recipe[recipe], data.raw.recipe[recipe].normal or nil, data.raw.recipe[recipe].expensive or nil}

    for _, difficulty in pairs(difficulties) do
        local recipe = difficulty

        if recipe.results == nil then
            local current_result = recipe.result
            local new_results_table = {current_result, new_result}
            recipe.results = new_results_table
        else
            table.insert(recipe.results, new_result)
        end
    end
end

local function add_ingredient(recipe, new_ingredient)
    local difficulties = {data.raw.recipe[recipe], data.raw.recipe[recipe].normal or nil, data.raw.recipe[recipe].expensive or nil}

    for _, difficulty in pairs(difficulties) do
        local recipe = difficulty
        
        table.insert(recipe.ingredients, new_ingredient)
    end
end

local function redefine_ingredients_table(recipe, new_ingredients)
    local difficulties = {data.raw.recipe[recipe], data.raw.recipe[recipe].normal or nil, data.raw.recipe[recipe].expensive or nil}
    
    for _, diffculty in pairs(difficulties) do
        diffculty.ingredients = new_ingredients       
    end
end

local function remove_result(recipe, to_remove, replace_with)   
    local difficulties = {data.raw.recipe[recipe], data.raw.recipe[recipe].normal or nil, data.raw.recipe[recipe].expensive or nil}

    for _, difficulty in pairs(difficulties) do
        for i, value in pairs(t) do
            
        end
    end
end


redefine_results_table("se-broken-data-scrapping", {
    {type = "item", name = "se-scrap", probability = 0.9, amount = 5},
    {type = "item", name = "raw-scrap", probability = 0.1, amount_min = 1, amount_max = 10}
})

-- mess around with normal se scrap recycling 
redefine_results_table("se-scrap-recycling", {
    {type = "item", name = "raw-scrap", amount = 10},
    {type = "fluid", name = "heavy-oil", probability = 0.15, amount = 1}
})
data.raw.recipe["se-scrap-recycling"].icons = data_util.transition_icons(
    {
        icon = data.raw.item["se-scrap"].icon,
        icon_size = data.raw.item["se-scrap"].icon_size, scale = 0.5
    },
    {
        icon = data.raw.item["raw-scrap"].icon,
        icon_size = data.raw.item["raw-scrap"].icon_size, scale = 0.5
    }  
)

-- lrf shenanigains
local lrf = data.raw.recipe["se-liquid-rocket-fuel"]
lrf.icon = "__space-exploration-graphics__/graphics/icons/fluid/liquid-rocket-fuel.png"
lrf.icon_size = data.raw.fluid["se-liquid-rocket-fuel"].icon_size
lrf.main_product = "se-liquid-rocket-fuel"
data_util.replace_or_add_result("se-liquid-rocket-fuel", nil , "raw-scrap", 2)


redefine_results_table("se-rocket-fuel-from-water-copper", {
    {type = "item", name = "rocket-fuel", amount = 1},
    {type = "item", name = "raw-scrap", amount_min = 50, amount_max = 100},
})

redefine_results_table("se-bio-sludge-decontamination", {
    {type = "item", name = "se-contaminated-scrap", probability = 0.1, amount_min = 1, amount_max = 5},
    {type = "fluid", name = "se-bio-sludge", amount = 99}
})

redefine_results_table("se-space-water-decontamination", {
    {type = "item", name = "se-contaminated-scrap", probability = 0.1, amount_min = 1, amount_max = 5},
    {type = "fluid", name = "se-space-water", amount = 99},
    {type = "fluid", name = "se-contaminated-bio-sludge", amount = 1}
})

redefine_results_table("se-scrap-decontamination", {
    {type = "item", name = "se-scrap", amount = 20},
    {type = "item", name = "raw-scrap",probability = 0.50, amount_min = 1, amount_max = 10},
    {type = "fluid", name = "se-contaminated-bio-sludge", amount = 1},
    {type = "fluid", name = "se-contaminated-space-water", amount = 1},
    {type = "item", name = "uranium-ore",probability = 0.01, amount_min = 1, amount_max = 3},
})

redefine_results_table("se-data-storage-substrate", {
    {type = "item", name = "raw-scrap", amount_min = 1, amount_max = 5},
    {type = "item", name = "se-data-storage-substrate", amount = 1},
    {type = "item", name = "iron-stick", amount = 2},
})

redefine_results_table("se-data-storage-substrate-cleaned", {
    {type = "item", name = "se-scrap", probability = 0.05, amount_min = 1, amount_max = 5},
    {type = "item", name = "se-data-storage-substrate-cleaned", amount = 1},
    {type = "fluid", name = "se-contaminated-space-water", amount = 5},
})

redefine_results_table("se-machine-learning-data", {
    {type = "item", name = "se-machine-learning-data", amount = 1},
    {type = "item", name = "se-scrap", probability = 0.3, amount_min = 1, amount_max = 2},
    {type = "fluid", name = "se-space-coolant-hot", amount = 5},
    {type = "item", name = "copper-cable", amount_min = 2, amount_max = 6},
})

data.raw.recipe["se-cargo-pod-scrapping"].main_product = "compressed-scrap"
redefine_results_table("se-cargo-pod-scrapping", {
    {type = "item", name = "compressed-scrap", amount = 5},
})

redefine_results_table("se-canister", {
    {type = "item", name = "se-canister", amount = 1},
    {type = "item", name = "se-scrap", probability = 0.5, amount_min = 2, amount_max = 5},
})

redefine_results_table("se-used-lifesupport-canister-cleaning", {
    {type = "item", name = "se-empty-lifesupport-canister", amount = 1},
    {type = "item", name = "se-contaminated-scrap", probability = 0.8, amount_min = 1, amount_max = 5},
})


add_result("nuclear-fuel-reprocessing",
    {type = "item", name = "radiation-scrap", amount_min = 1, amount_max = 2}
)


--#region material science changes
redefine_results_table("se-impact-shielding-data", {
    {type = "item", name = "se-impact-shielding-data", amount = 25},
    {type = "item", name = "se-heavy-girder", probability = 0.5, amount = 1},
    {type = "item", name = "se-iridium-plate", probability = 0.25, amount = 1},
    {type = "item", name = "compressed-scrap", amount = 70},
    {type = "item", name = "raw-scrap", amount = 500},
    {type = "fluid", name = "se-contaminated-space-water", amount = 1},
})

add_result("se-experimental-alloys-data",
    {type = "item", name = "compressed-scrap", probability = 0.05, amount = 1}
)

add_result("se-material-testing-pack",
    {type = "item", name = "se-scrap", probability = 0.05, amount_min = 1, amount_max = 2}
)

data_util.replace_or_add_result("se-radiation-shielding-data", "se-contaminated-scrap", "radiation-scrap", 8)

data_util.replace_or_add_result("se-pressure-containment-data", "se-scrap", "compressed-scrap", 2)
add_result("se-pressure-containment-data",
    {type = "item", name = "se-scrap", amount = 10}
)

data_util.replace_or_add_result("se-rigidity-data", "se-scrap", "compressed-scrap", nil, false, 1, 1, 0.5)

data_util.replace_or_add_result("se-explosion-shielding-data", "se-scrap", "compressed-scrap", nil, false, 1, 1, 0.50)

-- ballistic data rework
redefine_ingredients_table("se-ballistic-shielding-data", {
    {type = "item", name = "se-empty-data", amount = 5},
    {type = "item", name = "se-material-testing-pack", amount = 5},
    {type = "item", name = "se-heavy-girder", amount = 2},
    {type = "item", name = "se-iridium-plate", amount = 2},
    {type = "item", name = "cannon-shell", amount = 4},
    --{type = "fluid", name = "lubricant", amount = 5},
    {type = "item", name = "concrete-wall", amount = 1},
})
redefine_results_table("se-ballistic-shielding-data", {
    {type = "item", name = "se-ballistic-shielding-data", amount = 5},
    {type = "item", name = "se-heavy-girder", probability = 0.75, amount = 2},
    {type = "item", name = "se-iridium-plate", probability = 0.25, amount = 2},
    --{type = "fluid", name = "se-contaminated-space-water", amount = 1},
    {type = "item", name = "concrete-wall", probability = 0.9, amount = 1},
    {type = "item", name = "compressed-scrap", amount = 2},
})
data.raw.recipe["se-ballistic-shielding-data"].energy_required = 50

--#endregion
--#region energy science changes (minor)

add_result("se-radiation-data",
    {type = "item", name = "radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)

add_result("se-quantum-phenomenon-data",
    {type = "item", name = "radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)


redefine_ingredients_table("se-conductivity-data", {
    {type = "item", name = "electronic-circuit", amount = 2},
    {type = "item", name = "copper-cable", amount = 12},
    {type = "item", name = "se-holmium-plate", amount = 1},
    {type = "item", name = "se-empty-data", amount = 1},
    {type = "fluid", name = "se-space-coolant-cold", amount = 10},
})

add_result("se-conductivity-data",
    {type = "item", name = "copper-cable", probability = 0.5, amount = 6}
)

--#endregion

--#region gamma ray detector changes & space mirror changes

add_ingredient("se-gammaray-detector",
    {type = "item", name = "se-aeroframe-pole", amount = 6}
)

add_result("se-gammaray-detector",
    {type = "item", name = "se-aeroframe-pole", probability = 0.98, amount = 6}
)
add_result("se-gammaray-detector",
    {type = "item", name = "se-scrap", probability = 0.02, amount = 12}
)

add_result("se-space-mirror", 
    {type = "item", name = "iron-stick", amount = 12}
)
add_result("se-space-mirror-alternate", 
    {type = "item", name = "iron-stick", amount = 12}
)

--#endregion

--#region bio changes (minor)

add_result("se-radiation-exposure-data",
    {type = "item", name = "radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)

add_result("se-radiation-exposure-resistance-data",
    {type = "item", name = "radiation-scrap", probability = 0.1, amount_min = 1, amount_max = 5}
)
--#endregion