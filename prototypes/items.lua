local mod_prefix = "sc-"

    

data:extend({
    {
        name = "scrap",
        type = "item-subgroup",
        group = "resources",
        order = "s-"
    },
})

    --scrap
data:extend({ 
    {
        name = mod_prefix .. "raw-scrap",
        type = "item",
        stack_size = 100,
        icon = "__scrap-exploration__/graphics/Raw_scrap.png",
        icon_size = 64,
        item_group = "intermediate-products",
        subgroup = "scrap",
        order = "01"
    },
    {
        name = mod_prefix .. "compressed-scrap",
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
        name = mod_prefix .. "radiation-scrap",
        type = "item",
        stack_size = 50,
        icon = "__scrap-exploration__/graphics/Radioactive_waste.png",
        icon_size = 64,
        item_group = "intermediate-products",
        subgroup = "scrap",
        order = "05"
    },
    { -- temporary disable
        name = mod_prefix .. "scrap-plate",
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
        name = mod_prefix .. "observation-frame-broken",
        type = "item",
        stack_size = 200,
        icon = "__scrap-exploration__/graphics/Damaged_observation_frame.png",
        icon_size = 64,
        item_group = "intermediate-products",
        subgroup = "observation-frame",
        order = "z-01"
    },
})



