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
local v49 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableWidgetsTTI);
local l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingCarouselWidgetIndexBugfix;
local v51 = game:DefineFastFlag("AXFixWidgetTileImpressions", false);
local l_FFlagAXWidgetTypeAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXWidgetTypeAnalytics;
local l_FFlagAXWidgetImpressionThemeId_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXWidgetImpressionThemeId;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v12.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAXCatalogCategoriesStoreImprovePerf_0 = v12.FFlagAXCatalogCategoriesStoreImprovePerf;
local v56 = game:DefineFastInt("AXCarouselPeakFraction", 33);
local v57 = game:DefineFastInt("AXCarouselItemsBasedOnFrameSize", 3);
local v58 = v56 / 100;
local v59 = {
    leftPosition = 28, 
    rightPosition = 15
};
local v60 = {};
local function v81(v61, v62, v63, v64, v65) --[[ Line: 111 ]] --[[ Name: useItemCarouselWidgetViewModel ]]
    -- upvalues: v3 (copy), v17 (copy), l_useDispatch_0 (copy), v33 (copy), v22 (copy), v31 (copy), v21 (copy), v24 (copy), l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 (copy)
    local v66, v67 = v3.useState({
        cardWindowStart = 1, 
        cardWindowIndex = 1
    });
    local v68, v69 = v3.useState(v17.NotStarted);
    local l_widgetInfo_0 = v61.widgetInfo;
    local l_widgetConfiguration_0 = v61.widgetConfiguration;
    local v72 = l_useDispatch_0();
    local v73 = v33(v22);
    local v74 = v61.displayAsItemGroupWidget and not v61.widgetFocused;
    local v75 = v3.useMemo(function() --[[ Line: 131 ]]
        -- upvalues: v74 (copy), l_widgetConfiguration_0 (copy), v31 (ref), l_widgetInfo_0 (copy), v62 (copy), v61 (copy)
        if v74 and l_widgetConfiguration_0 and l_widgetConfiguration_0.customizedDataMap and l_widgetConfiguration_0.customizedDataMap.hydrateOnlyVisibleItems then
            return v31(l_widgetInfo_0, v62, v61.itemsPerRow);
        else
            return v31(l_widgetInfo_0, v62);
        end;
    end, {
        v62, 
        l_widgetInfo_0, 
        v74, 
        v61.itemsPerRow
    });
    v3.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: l_widgetInfo_0 (copy), v21 (ref), v75 (copy), v68 (copy), v17 (ref), v69 (copy), v72 (copy), v24 (ref), v73 (copy)
        if l_widgetInfo_0.type ~= v21.Types.MySharedAvatarsWidget and v75 and #v75 > 0 and v68 == v17.NotStarted then
            v69(v17.Fetching);
            v72(v24(v73, v75, l_widgetInfo_0.id));
        end;
    end, {
        v75, 
        l_widgetInfo_0, 
        v75, 
        v68, 
        v72, 
        v73
    });
    return v66, (v3.useCallback(function(v76) --[[ Line: 163 ]]
        -- upvalues: v64 (copy), v65 (copy), l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 (ref), v66 (copy), v67 (copy), v63 (copy)
        if not v76 then
            return;
        else
            local l_X_0 = v76.CanvasPosition.X;
            local v78 = math.max(1, (math.floor(l_X_0 / ((v64 or 0) + (v65 or 0)))));
            local v79 = nil;
            v79 = if l_FFlagAXScrollingCarouselWidgetIndexBugfix_0 then math.max(0, (math.floor(l_X_0 / ((v64 or 0) + (v65 or 0))))) + 1 else math.max(0, (math.floor(l_X_0 / ((v64 or 0) - (v65 or 0))))) + 1;
            local v80 = true;
            if v78 == v66.cardWindowStart then
                v80 = v79 ~= v66.cardWindowIndex;
            end;
            if v80 then
                v67({
                    cardWindowStart = v78, 
                    cardWindowIndex = v79
                });
                v63.current:fire();
            end;
            return;
        end;
    end, {
        v66, 
        v64, 
        v65, 
        v63
    }));
end;
local function _(v82, v83, v84) --[[ Line: 195 ]] --[[ Name: getItemWidth ]]
    return (math.floor((v82 - (v83 - 1) * v84) / v83));
end;
local function v93(v86, v87, v88, v89) --[[ Line: 201 ]] --[[ Name: useItemCarouselWidgetSizes ]]
    -- upvalues: l_useTokens_0 (copy)
    local l_Medium_0 = l_useTokens_0().Gap.Medium;
    local v91 = v87 + v89;
    local v92 = math.floor((v86 - (v91 - 1) * l_Medium_0) / v91);
    v91 = v88 * v92 + (v88 - 1) * l_Medium_0;
    return {
        itemWidth = v92, 
        itemGap = l_Medium_0, 
        canvasWidth = v91
    };
