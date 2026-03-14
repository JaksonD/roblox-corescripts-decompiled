local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local v4 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_CatalogCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories;
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.Categories);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SearchCategories);
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v12.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDefaultCatalogCategoryId_0 = v12.FFlagAXDefaultCatalogCategoryId;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v12.FFlagAXCatalogCategoriesStoreImprovePerf;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function v18(v17) --[[ Line: 31 ]] --[[ Name: selectCatalogCategories ]]
    return v17.AvatarExperience.Catalog.Categories;
end;
local function v20(v19) --[[ Line: 35 ]] --[[ Name: selectCatalogSearchCategories ]]
    return v19.AvatarExperience.Catalog.SearchCategories;
end;
return function(v21, v22, v23, v24) --[[ Line: 40 ]] --[[ Name: useCatalogCategoryImpressionsInfo ]]
    -- upvalues: l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v2 (copy), l_useSignalState_0 (copy), l_useSelector_0 (copy), v18 (copy), v20 (copy), l_FFlagAXDefaultCatalogCategoryId_0 (copy), v11 (copy), l_CatalogCategories_0 (copy), v7 (copy), v6 (copy), v4 (copy)
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then
        v25 = if v22 then v22.Name else nil;
        v26 = if v23 then v23.Name else nil;
        v27 = if v24 then v24.TaxonomyUuid else nil;
    elseif l_FFlagAXCatalogCategoriesStore_0 then
        local v28 = v2.getCatalogSelectionStore();
        local v29 = l_useSignalState_0(v28.selectedCategory);
        local v30 = l_useSignalState_0(v28.selectedSubcategory);
        local v31 = l_useSignalState_0(v28.selectedCategoryInfo);
        local v32 = v2.getCatalogSearchSelectionStore();
        local v33 = l_useSignalState_0(v32.selectedCategory);
        local v34 = l_useSignalState_0(v32.selectedSubcategory);
        local v35 = l_useSignalState_0(v32.selectedCategoryInfo);
        if v21 then
            v25 = if v33 then v33.Name else nil;
            v26 = if v34 then v34.Name else nil;
            v27 = if v35 then v35.TaxonomyUuid else nil;
        else
            v25 = if v29 then v29.Name else nil;
            v26 = if v30 then v30.Name else nil;
            v27 = if v31 then v31.TaxonomyUuid else nil;
        end;
    else
        local v36 = l_useSelector_0(v18);
        local v37 = l_useSelector_0(v20);
        local v38 = if v21 then v37 else v36;
        local v39 = v38.categoryId or if l_FFlagAXDefaultCatalogCategoryId_0 then v11.DefaultCatalogCategoryId else l_CatalogCategories_0.Recommended:rawValue();
        local l_subcategoryId_0 = v38.subcategoryId;
        v25 = v7.getCategoryNameById(v39);
        if l_subcategoryId_0 then
            v26 = v7.getSubcategoryNameByIdWithErrorLogging(v39, l_subcategoryId_0);
        end;
        local v41 = v6.getCatalogCategoryInfoById(v39, l_subcategoryId_0);
        v27 = if v41 then v41.TaxonomyUuid else nil;
    end;
    return v4.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v25 (ref), v26 (ref), v27 (ref)
        return {
            impressionsCategory = v25, 
            impressionsSubcategory = v26, 
            impressionsTaxonomyId = v27
        };
    end, {
        v25, 
        v26, 
        v27
    });
end;