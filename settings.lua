data:extend({
    {
        type = "bool-setting",
        name = "naquium-plate-tank",
        setting_type = "startup",
        default_value = false
    },
    {
        type = "bool-setting",
        name = "matter-fusion-swaps",
        setting_type = "startup",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "broken-observation-changes",
        setting_type = "startup",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "landfill-from-coal",
        setting_type = "startup",
        default_value = true
    },
})

if mods["Krastorio2"] then
    data:extend({
        {
            type = "bool-setting",
            name = "hide-dirty-water-ho-ir",
            setting_type = "startup",
            default_value = true
        },
        {
            type = "bool-setting",
            name = "pyro-rare-metals",
            setting_type = "startup",
            default_value = true
        },
    })
end