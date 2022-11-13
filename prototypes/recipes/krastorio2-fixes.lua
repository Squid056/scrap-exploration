local data_util = require("__space-exploration__/data_util")
local postprocess_dependency = false

-- this check is so once SE postprocess does not allow mods to depend off it, this part of the mod can be disabled safley
-- while also keeping krastorio2-recipes.lua operational.
-- even if postprocess_dependency = false, k2 should still be able to run safely, although with limited intergration.
if postprocess_dependency then


    Redefine_results_table("se-kr-rare-metal-substrate", {
        {type = "item", name = "raw-scrap", amount_min = 1, amount_max = 5},
        {type = "item", name = "se-data-storage-substrate", amount = 2},
        {type = "item", name = "iron-stick", amount = 4},
    })

    --#region SE matter fusion edits
    data_util.replace_or_add_result("se-matter-fusion-rare-metals", "se-contaminated-scrap", "radiation-scrap", 1)

    data_util.replace_or_add_result("se-matter-fusion-raw-imersite", "se-contaminated-scrap", "radiation-scrap", 1)

    data_util.replace_or_add_result("se-kr-matter-containment-data", "se-contaminated-scrap", "radiation-scrap", 10)

    data_util.replace_or_add_result("se-kr-matter-liberation-data", "se-contaminated-scrap", "radiation-scrap", 10)

    --#endregion



end