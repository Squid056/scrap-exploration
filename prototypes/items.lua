

    
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
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = data.raw["item"]["se-scrap"].icon_size,
        item_group = "intermediate-products",
        subgroup = "recycling",
        order = "z-01"
    },
    {
        name = "compressed-scrap",
        type = "item",
        stack_size = 20,
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = data.raw["item"]["se-scrap"].icon_size,
        item_group = "intermediate-products",
        subgroup = "recycling",
        order = "z-04"
    },
    {
        name = "radiation-scrap",
        type = "item",
        stack_size = 50,
        icon = data.raw["item"]["se-scrap"].icon,
        icon_size = data.raw["item"]["se-scrap"].icon_size,
        item_group = "intermediate-products",
        subgroup = "recycling",
        order = "z-05"
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
})



