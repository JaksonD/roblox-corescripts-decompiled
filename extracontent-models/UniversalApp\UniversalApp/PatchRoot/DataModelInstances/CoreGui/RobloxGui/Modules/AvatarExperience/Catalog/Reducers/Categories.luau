local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v6 = require(l_Modules_0.LuaApp.mutedError);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCategoryAndSubcategory);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v9.FFlagAXCatalogCategoriesStore;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore);
local l_FFlagAXCatalogCategoriesSDUILinks_0 = v9.FFlagAXCatalogCategoriesSDUILinks;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v9.FFlagAXHandleTaxonomyIdsDeepLinks;
local v15 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 = v9.FFlagAXFixPrefetchMarketplaceStartupCrash;
local v19 = {
    categoryId = v17.DefaultCatalogCategoryId, 
    subcategoryId = nil
};
return v3.createReducer(v19, {
    [v7.name] = function(v20, v21) --[[ Line: 47 ]]
        -- upvalues: l_FFlagAXCatalogCategoriesStore_0 (copy), v6 (copy), v4 (copy)
        if l_FFlagAXCatalogCategoriesStore_0 then
            v6("SetCategoryAndSubcategory is not supported with FFlagAXCatalogCategoriesStore");
            return v20;
        else
            local v22 = v4.Dictionary.join(v20, {
                categoryId = v21.category or v20.categoryId, 
                subcategoryId = v4.None
            });
            if v21.subcategory then
                v22 = v4.Dictionary.join(v22, {
                    subcategoryId = v21.subcategory
                });
            end;
            return v22;
        end;
    end, 
    [v8.name] = function(v23, v24) --[[ Line: 64 ]]
        -- upvalues: l_FFlagAXCatalogCategoriesSDUILinks_0 (copy), v16 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy), v12 (copy), v11 (copy), v15 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy), v4 (copy)
        if l_FFlagAXCatalogCategoriesSDUILinks_0 then
            local v25 = v16.getCatalogCategoriesStore();
            if not v25.getHasFetchedCategories(false) then
                if v25.setPendingDeepLinkAction then
                    v25.setPendingDeepLinkAction(v24);
                end;
                return v23;
            end;
        end;
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v26 = v16.getCatalogSelectionStore();
            if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then
                local l_taxonomy_0 = v24.taxonomy;
                if l_taxonomy_0 then
                    local v28 = if l_FFlagAXCatalogCategoriesStore_0 then v12() else v11();
                    local v29, v30 = v15.findCategoryIdsByTaxonomy(l_taxonomy_0, v28);
                    if v29 and not l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 then
                        v26.changeCategory(v29, v30);
                    end;
                    return v23;
                end;
            end;
            local v31 = nil;
            if v24.category then
                local v32 = if l_FFlagAXCatalogCategoriesStore_0 then v12() else v11();
                v31 = v15.findCategoryByCategoryId(v24.category, v32);
            else
                local v33 = v26.selectedCategoryId(false);
                v31 = v15.getCategoryId(v33);
            end;
            if v31 == nil then
                return v23;
            else
                local l_Id_0 = v31.Id;
                local v35 = nil;
                if v24.subcategory and v31 and v31.Subcategories then
                    local v36 = nil;
                    v36 = v15.findSubcategoryBySubcategoryId(v24.subcategory, v31.Subcategories);
                    if v36 then
                        v35 = v36.Id;
                    end;
                end;
                if not l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 then
                    v26.changeCategory(l_Id_0, v35);
                end;
                return v23;
            end;
        else
            local v37 = nil;
            v37 = if v24.category then v11()[v24.category] else v15.getCategoryId(v23.categoryId);
            local v38 = v4.Dictionary.join(v23, {
                categoryId = v37.Id, 
                subcategoryId = v4.None
            });
            if v24.subcategory and v37 and v37.Subcategories then
                local v39 = v37.Subcategories[v24.subcategory];
                if v39 then
                    v38 = v4.Dictionary.join(v38, {
                        subcategoryId = v39.Id
                    });
                end;
            end;
            return v38;
        end;
    end
});