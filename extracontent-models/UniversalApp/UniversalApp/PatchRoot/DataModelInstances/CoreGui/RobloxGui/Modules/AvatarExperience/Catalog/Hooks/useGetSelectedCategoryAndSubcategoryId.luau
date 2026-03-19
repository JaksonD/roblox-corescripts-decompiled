local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagAXCatalogCategoriesStore_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStore;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function v8(v7) --[[ Line: 13 ]] --[[ Name: selectSelectedCategoryId ]]
    return v7.AvatarExperience.Catalog.Categories.categoryId;
end;
local function v10(v9) --[[ Line: 17 ]] --[[ Name: selectSelectedSubcategoryId ]]
    return v9.AvatarExperience.Catalog.Categories.subcategoryId;
end;
return function() --[[ Line: 22 ]] --[[ Name: useGetSelectedCategoryAndSubcategoryId ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v3 (copy), l_useSignalState_0 (copy), l_useSelector_0 (copy), v8 (copy), v10 (copy)
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v11 = v3.getCatalogSelectionStore();
        return l_useSignalState_0(v11.selectedCategoryId), (l_useSignalState_0(v11.selectedSubcategoryId));
    else
        return l_useSelector_0(v8), (l_useSelector_0(v10));
    end;
end;