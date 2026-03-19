local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_FlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).FlatList;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v6.Core.Style.useTextSizeOffset;
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v11 = require(l_Modules_0.LuaApp.Components.EndOfScroll);
local v12 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getItemCountForRow);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Utils.getItemSize);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useRestoreYPositionOnDefocusEffect);
local v19 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useRenderInfo);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useTallTile);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useTallTileV2);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.useTallTileV3);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v25.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreen_0 = v25.Enums.AvatarScreen;
local v28 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v29 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v30 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFStringAXTallTilesThumbnailSize);
local v36 = require(l_Modules_0.AvatarExperience.Experiments.AXHighResolutionTallTilesIXP);
local v37 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v38 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_getAXMarketplaceWidgetStore_0 = v37.Stores.getAXMarketplaceWidgetStore;
local l_getUIScaleFromTokens_0 = v37.Utils.getUIScaleFromTokens;
local l_getBreakpointFromRowWidth_0 = v37.Utils.getBreakpointFromRowWidth;
local l_FFlagAXPassScreenSizeToWidgetApi_0 = v38.FFlagAXPassScreenSizeToWidgetApi;
local l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus;
local v44 = game:DefineFastInt("AXSearchPayloadExperimentPortraitModeMobileThreshold", 210) / 100;
local v45 = game:DefineFastInt("AXSearchPayloadExperimentPortraitModeTabletThreshold", 0) / 100;
local l_FFlagAXMISEnableMultiShopping_0 = v38.FFlagAXMISEnableMultiShopping;
local l_FFlagAXCatalogCategoriesStore_0 = v38.FFlagAXCatalogCategoriesStore;
local l_FFlagAXCatalogCategoriesSDUI_0 = v38.FFlagAXCatalogCategoriesSDUI;
local v49 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local v50 = game:DefineFastFlag("AXFixRowShiftInResultsList", false);
local l_WidgetListHorizontalMargin_0 = v13.WidgetListHorizontalMargin;
local v52 = game:DefineFastInt("AXWidgetListScrollThrottleIntervalMs", 400) / 1000;
local v53 = {
    WINDOW_SIZE = game:DefineFastInt("WidgetListWindowSize", 21), 
    INITIAL_NUM_TO_RENDER = 8, 
    MAX_TO_RENDER_PER_BATCH = 1, 
    UPDATE_CELLS_BATCHING_PERIOD = 30, 
    SCROLL_EVENT_THROTTLE = 0
};
local v54 = {
    BackgroundTransparency = 1, 
    BorderSizePixel = 0
};
local v55 = {
    Selectable = false, 
    BackgroundTransparency = 1, 
    ScrollBarThickness = 0, 
    BorderSizePixel = v50 and 0 or nil, 
    LayoutOrder = 2, 
    ElasticBehavior = Enum.ElasticBehavior.Always, 
    ClipsDescendants = false, 
    AutomaticCanvasSize = Enum.AutomaticSize.Y
};
local l_getUseSelectorDeepEquals_0 = v10.Utils.getUseSelectorDeepEquals;
local l_useAXAnimateScrollFrame_0 = v10.Components.AnimatedScrollingFrame.useAXAnimateScrollFrame;
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local function v71(v59) --[[ Line: 134 ]] --[[ Name: useCreatorNameTileFooterEnabled ]]
    -- upvalues: l_useAvatarRoute_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), v28 (copy), v24 (copy), v29 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v60 = l_useAvatarRoute_0();
    local v61 = v60 and v60.opaque and v60.opaque.name;
    local v70 = v2.useCallback(function(v62) --[[ Line: 138 ]]
        -- upvalues: v61 (copy), l_AvatarScreen_0 (ref), v28 (ref), v24 (ref), v59 (copy), v29 (ref)
        local l_categoryId_0 = v62.AvatarExperience.Catalog.Categories.categoryId;
        local l_subcategoryId_0 = v62.AvatarExperience.Catalog.Categories.subcategoryId;
        local v65 = if v61 == l_AvatarScreen_0.MySharedAvatars then v28.ContextWidgets.MySharedAvatars.Context else if l_categoryId_0 then v24.getContextForWidgetsById(v61, l_categoryId_0, l_subcategoryId_0) else nil;
        local v66 = v62.SearchesParameters[v59];
        local v67 = v66 and v66.searchKeyword ~= nil;
        local v68 = v24.getQueryStringForSearchWidgets(v66);
        local v69 = if v67 then v62.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v68] else if v65 then v62.AvatarExperience.Common.Widgets.ContextWidgetInfo[v65] else v62.AvatarExperience.Common.Widgets.WidgetInfo;
        if v69 then
            return (v29.getCreatorNameTileFooterEnabled(v69.Configuration));
        else
            return false;
        end;
    end, {
        v59, 
        v61
    });
    return l_useSelector_0(v70, l_getUseSelectorDeepEquals_0());
