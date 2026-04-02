local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_useControllerBarFocusNavigationBindings_0 = require(l_script_FirstAncestor_0.GameCollectionNavigationBindings).useControllerBarFocusNavigationBindings;
local v2 = require(l_script_FirstAncestor_0.useGetGameTileHeight);
local v3 = require(l_script_FirstAncestor_0.useIsHoldToPlayEnabledForGames);
local v4 = require(l_script_FirstAncestor_0.useRenderGameCollectionItem);
local v5 = require(l_script_FirstAncestor_0.useGameCollectionLayoutParams);
local v6 = require(l_script_FirstAncestor_0.useGameSortAnalytics);
local v7 = require(l_script_FirstAncestor_0.Impressions.GameSortImpressionsDetector);
local v8 = require(l_script_FirstAncestor_0.useGameSortData);
local v9 = require(l_script_FirstAncestor_0.Impressions.useGameSortImpressionsParams);
local v10 = require(l_script_FirstAncestor_0.useGameSortTooltipParams);
local v11 = require(l_script_FirstAncestor_0.Impressions.WaitForPropWrapper);
local v12 = require(l_script_FirstAncestor_0.useSizeAdjustedEntries);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v14 = require(l_Parent_0.React);
local v15 = require(l_Parent_0.SignalsReact);
local v16 = require(l_Parent_0.t);
local l_validateProps_0 = require(l_Parent_0.DiscoveryUtils).validateProps;
local v18 = require(l_Parent_0.GameTile);
local l_getGameTileCollectionItemSize_0 = v18.getGameTileCollectionItemSize;
local l_getGameTileHiddenStore_0 = v18.getGameTileHiddenStore;
local l_GameTileConstants_0 = v18.GameTileConstants;
local _ = require(l_Parent_0.AppCommonLib);
local v23 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v23.usePreferredInput;
local l_useBreakpointXOrSmaller_0 = v23.useBreakpointXOrSmaller;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local l_useCollectionLayout_0 = require(l_Parent_0.CollectionViews).useCollectionLayout;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v30 = require(l_Parent_0.DiscoveryAnalytics);
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local v32 = require(l_Parent_0.HoldToPlay);
local l_HoldToPlayLauncher_0 = v32.HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = v32.useHoldToPlayStateAndCallbacks;
local _ = require(l_Parent_0.DiscoveryTypes);
local v36 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.CollectionViews);
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppAddTestIdsForGameCollections_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGameSortAnalyticFromSearch;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local v51 = v16.strictInterface({
    entries = v16.optional(v16.table), 
    title = v16.optional(v16.string), 
    headerComponent = v16.optional(v16.table), 
    verticalScrollingFrameRef = v16.table, 
    maxNumRows = v16.optional(v16.number), 
    useGridTiles = v16.optional(v16.boolean), 
    gameSortId = v16.string, 
    sortIndex = v16.number, 
    pageContext = v16.string, 
    scrollViewPositionChangedSignal = v16.optional(v16.table), 
    friendFooterEnabled = v16.optional(v16.boolean), 
    playerCountStyle = v16.optional(v16.string), 
    isSponsoredFooterAllowed = v16.optional(v16.boolean), 
    componentType = v16.optional(v16.string), 
    gameTileLayoutType = v16.optional(v16.string), 
    infoText = v16.optional(v16.string), 
    linkPath = v16.optional(v16.string), 
    gridSupportAllowed = v16.optional(v16.boolean), 
    isHoverSupportEnabled = v16.optional(v16.boolean), 
    onItemsPerRowChanged = v16.optional(v16.callback), 
    startRow = v16.optional(v16.number), 
    playButtonStyle = v16.optional(v16.string), 
    sideMargin = if not l_FFlagLuaAppCompositionAlways_0 then v16.optional(v16.number) else nil, 
    shouldHideTileMetadata = v16.optional(v16.boolean), 
    shouldHideTileTitle = v16.optional(v16.boolean), 
    containedTile = v16.optional(v16.boolean), 
    numUpdatesToDelayImpressions = v16.optional(v16.number), 
    selectionOrderBase = v16.optional(v16.number), 
    enableExplicitFeedback = v16.optional(v16.boolean), 
    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v16.optional(v16.string) else nil, 
    enableSponsoredFeedback = v16.optional(v16.boolean), 
    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v16.optional(v16.boolean) else nil, 
    searchParams = v16.optional(v16.table), 
    layoutOverrides = v16.optional(v16.table), 
    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v16.optional(v16.boolean) else nil, 
    launchExperienceEventContextOverride = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v16.optional(v16.string) else nil, 
    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.string) else nil, 
    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil, 
    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil, 
    appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v16.optional(v16.boolean) else nil, 
    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v16.optional(v16.callback) else nil
});
return v14.memo(function(v52) --[[ Line: 169 ]] --[[ Name: GameCollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v51 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v23 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), l_useBreakpointXOrSmaller_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v14 (copy), v8 (copy), v36 (copy), v5 (copy), v12 (copy), l_useCollectionLayout_0 (copy), v6 (copy), v10 (copy), v9 (copy), v3 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_useTextSizeOffset_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), l_getGameTileHiddenStore_0 (copy), v15 (copy), v4 (copy), l_AppPage_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), v30 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v7 (copy), l_CollectionGrid_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), v11 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v51, v52);
    local v54 = l_useAppPolicy_0(function(v53) --[[ Line: 173 ]]
        return v53.useGridPageLayout();
    end);
    local v55 = l_usePreferredInput_0();
    local v56 = v55 == v23.Input.Directional and 4 or 2;
    local v57 = v55 == v23.Input.Directional and 4 or 1;
    local v58 = v52.isHoverSupportEnabled and v54 and v55 == v23.Input.Pointer;
    local v59 = v52.gameTileLayoutType or "Narrow";
    local v60 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v52.appCompositionEnabled;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 or l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 then
        local v64 = l_useBreakpointXOrSmaller_0(v23.Keys.Small);
        local v65 = v60 and v59 == "Narrow" and v64;
        v61 = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v65 else nil;
        v62 = if l_FFlagLuaAppNarrowTileHideRating_0 then v65 else nil;
        v63 = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v65 else nil;
    end;
    local v66 = if v60 then l_getGameTileCollectionItemSize_0(v59) else nil;
    local v67, v68 = v14.useState(nil);
    local v69 = v14.useRef(v67);
    v69.current = v67;
    local v70 = v8(v52.gameSortId, v52.pageContext, v52.searchParams and v52.searchParams.searchUuid);
    local v72 = v14.useMemo(function() --[[ Line: 220 ]]
        -- upvalues: v54 (copy), v52 (copy), v36 (ref)
        local v71 = if v54 then nil else v52.sideMargin;
        if not v52.layoutOverrides and not v71 then
            return nil;
        else
            return v36.Dictionary.join(v52.layoutOverrides or {}, {
                sideMargin = if v52.layoutOverrides and v52.layoutOverrides.sideMargin then v52.layoutOverrides.sideMargin else v71
            });
        end;
    end, {
        v52.layoutOverrides, 
        v54, 
        v52.sideMargin
    });
    local v73 = v5(v59, v67, false, v72);
    local v74 = v12(v52.entries, v73.columnGap, v73.verticalPadding);
    local v75 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v75 = l_useCollectionLayout_0(v66).itemsPerRow;
    end;
    local v76 = if v60 then v75 or 0 else v73.numColumns or 0;
    local v77, v78 = v6(v70.sort, v70.isOmni, v52.sortIndex, v52.pageContext, nil, v74, v76, v52.startRow);
    local v79, v80 = v10(v70.sort, v70.isOmni, v52.infoText);
    local v81, v82, v83 = v9(v70.sort, v70.isOmni, v52.sortIndex, v52.pageContext, v52.useGridTiles, v52.componentType, v70.gamesApiSortPageId, v52.gameSortId, v52.scrollViewPositionChangedSignal, v76, v52.startRow, v74, v52.searchParams);
    local v84 = ("GameGrid_%*_%*"):format(v52.gameSortId, v52.sortIndex);
    local v85 = v3();
    local v86 = l_useHoldToPlayStateAndCallbacks_0();
    local v87 = l_useControllerBarFocusNavigationBindings_0(nil, if v85 then v86.holdToPlayEventHandler else nil);
    v14.useEffect(function() --[[ Line: 287 ]]
        -- upvalues: v87 (copy), v67 (copy)
        if v87 then
            v87(v67);
        end;
    end, {
        v87, 
        v67
    });
    local v88 = v52.shouldHideTileTitle or false;
    local v89 = v52.shouldHideTileMetadata or false;
    local v90 = v52.containedTile or false;
    local v91 = l_useTextSizeOffset_0();
    local v92 = l_GameTileConstants_0.TileTextLines[v59] and l_GameTileConstants_0.TileTextLines[v59].titleTextLines;
    local v93 = v2(v58, v59, v90, v89, v88, v91, nil, v92, if not not l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v62 or v63 else nil);
    local v94 = l_getGameTileHiddenStore_0(v52.gameSortId);
    local v95 = v15.useSignalState(v94.getHiddenGames);
    local l_setGameHidden_0 = v94.setGameHidden;
    local v97 = nil;
    v97 = if not (v59 == "Narrow") or v52.playerCountStyle then v52.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v98 = v4(v97, v52.isSponsoredFooterAllowed, v59, v52.friendFooterEnabled, v52.pageContext == l_AppPage_0.Home, v84, v58, v77, v78, if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 and v52.launchExperienceEventContextOverride then v52.launchExperienceEventContextOverride else v30.Constants.Context.ExperienceTile, nil, nil, nil, if v70.isOmni then v52.gameSortId else nil, nil, nil, v52.playButtonStyle, v90, v88, v89, if v85 then v86.onHoldableFocused else nil, if v85 then v86.onHoldableUnfocused else nil, if v85 then v86.shouldDisableHoldable else nil, v91, v92, nil, nil, nil, nil, v52.selectionOrderBase, v52.enableExplicitFeedback, v95, l_setGameHidden_0, v52.pageContext, if l_FFlagLuaAppEnableWhyThisAdModal_0 then v52.sponsoredUserCohort else nil, v52.enableSponsoredFeedback, if l_FFlagLuaAppEnableSponsoredReportAd_0 then v52.enableReportAd else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then #v74 else nil, if l_FFlagLuaAppSupportAdRatingFooter_0 then v52.isSponsoredRatingFooterAllowed else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v52.sponsoredFooterAdLabelText else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v52.sponsoredFooterAdLabelFirst else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v52.sponsoredFooterIncludeRatingContent else nil, if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v52.onTileImageLoaded else nil, if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v61 else nil, if l_FFlagLuaAppNarrowTileHideRating_0 then v62 else nil, if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v63 else nil);
    if not l_FFlagLuaAppCompositionAlways_0 then
        local v99 = v14.useRef(0);
        local l_v99_0 = v99 --[[ copy: 43 -> 44 ]];
        v14.useEffect(function() --[[ Line: 385 ]]
            -- upvalues: v60 (copy), v73 (copy), l_v99_0 (copy), v52 (copy)
            if not v60 and v73.numColumns ~= l_v99_0.current then
                l_v99_0.current = v73.numColumns;
                if v52.onItemsPerRowChanged then
                    v52.onItemsPerRowChanged(v73.numColumns);
                end;
            end;
        end, {
            v73.numColumns, 
            v52.onItemsPerRowChanged, 
            v99, 
            if l_FFlagLuaAppCompositionSupport_0 then v60 else nil
        });
    end;
    if not v70.gameSortDataFound then
        return nil;
    else
        local v101 = v14.createElement(v7, {
            parentRef = v69, 
            pageContext = v52.pageContext, 
            impressionsTag = v84, 
            scrollViewPositionChangedSignal = v82, 
            sendGameImpressions = v81, 
            dataUpdatedTimestamp = v70.gameSortContents and v70.gameSortContents.updatedTimestamp or nil
        });
        return v14.createElement(v14.Fragment, nil, {
            GameGrid = v14.createElement(l_CollectionGrid_0, {
                collectionItemSize = if v60 then v66 else nil, 
                title = v52.title, 
                subtitle = v70.sort and v70.sort.subtitle or nil, 
                onViewableItemsChanged = v83, 
                containerRef = v68, 
                tooltipInfoText = v80, 
                hideHeaderButton = true, 
                items = v74, 
                onActivateInfoIcon = v79, 
                verticalScrollingFrameRef = v52.verticalScrollingFrameRef, 
                renderItem = v98, 
                getItemHeight = v93, 
                numColumns = if v60 then nil else v73.numColumns, 
                columnGap = if v60 then nil else v73.columnGap, 
                sideMargin = if v60 then nil else v73.sideMargin, 
                verticalPadding = if v60 then nil else v73.verticalPadding, 
                maxNumRows = v52.maxNumRows, 
                bufferRowsBelowScreen = v56, 
                bufferRowsAboveScreen = v57, 
                headerComponent = v52.headerComponent, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v52.gameSortId then ("--%*-game-collection-grid"):format(v52.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v14.createElement(v11, {
                waitForProp = v52.startRow, 
                maxUpdatesToDelay = v52.numUpdatesToDelayImpressions, 
                wrappedComponent = v101
            }), 
            HoldToPlayLauncher = if v85 and v86.shouldRenderHoldToPlayLauncher then v14.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v86.selectedIndex, 
                selectedEntry = v86.selectedEntry, 
                selectedNavigationUniverseId = v86.selectedNavigationUniverseId, 
                holdState = v86.holdState, 
                holdProgress = v86.holdProgress, 
                cancelHold = v86.cancelHold, 
                launchContext = v30.Constants.Context.HoldToPlayLauncher, 
                referralSource = v52.pageContext, 
                reportExperienceLaunched = v78
            }) else nil
        });
    end;
end);