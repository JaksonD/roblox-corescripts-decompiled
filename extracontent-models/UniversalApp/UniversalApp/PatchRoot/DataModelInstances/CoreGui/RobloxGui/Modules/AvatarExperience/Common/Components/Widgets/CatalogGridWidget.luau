local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_WidgetListItem_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).WidgetComponents.WidgetListItem;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v8 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.ItemGroupWidget);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.EntryButtonWidget);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.ItemCarouselWidget);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local l_WidgetIxpLayerMap_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Utils.WidgetIxpLayerMap;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableDecreaseWidgetPaddingSizing);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFIntWidgetPaddingSizing);
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStoreImprovePerf;
local v20 = game:DefineFastFlag("AXRemoveEntryButtonWidget", false);
local v21 = {
    [v8.Templates.ItemGroup] = {
        component = v9, 
        horizontalMargin = 15
    }, 
    [v8.Templates.Carousel] = {
        component = v11, 
        horizontalMargin = 15
    }, 
    [v8.Templates.Button] = if v20 then nil else {
        component = v10, 
        horizontalMargin = 15
    }
};
local v36 = v3.forwardRef(function(v22, v23) --[[ Line: 91 ]]
    -- upvalues: v13 (copy), v12 (copy), l_useDesignTokens_0 (copy), v21 (copy), v3 (copy), l_ImpressionEnums_0 (copy), v17 (copy), v18 (copy), l_WidgetListItem_0 (copy), l_WidgetIxpLayerMap_0 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy)
    local l_widgetRow_0 = v22.widgetRow;
    local l_widgetInfo_0 = v22.widgetInfo;
    local l_widgetConfiguration_0 = v22.widgetConfiguration;
    local v27 = v13(v12);
    local v28 = l_useDesignTokens_0();
    if not l_widgetInfo_0 or not l_widgetInfo_0.template or not l_widgetInfo_0.template.type or v21[l_widgetInfo_0.template.type] == nil then
        return nil;
    else
        assert(l_widgetInfo_0.template, "");
        local v29 = v21[l_widgetInfo_0.template.type];
        local l_component_0 = v29.component;
        local l_horizontalMargin_0 = v29.horizontalMargin;
        local v33 = v3.useCallback(function() --[[ Line: 114 ]]
            -- upvalues: v22 (copy), l_ImpressionEnums_0 (ref), v27 (copy)
            if v22.requestWidgetAcquireFocus then
                local l_SEE_ALL_0 = l_ImpressionEnums_0.ActionType.SEE_ALL;
                v27.widgetInteractionV2(v22.widgetAnalyticsInfo, l_SEE_ALL_0);
                v22.requestWidgetAcquireFocus();
            end;
        end, {
            v22.requestWidgetAcquireFocus
        });
        local v34 = nil;
        if v17() then
            local v35 = {
                [32] = v28.Global.Space_400, 
                [24] = v28.Global.Space_300, 
                [20] = v28.Global.Space_250, 
                [16] = v28.Global.Space_200
            };
            v34 = if v35[v18()] == nil then v28.Global.Space_400 else v35[v18()];
        end;
        return v3.createElement(l_WidgetListItem_0, {
            ref = v23, 
            NextSelectionUp = v22.NextSelectionUp, 
            NextSelectionDown = v22.NextSelectionDown, 
            padding = {
                bottom = if v17() then UDim.new(0, v34) else UDim.new(0, v28.Global.Space_400)
            }, 
            horizontalMargin = l_horizontalMargin_0
        }, {
            Widget = v3.createElement(l_component_0, {
                widgetInfo = v22.widgetInfo, 
                itemsPerRow = v22.itemsPerRow, 
                rowHeight = v22.rowHeight, 
                rowCount = v22.rowCount, 
                widgetRow = l_widgetRow_0, 
                widgetAnalyticsInfo = v22.widgetAnalyticsInfo, 
                widgetFocused = v22.widgetFocused, 
                requestWidgetAcquireFocus = v33, 
                requestWidgetReleaseFocus = v22.requestWidgetReleaseFocus, 
                itemDetailsPeekViewRefs = v22.itemDetailsPeekViewRefs, 
                gridRef = v22.gridRef, 
                gamepadNavigationFocusPos = v22.gamepadNavigationFocusPos, 
                setGamepadNavigationFocusPos = v22.setGamepadNavigationFocusPos, 
                itemSize = v22.itemSize, 
                ixpLayerToExpose = l_WidgetIxpLayerMap_0[v22.widgetInfo.type], 
                widgetConfiguration = l_widgetConfiguration_0, 
                rowWidth = v22.rowWidth, 
                onThumbnailLoaded = v22.onThumbnailLoaded, 
                selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v22.selectedCategory else nil, 
                selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v22.selectedSubcategory else nil, 
                selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v22.selectedCategoryInfo else nil
            })
        });
    end;
end);
return (v3.memo(v36));