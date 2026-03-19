local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetCategoryAndSubcategory);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesStore_0 = v4.FFlagAXCatalogCategoriesStore;
local l_FFlagAXEnableTaxonomyM20ExposureLoggingClothing_0 = v4.FFlagAXEnableTaxonomyM20ExposureLoggingClothing;
local l_FFlagAXEnableTaxonomyM21ExposureLoggingClothing_0 = v4.FFlagAXEnableTaxonomyM21ExposureLoggingClothing;
local l_FFlagAXCatalogCategoriesSDUI_0 = v4.FFlagAXCatalogCategoriesSDUI;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v10 = require(l_Modules_0.LuaApp.mutedError);
local l_CatalogCategories_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories;
local l_CatalogSDUICategoryIds_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogSDUICategoryIds;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v15 = game:DefineFastString("AXTaxonomyM20ExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
local v16 = game:DefineFastString("AXTaxonomyM21ExperimentLayerName", l_AppUserLayers_0.AvatarExperienceUAMarketplaceView);
return function(v17, v18, v19) --[[ Line: 31 ]]
    -- upvalues: v2 (copy), l_FFlagAXEnableTaxonomyM20ExposureLoggingClothing_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_CatalogSDUICategoryIds_0 (copy), l_IXPServiceWrapper_0 (copy), v15 (copy), l_CatalogCategories_0 (copy), l_FFlagAXEnableTaxonomyM21ExposureLoggingClothing_0 (copy), v16 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v9 (copy), v10 (copy), v3 (copy)
    return function(v20) --[[ Line: 32 ]]
        -- upvalues: v2 (ref), v17 (copy), v18 (copy), v19 (copy), l_FFlagAXEnableTaxonomyM20ExposureLoggingClothing_0 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), l_CatalogSDUICategoryIds_0 (ref), l_IXPServiceWrapper_0 (ref), v15 (ref), l_CatalogCategories_0 (ref), l_FFlagAXEnableTaxonomyM21ExposureLoggingClothing_0 (ref), v16 (ref), l_FFlagAXCatalogCategoriesStore_0 (ref), v9 (ref), v10 (ref), v3 (ref)
        v2.isTypeOrNil(v17, "string", "SetCategoryAndSubcategory thunk expects category");
        v2.isTypeOrNil(v18, "string", "SetCategoryAndSubcategory thunk expects subcategory");
        v2.isType(v19, "table", "SetCategory thunk expects analytics");
        if l_FFlagAXEnableTaxonomyM20ExposureLoggingClothing_0 then
            if l_FFlagAXCatalogCategoriesSDUI_0 then
                if v17 == l_CatalogSDUICategoryIds_0.Clothing:rawValue() then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v15);
                end;
            elseif v17 == l_CatalogCategories_0.Clothing:rawValue() then
                l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v15);
            end;
        end;
        if l_FFlagAXEnableTaxonomyM21ExposureLoggingClothing_0 then
            if l_FFlagAXCatalogCategoriesSDUI_0 then
                if v17 == l_CatalogSDUICategoryIds_0.Clothing:rawValue() then
                    l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v16);
                end;
            elseif v17 == l_CatalogCategories_0.Clothing:rawValue() then
                l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v16);
            end;
        end;
        if l_FFlagAXCatalogCategoriesStore_0 then
            if not v9.getCatalogSelectionStore().changeCategory(v17, v18) then
                v10("Failed to select subcategory in SetCategoryAndSubcategory thunk");
            end;
        else
            v20:dispatch(v3(v17, v18));
        end;
        local v21 = nil;
        local v22 = nil;
        if l_FFlagAXCatalogCategoriesStore_0 then
            local v23 = v9.getCatalogSelectionStore();
            v21 = v23.selectedCategoryId(false);
            v22 = v23.selectedSubcategoryId(false);
        else
            v21 = v20:getState().AvatarExperience.Catalog.Categories.categoryId;
            v22 = v20:getState().AvatarExperience.Catalog.Categories.subcategoryId;
        end;
        v19.clickNavigationTab(v21, v22);
    end;
end;