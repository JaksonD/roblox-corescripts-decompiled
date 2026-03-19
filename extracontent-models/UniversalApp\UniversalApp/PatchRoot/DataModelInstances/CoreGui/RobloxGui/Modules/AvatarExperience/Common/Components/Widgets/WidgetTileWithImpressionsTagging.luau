local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useImpressionsTagger_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).useImpressionsTagger;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableWidgetsTTI);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v6.FFlagAXCatalogItemCardFooterBackendDriven;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v6.FFlagAXCatalogCategoriesStoreImprovePerf;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getUseSelectorDeepEquals_0 = v9.Utils.getUseSelectorDeepEquals;
local v13 = require(l_CorePackages_0.Packages.RoactGamepad);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_ItemTypeEnum_0 = v9.Enums.ItemTypeEnum;
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
return function(v19) --[[ Line: 59 ]] --[[ Name: WidgetTileWithImpressionsTagging ]]
    -- upvalues: l_useImpressionsTagger_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), v17 (copy), l_AvatarScreen_0 (copy), v2 (copy), v13 (copy), v10 (copy), v14 (copy), v5 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v16 (copy)
    local v20 = v19.refCache[v19.index];
    l_useImpressionsTagger_0(v20, v19.impressionsTag, v19.index);
    local l_contentType_0 = v19.contentType;
    local l_contentId_0 = v19.contentId;
    local l_index_0 = v19.index;
    local l_refCache_0 = v19.refCache;
    local v27 = l_useSelector_0(function(v25) --[[ Line: 68 ]]
        -- upvalues: l_contentType_0 (copy), l_contentId_0 (copy)
        local v26 = v25.AvatarExperience.Common.Widgets.HydratedWidgetData[l_contentType_0];
        if v26 then
            return v26[tostring(l_contentId_0)];
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v28 = v27 and v27.type == l_ItemTypeEnum_0.Look;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v33 = l_useSelector_0(function(v32) --[[ Line: 77 ]]
        return v32.AvatarExperience.AvatarScene.AvatarRoute.opaque.name;
    end, l_getUseSelectorDeepEquals_0());
    local v34 = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v17(v33 == l_AvatarScreen_0.CatalogSearch, v19.selectedCategory, v19.selectedSubcategory, v19.selectedCategoryInfo) else v17(v33 == l_AvatarScreen_0.CatalogSearch);
    v29 = v34.impressionsCategory;
    v30 = v34.impressionsSubcategory;
    v31 = v34.impressionsTaxonomyId;
    return v2.createElement(v13.Focusable.Frame, {
        Size = UDim2.new(v19.size.X, UDim.new()), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ref = l_refCache_0[l_index_0], 
        NextSelectionRight = if l_index_0 < v19.itemsPerRow then l_refCache_0[l_index_0 + 1] else nil, 
        NextSelectionLeft = if l_index_0 > 1 then l_refCache_0[l_index_0 - 1] else nil
    }, {
        WidgetItemTile = v2.createElement(v10, {
            itemId = if v27 then tostring(v27.id) else nil, 
            itemType = if v27 then v27.type else nil, 
            index = v19.index, 
            analyticsItemCountPerPage = v19.analyticsItemCountPerPage, 
            analyticsContext = v14.AnalyticsContext.Catalog, 
            widgetAnalyticsInfo = v19.widgetAnalyticsInfo, 
            itemDetailsPeekViewRefs = v19.itemDetailsPeekViewRefs, 
            resultsListRef = v19.resultsListRef, 
            itemCreatorNamesEnabled = v19.creatorNameFooterEnabled, 
            creatorNameTileFooterEnabled = v19.creatorNameTileFooterEnabled, 
            cardStyle = v19.cardStyle, 
            tileWidth = v19.size.X.Offset, 
            onThumbnailLoaded = if v5() and v19.onThumbnailLoaded then v19.onThumbnailLoaded else nil, 
            isCreatorNameVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v19.isCreatorNameVisible else nil, 
            isTitleVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v19.isTitleVisible else nil, 
            isPriceVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v19.isPriceVisible else nil, 
            lookData = if v28 then v27 else nil, 
            hydratedContent = if not v28 then v27 else nil, 
            tileContentType = v19.tileContentType, 
            thumbailAspectRatio = if v28 then v16.LookTileAspectRatio else nil, 
            thumbnailSize = v28 and "w=300&h=450" or nil, 
            impressionsCategory = v29, 
            impressionsSubcategory = v30, 
            impressionsTaxonomyId = v31
        })
    });
end;