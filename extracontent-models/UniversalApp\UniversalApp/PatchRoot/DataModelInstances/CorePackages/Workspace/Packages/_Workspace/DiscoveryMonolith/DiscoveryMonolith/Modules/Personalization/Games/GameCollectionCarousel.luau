local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local _ = require(l_Parent_0.AppCommonLib);
local v7 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v7.usePreferredInput;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local v11 = require(l_Parent_0.GameCollections);
local l_useCountdownSubtitleTextBinding_0 = v11.useCountdownSubtitleTextBinding;
local l_useGetGameTileHeight_0 = v11.useGetGameTileHeight;
local l_useRenderGameCollectionItem_0 = v11.useRenderGameCollectionItem;
local l_useGameCollectionLayoutParams_0 = v11.useGameCollectionLayoutParams;
local l_isSeeAllTileEnabled_0 = v11.isSeeAllTileEnabled;
local l_useGameSortHeaderButtonParams_0 = v11.useGameSortHeaderButtonParams;
local l_useIsHoldToPlayEnabledForGames_0 = v11.useIsHoldToPlayEnabledForGames;
local l_WaitForPropWrapper_0 = v11.WaitForPropWrapper;
local v20 = require(l_Parent_0.DiscoveryAnalytics);
local l_useControllerBarFocusNavigationBindings_0 = v11.GameCollectionNavigationBindings.useControllerBarFocusNavigationBindings;
local l_useGameSortAnalytics_0 = v11.useGameSortAnalytics;
local l_GameSortImpressionsDetector_0 = v11.GameSortImpressionsDetector;
local l_useGameSortData_0 = v11.useGameSortData;
local l_useGameSortImpressionsParams_0 = v11.useGameSortImpressionsParams;
local l_useGameSortTooltipParams_0 = v11.useGameSortTooltipParams;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ScrollDetector_0 = require(l_Parent_0.ScrollTelemetry).ScrollDetector;
local l_FrameBoundsImpressionsTracker_0 = require(l_Parent_0.Impressions).FrameBoundsImpressionsTracker;
local l_ScreenSizeImpressionsTracker_0 = require(l_Parent_0.Impressions).ScreenSizeImpressionsTracker;
local l_HoldToPlayLauncher_0 = require(l_Parent_0.HoldToPlay).HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = require(l_Parent_0.HoldToPlay).useHoldToPlayStateAndCallbacks;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_HoverTileCoordinator_0 = require(l_Parent_0.GameTile).HoverTileCoordinator;
local l_useVideoAnalytics_0 = require(l_Parent_0.GameTile).useVideoAnalytics;
local v36 = require(l_Parent_0.DiscoveryTypes);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v38 = require(l_Modules_0.Personalization.Games.useLoadGamesForSortFromGamesApi);
local v39 = require(l_Modules_0.Personalization.Games.useLoadMoreGames);
local v40 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppHeaderButtonText_0 = v40.FFlagLuaAppHeaderButtonText;
local l_FFlagSearchOmniAutocompletePage_0 = v40.FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = v40.FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagLuaAppHomeGameCarouselRemount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeGameCarouselRemount;
local l_FFlagLuaAppAddTestIdsForGameCollections_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections;
local l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTileVideoDeviceMemoryBlocking;
local v47 = v3.strictInterface({
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
    sideMargin = v3.optional(v3.number), 
    backgroundMuralUrl = v3.optional(v3.string), 
    headerButtonText = if l_FFlagLuaAppHeaderButtonText_0 then v3.optional(v3.string) else nil, 
    shouldHideTileMetadata = v3.optional(v3.boolean), 
    shouldHideTileTitle = v3.optional(v3.boolean), 
    containedTile = v3.optional(v3.boolean), 
    shouldUseFrameBoundsForImpressions = if l_FFlagSearchOmniAutocompletePage_0 then v3.optional(v3.boolean) else nil, 
    layoutOverrides = if l_FFlagSearchOmniAutocompletePage_0 then v3.optional(v3.table) else nil, 
    numUpdatesToDelayImpressions = v3.optional(v3.number), 
    selectionOrderBase = v3.optional(v3.number), 
    defaultContainerSize = v3.optional(v3.Vector2)
});
return v2.memo(function(v48) --[[ Line: 130 ]] --[[ Name: GameCollectionCarousel ]]
    -- upvalues: l_validateProps_0 (copy), v47 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v7 (copy), v2 (copy), l_useGameSortData_0 (copy), v38 (copy), v36 (copy), v39 (copy), l_useGameSortAnalytics_0 (copy), l_useGameSortHeaderButtonParams_0 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_useGameSortTooltipParams_0 (copy), l_useGameSortImpressionsParams_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_useVideoAnalytics_0 (copy), l_useIsHoldToPlayEnabledForGames_0 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_GameTileConstants_0 (copy), l_useTextSizeOffset_0 (copy), l_useGetGameTileHeight_0 (copy), l_isSeeAllTileEnabled_0 (copy), l_useRenderGameCollectionItem_0 (copy), l_AppPage_0 (copy), v20 (copy), l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 (copy), l_useCountdownSubtitleTextBinding_0 (copy), l_HoverTileCoordinator_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy), l_GameSortImpressionsDetector_0 (copy), l_FFlagLuaAppHomeGameCarouselRemount_0 (copy), l_CollectionCarousel_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), l_WaitForPropWrapper_0 (copy), l_ScrollDetector_0 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v47, v48);
    local v50 = l_useAppPolicy_0(function(v49) --[[ Line: 134 ]]
        return v49.useGridPageLayout();
    end);
    local v51 = l_usePreferredInput_0();
    local v52 = v48.isHoverSupportEnabled and v50 and v51 == v7.Input.Pointer;
    local v53 = v48.gameTileLayoutType or "Narrow";
    local v54, v55 = v2.useState(nil);
    v2.useRef(v54).current = v54;
    local v56 = v2.useRef(nil);
    local v57 = l_useGameSortData_0(v48.gameSortId, v48.pageContext);
    local v58 = v57.gameSortContents and v57.gameSortContents.entries or {};
    local v59 = v38(v48.gameSortId);
    v2.useEffect(function() --[[ Line: 159 ]]
        -- upvalues: v57 (copy), v36 (ref), v59 (copy)
        if v57.sort and v57.sort.dataSource == v36.DataSourceType.ExploreApi then
            v59();
        end;
    end, {
        v48.gameSortId, 
        v57.sort
    });
    local v60 = v39(v57.gameSortContents, v57.sort, v57.gameSortFetchingStatus, v48.pageContext, v57.sortIndex);
    local v61, v62, v63, v64 = l_useGameSortAnalytics_0(v57.sort, v57.isOmni, v48.sortIndex, v48.pageContext, v56, v58, #v58, v48.startRow);
    local v65, v66, v67 = l_useGameSortHeaderButtonParams_0(v63, v57.sort, v57.isOmni, v57.sortIndex, v57.gamesApiSortPageId, v48.gameSortId, v48.pageContext, v48.linkPath, v48.subtitleLinkPath, if l_FFlagLuaAppHeaderButtonText_0 then v48.headerButtonText else nil);
    local v68, v69 = l_useGameSortTooltipParams_0(v57.sort, v57.isOmni, v48.infoText);
    local v70, v71, v72 = l_useGameSortImpressionsParams_0(v57.sort, v57.isOmni, v48.sortIndex, v48.pageContext, v48.useGridTiles, v48.componentType, v57.gamesApiSortPageId, v48.gameSortId, v48.scrollViewPositionChangedSignal, nil, v48.startRow, v58);
    local v73 = ("GameCarousel_%*%*"):format(v48.gameSortId, v48.sortIndex);
    local v74 = nil;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
        v74 = l_useVideoAnalytics_0(v57.sort, v57.isOmni, v48.pageContext, v48.sortIndex, v58);
    end;
    local v75 = l_useIsHoldToPlayEnabledForGames_0();
    local v76 = l_useHoldToPlayStateAndCallbacks_0();
    local v77 = l_useControllerBarFocusNavigationBindings_0(v65, if v75 then v76.holdToPlayEventHandler else nil);
    v2.useEffect(function() --[[ Line: 233 ]]
        -- upvalues: v77 (copy), v54 (copy)
        if v77 then
            v77(v54);
        end;
    end, {
        v77, 
        v54
    });
    local v78 = if l_FFlagSearchOmniAutocompletePage_0 and v48.layoutOverrides then v48.layoutOverrides else if v50 then nil else {
        sideMargin = v48.sideMargin
    };
    local v79 = l_useGameCollectionLayoutParams_0(v53, v54, false, v78, v48.defaultContainerSize);
    local l_backgroundMuralUrl_0 = v48.backgroundMuralUrl;
    local v81 = v48.shouldHideTileTitle or false;
    local v82 = v48.shouldHideTileMetadata or false;
    local v83 = if v48.containedTile ~= nil then v48.containedTile else v50 and v48.gridSupportAllowed and v48.gameTileLayoutType == "Narrow" or l_backgroundMuralUrl_0 ~= nil and l_backgroundMuralUrl_0 ~= "";
    local v84 = l_GameTileConstants_0.TileTextLines[v53] and l_GameTileConstants_0.TileTextLines[v53].titleTextLines;
    local v85 = l_useTextSizeOffset_0();
    local v86 = l_useGetGameTileHeight_0(v52, v53, v83, v82, v81, v85, nil, v84);
    local v87 = if l_isSeeAllTileEnabled_0(v48.hideSeeAll, v79.maxTilesToShow, v79.numColumns, #v58, v65) then v79.maxTilesToShow or #v58 + 1 else nil;
    local v88 = nil;
    v88 = if not (v53 == "Narrow") or v48.playerCountStyle then v48.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v89 = l_useRenderGameCollectionItem_0(v88, v48.isSponsoredFooterAllowed, v53, v48.friendFooterEnabled, v48.pageContext == l_AppPage_0.Home, v73, v52, v61, v62, v20.Constants.Context.ExperienceTile, nil, nil, v65, if v57.isOmni and v57.sort then v57.sort.topicId else nil, v87, nil, v48.playButtonStyle, v83, v81, v82, if v75 then v76.onHoldableFocused else nil, if v75 then v76.onHoldableUnfocused else nil, if v75 then v76.shouldDisableHoldable else nil, v85, v84, nil, nil, if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v74 else nil, nil, v48.selectionOrderBase, nil, nil, nil, if l_FFlagLuaAppTileVideoDeviceMemoryBlocking_0 then v48.pageContext else nil);
    local v90 = l_useCountdownSubtitleTextBinding_0(v48.endTimestamp, v48.countdownString, v57.sort and v57.sort.subtitle or "");
    local v91 = nil;
    v91 = if v48.endTimestamp and v48.countdownString then v90 else v57.sort and v57.sort.subtitle or nil;
    local v92 = v2.useCallback(function() --[[ Line: 348 ]]
        -- upvalues: l_HoverTileCoordinator_0 (ref)
        l_HoverTileCoordinator_0.default:reset();
    end, {});
    if not v57.gameSortDataFound then
        return nil;
    else
        local v93 = if l_FFlagSearchOmniAutocompletePage_0 then v48.shouldUseFrameBoundsForImpressions and v2.createElement(l_FrameBoundsImpressionsTracker_0, {
            parentRef = v56, 
            pageContext = v48.pageContext, 
            impressionsTag = v73, 
            scrollViewPositionChangedSignal = v71, 
            sendImpressions = v70, 
            dataUpdatedTimestamp = v57.gameSortContents and v57.gameSortContents.updatedTimestamp or nil
        }) or v2.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v56, 
            pageContext = v48.pageContext, 
            impressionsTag = v73, 
            scrollViewPositionChangedSignal = v71, 
            sendImpressions = v70, 
            dataUpdatedTimestamp = v57.gameSortContents and v57.gameSortContents.updatedTimestamp or nil
        }) else v2.createElement(l_GameSortImpressionsDetector_0, {
            parentRef = v56, 
            pageContext = v48.pageContext, 
            impressionsTag = v73, 
            scrollViewPositionChangedSignal = v71, 
            sendGameImpressions = v70, 
            dataUpdatedTimestamp = v57.gameSortContents and v57.gameSortContents.updatedTimestamp or nil
        });
        local v94 = if l_FFlagLuaAppHomeGameCarouselRemount_0 and v48.pageContext == l_AppPage_0.Home then ("GameCarousel_%*"):format(v48.gameSortId) else "GameCarousel";
        return v2.createElement(v2.Fragment, nil, {
            [v94] = v2.createElement(l_CollectionCarousel_0, {
                title = v57.sort and v57.sort.displayName or "", 
                subtitle = v91, 
                backgroundMuralUrl = l_backgroundMuralUrl_0, 
                onViewableItemsChanged = v72, 
                onChangeCanvasPosition = v72, 
                containerRef = v55, 
                scrollingFrameRef = v56, 
                tooltipInfoText = v69, 
                hideHeaderButton = v48.hideSeeAll, 
                items = v58, 
                onActivateHeader = v65, 
                onActivateSubtitle = if v48.subtitleLinkPath then v67 else nil, 
                onActivateInfoIcon = v68, 
                renderItem = v89, 
                getItemHeight = v86, 
                numColumns = v79.numColumns, 
                fractionalItemAmount = v79.fractionalItemAmount, 
                columnGap = v79.columnGap, 
                sideMargin = v79.sideMargin, 
                maxItemsToShow = v79.maxTilesToShow, 
                headerButtonText = v66, 
                thresholdFromEnd = v79.loadMoreThreshold, 
                onReachedThresholdFromEnd = v60, 
                onScrollButtonEnter = v92, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v48.gameSortId then ("--%*-game-collection-carousel"):format(v48.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v2.createElement(l_WaitForPropWrapper_0, {
                waitForProp = v48.startRow, 
                maxUpdatesToDelay = v48.numUpdatesToDelayImpressions, 
                wrappedComponent = v93
            }), 
            ScrollDetector = v2.createElement(l_ScrollDetector_0, {
                scrollingFrameRef = v56, 
                sendScrollEvent = v64
            }), 
            HoldToPlayLauncher = if v75 and v76.shouldRenderHoldToPlayLauncher then v2.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v76.selectedIndex, 
                selectedEntry = v76.selectedEntry, 
                selectedNavigationUniverseId = v76.selectedNavigationUniverseId, 
                holdState = v76.holdState, 
                holdProgress = v76.holdProgress, 
                cancelHold = v76.cancelHold, 
                launchContext = v20.Constants.Context.HoldToPlayLauncher, 
                referralSource = v48.pageContext, 
                reportExperienceLaunched = v62
            }) else nil
        });
    end;
end);