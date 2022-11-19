

    

data:extend({
    {
        name = "scrap",
        type = "item-subgroup",
        group = "resources",
        order = "s-"
    }
})


    --scrap furnace
data:extend({ 
    {
    icon = data.raw["furnace"]["electric-furnace"].icon,
    icon_mipmaps = 4,
    icon_size = 64,
    name = "scrap-furnace",
    order = "c[electric-furnace]-c",
    place_result = "scrap-furnace",
    stack_size = 50,
    subgroup = "production-machine",
    type = "item"
    }
})




    --scrap
data:extend({ 
    {
        name = "raw-scrap",
        type = "item",
        stack_size = 100,
        icon = "__scrap-exploration__/graphics/Raw_scrap.png",
        icon_size = 64,
        item_group = "intermediate-products",
        subgroup = "scrap",
        order = "01"
    },
    {
        name = "compressed-scrap",
        type = "item",
        stack_size = 20,
        --icon = "__scrap-exploration__/graphics/Compressed_scrap.png",
        icon = "__space-exploration-graphics__/graphics/icons/scrap-stacked.png", -- temp placeholder 
        icon_size = 64,
        item_group = "intermediate-products",
        subgroup = "scrap",
        order = "04"
    },
    {
        name = "radiation-scrap",
        type = "item",
        stack_size = 50,
        icon = "__scrap-exploration__/graphics/Radioactive_waste.png",
        icon_size = 64,
        item_group = "intermediate-products",
        subgroup = "scrap",
        order = "05"
    },
    {
        name = "scrap-plate",
        type = "item",
        stack_size = 100,
        icons = 
        {
        {
            icon = data.raw["item"]["iron-plate"].icon,
            tint = {r=0.2,g=0.2,b=0,a=0.3},
        }
        },
        icon_size = data.raw["item"]["iron-plate"].icon_size,
        item_group = "production",
        order = "z-01"
    },
    {
        name = "se-observation-frame-broken",
        type = "item",
        stack_size = 200,
        icon = data.raw["item"]["se-observation-frame-blank"].icon,
        icon_size = data.raw["item"]["se-observation-frame-blank"].icon_size,
        item_group = "intermediate-products",
        subgroup = "observation-frame",
        order = "z-01"
    },
})



