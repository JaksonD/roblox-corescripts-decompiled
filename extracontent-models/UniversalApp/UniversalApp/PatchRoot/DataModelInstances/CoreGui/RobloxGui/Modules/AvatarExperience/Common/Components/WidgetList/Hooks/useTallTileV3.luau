local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v4 = game:DefineFastFlag("AXFixTallTilesForSubcategories", false);
useTallTileV3 = function(v5) --[[ Line: 11 ]] --[[ Name: useTallTileV3 ]]
    -- upvalues: v2 (copy), v4 (copy), l_useSignalState_0 (copy)
    local v6 = v2.getCatalogSelectionStore();
    local v7 = v2.getCatalogSearchSelectionStore();
    if v4 then
        local v8 = l_useSignalState_0(v6.selectedCategoryInfo);
        local v9 = l_useSignalState_0(v7.selectedCategoryInfo);
        return (if v5 then v9 else v8).TileType == "Tall";
    else
        local v10 = l_useSignalState_0(v6.selectedCategory);
        local v11 = l_useSignalState_0(v7.selectedCategory);
        return (if v5 then v11 else v10).TileType == "Tall";
    end;
end;
return useTallTileV3;