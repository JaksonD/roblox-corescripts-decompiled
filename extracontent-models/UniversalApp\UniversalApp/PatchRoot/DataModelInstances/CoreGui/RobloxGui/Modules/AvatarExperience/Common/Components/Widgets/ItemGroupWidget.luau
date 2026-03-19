local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.ItemCarouselWidget);
local v7 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableWidgetsTTI);
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStoreImprovePerf;
return function(v9) --[[ Line: 41 ]] --[[ Name: ItemGroupWidget ]]
    -- upvalues: v2 (copy), v6 (copy), v7 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy)
    return v2.createElement(v6, {
        LayoutOrder = v9.LayoutOrder, 
        widgetInfo = v9.widgetInfo, 
        itemsPerRow = v9.itemsPerRow, 
        rowCount = v9.rowCount, 
        rowHeight = v9.rowHeight, 
        widgetRow = v9.widgetRow, 
        itemSize = v9.itemSize, 
        widgetAnalyticsInfo = v9.widgetAnalyticsInfo, 
        widgetFocused = v9.widgetFocused, 
        gridRef = v9.gridRef, 
        itemDetailsPeekViewRefs = v9.itemDetailsPeekViewRefs, 
        requestWidgetAcquireFocus = v9.requestWidgetAcquireFocus, 
        getItemMetrics = v9.getItemMetrics, 
        hideItemName = v9.hideItemName, 
        widgetConfiguration = v9.widgetConfiguration, 
        ixpLayerToExpose = v9.ixpLayerToExpose, 
        displayAsItemGroupWidget = true, 
        rowWidth = v9.rowWidth, 
        onThumbnailLoaded = if v7() then v9.onThumbnailLoaded else nil, 
        selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v9.selectedCategory else nil, 
        selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v9.selectedSubcategory else nil, 
        selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v9.selectedCategoryInfo else nil
    });
end;