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
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local l_useCollectionLayout_0 = require(l_Parent_0.CollectionViews).useCollectionLayout;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v29 = require(l_Parent_0.DiscoveryAnalytics);
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local v31 = require(l_Parent_0.HoldToPlay);
local l_HoldToPlayLauncher_0 = v31.HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = v31.useHoldToPlayStateAndCallbacks;
local _ = require(l_Parent_0.DiscoveryTypes);
local v35 = require(l_Parent_0.Cryo);
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
local v47 = v16.strictInterface({
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
return v14.memo(function(v48) --[[ Line: 164 ]] --[[ Name: GameCollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v47 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v23 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_getGameTileCollectionItemSize_0 (copy), v14 (copy), v8 (copy), v35 (copy), v5 (copy), v12 (copy), l_useCollectionLayout_0 (copy), v6 (copy), v10 (copy), v9 (copy), v3 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_useTextSizeOffset_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), l_getGameTileHiddenStore_0 (copy), v15 (copy), v4 (copy), l_AppPage_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), v29 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v7 (copy), l_CollectionGrid_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), v11 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v47, v48);
    local v50 = l_useAppPolicy_0(function(v49) --[[ Line: 168 ]]
        return v49.useGridPageLayout();
    end);
    local v51 = l_usePreferredInput_0();
    local v52 = v51 == v23.Input.Directional and 4 or 2;
    local v53 = v51 == v23.Input.Directional and 4 or 1;
    local v54 = v48.isHoverSupportEnabled and v50 and v51 == v23.Input.Pointer;
    local v55 = v48.gameTileLayoutType or "Narrow";
    local v56 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v48.appCompositionEnabled;
    local v57 = if v56 then l_getGameTileCollectionItemSize_0(v55) else nil;
    local v58, v59 = v14.useState(nil);
    local v60 = v14.useRef(v58);
    v60.current = v58;
    local v61 = v8(v48.gameSortId, v48.pageContext, v48.searchParams and v48.searchParams.searchUuid);
    local v63 = v14.useMemo(function() --[[ Line: 199 ]]
        -- upvalues: v50 (copy), v48 (copy), v35 (ref)
        local v62 = if v50 then nil else v48.sideMargin;
        if not v48.layoutOverrides and not v62 then
            return nil;
        else
            return v35.Dictionary.join(v48.layoutOverrides or {}, {
                sideMargin = if v48.layoutOverrides and v48.layoutOverrides.sideMargin then v48.layoutOverrides.sideMargin else v62
            });
        end;
    end, {
        v48.layoutOverrides, 
        v50, 
        v48.sideMargin
    });
    local v64 = v5(v55, v58, false, v63);
    local v65 = v12(v48.entries, v64.columnGap, v64.verticalPadding);
    local v66 = nil;
    if l_FFlagLuaAppCompositionSupport_0 then
        v66 = l_useCollectionLayout_0(v57).itemsPerRow;
    end;
    local v67 = if v56 then v66 or 0 else v64.numColumns or 0;
    local v68, v69 = v6(v61.sort, v61.isOmni, v48.sortIndex, v48.pageContext, nil, v65, v67, v48.startRow);
    local v70, v71 = v10(v61.sort, v61.isOmni, v48.infoText);
    local v72, v73, v74 = v9(v61.sort, v61.isOmni, v48.sortIndex, v48.pageContext, v48.useGridTiles, v48.componentType, v61.gamesApiSortPageId, v48.gameSortId, v48.scrollViewPositionChangedSignal, v67, v48.startRow, v65, v48.searchParams);
    local v75 = ("GameGrid_%*_%*"):format(v48.gameSortId, v48.sortIndex);
    local v76 = v3();
    local v77 = l_useHoldToPlayStateAndCallbacks_0();
    local v78 = l_useControllerBarFocusNavigationBindings_0(nil, if v76 then v77.holdToPlayEventHandler else nil);
    v14.useEffect(function() --[[ Line: 266 ]]
        -- upvalues: v78 (copy), v58 (copy)
        if v78 then
            v78(v58);
        end;
    end, {
        v78, 
        v58
    });
    local v79 = v48.shouldHideTileTitle or false;
    local v80 = v48.shouldHideTileMetadata or false;
    local v81 = v48.containedTile or false;
    local v82 = l_useTextSizeOffset_0();
    local v83 = l_GameTileConstants_0.TileTextLines[v55] and l_GameTileConstants_0.TileTextLines[v55].titleTextLines;
    local v84 = v2(v54, v55, v81, v80, v79, v82, nil, v83);
    local v85 = l_getGameTileHiddenStore_0(v48.gameSortId);
    local v86 = v15.useSignalState(v85.getHiddenGames);
    local l_setGameHidden_0 = v85.setGameHidden;
    local v88 = nil;
    v88 = if not (v55 == "Narrow") or v48.playerCountStyle then v48.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v89 = v4(v88, v48.isSponsoredFooterAllowed, v55, v48.friendFooterEnabled, v48.pageContext == l_AppPage_0.Home, v75, v54, v68, v69, if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 and v48.launchExperienceEventContextOverride then v48.launchExperienceEventContextOverride else v29.Constants.Context.ExperienceTile, nil, nil, nil, if v61.isOmni then v48.gameSortId else nil, nil, nil, v48.playButtonStyle, v81, v79, v80, if v76 then v77.onHoldableFocused else nil, if v76 then v77.onHoldableUnfocused else nil, if v76 then v77.shouldDisableHoldable else nil, v82, v83, nil, nil, nil, nil, v48.selectionOrderBase, v48.enableExplicitFeedback, v86, l_setGameHidden_0, v48.pageContext, if l_FFlagLuaAppEnableWhyThisAdModal_0 then v48.sponsoredUserCohort else nil, v48.enableSponsoredFeedback, if l_FFlagLuaAppEnableSponsoredReportAd_0 then v48.enableReportAd else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then #v65 else nil, if l_FFlagLuaAppSupportAdRatingFooter_0 then v48.isSponsoredRatingFooterAllowed else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v48.sponsoredFooterAdLabelText else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v48.sponsoredFooterAdLabelFirst else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v48.sponsoredFooterIncludeRatingContent else nil, if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v48.onTileImageLoaded else nil);
    if not l_FFlagLuaAppCompositionAlways_0 then
        local v90 = v14.useRef(0);
        local l_v90_0 = v90 --[[ copy: 40 -> 41 ]];
        v14.useEffect(function() --[[ Line: 358 ]]
            -- upvalues: v56 (copy), v64 (copy), l_v90_0 (copy), v48 (copy)
            if not v56 and v64.numColumns ~= l_v90_0.current then
                l_v90_0.current = v64.numColumns;
                if v48.onItemsPerRowChanged then
                    v48.onItemsPerRowChanged(v64.numColumns);
                end;
            end;
        end, {
            v64.numColumns, 
            v48.onItemsPerRowChanged, 
            v90, 
            if l_FFlagLuaAppCompositionSupport_0 then v56 else nil
        });
    end;
    if not v61.gameSortDataFound then
        return nil;
    else
        local v92 = v14.createElement(v7, {
            parentRef = v60, 
            pageContext = v48.pageContext, 
            impressionsTag = v75, 
            scrollViewPositionChangedSignal = v73, 
            sendGameImpressions = v72, 
            dataUpdatedTimestamp = v61.gameSortContents and v61.gameSortContents.updatedTimestamp or nil
        });
        return v14.createElement(v14.Fragment, nil, {
            GameGrid = v14.createElement(l_CollectionGrid_0, {
                collectionItemSize = if v56 then v57 else nil, 
                title = v48.title, 
                subtitle = v61.sort and v61.sort.subtitle or nil, 
                onViewableItemsChanged = v74, 
                containerRef = v59, 
                tooltipInfoText = v71, 
                hideHeaderButton = true, 
                items = v65, 
                onActivateInfoIcon = v70, 
                verticalScrollingFrameRef = v48.verticalScrollingFrameRef, 
                renderItem = v89, 
                getItemHeight = v84, 
                numColumns = if v56 then nil else v64.numColumns, 
                columnGap = if v56 then nil else v64.columnGap, 
                sideMargin = if v56 then nil else v64.sideMargin, 
                verticalPadding = if v56 then nil else v64.verticalPadding, 
                maxNumRows = v48.maxNumRows, 
                bufferRowsBelowScreen = v52, 
                bufferRowsAboveScreen = v53, 
                headerComponent = v48.headerComponent, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v48.gameSortId then ("--%*-game-collection-grid"):format(v48.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v14.createElement(v11, {
                waitForProp = v48.startRow, 
                maxUpdatesToDelay = v48.numUpdatesToDelayImpressions, 
                wrappedComponent = v92
            }), 
            HoldToPlayLauncher = if v76 and v77.shouldRenderHoldToPlayLauncher then v14.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v77.selectedIndex, 
                selectedEntry = v77.selectedEntry, 
                selectedNavigationUniverseId = v77.selectedNavigationUniverseId, 
                holdState = v77.holdState, 
                holdProgress = v77.holdProgress, 
                cancelHold = v77.cancelHold, 
                launchContext = v29.Constants.Context.HoldToPlayLauncher, 
                referralSource = v48.pageContext, 
                reportExperienceLaunched = v69
            }) else nil
        });
    end;
end);