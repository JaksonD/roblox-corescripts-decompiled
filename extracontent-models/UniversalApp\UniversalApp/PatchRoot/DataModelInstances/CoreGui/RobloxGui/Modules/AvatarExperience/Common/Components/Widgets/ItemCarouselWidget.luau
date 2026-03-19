local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local l_WidgetHeader_0 = v8.WidgetComponents.WidgetHeader;
local l_WidgetLayout_0 = v8.WidgetComponents.WidgetLayout;
local l_Grid_0 = v8.GridComponents.Grid;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXFixSeeAllSpacing_0 = v12.FFlagAXFixSeeAllSpacing;
local l_FFlagAXLookAndFeelBackgrounds_0 = v12.FFlagAXLookAndFeelBackgrounds;
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v12.FFlagAXCatalogItemCardFooterBackendDriven;
local l_ScrollingAppCarousel_0 = require(l_CorePackages_0.Workspace.Packages.AppBlox).ScrollingAppCarousel;
local v17 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.WidgetTileWithImpressionsTagging);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v20 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v21 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v23 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent);
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.WidgetEventImpressionsReporter);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local v29 = require(l_Modules_0.AvatarExperience.Common.Components.Widgets.WidgetLoadableGridView);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getContentToHyderate);
local v32 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getWidgetTileFooterProps);
local v33 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useImpressionsTagger_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).useImpressionsTagger;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_getFooterVisibilityFromItemFooters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).Utils.getFooterVisibilityFromItemFooters;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v44 = require(l_Modules_0.AvatarExperience.Flags.FIntAXCarouselWidgetMaxItems);
local v45 = game:DefineFastInt("AXCarouselLoadingBuffer", 1);
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAnimatedLooksThumbnails);
local v47 = game:DefineFastFlag("AXCarouselFixMissingAnalytics2", false);
local v48 = game:DefineFastFlag("AXCarouselMoreSeeAllAnalytics", false);
local l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingCarouselWidgetIndexBugfix;
local v50 = game:DefineFastFlag("AXSeeAllTreatmentType", false);
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v12.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v12.FFlagAXCatalogCategoriesStoreImprovePerf;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v12.FFlagAXAddLookTypeEnumForLogging;
local v54 = game:DefineFastInt("AXCarouselPeakFraction", 33);
local v55 = game:DefineFastInt("AXCarouselItemsBasedOnFrameSize", 3);
local v56 = v54 / 100;
local v57 = {
    leftPosition = 28, 
    rightPosition = 15
};
local v58 = {};
local function v79(v59, v60, v61, v62, v63) --[[ Line: 107 ]] --[[ Name: useItemCarouselWidgetViewModel ]]
    -- upvalues: v3 (copy), v17 (copy), l_useDispatch_0 (copy), v33 (copy), v22 (copy), v31 (copy), v21 (copy), v24 (copy), l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 (copy)
    local v64, v65 = v3.useState({
        cardWindowStart = 1, 
        cardWindowIndex = 1
    });
    local v66, v67 = v3.useState(v17.NotStarted);
    local l_widgetInfo_0 = v59.widgetInfo;
    local l_widgetConfiguration_0 = v59.widgetConfiguration;
    local v70 = l_useDispatch_0();
    local v71 = v33(v22);
    local v72 = v59.displayAsItemGroupWidget and not v59.widgetFocused;
    local v73 = v3.useMemo(function() --[[ Line: 127 ]]
        -- upvalues: v72 (copy), l_widgetConfiguration_0 (copy), v31 (ref), l_widgetInfo_0 (copy), v60 (copy), v59 (copy)
        if v72 and l_widgetConfiguration_0 and l_widgetConfiguration_0.customizedDataMap and l_widgetConfiguration_0.customizedDataMap.hydrateOnlyVisibleItems then
            return v31(l_widgetInfo_0, v60, v59.itemsPerRow);
        else
            return v31(l_widgetInfo_0, v60);
        end;
    end, {
        v60, 
        l_widgetInfo_0, 
        v72, 
        v59.itemsPerRow
    });
    v3.useEffect(function() --[[ Line: 147 ]]
        -- upvalues: l_widgetInfo_0 (copy), v21 (ref), v73 (copy), v66 (copy), v17 (ref), v67 (copy), v70 (copy), v24 (ref), v71 (copy)
        if l_widgetInfo_0.type ~= v21.Types.MySharedAvatarsWidget and v73 and #v73 > 0 and v66 == v17.NotStarted then
            v67(v17.Fetching);
            v70(v24(v71, v73, l_widgetInfo_0.id));
        end;
    end, {
        v73, 
        l_widgetInfo_0, 
        v73, 
        v66, 
        v70, 
        v71
    });
    return v64, (v3.useCallback(function(v74) --[[ Line: 159 ]]
        -- upvalues: v62 (copy), v63 (copy), l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 (ref), v64 (copy), v65 (copy), v61 (copy)
        if not v74 then
            return;
        else
            local l_X_0 = v74.CanvasPosition.X;
            local v76 = math.max(1, (math.floor(l_X_0 / ((v62 or 0) + (v63 or 0)))));
            local v77 = nil;
            v77 = if l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 then math.max(0, (math.floor(l_X_0 / ((v62 or 0) + (v63 or 0))))) + 1 else math.max(0, (math.floor(l_X_0 / ((v62 or 0) - (v63 or 0))))) + 1;
            local v78 = true;
            if v76 == v64.cardWindowStart then
                v78 = v77 ~= v64.cardWindowIndex;
            end;
            if v78 then
                v65({
                    cardWindowStart = v76, 
                    cardWindowIndex = v77
                });
                v61.current:fire();
            end;
            return;
        end;
    end, {
        v64, 
        v62, 
        v63, 
        v61
    }));
