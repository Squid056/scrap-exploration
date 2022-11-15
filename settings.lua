data:extend({
    {
        type = "bool-setting",
        name = "naquium-plate-tank",
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
        }
    })
end