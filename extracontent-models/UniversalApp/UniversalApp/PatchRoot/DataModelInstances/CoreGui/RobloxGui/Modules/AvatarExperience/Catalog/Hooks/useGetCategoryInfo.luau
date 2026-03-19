local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_CatalogCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories;
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Categories);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v9.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDefaultCatalogCategoryId_0 = v9.FFlagAXDefaultCatalogCategoryId;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function v14(v13) --[[ Line: 20 ]] --[[ Name: selectCatalogCategories ]]
    return v13.AvatarExperience.Catalog.Categories;
end;
return function() --[[ Line: 25 ]] --[[ Name: useGetCategoryInfo ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v6 (copy), l_useSignalState_0 (copy), l_useSelector_0 (copy), v14 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v8 (copy), l_CatalogCategories_0 (copy), v4 (copy)
    if l_FFlagAXCatalogCategoriesStore_0 then
        local v15 = v6.getCatalogSelectionStore();
        return (l_useSignalState_0(v15.selectedCategoryInfo));
    else
        local v16 = l_useSelector_0(v14);
        local v17 = v16.categoryId or if l_FFlagAXDefaultCatalogCategoryId_0 then v8.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
        local l_subcategoryId_0 = v16.subcategoryId;
        return (v4.getCatalogCategoryInfoById(v17, l_subcategoryId_0));
    end;
end;