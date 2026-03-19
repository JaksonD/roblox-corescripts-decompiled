local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v2.Enums.CatalogCategories;
local l_CatalogSubcategories_0 = v2.Enums.CatalogSubcategories;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
useTallTileV2 = function(v7, _) --[[ Line: 12 ]] --[[ Name: useTallTileV2 ]]
    -- upvalues: v5 (copy), l_useSignalState_0 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy)
    local v9 = v5.getCatalogSelectionStore();
    local v10 = v5.getCatalogSearchSelectionStore();
    local v11 = l_useSignalState_0(v9.selectedCategoryId);
    local v12 = l_useSignalState_0(v9.selectedSubcategoryId);
    local v13 = l_useSignalState_0(v10.selectedCategoryId);
    local v14 = l_useSignalState_0(v10.selectedSubcategoryId);
    local v15 = if v7 then v13 else v11;
    local v16 = if v7 then v14 else v12;
    local v17 = true;
    if v15 ~= l_CatalogCategories_0.AllAnimations:rawValue() then
        v17 = true;
        if v15 ~= l_CatalogCategories_0.Characters:rawValue() then
            v17 = true;
            if v15 ~= l_CatalogCategories_0.Avatars:rawValue() then
                v17 = v16 == l_CatalogSubcategories_0.FullBodies:rawValue();
            end;
        end;
    end;
    return v17;
end;
return useTallTileV2;