local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.ItemCarouselWidget);
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStoreImprovePerf;
return function(v8) --[[ Line: 40 ]] --[[ Name: ItemGroupWidget ]]
    -- upvalues: v2 (copy), v6 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy)
    return v2.createElement(v6, {
        LayoutOrder = v8.LayoutOrder, 
        widgetInfo = v8.widgetInfo, 
        itemsPerRow = v8.itemsPerRow, 
        rowCount = v8.rowCount, 
        rowHeight = v8.rowHeight, 
        widgetRow = v8.widgetRow, 
        itemSize = v8.itemSize, 
        widgetAnalyticsInfo = v8.widgetAnalyticsInfo, 
        widgetFocused = v8.widgetFocused, 
        gridRef = v8.gridRef, 
        itemDetailsPeekViewRefs = v8.itemDetailsPeekViewRefs, 
        requestWidgetAcquireFocus = v8.requestWidgetAcquireFocus, 
        getItemMetrics = v8.getItemMetrics, 
        hideItemName = v8.hideItemName, 
        widgetConfiguration = v8.widgetConfiguration, 
        ixpLayerToExpose = v8.ixpLayerToExpose, 
        displayAsItemGroupWidget = true, 
        rowWidth = v8.rowWidth, 
        onThumbnailLoaded = v8.onThumbnailLoaded, 
        selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v8.selectedCategory else nil, 
        selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v8.selectedSubcategory else nil, 
        selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v8.selectedCategoryInfo else nil
    });
end;