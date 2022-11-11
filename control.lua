--[[
require("helper")
local data_util = require( "__space-exploration__.data_util" )

local old_recipes = 
{
    "se-scrap-recycling",
    "se-broken-data-scrapping",
    "se-broken-data-scrapping",
}


    for i, recipe in pairs(old_recipes) do
        for _, tech in pairs(data.raw.technology) do
            if tech.effects then
                for _, effect in pairs(tech.effects) do
                    if effect.type == "unlock-recipe" and effect.recipe == recipe[i] then
                    data_util.delete_recipe(recipe[i])
                    end
                end
            end
        end
        
    end
    
]]