end;
local function v85(v72) --[[ Line: 169 ]] --[[ Name: useCreatorNameTileFooterEnabledV2 ]]
    -- upvalues: v49 (copy), l_useSignalState_0 (copy), l_useAvatarRoute_0 (copy), v2 (copy), l_AvatarScreen_0 (copy), v28 (copy), v24 (copy), v29 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy)
    local v73 = v49.getCatalogSelectionStore();
    local v74 = l_useSignalState_0(v73.selectedCategoryId);
    local v75 = l_useSignalState_0(v73.selectedSubcategoryId);
    local v76 = l_useAvatarRoute_0();
    local v77 = v76 and v76.opaque and v76.opaque.name;
    local v84 = v2.useCallback(function(v78) --[[ Line: 177 ]]
        -- upvalues: v77 (copy), l_AvatarScreen_0 (ref), v28 (ref), v74 (copy), v24 (ref), v75 (copy), v72 (copy), v29 (ref)
        local v79 = if v77 == l_AvatarScreen_0.MySharedAvatars then v28.ContextWidgets.MySharedAvatars.Context else if v74 then v24.getContextForWidgetsById(v77, v74, v75) else nil;
        local v80 = v78.SearchesParameters[v72];
        local v81 = v80 and v80.searchKeyword ~= nil;
        local v82 = v24.getQueryStringForSearchWidgets(v80);
        local v83 = if v81 then v78.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v82] else if v79 then v78.AvatarExperience.Common.Widgets.ContextWidgetInfo[v79] else v78.AvatarExperience.Common.Widgets.WidgetInfo;
        if v83 then
            return (v29.getCreatorNameTileFooterEnabled(v83.Configuration));
        else
            return false;
        end;
    end, {
        v72, 
        v77, 
        v74, 
        v75
    });
    return l_useSelector_0(v84, l_getUseSelectorDeepEquals_0());
end;
local function v87(v86) --[[ Line: 205 ]] --[[ Name: renderItem ]]
    return v86.item.render(v86);
end;
local function v89(v88) --[[ Line: 254 ]]
    return v88.GlobalGuiInset and v88.GlobalGuiInset.bottom or 0;
end;
local function v91(v90) --[[ Line: 258 ]] --[[ Name: selectDeviceOrientation ]]
    return v90.DeviceOrientation;
