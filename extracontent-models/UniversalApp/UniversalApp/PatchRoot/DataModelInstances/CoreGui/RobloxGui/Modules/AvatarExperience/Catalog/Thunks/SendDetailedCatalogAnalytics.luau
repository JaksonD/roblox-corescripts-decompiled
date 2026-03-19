local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_FFlagAXCatalogCategoriesStore_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStore;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
return function(v8, v9, v10, v11, v12, v13, v14) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), v5 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v7 (copy), v4 (copy), v2 (copy)
    return function(v15) --[[ Line: 15 ]]
        -- upvalues: v8 (copy), v3 (ref), v5 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), v7 (ref), v4 (ref), v10 (copy), v11 (copy), v2 (ref), v12 (copy), v13 (copy), v9 (copy), v14 (copy)
        local v16 = v15:getState();
        local l_detail_0 = v16.AvatarExperience.AvatarScene.AvatarRoute.opaque.params.detail;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        local v21 = nil;
        if v8 ~= v3.AnalyticsContext.ItemDetailsRecommendedItem then
            v20 = v16.Search.SearchesInCatalog[l_detail_0];
            if v8 == v3.AnalyticsContext.CatalogSearch then
                v5.isNotNil(v20, "searchInCatalog");
                v18 = v16.AvatarExperience.Catalog.SearchCategories.categoryId;
                v19 = v16.AvatarExperience.Catalog.SearchCategories.subcategoryId;
            elseif l_FFlagAXCatalogCategoriesStore_0 then
                local v22 = v7.getCatalogSelectionStore();
                v18 = v22.selectedCategoryId(false);
                v19 = v22.selectedSubcategoryId(false);
            else
                v18 = v16.AvatarExperience.Catalog.Categories.categoryId;
                v19 = v16.AvatarExperience.Catalog.Categories.subcategoryId;
            end;
            local v23 = v4(v16.AvatarExperience.Common, v10, v11);
            v21 = v2.GetItemSubType(v11, v23);
        end;
        local l_RequestId_0 = v16.AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
        local l_AnalyticsMetadata_0 = v16.AvatarExperience.AnalyticsMetadata;
        local v26 = {
            keyword = v20 and v20.keyword
        };
        local v27 = math.ceil(v12 / v13);
        v9(v8, v27, v18, v19, nil, v26, v12, v10, v11, v21, v14, l_RequestId_0, l_AnalyticsMetadata_0);
    end;
end;