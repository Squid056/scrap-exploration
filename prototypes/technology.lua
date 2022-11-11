local data_util = require( "__space-exploration__.data_util" )
-- lock landfill recipes (By rekales#0524 )
--[[
for i, effect in pairs(data.raw["technology"]["se-recycling-facility"].effects)
do
    if effect.type == "unlock-recipe" and effect.recipe == "landfill-se-scrap"
    then
        table.remove(data.raw["technology"]["se-recycling-facility"].effects, i)
    end
end
]]


data:extend({
    {
        type = "technology",
        name = "scrap-furnace",
        icon_size = 256,
        icon_mipmaps = 4,
        icon = "__base__/graphics/technology/steel-processing.png",
        effects =
        {
            {type = "unlock-recipe", recipe = "scrap-furnace"},
            {type = "unlock-recipe", recipe = "raw-scrap-1"},
            {type = "unlock-recipe", recipe = "raw-scrap-2"},
            {type = "unlock-recipe", recipe = "iron-stick-melting"},
            {type = "unlock-recipe", recipe = "copper-cable-melting"},
        },
        unit =
        {
        count = 250,
        ingredients = 
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
        },
        time = 60
        },
        prerequisites = 
        {
            "se-heat-shielding",
            "engine",
        },
        order = "e-g"
    },
    {
        type = "technology",
        name = "scrap-plate",
        icon_size = 256,
        icon_mipmaps = 4,
        icon = "__base__/graphics/technology/steel-processing.png",
        effects =
        {
            {type = "unlock-recipe", recipe = "scrap-plate"},
        },
        unit =
        {
        count = 500,
        ingredients = 
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"se-rocket-science-pack", 1},
            {"space-science-pack", 1},
        },
        time = 60
        },
        prerequisites = 
        {
            "se-pyroflux-smelting",
            "scrap-furnace",
        },
        order = "e-g"
    }


})

data_util.tech_add_prerequisites("se-recycling-facility", {"scrap-furnace"}, true)