local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useImpressionsTagger_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).useImpressionsTagger;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v5.FFlagAXCatalogItemCardFooterBackendDriven;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v5.FFlagAXCatalogCategoriesStoreImprovePerf;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getUseSelectorDeepEquals_0 = v8.Utils.getUseSelectorDeepEquals;
local v12 = require(l_CorePackages_0.Packages.RoactGamepad);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_ItemTypeEnum_0 = v8.Enums.ItemTypeEnum;
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
return function(v18) --[[ Line: 57 ]] --[[ Name: WidgetTileWithImpressionsTagging ]]
    -- upvalues: l_useImpressionsTagger_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), v16 (copy), l_AvatarScreen_0 (copy), v2 (copy), v12 (copy), v9 (copy), v13 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v15 (copy)
    local v19 = v18.refCache[v18.index];
    l_useImpressionsTagger_0(v19, v18.impressionsTag, v18.index);
    local l_contentType_0 = v18.contentType;
    local l_contentId_0 = v18.contentId;
    local l_index_0 = v18.index;
    local l_refCache_0 = v18.refCache;
    local v26 = l_useSelector_0(function(v24) --[[ Line: 66 ]]
        -- upvalues: l_contentType_0 (copy), l_contentId_0 (copy)
        local v25 = v24.AvatarExperience.Common.Widgets.HydratedWidgetData[l_contentType_0];
        if v25 then
            return v25[tostring(l_contentId_0)];
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v27 = v26 and v26.type == l_ItemTypeEnum_0.Look;
    local v28 = nil;
    local v29 = nil;
    local v30 = nil;
    local v32 = l_useSelector_0(function(v31) --[[ Line: 75 ]]
        return v31.AvatarExperience.AvatarScene.AvatarRoute.opaque.name;
    end, l_getUseSelectorDeepEquals_0());
    local v33 = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v16(v32 == l_AvatarScreen_0.CatalogSearch, v18.selectedCategory, v18.selectedSubcategory, v18.selectedCategoryInfo) else v16(v32 == l_AvatarScreen_0.CatalogSearch);
    v28 = v33.impressionsCategory;
    v29 = v33.impressionsSubcategory;
    v30 = v33.impressionsTaxonomyId;
    return v2.createElement(v12.Focusable.Frame, {
        Size = UDim2.new(v18.size.X, UDim.new()), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ref = l_refCache_0[l_index_0], 
        NextSelectionRight = if l_index_0 < v18.itemsPerRow then l_refCache_0[l_index_0 + 1] else nil, 
        NextSelectionLeft = if l_index_0 > 1 then l_refCache_0[l_index_0 - 1] else nil
    }, {
        WidgetItemTile = v2.createElement(v9, {
            itemId = if v26 then tostring(v26.id) else nil, 
            itemType = if v26 then v26.type else nil, 
            index = v18.index, 
            analyticsItemCountPerPage = v18.analyticsItemCountPerPage, 
            analyticsContext = v13.AnalyticsContext.Catalog, 
            widgetAnalyticsInfo = v18.widgetAnalyticsInfo, 
            itemDetailsPeekViewRefs = v18.itemDetailsPeekViewRefs, 
            resultsListRef = v18.resultsListRef, 
            itemCreatorNamesEnabled = v18.creatorNameFooterEnabled, 
            creatorNameTileFooterEnabled = v18.creatorNameTileFooterEnabled, 
            cardStyle = v18.cardStyle, 
            tileWidth = v18.size.X.Offset, 
            onThumbnailLoaded = if v18.onThumbnailLoaded then v18.onThumbnailLoaded else nil, 
            isCreatorNameVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v18.isCreatorNameVisible else nil, 
            isTitleVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v18.isTitleVisible else nil, 
            isPriceVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v18.isPriceVisible else nil, 
            lookData = if v27 then v26 else nil, 
            hydratedContent = if not v27 then v26 else nil, 
            tileContentType = v18.tileContentType, 
            thumbailAspectRatio = if v27 then v15.LookTileAspectRatio else nil, 
            thumbnailSize = v27 and "w=300&h=450" or nil, 
            impressionsCategory = v28, 
            impressionsSubcategory = v29, 
            impressionsTaxonomyId = v30
        })
    });
end;