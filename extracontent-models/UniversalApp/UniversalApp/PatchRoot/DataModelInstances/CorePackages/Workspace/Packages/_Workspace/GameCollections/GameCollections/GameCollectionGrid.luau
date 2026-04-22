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
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local l_FFlagLuaAppFixSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixSearchImpressions;
local l_FFlagLuaAppFixCompositionSizeOverrideGap_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixCompositionSizeOverrideGap;
local v52 = v16.strictInterface({
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
    launchExperienceEventContextOverride = v16.optional(v16.string), 
    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.string) else nil, 
    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil, 
    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil, 
    appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v16.optional(v16.boolean) else nil, 
    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v16.optional(v16.callback) else nil
});
return v14.memo(function(v53) --[[ Line: 168 ]] --[[ Name: GameCollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v52 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v23 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), l_useBreakpointXOrSmaller_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v14 (copy), v8 (copy), v36 (copy), v5 (copy), l_FFlagLuaAppFixCompositionSizeOverrideGap_0 (copy), l_useCollectionLayout_0 (copy), v12 (copy), v6 (copy), v10 (copy), v9 (copy), l_FFlagLuaAppFixSearchImpressions_0 (copy), v3 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_useTextSizeOffset_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), l_getGameTileHiddenStore_0 (copy), v15 (copy), v4 (copy), l_AppPage_0 (copy), v30 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v7 (copy), l_CollectionGrid_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), v11 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v52, v53);
    local v55 = l_useAppPolicy_0(function(v54) --[[ Line: 172 ]]
        return v54.useGridPageLayout();
    end);
    local v56 = l_usePreferredInput_0();
    local v57 = v56 == v23.Input.Directional and 4 or 2;
    local v58 = v56 == v23.Input.Directional and 4 or 1;
    local v59 = v53.isHoverSupportEnabled and v55 and v56 == v23.Input.Pointer;
    local v60 = v53.gameTileLayoutType or "Narrow";
    local v61 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v53.appCompositionEnabled;
    local v62 = nil;
    local v63 = nil;
    local v64 = nil;
    if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 or l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 then
        local v65 = l_useBreakpointXOrSmaller_0(v23.Keys.Small);
        local v66 = v61 and v60 == "Narrow" and v65;
        v62 = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v66 else nil;
        v63 = if l_FFlagLuaAppNarrowTileHideRating_0 then v66 else nil;
        v64 = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v66 else nil;
    end;
    local v67 = if v61 then l_getGameTileCollectionItemSize_0(v60) else nil;
    local v68, v69 = v14.useState(nil);
    local v70 = v14.useRef(v68);
    v70.current = v68;
    local v71 = v8(v53.gameSortId, v53.pageContext, v53.searchParams and v53.searchParams.searchUuid);
    local v73 = v14.useMemo(function() --[[ Line: 219 ]]
        -- upvalues: v55 (copy), v53 (copy), v36 (ref)
        local v72 = if v55 then nil else v53.sideMargin;
        if not v53.layoutOverrides and not v72 then
            return nil;
        else
            return v36.Dictionary.join(v53.layoutOverrides or {}, {
                sideMargin = if v53.layoutOverrides and v53.layoutOverrides.sideMargin then v53.layoutOverrides.sideMargin else v72
            });
        end;
    end, {
        v53.layoutOverrides, 
        v55, 
        v53.sideMargin
    });
    local v74 = v5(v60, v68, false, v73);
    local v75 = nil;
    local v76 = nil;
    if l_FFlagLuaAppFixCompositionSizeOverrideGap_0 and l_FFlagLuaAppCompositionSupport_0 then
        local v77 = l_useCollectionLayout_0(v67);
        v76 = v77.itemsPerRow;
        v75 = v12(v53.entries, if v61 then v77.gutter else v74.columnGap, if v61 then v77.verticalGap else v74.verticalPadding);
    else
        v75 = v12(v53.entries, v74.columnGap, v74.verticalPadding);
        if l_FFlagLuaAppCompositionSupport_0 then
            v76 = l_useCollectionLayout_0(v67).itemsPerRow;
        end;
    end;
    local v78 = if v61 then v76 or 0 else v74.numColumns or 0;
    local v79, v80 = v6(v71.sort, v71.isOmni, v53.sortIndex, v53.pageContext, nil, v75, v78, v53.startRow);
    local v81, v82 = v10(v71.sort, v71.isOmni, v53.infoText);
    local v83, v84, v85 = v9(v71.sort, v71.isOmni, v53.sortIndex, v53.pageContext, v53.useGridTiles, v53.componentType, v71.gamesApiSortPageId, v53.gameSortId, v53.scrollViewPositionChangedSignal, v78, v53.startRow, v75, v53.searchParams);
    local v86 = if l_FFlagLuaAppFixSearchImpressions_0 and v53.searchParams then v53.searchParams.searchUuid else nil;
    local v88 = if l_FFlagLuaAppFixSearchImpressions_0 then v14.useMemo(function() --[[ Line: 293 ]]
        -- upvalues: v53 (copy), v86 (copy)
        local v87 = ("GameGrid_%*"):format(v53.pageContext);
        if v86 then
            v87 = v87 .. ("_%*"):format(v86);
        end;
        return v87 .. ("_%*_%*"):format(v53.gameSortId, v53.sortIndex);
    end, {
        v53.pageContext, 
        v86, 
        v53.gameSortId, 
        v53.sortIndex
    }) else ("GameGrid_%*_%*"):format(v53.gameSortId, v53.sortIndex);
    local v89 = v3();
    local v90 = l_useHoldToPlayStateAndCallbacks_0();
    local v91 = l_useControllerBarFocusNavigationBindings_0(nil, if v89 then v90.holdToPlayEventHandler else nil);
    v14.useEffect(function() --[[ Line: 320 ]]
        -- upvalues: v91 (copy), v68 (copy)
        if v91 then
            v91(v68);
        end;
    end, {
        v91, 
        v68
    });
    local v92 = v53.shouldHideTileTitle or false;
    local v93 = v53.shouldHideTileMetadata or false;
    local v94 = v53.containedTile or false;
    local v95 = l_useTextSizeOffset_0();
    local v96 = l_GameTileConstants_0.TileTextLines[v60] and l_GameTileConstants_0.TileTextLines[v60].titleTextLines;
    local v97 = v2(v59, v60, v94, v93, v92, v95, nil, v96, if not not l_FFlagLuaAppNarrowTileHideRating_0 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v63 or v64 else nil);
    local v98 = l_getGameTileHiddenStore_0(v53.gameSortId);
    local v99 = v15.useSignalState(v98.getHiddenGames);
    local l_setGameHidden_0 = v98.setGameHidden;
    local v101 = nil;
    v101 = if not (v60 == "Narrow") or v53.playerCountStyle then v53.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v102 = v4(v101, v53.isSponsoredFooterAllowed, v60, v53.friendFooterEnabled, v53.pageContext == l_AppPage_0.Home, v88, v59, v79, v80, if v53.launchExperienceEventContextOverride then v53.launchExperienceEventContextOverride else v30.Constants.Context.ExperienceTile, nil, nil, nil, if v71.isOmni then v53.gameSortId else nil, nil, nil, v53.playButtonStyle, v94, v92, v93, if v89 then v90.onHoldableFocused else nil, if v89 then v90.onHoldableUnfocused else nil, if v89 then v90.shouldDisableHoldable else nil, v95, v96, nil, nil, nil, nil, v53.selectionOrderBase, v53.enableExplicitFeedback, v99, l_setGameHidden_0, v53.pageContext, if l_FFlagLuaAppEnableWhyThisAdModal_0 then v53.sponsoredUserCohort else nil, v53.enableSponsoredFeedback, if l_FFlagLuaAppEnableSponsoredReportAd_0 then v53.enableReportAd else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then #v75 else nil, if l_FFlagLuaAppSupportAdRatingFooter_0 then v53.isSponsoredRatingFooterAllowed else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v53.sponsoredFooterAdLabelText else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v53.sponsoredFooterAdLabelFirst else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v53.sponsoredFooterIncludeRatingContent else nil, if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v53.onTileImageLoaded else nil, if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v62 else nil, if l_FFlagLuaAppNarrowTileHideRating_0 then v63 else nil, if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v64 else nil);
    if not l_FFlagLuaAppCompositionAlways_0 then
        local v103 = v14.useRef(0);
        local l_v103_0 = v103 --[[ copy: 44 -> 45 ]];
        v14.useEffect(function() --[[ Line: 418 ]]
            -- upvalues: v61 (copy), v74 (copy), l_v103_0 (copy), v53 (copy)
            if not v61 and v74.numColumns ~= l_v103_0.current then
                l_v103_0.current = v74.numColumns;
                if v53.onItemsPerRowChanged then
                    v53.onItemsPerRowChanged(v74.numColumns);
                end;
            end;
        end, {
            v74.numColumns, 
            v53.onItemsPerRowChanged, 
            v103, 
            if l_FFlagLuaAppCompositionSupport_0 then v61 else nil
        });
    end;
    if not v71.gameSortDataFound then
        return nil;
    else
        local v105 = v14.createElement(v7, {
            parentRef = v70, 
            pageContext = v53.pageContext, 
            impressionsTag = v88, 
            scrollViewPositionChangedSignal = v84, 
            sendGameImpressions = v83, 
            dataUpdatedTimestamp = v71.gameSortContents and v71.gameSortContents.updatedTimestamp or nil
        });
        return v14.createElement(v14.Fragment, nil, {
            GameGrid = v14.createElement(l_CollectionGrid_0, {
                collectionItemSize = if v61 then v67 else nil, 
                title = v53.title, 
                subtitle = v71.sort and v71.sort.subtitle or nil, 
                onViewableItemsChanged = v85, 
                containerRef = v69, 
                tooltipInfoText = v82, 
                hideHeaderButton = true, 
                items = v75, 
                onActivateInfoIcon = v81, 
                verticalScrollingFrameRef = v53.verticalScrollingFrameRef, 
                renderItem = v102, 
                getItemHeight = v97, 
                numColumns = if v61 then nil else v74.numColumns, 
                columnGap = if v61 then nil else v74.columnGap, 
                sideMargin = if v61 then nil else v74.sideMargin, 
                verticalPadding = if v61 then nil else v74.verticalPadding, 
                maxNumRows = v53.maxNumRows, 
                bufferRowsBelowScreen = v57, 
                bufferRowsAboveScreen = v58, 
                headerComponent = v53.headerComponent, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v53.gameSortId then ("--%*-game-collection-grid"):format(v53.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v14.createElement(v11, {
                waitForProp = v53.startRow, 
                maxUpdatesToDelay = v53.numUpdatesToDelayImpressions, 
                wrappedComponent = v105
            }), 
            HoldToPlayLauncher = if v89 and v90.shouldRenderHoldToPlayLauncher then v14.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v90.selectedIndex, 
                selectedEntry = v90.selectedEntry, 
                selectedNavigationUniverseId = v90.selectedNavigationUniverseId, 
                holdState = v90.holdState, 
                holdProgress = v90.holdProgress, 
                cancelHold = v90.cancelHold, 
                launchContext = v30.Constants.Context.HoldToPlayLauncher, 
                referralSource = v53.pageContext, 
                reportExperienceLaunched = v80
            }) else nil
        });
    end;
end);