end;
return function(v92) --[[ Line: 262 ]] --[[ Name: WidgetList ]]
    -- upvalues: l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (copy), l_useFocusGuiObject_0 (copy), v2 (copy), v3 (copy), v19 (copy), v45 (copy), v44 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useSelector_0 (copy), v91 (copy), v89 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (copy), l_getAXMarketplaceWidgetStore_0 (copy), l_useTokens_0 (copy), l_getUIScaleFromTokens_0 (copy), l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v23 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v22 (copy), v21 (copy), l_useAppPolicy_0 (copy), v13 (copy), v35 (copy), v36 (copy), v30 (copy), l_GridMetrics_0 (copy), l_WidgetListHorizontalMargin_0 (copy), v16 (copy), v85 (copy), v71 (copy), v17 (copy), v52 (copy), v18 (copy), v11 (copy), v12 (copy), v20 (copy), l_useAXAnimateScrollFrame_0 (copy), l_getBreakpointFromRowWidth_0 (copy), l_FlatList_0 (copy), v87 (copy), v53 (copy), v54 (copy), v55 (copy)
    local v93 = nil;
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then
        v93 = l_useFocusGuiObject_0();
    end;
    local v94 = v92.gridRef or v2.useRef(nil);
    local v95 = v92.flatListRef or v2.useRef(nil);
    local v96 = v3.useRefCache();
    local v97 = v19.useResponsive();
    local v98 = v19.useOrientation();
    local v99 = false;
    if v97 == v19.BreakpointConfig.Enum.Medium then
        v99 = v98 == v19.BreakpointConfig.Enum.Portrait;
    end;
    local v100 = if v99 then v45 else v44;
    local v101 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 then
        local v102 = l_useSelector_0(v91);
        local v103 = l_useSelector_0(v89);
        if v102 == v19.BreakpointConfig.Enum.Portrait then
            v101 = v103 * 1.5;
        end;
    end;
    local v104, v105 = v2.useState(0);
    local v106 = nil;
    local v107 = nil;
    if l_FFlagAXPassScreenSizeToWidgetApi_0 then
        v106 = l_getAXMarketplaceWidgetStore_0(false).setScreenSize;
        local v108 = l_useTokens_0();
        v107 = l_getUIScaleFromTokens_0(v108);
    end;
    local v109 = l_useStyle_0();
    local l_Theme_0 = v109.Theme;
    local v111 = l_useTextSizeOffset_0();
    local v112 = nil;
    v112 = if l_FFlagAXCatalogCategoriesSDUI_0 then v23(v92.fromSearch) else if l_FFlagAXCatalogCategoriesStore_0 then v22(v92.fromSearch, v92.searchUuid) else v21(v92.searchUuid, if v92.fromSearch then v92.selectedSearchCategoryId else v92.selectedCategoryId, if v92.fromSearch then v92.selectedSearchSubcategoryId else v92.selectedSubcategoryId);
    local v114 = l_useAppPolicy_0(function(v113) --[[ Line: 325 ]]
        return v113.getEnableContinuousLoad();
    end);
    local v115 = if v112 then v13.ItemTileTallAspectRatio else nil;
    local v116 = if v112 then Enum.ScaleType.Crop else nil;
    local v117 = if v112 then v35() else nil;
    if v36.isEnabled() and v112 then
        v117 = if v30.readTestVariable(v36.EnableHighResolutionTallTiles) then v13.CatalogThumbnailTypeToSize.BundleThumbnail._420x420 else v13.CatalogThumbnailTypeToSize.BundleThumbnail._150x150;
    end;
    if v36.isEnabled() then
        v2.useEffect(function() --[[ Line: 342 ]]
            -- upvalues: v112 (ref), v30 (ref), v36 (ref)
            if v112 then
                v30.logExperimentExposure(v36);
            end;
        end, {
            v112
        });
    end;
    local v118 = l_GridMetrics_0.getSmallMetrics(math.max(v104 - l_WidgetListHorizontalMargin_0 * 2, 0), 10);
    local v119 = math.max(v16(v104 - l_WidgetListHorizontalMargin_0 * 2 + 10, v118.itemWidth + 10), 1);
    local v120 = if v112 then v13.ItemTileType.TallCatalogItemTile else v13.ItemTileType.CatalogItemTile;
    local v121 = if l_FFlagAXCatalogCategoriesStore_0 then v85(v92.searchUuid) else v71(v92.searchUuid);
    local v122 = if v112 then v17(v109, v118.itemWidth, v120, v121, v111) else v17(v109, v118.itemWidth, nil, v121, v111);
    local l_v119_0 = v119;
    local v124, v125 = v2.useState(false);
    local v126 = v2.useRef(0);
    local v128 = v2.useCallback(function() --[[ Line: 384 ]]
        -- upvalues: v126 (copy), v52 (ref), v92 (copy), v125 (copy)
        local v127 = os.clock();
        if v127 - v126.current < v52 then
            return;
        else
            v126.current = v127;
            if not v92.focusedWidget and v92.loadMore then
                v125(true);
                v92.loadMore():andThen(function() --[[ Line: 395 ]]
                    -- upvalues: v125 (ref)
                    v125(false);
                end, function() --[[ Line: 397 ]]
                    -- upvalues: v125 (ref)
                    v125(false);
                end);
            end;
            return;
        end;
    end, {
        v92.loadMore, 
        v92.focusedWidget
    });
    local v129 = if not v114 and v92.hasMoreRows then v128 else nil;
    local v131 = v2.useCallback(function() --[[ Line: 407 ]]
        -- upvalues: v95 (copy)
        if v95.current ~= nil then
            local v130 = v95.current:getNativeScrollRef();
            if v130 ~= nil then
                return v130._nativeRef;
            end;
        end;
        return nil;
    end, {});
    local v132 = v2.useCallback(function() --[[ Line: 421 ]]
        -- upvalues: v95 (copy), l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 (ref), v92 (copy), v93 (ref)
        if v95.current then
            v95.current:scrollToOffset({
                offset = 0, 
                animated = true
            });
            if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 and v92.NextSelectionUp then
                v93(v92.NextSelectionUp.current);
            end;
        end;
    end, if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then {
        v92.NextSelectionUp, 
        v93
    } else {});
    local v133 = v2.useRef(0);
    local v135 = v2.useCallback(function(...) --[[ Line: 438 ]]
        -- upvalues: v131 (copy), v133 (copy), v92 (copy)
        local v134 = v131();
        if v134 and v134.current then
            v133.current = v134.current.CanvasPosition.Y;
        end;
        if v92.onWidgetFocusAcquired then
            v92.onWidgetFocusAcquired(...);
        end;
    end, {
        v92.onWidgetFocusAcquired, 
        v131
    });
    v18(v92.searchUuid, v92.focusedWidget, v131, v133);
    local v136, v137 = v2.useState(false);
    local v138 = v131();
    v2.useEffect(function() --[[ Line: 460 ]]
        -- upvalues: v138 (copy), v137 (copy)
        local v139 = nil;
        if v138 and v138.current then
            v139 = v138.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ Line: 463 ]]
                -- upvalues: v138 (ref), v137 (ref)
                if v138 == nil or v138.current == nil then
                    return;
                else
                    v137(v138.current.AbsoluteCanvasSize.Y > v138.current.AbsoluteWindowSize.Y);
                    return;
                end;
            end);
        end;
        return function() --[[ Line: 477 ]]
            -- upvalues: v139 (ref)
            if v139 then
                v139:Disconnect();
            end;
        end;
    end, {
        v138
    });
    local v140 = if v92.shouldCreateEndOfScrollElement then if v136 then v2.createElement(v11, {
        backToTopCallback = v132, 
        bottomPadding = v101
    }) else nil else if v124 then v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 56)
    }, {
        LoadingBar = v2.createElement(v12)
    }) else nil;
    local v142 = v2.useCallback(function(v141) --[[ Line: 503 ]]
        -- upvalues: v92 (copy)
        if v92.onScroll then
            v92.onScroll(v141.CanvasPosition.Y);
        end;
    end, {
        v92.onScroll
    });
    local v143 = v104 - l_WidgetListHorizontalMargin_0 * 2;
    local v144 = v20(v122, v119, l_v119_0, v92.searchUuid, v92.entries, v92.showingEntries, v92.numItemsExpected, v92.fromSearch, v92.topPanelHeight, v92.bottomBarHeight, v92.focusedWidget, v135, v92.onWidgetFocusReleased, v92.hasMoreRows, v92.itemDetailsPeekViewRefs, v96, v94, v92.onFocusGained, v92.requestImpressionsSignal, v131, v115, v116, v117, v129, v143, v92.pillBarVisible);
    if l_FFlagAXScrollingFramesShouldAnimateOnFocus_0 then
        l_useAXAnimateScrollFrame_0((v131()));
    end;
    local v149 = v2.useCallback(function(v145) --[[ Line: 548 ]]
        -- upvalues: v105 (copy), l_FFlagAXPassScreenSizeToWidgetApi_0 (ref), l_WidgetListHorizontalMargin_0 (ref), l_getBreakpointFromRowWidth_0 (ref), v107 (ref), v106 (ref)
        local l_X_0 = v145.AbsoluteSize.X;
        v105(l_X_0);
        if l_FFlagAXPassScreenSizeToWidgetApi_0 then
            local v147 = math.max(l_X_0 - l_WidgetListHorizontalMargin_0 * 2, 0);
            local v148 = l_getBreakpointFromRowWidth_0(v147, v107);
            v106(v148);
        end;
    end, {
        if l_FFlagAXPassScreenSizeToWidgetApi_0 then v106 else nil, 
        if l_FFlagAXPassScreenSizeToWidgetApi_0 then v105 else nil, 
        if l_FFlagAXPassScreenSizeToWidgetApi_0 then v107 else nil
    });
    v2.useEffect(function() --[[ Line: 565 ]]
        -- upvalues: v92 (copy), v119 (ref)
        if v92.onNumItemsPerRowChanged then
            v92.onNumItemsPerRowChanged(v119);
        end;
    end, {
        v92.onNumItemsPerRowChanged, 
        v119
    });
    return v2.createElement(v3.Focusable.Frame, {
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0), 
        ClipsDescendants = true, 
        [v2.Change.AbsoluteSize] = v149, 
        ref = v94, 
        defaultChild = if v92.showingEntries then v96[1] else nil, 
        restorePreviousChildFocus = v92.restorePreviousChildFocus, 
        NextSelectionRight = v92.NextSelectionRight, 
        NextSelectionUp = v92.NextSelectionUp
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_WidgetListHorizontalMargin_0), 
            PaddingRight = UDim.new(0, l_WidgetListHorizontalMargin_0)
        }), 
        WidgetFlatList = v2.createElement(l_FlatList_0, {
            data = v144, 
            renderItem = v87, 
            windowSize = v53.WINDOW_SIZE, 
            initialNumToRender = v53.INITIAL_NUM_TO_RENDER, 
            maxToRenderPerBatch = v53.MAX_TO_RENDER_PER_BATCH, 
            updateCellsBatchingPeriod = v53.UPDATE_CELLS_BATCHING_PERIOD, 
            scrollEventThrottle = v53.SCROLL_EVENT_THROTTLE, 
            UNSTABLE_forceSiblingLayoutUpdate = true, 
            ref = v95, 
            contentContainerStyle = v54, 
            style = v55, 
            onScroll = v142, 
            onEndReachedThreshold = v100, 
            onEndReached = if v114 then v128 else nil, 
            showDefaultLoadingIndicators = true, 
            ListHeaderComponent = v92.listHeaderComponent, 
            ListFooterComponent = v140, 
            scrollEnabled = v92.scrollingEnabled
        })
    });
end;