end;
local function _(v80, v81, v82) --[[ Line: 191 ]] --[[ Name: getItemWidth ]]
    return (math.floor((v80 - (v81 - 1) * v82) / v81));
end;
local function v91(v84, v85, v86, v87) --[[ Line: 197 ]] --[[ Name: useItemCarouselWidgetSizes ]]
    -- upvalues: l_useTokens_0 (copy)
    local l_Medium_0 = l_useTokens_0().Gap.Medium;
    local v89 = v85 + v87;
    local v90 = math.floor((v84 - (v89 - 1) * l_Medium_0) / v89);
    v89 = v86 * v90 + (v86 - 1) * l_Medium_0;
    return {
        itemWidth = v90, 
        itemGap = l_Medium_0, 
        canvasWidth = v89
    };
end;
return function(v92) --[[ Line: 210 ]] --[[ Name: ItemCarouselWidget ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v44 (copy), v55 (copy), v91 (copy), l_FFlagAXFixSeeAllSpacing_0 (copy), v56 (copy), v50 (copy), l_UnifiedEventLogEnums_0 (copy), v33 (copy), v27 (copy), v3 (copy), l_Signal_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v79 (copy), v20 (copy), v32 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), l_getFooterVisibilityFromItemFooters_0 (copy), v47 (copy), v4 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), v18 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), v21 (copy), v46 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), v23 (copy), v45 (copy), l_Grid_0 (copy), l_ScrollingAppCarousel_0 (copy), v57 (copy), l_ScreenSizeImpressionsDetector_0 (copy), v58 (copy), v26 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_WidgetHeader_0 (copy), l_useImpressionsTagger_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogConstants_0 (copy), v48 (copy), l_HttpService_0 (copy), l_WidgetLayout_0 (copy), v29 (copy)
    local v93 = l_useStyle_0();
    local v94 = l_useDesignTokens_0();
    local l_widgetInfo_1 = v92.widgetInfo;
    local v96 = l_widgetInfo_1.content and #l_widgetInfo_1.content or 0;
    local v97 = math.min(v96, v44);
    local v98 = math.min(v96, v92.itemsPerRow * v55 - v55 + 1);
    local v99 = 0;
    local v100 = v91(v92.rowWidth or 0, v92.itemsPerRow, v98, (not not v92.displayAsItemGroupWidget or l_FFlagAXFixSeeAllSpacing_0 and v92.widgetFocused) and 0 or v56);
    local v101 = nil;
    v101 = if v50 then if v92.widgetFocused then l_UnifiedEventLogEnums_0.WidgetUiTreatment.WIDGET_SEE_ALL else if v92.displayAsItemGroupWidget then l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP else l_UnifiedEventLogEnums_0.WidgetUiTreatment.CAROUSEL else if v92.displayAsItemGroupWidget then l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP else l_UnifiedEventLogEnums_0.WidgetUiTreatment.CAROUSEL;
    local l_itemGap_0 = v100.itemGap;
    local l_itemWidth_0 = v100.itemWidth;
    local l_canvasWidth_0 = v100.canvasWidth;
    local v105 = v33(v27);
    local v106 = v3.useRef(l_Signal_0.new());
    local v107 = "WIDGET_CAROUSEL" .. "_" .. v92.widgetInfo.id;
    local l_widgetConfiguration_1 = v92.widgetConfiguration;
    local v109 = l_widgetInfo_1 and l_widgetInfo_1.template and l_widgetInfo_1.template.seeAllButton or v92.widgetFocused;
    local v110 = l_useLocalization_0({
        widgetTitle = if l_widgetInfo_1 and l_widgetInfo_1.template then l_widgetInfo_1.template.title else nil, 
        widgetDescription = if l_widgetInfo_1 and l_widgetInfo_1.template then l_widgetInfo_1.template.description else nil
    });
    local v111 = v5.useRefCache();
    local v113 = l_useSelector_0(function(v112) --[[ Line: 259 ]]
        return v112.AvatarExperience.Common.Widgets.HydratedWidgetData;
    end, l_getUseSelectorDeepEquals_0());
    local v114, v115 = v79(v92, v113, v106, l_itemWidth_0, l_itemGap_0);
    v3.useEffect(function() --[[ Line: 265 ]]
        -- upvalues: v106 (copy)
        v106.current:fire();
    end, {});
    local v116 = v3.useRef(nil);
    v3.useEffect(function() --[[ Line: 275 ]]
        -- upvalues: v116 (copy), v20 (ref), v106 (copy)
        local function v117() --[[ Line: 276 ]] --[[ Name: scheduleNextTimer ]]
            -- upvalues: v116 (ref), v20 (ref), v106 (ref), v117 (copy)
            v116.current = task.delay(v20.ImpressionsDetectionInterval, function() --[[ Line: 277 ]]
                -- upvalues: v106 (ref), v117 (ref)
                v106.current:fire();
                v117();
            end);
        end;
        v116.current = task.delay(v20.ImpressionsDetectionInterval, function() --[[ Line: 277 ]]
            -- upvalues: v106 (ref), v117 (copy)
            v106.current:fire();
            v117();
        end);
        return function() --[[ Line: 285 ]]
            -- upvalues: v116 (ref)
            if v116.current then
                task.cancel(v116.current);
                v116.current = nil;
            end;
        end;
    end, {});
    local v118 = {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_itemGap_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    };
    local v119 = v32(l_widgetInfo_1, l_widgetConfiguration_1);
    local l_creatorNameFooterEnabled_0 = v119.creatorNameFooterEnabled;
    local l_priceFooterEnabled_0 = v119.priceFooterEnabled;
    local l_creatorNameTileFooterEnabled_0 = v119.creatorNameTileFooterEnabled;
    local v123 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then l_getFooterVisibilityFromItemFooters_0(if v92.widgetInfo then v92.widgetInfo.template.itemFooters else nil) else nil;
    local function v127(v124, v125) --[[ Line: 311 ]]
        -- upvalues: v47 (ref), v4 (ref), v92 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), v20 (ref), v113 (copy), l_widgetInfo_1 (copy), v101 (ref), v3 (ref), v18 (ref), l_itemWidth_0 (copy), v99 (ref), l_FFlagAXLookAndFeelBackgrounds_0 (ref), v21 (ref), v111 (copy), l_creatorNameFooterEnabled_0 (ref), l_priceFooterEnabled_0 (copy), l_creatorNameTileFooterEnabled_0 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v123 (copy), v107 (copy), v46 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref)
        local v126 = if v47 then v4.Dictionary.join(v92.widgetAnalyticsInfo, {
            itemPosition = v125, 
            itemId = v124.id, 
            itemType = v124.type, 
            lookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v124.type == v20.ItemType.Look and v113 and v113[v20.ItemType.Look] and v113[v20.ItemType.Look][v124.id] then v113[v20.ItemType.Look][v124.id].lookType else nil, 
            themeId = l_widgetInfo_1.tagId, 
            gridPositionRow = if v92.widgetFocused and v124.gridInformation then v124.gridInformation.row else v92.widgetRow, 
            gridPositionColumn = if v92.widgetFocused and v124.gridInformation then v124.gridInformation.column else v125, 
            uiTreatmentType = v101
        }) else nil;
        return v3.createElement(v18, {
            size = UDim2.new(0, l_itemWidth_0, 0, v99), 
            cardStyle = if l_FFlagAXLookAndFeelBackgrounds_0 then l_widgetInfo_1.template.cardStyle else nil, 
            contentType = v124.type or v21.ContentType.Asset, 
            tileContentType = l_widgetInfo_1.type, 
            contentId = v124.id or "", 
            index = v125, 
            refCache = v111, 
            resultsListRef = v92.gridRef, 
            itemDetailsPeekViewRefs = v92.itemDetailsPeekViewRefs, 
            itemsPerRow = v92.itemsPerRow, 
            hideItemName = v92.hideItemName, 
            analyticsItemCountPerPage = v92.itemsPerRow, 
            creatorNameFooterEnabled = l_creatorNameFooterEnabled_0, 
            priceFooterEnabled = l_priceFooterEnabled_0, 
            creatorNameTileFooterEnabled = l_creatorNameTileFooterEnabled_0, 
            isCreatorNameVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v123.isCreatorNameVisible else nil, 
            isTitleVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v123.isTitleVisible else nil, 
            isPriceVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v123.isPriceVisible else nil, 
            impressionsTag = v107, 
            disable3DRendering = if v46() then v92.widgetFocused else nil, 
            widgetAnalyticsInfo = if v47 then v126 else v4.Dictionary.join(v92.widgetAnalyticsInfo, {
                uiTreatmentType = v101
            }), 
            onThumbnailLoaded = v92.onThumbnailLoaded, 
            selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v92.selectedCategory else nil, 
            selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v92.selectedSubcategory else nil, 
            selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v92.selectedCategoryInfo else nil
        });
    end;
    local v128 = {};
    if v109 then
        for v129 = 1, v97 do
            table.insert(v128, l_widgetInfo_1.content and l_widgetInfo_1.content[v129] or {});
        end;
    end;
    local v130 = if v92.widgetInfo then v23.isLooksWidget(v92.widgetInfo.type) else nil;
    local v131 = 0;
    local l_CatalogItemTile_0 = v20.ItemTileType.CatalogItemTile;
    if v109 then
        v131 = v93.Font.Header2.RelativeSize * v93.Font.BaseSize;
        l_CatalogItemTile_0 = v20.ItemTileType.CatalogItemTile;
        if v130 then
            v131 = v93.Font.SubHeader1.RelativeSize * v93.Font.BaseSize;
            l_CatalogItemTile_0 = v20.ItemTileType.LookItemTile;
        end;
    end;
    local v133 = v23.GridItemHeightGetterWithOptions({
        itemTileType = l_CatalogItemTile_0, 
        fontHeight = v131, 
        hideItemName = v92.hideItemName, 
        itemCreatorNamesEnabled = l_creatorNameTileFooterEnabled_0, 
        itemPriceEnabled = l_priceFooterEnabled_0, 
        isWidgetFocused = v92.widgetFocused
    });
    local v134 = v133(l_itemWidth_0);
    if v130 then
        l_creatorNameFooterEnabled_0 = l_creatorNameFooterEnabled_0 and l_creatorNameTileFooterEnabled_0 or false;
        local v135 = 0;
        if l_priceFooterEnabled_0 then
            v135 = v135 + v94.Global.Size_175;
        end;
        if l_creatorNameFooterEnabled_0 then
            v135 = v135 + v94.Global.Size_175;
        end;
        v134 = v134 + v135;
        v99 = v99 + v135;
    end;
    local v136 = nil;
    v136 = if v92.displayAsItemGroupWidget then math.min(v92.itemsPerRow, v98) else math.min(v98, v114.cardWindowStart + v92.itemsPerRow + v45);
    for v137 = 1, v136 do
        local v138 = l_widgetInfo_1.content and l_widgetInfo_1.content[v137] or {};
        v138.gridInformation = {
            row = 1, 
            column = v137
        };
        table.insert(v118, v127(v138, v137));
    end;
    local v142 = if v92.displayAsItemGroupWidget then v3.createElement(l_Grid_0, {
        itemsPerRow = v92.itemsPerRow, 
        renderItem = function(v139) --[[ Line: 443 ]] --[[ Name: renderItem ]]
            -- upvalues: v127 (copy)
            local l_item_0 = v139.item;
            return v127({
                id = l_item_0.id, 
                type = l_item_0.type, 
                gridInformation = l_item_0.gridInformation
            }, v139.index);
        end, 
        getItemId = function(v141) --[[ Line: 450 ]] --[[ Name: getItemId ]]
            -- upvalues: v92 (copy)
            return v141.id .. v92.itemsPerRow;
        end, 
        items = v4.List.getRange(l_widgetInfo_1.content or {}, 1, (v92.rowCount or 1) * v92.itemsPerRow), 
        gapVertical = l_itemGap_0, 
        gapHorizontal = l_itemGap_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }) else v3.createElement(l_ScrollingAppCarousel_0, {
        items = v118, 
        index = math.max(1, (math.min(v114.cardWindowIndex, v98))), 
        styleProps = v57, 
        itemCount = v98, 
        itemWidth = math.max(1, l_itemWidth_0), 
        itemPadding = l_itemGap_0, 
        carouselMargin = v94.Global.Space_600, 
        carouselHeight = 0, 
        canvasWidth = math.max(1, l_canvasWidth_0), 
        onChangeCanvasPosition = v115, 
        onRefCallback = v115, 
        shouldExpandToFitContentHeight = true
    });
    local v149 = v3.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v106.current, 
        onImpressionsDetected = function(v143) --[[ Line: 476 ]] --[[ Name: onImpressionsDetected ]]
            -- upvalues: v92 (copy), v58 (ref), l_widgetInfo_1 (copy), v47 (ref), v26 (ref), v105 (copy), v4 (ref), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), v20 (ref), v113 (copy), v101 (ref)
            for _, v145 in v143 do
                local v146 = v92.widgetInfo.id .. "_" .. v145;
                if not v58[v146] then
                    local v147 = l_widgetInfo_1.content and l_widgetInfo_1.content[v145] or {};
                    if v47 then
                        v26(v105, v4.Dictionary.join(v92.widgetAnalyticsInfo, {
                            widgetPosition = v92.widgetRow, 
                            widgetId = v92.widgetInfo.id, 
                            itemPosition = v145, 
                            itemId = v147.id, 
                            itemType = v147.type, 
                            lookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v147.type == v20.ItemType.Look and v113 and v113[v20.ItemType.Look] and v113[v20.ItemType.Look][v147.id] then v113[v20.ItemType.Look][v147.id].lookType else nil, 
                            widgetAbsPosition = (v92.widgetRow - 1) * v92.itemsPerRow, 
                            uiTreatmentType = v101
                        }));
                    else
                        local v148 = {
                            widgetPosition = v92.widgetRow, 
                            widgetId = v92.widgetInfo.id, 
                            itemPosition = v145, 
                            itemId = v147.id, 
                            itemType = v147.type, 
                            widgetAbsPosition = (v92.widgetRow - 1) * v92.itemsPerRow, 
                            uiTreatmentType = v101
                        };
                        v26(v105, v148);
                    end;
                    v58[v146] = true;
                end;
            end;
        end, 
        impressionsTag = v107
    });
    local v150 = "";
    local v151 = "";
    if l_widgetInfo_1.template then
        v150 = if l_widgetInfo_1.template.title then v110.widgetTitle else l_widgetInfo_1.template.localizedTitle;
        v151 = if l_widgetInfo_1.template.description then v110.widgetDescription else l_widgetInfo_1.template.localizedDescription;
    end;
    local v152 = nil;
    local v153 = v3.useRef(nil);
    local v154 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then not (v150 or v151) else nil;
    if not v92.widgetFocused and not v154 then
        v152 = v3.createElement(l_WidgetHeader_0, {
            titleText = v150, 
            descriptionText = v151, 
            LayoutOrder = 1, 
            seeAllCallback = if v109 then v92.requestWidgetAcquireFocus else nil, 
            seeAllRef = v153
        });
    end;
    local v155 = v3.useRef(nil);
    l_useImpressionsTagger_0(v155, v21.WidgetExposureMetadata.TagName, v92.widgetRow);
    v3.useEffect(function() --[[ Line: 547 ]]
        -- upvalues: v155 (copy), l_addUnifiedEventLogging_0 (ref), v4 (ref), v92 (copy), l_UnifiedEventLogEnums_0 (ref), v101 (ref), l_widgetInfo_1 (copy), l_UnifiedEventLogConstants_0 (ref), v153 (copy), v48 (ref), l_HttpService_0 (ref), v21 (ref)
        local v156 = v155 and v155.current;
        if v156 then
            l_addUnifiedEventLogging_0(v155, v4.Dictionary.join(v92.widgetAnalyticsInfo, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.WIDGET_IMPRESSION, 
                gridPositionRow = v92.widgetRow, 
                gridPositionColumn = 1, 
                uiTreatmentType = v101, 
                themeId = if l_widgetInfo_1 then l_widgetInfo_1.tagId else nil
            }), {
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
            if v153 and v153.current then
                l_addUnifiedEventLogging_0(v153, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    requestId = if v48 then v92.widgetAnalyticsInfo.requestId else nil, 
                    elementName = "SEE_ALL", 
                    elementMetadata = if v48 then l_HttpService_0:JSONEncode({
                        widget_id = v92.widgetAnalyticsInfo.widgetId, 
                        widget_type = v92.widgetAnalyticsInfo.widgetType, 
                        tag_id = if l_widgetInfo_1 then l_widgetInfo_1.tagId else nil
                    }) else nil, 
                    gridPositionRow = v92.widgetRow, 
                    gridPositionColumn = 1
                }, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
            end;
            if v92.ixpLayerToExpose then
                v156:SetAttribute(v21.WidgetExposureMetadata.AttributeKey, v92.ixpLayerToExpose);
            end;
        end;
    end, {
        v92.ixpLayerToExpose
    });
    return v3.createElement(l_WidgetLayout_0, {
        headerSlot = v152, 
        contentSlot = if v92.widgetFocused then v3.createElement(v29, {
            widgetInfo = v92.widgetInfo, 
            impressionsTag = v107, 
            getItemHeight = v133, 
            items = v128, 
            totalNumItems = v97, 
            renderItem = v127, 
            getItemMetrics = v92.getItemMetrics, 
            itemsPerRow = v92.itemsPerRow
        }) else v3.createElement(v3.Fragment, {}, {
            ["Widget_" .. l_widgetInfo_1.id] = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                ref = v155
            }, v142), 
            ImpressionsDetector = v149
        })
    });
end;