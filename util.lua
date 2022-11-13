function Redefine_results_table_sub(recipe, new_results, difficulty)
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

function Redefine_results_table(recipe, new_results)
    local difficulties = {recipe or nil, recipe.normal or nil, recipe.expensive or nil}
    
    for _, difficulty in pairs(difficulties) do
        Redefine_results_table_sub(recipe, new_results, difficulty)
    end
end

function Add_result(recipe, new_result)
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

function Add_ingredient(recipe, new_ingredient)
    local difficulties = {data.raw.recipe[recipe], data.raw.recipe[recipe].normal or nil, data.raw.recipe[recipe].expensive or nil}

    for _, difficulty in pairs(difficulties) do
        local recipe = difficulty
        
        table.insert(recipe.ingredients, new_ingredient)
    end
end

function Redefine_ingredients_table(recipe, new_ingredients)
    local difficulties = {data.raw.recipe[recipe], data.raw.recipe[recipe].normal or nil, data.raw.recipe[recipe].expensive or nil}
    
    for _, diffculty in pairs(difficulties) do
        diffculty.ingredients = new_ingredients       
    end
end