end;
return function(v94) --[[ Line: 214 ]] --[[ Name: ItemCarouselWidget ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v44 (copy), v57 (copy), v93 (copy), l_FFlagAXFixSeeAllSpacing_0 (copy), v58 (copy), v33 (copy), v27 (copy), v3 (copy), l_Signal_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v81 (copy), v51 (copy), v20 (copy), v32 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), l_getFooterVisibilityFromItemFooters_0 (copy), v47 (copy), v4 (copy), l_UnifiedEventLogEnums_0 (copy), v18 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy), v21 (copy), v46 (copy), v49 (copy), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (copy), v23 (copy), v45 (copy), l_Grid_0 (copy), l_ScrollingAppCarousel_0 (copy), v59 (copy), l_ScreenSizeImpressionsDetector_0 (copy), v60 (copy), v26 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_WidgetHeader_0 (copy), l_useImpressionsTagger_0 (copy), l_addUnifiedEventLogging_0 (copy), l_FFlagAXWidgetTypeAnalytics_0 (copy), l_FFlagAXWidgetImpressionThemeId_0 (copy), l_UnifiedEventLogConstants_0 (copy), v48 (copy), l_HttpService_0 (copy), l_WidgetLayout_0 (copy), v29 (copy)
    local v95 = l_useStyle_0();
    local v96 = l_useDesignTokens_0();
    local l_widgetInfo_1 = v94.widgetInfo;
    local v98 = l_widgetInfo_1.content and #l_widgetInfo_1.content or 0;
    local v99 = math.min(v98, v44);
    local v100 = math.min(v98, v94.itemsPerRow * v57 - v57 + 1);
    local v101 = 0;
    local v102 = v93(v94.rowWidth or 0, v94.itemsPerRow, v100, (not not v94.displayAsItemGroupWidget or l_FFlagAXFixSeeAllSpacing_0 and v94.widgetFocused) and 0 or v58);
    local l_itemGap_0 = v102.itemGap;
    local l_itemWidth_0 = v102.itemWidth;
    local l_canvasWidth_0 = v102.canvasWidth;
    local v106 = v33(v27);
    local v107 = v3.useRef(l_Signal_0.new());
    local v108 = "WIDGET_CAROUSEL" .. "_" .. v94.widgetInfo.id;
    local l_widgetConfiguration_1 = v94.widgetConfiguration;
    local v110 = l_widgetInfo_1 and l_widgetInfo_1.template and l_widgetInfo_1.template.seeAllButton or v94.widgetFocused;
    local v111 = l_useLocalization_0({
        widgetTitle = if l_widgetInfo_1 and l_widgetInfo_1.template then l_widgetInfo_1.template.title else nil, 
        widgetDescription = if l_widgetInfo_1 and l_widgetInfo_1.template then l_widgetInfo_1.template.description else nil
    });
    local v112 = v5.useRefCache();
    local v114 = l_useSelector_0(function(v113) --[[ Line: 248 ]]
        return v113.AvatarExperience.Common.Widgets.HydratedWidgetData;
    end, l_getUseSelectorDeepEquals_0());
    local v115, v116 = v81(v94, v114, v107, l_itemWidth_0, l_itemGap_0);
    v3.useEffect(function() --[[ Line: 254 ]]
        -- upvalues: v107 (copy)
        v107.current:fire();
    end, {});
    if v51 then
        local v117 = v3.useRef(nil);
        local l_v117_0 = v117 --[[ copy: 23 -> 45 ]];
        v3.useEffect(function() --[[ Line: 266 ]]
            -- upvalues: l_v117_0 (copy), v20 (ref), v107 (copy)
            local function v119() --[[ Line: 267 ]] --[[ Name: scheduleNextTimer ]]
                -- upvalues: l_v117_0 (ref), v20 (ref), v107 (ref), v119 (copy)
                l_v117_0.current = task.delay(v20.ImpressionsDetectionInterval, function() --[[ Line: 268 ]]
                    -- upvalues: v107 (ref), v119 (ref)
                    v107.current:fire();
                    v119();
                end);
            end;
            l_v117_0.current = task.delay(v20.ImpressionsDetectionInterval, function() --[[ Line: 268 ]]
                -- upvalues: v107 (ref), v119 (copy)
                v107.current:fire();
                v119();
            end);
            return function() --[[ Line: 276 ]]
                -- upvalues: l_v117_0 (ref)
                if l_v117_0.current then
                    task.cancel(l_v117_0.current);
                    l_v117_0.current = nil;
                end;
            end;
        end, {});
    end;
    local v120 = {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_itemGap_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        })
    };
    local v121 = v32(l_widgetInfo_1, l_widgetConfiguration_1);
    local l_creatorNameFooterEnabled_0 = v121.creatorNameFooterEnabled;
    local l_priceFooterEnabled_0 = v121.priceFooterEnabled;
    local l_creatorNameTileFooterEnabled_0 = v121.creatorNameTileFooterEnabled;
    local v125 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then l_getFooterVisibilityFromItemFooters_0(if v94.widgetInfo then v94.widgetInfo.template.itemFooters else nil) else nil;
    local function v129(v126, v127) --[[ Line: 302 ]]
        -- upvalues: v47 (ref), v4 (ref), v94 (copy), l_widgetInfo_1 (copy), l_UnifiedEventLogEnums_0 (ref), v3 (ref), v18 (ref), l_itemWidth_0 (copy), v101 (ref), l_FFlagAXLookAndFeelBackgrounds_0 (ref), v21 (ref), v112 (copy), l_creatorNameFooterEnabled_0 (ref), l_priceFooterEnabled_0 (copy), l_creatorNameTileFooterEnabled_0 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v125 (copy), v108 (copy), v46 (ref), v49 (ref), l_FFlagAXCatalogCategoriesStoreImprovePerf_0 (ref)
        local v128 = if v47 then v4.Dictionary.join(v94.widgetAnalyticsInfo, {
            itemPosition = v127, 
            itemId = v126.id, 
            itemType = v126.type, 
            themeId = l_widgetInfo_1.tagId, 
            gridPositionRow = if v94.widgetFocused and v126.gridInformation then v126.gridInformation.row else v94.widgetRow, 
            gridPositionColumn = if v94.widgetFocused and v126.gridInformation then v126.gridInformation.column else v127, 
            uiTreatmentType = if v94.displayAsItemGroupWidget then l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP else l_UnifiedEventLogEnums_0.WidgetUiTreatment.CAROUSEL
        }) else nil;
        return v3.createElement(v18, {
            size = UDim2.new(0, l_itemWidth_0, 0, v101), 
            cardStyle = if l_FFlagAXLookAndFeelBackgrounds_0 then l_widgetInfo_1.template.cardStyle else nil, 
            contentType = v126.type or v21.ContentType.Asset, 
            tileContentType = l_widgetInfo_1.type, 
            contentId = v126.id or "", 
            index = v127, 
            refCache = v112, 
            resultsListRef = v94.gridRef, 
            itemDetailsPeekViewRefs = v94.itemDetailsPeekViewRefs, 
            itemsPerRow = v94.itemsPerRow, 
            hideItemName = v94.hideItemName, 
            analyticsItemCountPerPage = v94.itemsPerRow, 
            creatorNameFooterEnabled = l_creatorNameFooterEnabled_0, 
            priceFooterEnabled = l_priceFooterEnabled_0, 
            creatorNameTileFooterEnabled = l_creatorNameTileFooterEnabled_0, 
            isCreatorNameVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v125.isCreatorNameVisible else nil, 
            isTitleVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v125.isTitleVisible else nil, 
            isPriceVisible = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then v125.isPriceVisible else nil, 
            impressionsTag = v108, 
            disable3DRendering = if v46() then v94.widgetFocused else nil, 
            widgetAnalyticsInfo = if v47 then v128 else v4.Dictionary.join(v94.widgetAnalyticsInfo, {
                uiTreatmentType = if v94.displayAsItemGroupWidget then l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP else l_UnifiedEventLogEnums_0.WidgetUiTreatment.CAROUSEL
            }), 
            onThumbnailLoaded = if v49() then v94.onThumbnailLoaded else nil, 
            selectedCategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v94.selectedCategory else nil, 
            selectedSubcategory = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v94.selectedSubcategory else nil, 
            selectedCategoryInfo = if l_FFlagAXCatalogCategoriesStoreImprovePerf_0 then v94.selectedCategoryInfo else nil
        });
    end;
    local v130 = {};
    if v110 then
        for v131 = 1, v99 do
            table.insert(v130, l_widgetInfo_1.content and l_widgetInfo_1.content[v131] or {});
        end;
    end;
    local v132 = if v94.widgetInfo then v23.isLooksWidget(v94.widgetInfo.type) else nil;
    local v133 = 0;
    local l_CatalogItemTile_0 = v20.ItemTileType.CatalogItemTile;
    if v110 then
        v133 = v95.Font.Header2.RelativeSize * v95.Font.BaseSize;
        l_CatalogItemTile_0 = v20.ItemTileType.CatalogItemTile;
        if v132 then
            v133 = v95.Font.SubHeader1.RelativeSize * v95.Font.BaseSize;
            l_CatalogItemTile_0 = v20.ItemTileType.LookItemTile;
        end;
    end;
    local v135 = v23.GridItemHeightGetterWithOptions({
        itemTileType = l_CatalogItemTile_0, 
        fontHeight = v133, 
        hideItemName = v94.hideItemName, 
        itemCreatorNamesEnabled = l_creatorNameTileFooterEnabled_0, 
        itemPriceEnabled = l_priceFooterEnabled_0, 
        isWidgetFocused = v94.widgetFocused
    });
    local v136 = v135(l_itemWidth_0);
    if v132 then
        l_creatorNameFooterEnabled_0 = l_creatorNameFooterEnabled_0 and l_creatorNameTileFooterEnabled_0 or false;
        local v137 = 0;
        if l_priceFooterEnabled_0 then
            v137 = v137 + v96.Global.Size_175;
        end;
        if l_creatorNameFooterEnabled_0 then
            v137 = v137 + v96.Global.Size_175;
        end;
        v136 = v136 + v137;
        v101 = v101 + v137;
    end;
    local v138 = nil;
    v138 = if v94.displayAsItemGroupWidget then math.min(v94.itemsPerRow, v100) else math.min(v100, v115.cardWindowStart + v94.itemsPerRow + v45);
    for v139 = 1, v138 do
        local v140 = l_widgetInfo_1.content and l_widgetInfo_1.content[v139] or {};
        v140.gridInformation = {
            row = 1, 
            column = v139
        };
        table.insert(v120, v129(v140, v139));
    end;
    local v144 = if v94.displayAsItemGroupWidget then v3.createElement(l_Grid_0, {
        itemsPerRow = v94.itemsPerRow, 
        renderItem = function(v141) --[[ Line: 431 ]] --[[ Name: renderItem ]]
            -- upvalues: v129 (copy)
            local l_item_0 = v141.item;
            return v129({
                id = l_item_0.id, 
                type = l_item_0.type, 
                gridInformation = l_item_0.gridInformation
            }, v141.index);
        end, 
        getItemId = function(v143) --[[ Line: 438 ]] --[[ Name: getItemId ]]
            -- upvalues: v94 (copy)
            return v143.id .. v94.itemsPerRow;
        end, 
        items = v4.List.getRange(l_widgetInfo_1.content or {}, 1, (v94.rowCount or 1) * v94.itemsPerRow), 
        gapVertical = l_itemGap_0, 
        gapHorizontal = l_itemGap_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }) else v3.createElement(l_ScrollingAppCarousel_0, {
        items = v120, 
        index = math.max(1, (math.min(v115.cardWindowIndex, v100))), 
        styleProps = v59, 
        itemCount = v100, 
        itemWidth = math.max(1, l_itemWidth_0), 
        itemPadding = l_itemGap_0, 
        carouselMargin = v96.Global.Space_600, 
        carouselHeight = 0, 
        canvasWidth = math.max(1, l_canvasWidth_0), 
        onChangeCanvasPosition = v116, 
        onRefCallback = v116, 
        shouldExpandToFitContentHeight = true
    });
    local v151 = v3.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v107.current, 
        onImpressionsDetected = function(v145) --[[ Line: 464 ]] --[[ Name: onImpressionsDetected ]]
            -- upvalues: v94 (copy), v60 (ref), l_widgetInfo_1 (copy), v47 (ref), v26 (ref), v106 (copy), v4 (ref), l_UnifiedEventLogEnums_0 (ref)
            for _, v147 in v145 do
                local v148 = v94.widgetInfo.id .. "_" .. v147;
                if not v60[v148] then
                    local v149 = l_widgetInfo_1.content and l_widgetInfo_1.content[v147] or {};
                    if v47 then
                        v26(v106, v4.Dictionary.join(v94.widgetAnalyticsInfo, {
                            widgetPosition = v94.widgetRow, 
                            widgetId = v94.widgetInfo.id, 
                            itemPosition = v147, 
                            itemId = v149.id, 
                            itemType = v149.type, 
                            widgetAbsPosition = (v94.widgetRow - 1) * v94.itemsPerRow, 
                            uiTreatmentType = if v94.displayAsItemGroupWidget then l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP else l_UnifiedEventLogEnums_0.WidgetUiTreatment.CAROUSEL
                        }));
                    else
                        local v150 = {
                            widgetPosition = v94.widgetRow, 
                            widgetId = v94.widgetInfo.id, 
                            itemPosition = v147, 
                            itemId = v149.id, 
                            itemType = v149.type, 
                            widgetAbsPosition = (v94.widgetRow - 1) * v94.itemsPerRow, 
                            uiTreatmentType = if v94.displayAsItemGroupWidget then l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP else l_UnifiedEventLogEnums_0.WidgetUiTreatment.CAROUSEL
                        };
                        v26(v106, v150);
                    end;
                    v60[v148] = true;
                end;
            end;
        end, 
        impressionsTag = v108
    });
    local v152 = "";
    local v153 = "";
    if l_widgetInfo_1.template then
        v152 = if l_widgetInfo_1.template.title then v111.widgetTitle else l_widgetInfo_1.template.localizedTitle;
        v153 = if l_widgetInfo_1.template.description then v111.widgetDescription else l_widgetInfo_1.template.localizedDescription;
    end;
    local v154 = nil;
    local v155 = v3.useRef(nil);
    local v156 = if l_FFlagAXMoveAllTabToWidgetOnly_0 then not (v152 or v153) else nil;
    if not v94.widgetFocused and not v156 then
        v154 = v3.createElement(l_WidgetHeader_0, {
            titleText = v152, 
            descriptionText = v153, 
            LayoutOrder = 1, 
            seeAllCallback = if v110 then v94.requestWidgetAcquireFocus else nil, 
            seeAllRef = v155
        });
    end;
    local v157 = v3.useRef(nil);
    l_useImpressionsTagger_0(v157, v21.WidgetExposureMetadata.TagName, v94.widgetRow);
    v3.useEffect(function() --[[ Line: 532 ]]
        -- upvalues: v157 (copy), l_addUnifiedEventLogging_0 (ref), v4 (ref), v94 (copy), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXWidgetTypeAnalytics_0 (ref), l_FFlagAXWidgetImpressionThemeId_0 (ref), l_widgetInfo_1 (copy), l_UnifiedEventLogConstants_0 (ref), v155 (copy), v48 (ref), l_HttpService_0 (ref), v21 (ref)
        local v158 = v157 and v157.current;
        if v158 then
            l_addUnifiedEventLogging_0(v157, v4.Dictionary.join(v94.widgetAnalyticsInfo, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.WIDGET_IMPRESSION, 
                gridPositionRow = v94.widgetRow, 
                gridPositionColumn = 1, 
                uiTreatmentType = if l_FFlagAXWidgetTypeAnalytics_0 and v94.displayAsItemGroupWidget then l_UnifiedEventLogEnums_0.WidgetUiTreatment.ITEM_GROUP else l_UnifiedEventLogEnums_0.WidgetUiTreatment.CAROUSEL, 
                themeId = if l_FFlagAXWidgetImpressionThemeId_0 and l_widgetInfo_1 then l_widgetInfo_1.tagId else nil
            }), {
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
            if v155 and v155.current then
                l_addUnifiedEventLogging_0(v155, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    requestId = if v48 then v94.widgetAnalyticsInfo.requestId else nil, 
                    elementName = "SEE_ALL", 
                    elementMetadata = if v48 then l_HttpService_0:JSONEncode({
                        widget_id = v94.widgetAnalyticsInfo.widgetId, 
                        widget_type = v94.widgetAnalyticsInfo.widgetType, 
                        tag_id = if l_widgetInfo_1 then l_widgetInfo_1.tagId else nil
                    }) else nil, 
                    gridPositionRow = v94.widgetRow, 
                    gridPositionColumn = 1
                }, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
            end;
            if v94.ixpLayerToExpose then
                v158:SetAttribute(v21.WidgetExposureMetadata.AttributeKey, v94.ixpLayerToExpose);
            end;
        end;
    end, {
        v94.ixpLayerToExpose
    });
    return v3.createElement(l_WidgetLayout_0, {
        headerSlot = v154, 
        contentSlot = if v94.widgetFocused then v3.createElement(v29, {
            widgetInfo = v94.widgetInfo, 
            impressionsTag = v108, 
            getItemHeight = v135, 
            items = v130, 
            totalNumItems = v99, 
            renderItem = v129, 
            getItemMetrics = v94.getItemMetrics, 
            itemsPerRow = v94.itemsPerRow
        }) else v3.createElement(v3.Fragment, {}, {
            ["Widget_" .. l_widgetInfo_1.id] = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                ref = v157
            }, v144), 
            ImpressionsDetector = v151
        })
    });
end;