local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v2.FFlagAXCatalogCategoriesStore;
local l_FFlagAXHandleTaxonomyIdsDeepLinks_0 = v2.FFlagAXHandleTaxonomyIdsDeepLinks;
local l_FFlagAXCatalogCategoriesSDUILinks_0 = v2.FFlagAXCatalogCategoriesSDUILinks;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategoriesFromStore);
return function(v11) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), l_FFlagAXCatalogCategoriesSDUILinks_0 (copy), v8 (copy), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (copy), v10 (copy), v9 (copy), v7 (copy)
    return function(v12) --[[ Line: 18 ]]
        -- upvalues: v6 (ref), v11 (copy), l_FFlagAXCatalogCategoriesStore_0 (ref), l_FFlagAXCatalogCategoriesSDUILinks_0 (ref), v8 (ref), l_FFlagAXHandleTaxonomyIdsDeepLinks_0 (ref), v10 (ref), v9 (ref), v7 (ref)
        v12:dispatch(v6(v11));
        if not l_FFlagAXCatalogCategoriesStore_0 then
            return;
        elseif l_FFlagAXCatalogCategoriesSDUILinks_0 and not v8.getCatalogCategoriesStore().getHasFetchedCategories(false) then
            return;
        else
            local v13 = v8.getCatalogSelectionStore();
            if l_FFlagAXHandleTaxonomyIdsDeepLinks_0 then
                local l_taxonomy_0 = v11.taxonomy;
                if l_taxonomy_0 then
                    local v15 = if l_FFlagAXCatalogCategoriesStore_0 then v10() else v9();
                    local v16, v17 = v7.findCategoryIdsByTaxonomy(l_taxonomy_0, v15);
                    if v16 then
                        v13.changeCategory(v16, v17);
                    end;
                    return;
                end;
            end;
            local v18 = nil;
            if v11.category then
                local v19 = if l_FFlagAXCatalogCategoriesStore_0 then v10() else v9();
                v18 = v7.findCategoryByCategoryId(v11.category, v19);
            else
                local v20 = v13.selectedCategoryId(false);
                v18 = v7.getCategoryId(v20);
            end;
            if v18 == nil then
                return;
            else
                local l_Id_0 = v18.Id;
                local v22 = nil;
                if v11.subcategory and v18 and v18.Subcategories then
                    local v23 = v7.findSubcategoryBySubcategoryId(v11.subcategory, v18.Subcategories);
                    if v23 then
                        v22 = v23.Id;
                    end;
                end;
                v13.changeCategory(l_Id_0, v22);
                return;
            end;
        end;
    end;
end;