local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v5 = require(l_Parent_0.GameTile);
local l_GameTileConstants_0 = v5.GameTileConstants;
local l_getGameTileCollectionItemSize_0 = v5.getGameTileCollectionItemSize;
local _ = require(l_Parent_0.AppCommonLib);
local v9 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v9.usePreferredInput;
local l_useBreakpointXOrSmaller_0 = v9.useBreakpointXOrSmaller;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v13 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v13.CollectionCarousel;
local l_useCollectionLayout_0 = v13.useCollectionLayout;
local v16 = require(l_Parent_0.GameCollections);
local l_useCountdownSubtitleTextBinding_0 = v16.useCountdownSubtitleTextBinding;
local l_useGetGameTileHeight_0 = v16.useGetGameTileHeight;
local l_useRenderGameCollectionItem_0 = v16.useRenderGameCollectionItem;
local l_useGameCollectionLayoutParams_0 = v16.useGameCollectionLayoutParams;
local l_isSeeAllTileEnabled_0 = v16.isSeeAllTileEnabled;
local l_useGameSortHeaderButtonParams_0 = v16.useGameSortHeaderButtonParams;
local l_useIsHoldToPlayEnabledForGames_0 = v16.useIsHoldToPlayEnabledForGames;
local l_WaitForPropWrapper_0 = v16.WaitForPropWrapper;
local v25 = require(l_Parent_0.DiscoveryAnalytics);
local l_useControllerBarFocusNavigationBindings_0 = v16.GameCollectionNavigationBindings.useControllerBarFocusNavigationBindings;
local l_useGameSortAnalytics_0 = v16.useGameSortAnalytics;
local l_GameSortImpressionsDetector_0 = v16.GameSortImpressionsDetector;
local l_useGameSortData_0 = v16.useGameSortData;
local l_useGameSortImpressionsParams_0 = v16.useGameSortImpressionsParams;
local l_useGameSortTooltipParams_0 = v16.useGameSortTooltipParams;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ScrollDetector_0 = require(l_Parent_0.ScrollTelemetry).ScrollDetector;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local l_HoldToPlayLauncher_0 = require(l_Parent_0.HoldToPlay).HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = require(l_Parent_0.HoldToPlay).useHoldToPlayStateAndCallbacks;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_HoverTileCoordinator_0 = require(l_Parent_0.GameTile).HoverTileCoordinator;
local l_useVideoAnalytics_0 = require(l_Parent_0.GameTile).useVideoAnalytics;
local v41 = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v43 = require(l_Modules_0.Personalization.Games.useLoadGamesForSortFromGamesApi);
local v44 = require(l_Modules_0.Personalization.Games.useLoadMoreGames);
local v45 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppHeaderButtonText_0 = v45.FFlagLuaAppHeaderButtonText;
local l_FFlagSearchOmniAutocompletePage_0 = v45.FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = v45.FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagLuaAppHomeGameCarouselRemount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeGameCarouselRemount;
local l_FFlagLuaAppAddTestIdsForGameCollections_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections;
local l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking;
local l_FFlagLuaAppUseFrameBoundsImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local v59 = v3.strictInterface({
    useGridTiles = v3.optional(v3.boolean), 
    gameSortId = v3.string, 
    sortIndex = v3.number, 
    pageContext = v3.string, 
    scrollViewPositionChangedSignal = v3.optional(v3.table), 
    friendFooterEnabled = v3.optional(v3.boolean), 
    playerCountStyle = v3.optional(v3.string), 
    isSponsoredFooterAllowed = v3.optional(v3.boolean), 
    componentType = v3.optional(v3.string), 
    hideSeeAll = v3.optional(v3.boolean), 
    gameTileLayoutType = v3.optional(v3.string), 
    infoText = v3.optional(v3.string), 
    endTimestamp = v3.optional(v3.number), 
    countdownString = v3.optional(v3.string), 
    linkPath = v3.optional(v3.string), 
    subtitleLinkPath = v3.optional(v3.string), 
    gridSupportAllowed = v3.optional(v3.boolean), 
    isHoverSupportEnabled = v3.optional(v3.boolean), 
    startRow = v3.optional(v3.number), 
    playButtonStyle = v3.optional(v3.string), 
    sideMargin = if not l_FFlagLuaAppCompositionAlways_0 then v3.optional(v3.number) else nil, 
    backgroundMuralUrl = v3.optional(v3.string), 
    headerButtonText = if l_FFlagLuaAppHeaderButtonText_0 then v3.optional(v3.string) else nil, 
    shouldHideTileMetadata = v3.optional(v3.boolean), 
    shouldHideTileTitle = v3.optional(v3.boolean), 
    containedTile = v3.optional(v3.boolean), 
    shouldUseFrameBoundsForImpressions = if l_FFlagSearchOmniAutocompletePage_0 then v3.optional(v3.boolean) else nil, 
    layoutOverrides = if l_FFlagSearchOmniAutocompletePage_0 then v3.optional(v3.table) else nil, 
    numUpdatesToDelayImpressions = v3.optional(v3.number), 
    selectionOrderBase = v3.optional(v3.number), 
    defaultContainerSize = v3.optional(v3.Vector2), 
    appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v3.optional(v3.boolean) else nil, 
    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v3.optional(v3.callback) else nil
});
return v2.memo(function(v60) --[[ Line: 145 ]] --[[ Name: GameCollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v59 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v9 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), l_useBreakpointXOrSmaller_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v2 (copy), l_useGameSortData_0 (copy), v43 (copy), v41 (copy), v44 (copy), l_useGameSortAnalytics_0 (copy), l_useGameSortHeaderButtonParams_0 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_useGameSortTooltipParams_0 (copy), l_useGameSortImpressionsParams_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_useVideoAnalytics_0 (copy), l_useIsHoldToPlayEnabledForGames_0 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_useCollectionLayout_0 (copy), l_GameTileConstants_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_isSeeAllTileEnabled_0 (copy), l_useRenderGameCollectionItem_0 (copy), l_AppPage_0 (copy), v25 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_useCountdownSubtitleTextBinding_0 (copy), l_HoverTileCoordinator_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_GameSortImpressionsDetector_0 (copy), l_FFlagLuaAppHomeGameCarouselRemount_0 (copy), l_CollectionCarousel_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), l_WaitForPropWrapper_0 (copy), l_ScrollDetector_0 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v59, v60);
    local v62 = l_useAppPolicy_0(function(v61) --[[ Line: 149 ]]
        return v61.useGridPageLayout();
    end);
    local v63 = l_usePreferredInput_0();
    local v64 = v60.isHoverSupportEnabled and v62 and v63 == v9.Input.Pointer;
    local v65 = v60.gameTileLayoutType or "Narrow";
    local v66 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v60.appCompositionEnabled;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 or l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 then
        local v70 = l_useBreakpointXOrSmaller_0(v9.Keys.Small);
        local v71 = v66 and v65 == "Narrow" and v70;
        v67 = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v71 else nil;
        v68 = if l_FFlagLuaAppNarrowTileHideRating_0 then v71 else nil;
        v69 = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v71 else nil;
    end;
    local v72 = if v66 then l_getGameTileCollectionItemSize_0(v65) else nil;
    local v73, v74 = v2.useState(nil);
    v2.useRef(v73).current = v73;
    local v75 = v2.useRef(nil);
    local v76 = l_useGameSortData_0(v60.gameSortId, v60.pageContext);
    local v77 = v76.gameSortContents and v76.gameSortContents.entries or {};
    local v78 = v43(v60.gameSortId);
    v2.useEffect(function() --[[ Line: 195 ]]
        -- upvalues: v76 (copy), v41 (ref), v78 (copy)
        if v76.sort and v76.sort.dataSource == v41.DataSourceType.ExploreApi then
            v78();
        end;
    end, {
        v60.gameSortId, 
        v76.sort
    });
    local v79 = v44(v76.gameSortContents, v76.sort, v76.gameSortFetchingStatus, v60.pageContext, v76.sortIndex);
    local v80, v81, v82, v83 = l_useGameSortAnalytics_0(v76.sort, v76.isOmni, v60.sortIndex, v60.pageContext, v75, v77, #v77, v60.startRow);
    local v84, v85, v86 = l_useGameSortHeaderButtonParams_0(v82, v76.sort, v76.isOmni, v76.sortIndex, v76.gamesApiSortPageId, v60.gameSortId, v60.pageContext, v60.linkPath, v60.subtitleLinkPath, if l_FFlagLuaAppHeaderButtonText_0 then v60.headerButtonText else nil);
    local v87, v88 = l_useGameSortTooltipParams_0(v76.sort, v76.isOmni, v60.infoText);
    local v89, v90, v91 = l_useGameSortImpressionsParams_0(v76.sort, v76.isOmni, v60.sortIndex, v60.pageContext, v60.useGridTiles, v60.componentType, v76.gamesApiSortPageId, v60.gameSortId, v60.scrollViewPositionChangedSignal, nil, v60.startRow, v77);
    local v92 = ("GameCarousel_%*%*"):format(v60.gameSortId, v60.sortIndex);
    local v93 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        v93 = l_useVideoAnalytics_0(v76.sort, v76.isOmni, v60.pageContext, v60.sortIndex, v77);
    end;
    local v94 = l_useIsHoldToPlayEnabledForGames_0();
    local v95 = l_useHoldToPlayStateAndCallbacks_0();
    local v96 = l_useControllerBarFocusNavigationBindings_0(v84, if v94 then v95.holdToPlayEventHandler else nil);
    v2.useEffect(function() --[[ Line: 269 ]]
        -- upvalues: v96 (copy), v73 (copy)
        if v96 then
            v96(v73);
        end;
    end, {
        v96, 
        v73
    });
    local v97 = if l_FFlagSearchOmniAutocompletePage_0 and v60.layoutOverrides then v60.layoutOverrides else if v62 then nil else {
        sideMargin = v60.sideMargin
    };
    local v98 = l_useGameCollectionLayoutParams_0(v65, v73, false, v97, v60.defaultContainerSize);
    local v99 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v99 = l_useCollectionLayout_0(v72).itemsPerRow;
    end;
    local l_backgroundMuralUrl_0 = v60.backgroundMuralUrl;
    local v101 = v60.shouldHideTileTitle or false;
    local v102 = v60.shouldHideTileMetadata or false;
    local v103 = if v60.containedTile ~= nil then v60.containedTile else v62 and v60.gridSupportAllowed and v60.gameTileLayoutType == "Narrow" or l_backgroundMuralUrl_0 ~= nil and l_backgroundMuralUrl_0 ~= "";
    local v104 = l_GameTileConstants_0.TileTextLines[v65] and l_GameTileConstants_0.TileTextLines[v65].titleTextLines;
    local v105 = l_useTextSizeOffset_0();
    local v106 = l_useGetGameTileHeight_0(v64, v65, v103, v102, v101, v105, nil, v104, if not not l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v68 or v69 else nil);
    local v107 = if l_isSeeAllTileEnabled_0(v60.hideSeeAll, v98.maxTilesToShow, if v66 then v99 else v98.numColumns, #v77, v84) then v98.maxTilesToShow or #v77 + 1 else nil;
    local v108 = nil;
    v108 = if not (v65 == "Narrow") or v60.playerCountStyle then v60.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v109 = l_useRenderGameCollectionItem_0(v108, v60.isSponsoredFooterAllowed, v65, v60.friendFooterEnabled, v60.pageContext == l_AppPage_0.Home, v92, v64, v80, v81, v25.Constants.Context.ExperienceTile, nil, nil, v84, if v76.isOmni and v76.sort then v76.sort.topicId else nil, v107, nil, v60.playButtonStyle, v103, v101, v102, if v94 then v95.onHoldableFocused else nil, if v94 then v95.onHoldableUnfocused else nil, if v94 then v95.shouldDisableHoldable else nil, v105, v104, nil, nil, if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v93 else nil, nil, v60.selectionOrderBase, nil, nil, nil, if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v60.pageContext else nil, nil, nil, nil, nil, nil, nil, nil, nil, if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v60.onTileImageLoaded else nil, if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v67 else nil, if l_FFlagLuaAppNarrowTileHideRating_0 then v68 else nil, if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v69 else nil);
    local v110 = l_useCountdownSubtitleTextBinding_0(v60.endTimestamp, v60.countdownString, v76.sort and v76.sort.subtitle or "");
    local v111 = nil;
    v111 = if v60.endTimestamp and v60.countdownString then v110 else v76.sort and v76.sort.subtitle or nil;
    local v112 = v2.useCallback(function() --[[ Line: 406 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    if not v76.gameSortDataFound then
        return nil;
    else
        local v113 = if l_FFlagSearchOmniAutocompletePage_0 then (l_FFlagLuaAppUseFrameBoundsImpressions_0 or v60.shouldUseFrameBoundsForImpressions) and v2.createElement(l_FrameBoundsImpressionsTracker_0, {
            parentRef = v75, 
            pageContext = v60.pageContext, 
            impressionsTag = v92, 
            scrollViewPositionChangedSignal = v90, 
            sendImpressions = v89, 
            dataUpdatedTimestamp = v76.gameSortContents and v76.gameSortContents.updatedTimestamp or nil
        }) or v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v75, 
            pageContext = v60.pageContext, 
            impressionsTag = v92, 
            scrollViewPositionChangedSignal = v90, 
            sendImpressions = v89, 
            dataUpdatedTimestamp = v76.gameSortContents and v76.gameSortContents.updatedTimestamp or nil
        }) else v2.createElement(l_GameSortImpressionsDetector_0, {
            parentRef = v75, 
            pageContext = v60.pageContext, 
            impressionsTag = v92, 
            scrollViewPositionChangedSignal = v90, 
            sendGameImpressions = v89, 
            dataUpdatedTimestamp = v76.gameSortContents and v76.gameSortContents.updatedTimestamp or nil
        });
        local v114 = if l_FFlagLuaAppHomeGameCarouselRemount_0 and v60.pageContext == l_AppPage_0.Home then ("GameCarousel_%*"):format(v60.gameSortId) else "GameCarousel";
        return v2.createElement(v2.Fragment, nil, {
            [v114] = v2.createElement(l_CollectionCarousel_0, {
                collectionItemSize = if v66 then v72 else nil, 
                title = v76.sort and v76.sort.displayName or "", 
                subtitle = v111, 
                backgroundMuralUrl = l_backgroundMuralUrl_0, 
                onViewableItemsChanged = v91, 
                onChangeCanvasPosition = v91, 
                containerRef = v74, 
                scrollingFrameRef = v75, 
                tooltipInfoText = v88, 
                hideHeaderButton = v60.hideSeeAll, 
                items = v77, 
                onActivateHeader = v84, 
                onActivateSubtitle = if v60.subtitleLinkPath then v86 else nil, 
                onActivateInfoIcon = v87, 
                renderItem = v109, 
                getItemHeight = v106, 
                numColumns = if v66 then nil else v98.numColumns, 
                fractionalItemAmount = if v66 then nil else v98.fractionalItemAmount, 
                columnGap = if v66 then nil else v98.columnGap, 
                sideMargin = if v66 then nil else v98.sideMargin, 
                maxItemsToShow = v98.maxTilesToShow, 
                headerButtonText = v85, 
                thresholdFromEnd = v98.loadMoreThreshold, 
                onReachedThresholdFromEnd = v79, 
                onScrollButtonEnter = v112, 
                enableHoverOverflow = if v66 then v64 else nil, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v60.gameSortId then ("--%*-game-collection-carousel"):format(v60.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v2.createElement(l_WaitForPropWrapper_0, {
                waitForProp = v60.startRow, 
                maxUpdatesToDelay = v60.numUpdatesToDelayImpressions, 
                wrappedComponent = v113
            }), 
            ScrollDetector = v2.createElement(l_ScrollDetector_0, {
                scrollingFrameRef = v75, 
                sendScrollEvent = v83
            }), 
            HoldToPlayLauncher = if v94 and v95.shouldRenderHoldToPlayLauncher then v2.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v95.selectedIndex, 
                selectedEntry = v95.selectedEntry, 
                selectedNavigationUniverseId = v95.selectedNavigationUniverseId, 
                holdState = v95.holdState, 
                holdProgress = v95.holdProgress, 
                cancelHold = v95.cancelHold, 
                launchContext = v25.Constants.Context.HoldToPlayLauncher, 
                referralSource = v60.pageContext, 
                reportExperienceLaunched = v81
            }) else nil
        });
    end;
end);