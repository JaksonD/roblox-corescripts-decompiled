local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_CatalogCategories_0 = v2.Enums.CatalogCategories;
local l_CatalogSubcategories_0 = v2.Enums.CatalogSubcategories;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagAXTallTilesForMakeupLooks_0 = v3.FFlagAXTallTilesForMakeupLooks;
useTallTileV2 = function(v9, _) --[[ Line: 15 ]] --[[ Name: useTallTileV2 ]]
    -- upvalues: v6 (copy), l_useSignalState_0 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy), l_FFlagAXTallTilesForMakeupLooks_0 (copy)
    local v11 = v6.getCatalogSelectionStore();
    local v12 = v6.getCatalogSearchSelectionStore();
    local v13 = l_useSignalState_0(v11.selectedCategoryId);
    local v14 = l_useSignalState_0(v11.selectedSubcategoryId);
    local v15 = l_useSignalState_0(v12.selectedCategoryId);
    local v16 = l_useSignalState_0(v12.selectedSubcategoryId);
    local v17 = if v9 then v15 else v13;
    local v18 = if v9 then v16 else v14;
    local v19 = true;
    if v17 ~= l_CatalogCategories_0.AllAnimations:rawValue() then
        v19 = true;
        if v17 ~= l_CatalogCategories_0.Characters:rawValue() then
            v19 = true;
            if v17 ~= l_CatalogCategories_0.Avatars:rawValue() then
                v19 = true;
                if v18 ~= l_CatalogSubcategories_0.FullBodies:rawValue() then
                    v19 = l_FFlagAXTallTilesForMakeupLooks_0 and v18 == l_CatalogSubcategories_0.MakeupLooks:rawValue();
                end;
            end;
        end;
    end;
    return v19;
end;
return useTallTileV2;