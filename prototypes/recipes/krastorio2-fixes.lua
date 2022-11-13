local data_util = require("__space-exploration__/data_util")




Redefine_results_table("se-kr-data-storage-substrate", {
    {type = "item", name = "raw-scrap", amount_min = 1, amount_max = 5},
    {type = "item", name = "se-data-storage-substrate", amount = 1},
    {type = "item", name = "iron-stick", amount = 2},
})

--#region SE matter fusion edits
data_util.replace_or_add_result("se-matter-fusion-rare-metals", "se-contaminated-scrap", "radiation-scrap", 1)
