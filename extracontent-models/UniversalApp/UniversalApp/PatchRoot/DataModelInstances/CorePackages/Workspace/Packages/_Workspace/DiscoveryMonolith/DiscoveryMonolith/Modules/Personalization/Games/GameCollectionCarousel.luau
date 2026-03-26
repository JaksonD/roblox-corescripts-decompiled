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
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v12 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v12.CollectionCarousel;
local l_useCollectionLayout_0 = v12.useCollectionLayout;
local v15 = require(l_Parent_0.GameCollections);
local l_useCountdownSubtitleTextBinding_0 = v15.useCountdownSubtitleTextBinding;
local l_useGetGameTileHeight_0 = v15.useGetGameTileHeight;
local l_useRenderGameCollectionItem_0 = v15.useRenderGameCollectionItem;
local l_useGameCollectionLayoutParams_0 = v15.useGameCollectionLayoutParams;
local l_isSeeAllTileEnabled_0 = v15.isSeeAllTileEnabled;
local l_useGameSortHeaderButtonParams_0 = v15.useGameSortHeaderButtonParams;
local l_useIsHoldToPlayEnabledForGames_0 = v15.useIsHoldToPlayEnabledForGames;
local l_WaitForPropWrapper_0 = v15.WaitForPropWrapper;
local v24 = require(l_Parent_0.DiscoveryAnalytics);
local l_useControllerBarFocusNavigationBindings_0 = v15.GameCollectionNavigationBindings.useControllerBarFocusNavigationBindings;
local l_useGameSortAnalytics_0 = v15.useGameSortAnalytics;
local l_GameSortImpressionsDetector_0 = v15.GameSortImpressionsDetector;
local l_useGameSortData_0 = v15.useGameSortData;
local l_useGameSortImpressionsParams_0 = v15.useGameSortImpressionsParams;
local l_useGameSortTooltipParams_0 = v15.useGameSortTooltipParams;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ScrollDetector_0 = require(l_Parent_0.ScrollTelemetry).ScrollDetector;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local l_HoldToPlayLauncher_0 = require(l_Parent_0.HoldToPlay).HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = require(l_Parent_0.HoldToPlay).useHoldToPlayStateAndCallbacks;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_HoverTileCoordinator_0 = require(l_Parent_0.GameTile).HoverTileCoordinator;
local l_useVideoAnalytics_0 = require(l_Parent_0.GameTile).useVideoAnalytics;
local v40 = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v42 = require(l_Modules_0.Personalization.Games.useLoadGamesForSortFromGamesApi);
local v43 = require(l_Modules_0.Personalization.Games.useLoadMoreGames);
local v44 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppHeaderButtonText_0 = v44.FFlagLuaAppHeaderButtonText;
local l_FFlagSearchOmniAutocompletePage_0 = v44.FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = v44.FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagLuaAppHomeGameCarouselRemount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeGameCarouselRemount;
local l_FFlagLuaAppAddTestIdsForGameCollections_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections;
local l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking;
local l_FFlagLuaAppUseFrameBoundsImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local v55 = v3.strictInterface({
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
return v2.memo(function(v56) --[[ Line: 141 ]] --[[ Name: GameCollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v55 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v9 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v2 (copy), l_useGameSortData_0 (copy), v42 (copy), v40 (copy), v43 (copy), l_useGameSortAnalytics_0 (copy), l_useGameSortHeaderButtonParams_0 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_useGameSortTooltipParams_0 (copy), l_useGameSortImpressionsParams_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_useVideoAnalytics_0 (copy), l_useIsHoldToPlayEnabledForGames_0 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_useCollectionLayout_0 (copy), l_GameTileConstants_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_isSeeAllTileEnabled_0 (copy), l_useRenderGameCollectionItem_0 (copy), l_AppPage_0 (copy), v24 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_useCountdownSubtitleTextBinding_0 (copy), l_HoverTileCoordinator_0 (copy), l_FFlagLuaAppUseFrameBoundsImpressions_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_GameSortImpressionsDetector_0 (copy), l_FFlagLuaAppHomeGameCarouselRemount_0 (copy), l_CollectionCarousel_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), l_WaitForPropWrapper_0 (copy), l_ScrollDetector_0 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v55, v56);
    local v58 = l_useAppPolicy_0(function(v57) --[[ Line: 145 ]]
        return v57.useGridPageLayout();
    end);
    local v59 = l_usePreferredInput_0();
    local v60 = v56.isHoverSupportEnabled and v58 and v59 == v9.Input.Pointer;
    local v61 = v56.gameTileLayoutType or "Narrow";
    local v62 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v56.appCompositionEnabled;
    local v63 = if v62 then l_getGameTileCollectionItemSize_0(v61) else nil;
    local v64, v65 = v2.useState(nil);
    v2.useRef(v64).current = v64;
    local v66 = v2.useRef(nil);
    local v67 = l_useGameSortData_0(v56.gameSortId, v56.pageContext);
    local v68 = v67.gameSortContents and v67.gameSortContents.entries or {};
    local v69 = v42(v56.gameSortId);
    v2.useEffect(function() --[[ Line: 175 ]]
        -- upvalues: v67 (copy), v40 (ref), v69 (copy)
        if v67.sort and v67.sort.dataSource == v40.DataSourceType.ExploreApi then
            v69();
        end;
    end, {
        v56.gameSortId, 
        v67.sort
    });
    local v70 = v43(v67.gameSortContents, v67.sort, v67.gameSortFetchingStatus, v56.pageContext, v67.sortIndex);
    local v71, v72, v73, v74 = l_useGameSortAnalytics_0(v67.sort, v67.isOmni, v56.sortIndex, v56.pageContext, v66, v68, #v68, v56.startRow);
    local v75, v76, v77 = l_useGameSortHeaderButtonParams_0(v73, v67.sort, v67.isOmni, v67.sortIndex, v67.gamesApiSortPageId, v56.gameSortId, v56.pageContext, v56.linkPath, v56.subtitleLinkPath, if l_FFlagLuaAppHeaderButtonText_0 then v56.headerButtonText else nil);
    local v78, v79 = l_useGameSortTooltipParams_0(v67.sort, v67.isOmni, v56.infoText);
    local v80, v81, v82 = l_useGameSortImpressionsParams_0(v67.sort, v67.isOmni, v56.sortIndex, v56.pageContext, v56.useGridTiles, v56.componentType, v67.gamesApiSortPageId, v56.gameSortId, v56.scrollViewPositionChangedSignal, nil, v56.startRow, v68);
    local v83 = ("GameCarousel_%*%*"):format(v56.gameSortId, v56.sortIndex);
    local v84 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        v84 = l_useVideoAnalytics_0(v67.sort, v67.isOmni, v56.pageContext, v56.sortIndex, v68);
    end;
    local v85 = l_useIsHoldToPlayEnabledForGames_0();
    local v86 = l_useHoldToPlayStateAndCallbacks_0();
    local v87 = l_useControllerBarFocusNavigationBindings_0(v75, if v85 then v86.holdToPlayEventHandler else nil);
    v2.useEffect(function() --[[ Line: 249 ]]
        -- upvalues: v87 (copy), v64 (copy)
        if v87 then
            v87(v64);
        end;
    end, {
        v87, 
        v64
    });
    local v88 = if l_FFlagSearchOmniAutocompletePage_0 and v56.layoutOverrides then v56.layoutOverrides else if v58 then nil else {
        sideMargin = v56.sideMargin
    };
    local v89 = l_useGameCollectionLayoutParams_0(v61, v64, false, v88, v56.defaultContainerSize);
    local v90 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v90 = l_useCollectionLayout_0(v63).itemsPerRow;
    end;
    local l_backgroundMuralUrl_0 = v56.backgroundMuralUrl;
    local v92 = v56.shouldHideTileTitle or false;
    local v93 = v56.shouldHideTileMetadata or false;
    local v94 = if v56.containedTile ~= nil then v56.containedTile else v58 and v56.gridSupportAllowed and v56.gameTileLayoutType == "Narrow" or l_backgroundMuralUrl_0 ~= nil and l_backgroundMuralUrl_0 ~= "";
    local v95 = l_GameTileConstants_0.TileTextLines[v61] and l_GameTileConstants_0.TileTextLines[v61].titleTextLines;
    local v96 = l_useTextSizeOffset_0();
    local v97 = l_useGetGameTileHeight_0(v60, v61, v94, v93, v92, v96, nil, v95);
    local v98 = if l_isSeeAllTileEnabled_0(v56.hideSeeAll, v89.maxTilesToShow, if v62 then v90 else v89.numColumns, #v68, v75) then v89.maxTilesToShow or #v68 + 1 else nil;
    local v99 = nil;
    v99 = if not (v61 == "Narrow") or v56.playerCountStyle then v56.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v100 = l_useRenderGameCollectionItem_0(v99, v56.isSponsoredFooterAllowed, v61, v56.friendFooterEnabled, v56.pageContext == l_AppPage_0.Home, v83, v60, v71, v72, v24.Constants.Context.ExperienceTile, nil, nil, v75, if v67.isOmni and v67.sort then v67.sort.topicId else nil, v98, nil, v56.playButtonStyle, v94, v92, v93, if v85 then v86.onHoldableFocused else nil, if v85 then v86.onHoldableUnfocused else nil, if v85 then v86.shouldDisableHoldable else nil, v96, v95, nil, nil, if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v84 else nil, nil, v56.selectionOrderBase, nil, nil, nil, if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v56.pageContext else nil, nil, nil, nil, nil, nil, nil, nil, nil, if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v56.onTileImageLoaded else nil);
    local v101 = l_useCountdownSubtitleTextBinding_0(v56.endTimestamp, v56.countdownString, v67.sort and v67.sort.subtitle or "");
    local v102 = nil;
    v102 = if v56.endTimestamp and v56.countdownString then v101 else v67.sort and v67.sort.subtitle or nil;
    local v103 = v2.useCallback(function() --[[ Line: 380 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    if not v67.gameSortDataFound then
        return nil;
    else
        local v104 = if l_FFlagSearchOmniAutocompletePage_0 then (l_FFlagLuaAppUseFrameBoundsImpressions_0 or v56.shouldUseFrameBoundsForImpressions) and v2.createElement(l_FrameBoundsImpressionsTracker_0, {
            parentRef = v66, 
            pageContext = v56.pageContext, 
            impressionsTag = v83, 
            scrollViewPositionChangedSignal = v81, 
            sendImpressions = v80, 
            dataUpdatedTimestamp = v67.gameSortContents and v67.gameSortContents.updatedTimestamp or nil
        }) or v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v66, 
            pageContext = v56.pageContext, 
            impressionsTag = v83, 
            scrollViewPositionChangedSignal = v81, 
            sendImpressions = v80, 
            dataUpdatedTimestamp = v67.gameSortContents and v67.gameSortContents.updatedTimestamp or nil
        }) else v2.createElement(l_GameSortImpressionsDetector_0, {
            parentRef = v66, 
            pageContext = v56.pageContext, 
            impressionsTag = v83, 
            scrollViewPositionChangedSignal = v81, 
            sendGameImpressions = v80, 
            dataUpdatedTimestamp = v67.gameSortContents and v67.gameSortContents.updatedTimestamp or nil
        });
        local v105 = if l_FFlagLuaAppHomeGameCarouselRemount_0 and v56.pageContext == l_AppPage_0.Home then ("GameCarousel_%*"):format(v56.gameSortId) else "GameCarousel";
        return v2.createElement(v2.Fragment, nil, {
            [v105] = v2.createElement(l_CollectionCarousel_0, {
                collectionItemSize = if v62 then v63 else nil, 
                title = v67.sort and v67.sort.displayName or "", 
                subtitle = v102, 
                backgroundMuralUrl = l_backgroundMuralUrl_0, 
                onViewableItemsChanged = v82, 
                onChangeCanvasPosition = v82, 
                containerRef = v65, 
                scrollingFrameRef = v66, 
                tooltipInfoText = v79, 
                hideHeaderButton = v56.hideSeeAll, 
                items = v68, 
                onActivateHeader = v75, 
                onActivateSubtitle = if v56.subtitleLinkPath then v77 else nil, 
                onActivateInfoIcon = v78, 
                renderItem = v100, 
                getItemHeight = v97, 
                numColumns = if v62 then nil else v89.numColumns, 
                fractionalItemAmount = if v62 then nil else v89.fractionalItemAmount, 
                columnGap = if v62 then nil else v89.columnGap, 
                sideMargin = if v62 then nil else v89.sideMargin, 
                maxItemsToShow = v89.maxTilesToShow, 
                headerButtonText = v76, 
                thresholdFromEnd = v89.loadMoreThreshold, 
                onReachedThresholdFromEnd = v70, 
                onScrollButtonEnter = v103, 
                enableHoverOverflow = if v62 then v60 else nil, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v56.gameSortId then ("--%*-game-collection-carousel"):format(v56.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v2.createElement(l_WaitForPropWrapper_0, {
                waitForProp = v56.startRow, 
                maxUpdatesToDelay = v56.numUpdatesToDelayImpressions, 
                wrappedComponent = v104
            }), 
            ScrollDetector = v2.createElement(l_ScrollDetector_0, {
                scrollingFrameRef = v66, 
                sendScrollEvent = v74
            }), 
            HoldToPlayLauncher = if v85 and v86.shouldRenderHoldToPlayLauncher then v2.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v86.selectedIndex, 
                selectedEntry = v86.selectedEntry, 
                selectedNavigationUniverseId = v86.selectedNavigationUniverseId, 
                holdState = v86.holdState, 
                holdProgress = v86.holdProgress, 
                cancelHold = v86.cancelHold, 
                launchContext = v24.Constants.Context.HoldToPlayLauncher, 
                referralSource = v56.pageContext, 
                reportExperienceLaunched = v72
            }) else nil
        });
    end;
end);