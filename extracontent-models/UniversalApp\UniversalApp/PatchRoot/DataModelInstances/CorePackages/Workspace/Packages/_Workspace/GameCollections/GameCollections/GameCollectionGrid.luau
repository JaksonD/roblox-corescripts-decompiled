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
local l_getGameTileHiddenStore_0 = v18.getGameTileHiddenStore;
local l_GameTileConstants_0 = v18.GameTileConstants;
local _ = require(l_Parent_0.AppCommonLib);
local v22 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v22.usePreferredInput;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_CollectionGrid_0 = require(l_Parent_0.CollectionViews).CollectionGrid;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v27 = require(l_Parent_0.DiscoveryAnalytics);
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local v29 = require(l_Parent_0.HoldToPlay);
local l_HoldToPlayLauncher_0 = v29.HoldToPlayLauncher;
local l_useHoldToPlayStateAndCallbacks_0 = v29.useHoldToPlayStateAndCallbacks;
local _ = require(l_Parent_0.DiscoveryTypes);
local v33 = require(l_Parent_0.Cryo);
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppAddTestIdsForGameCollections_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGameSortAnalyticFromSearch;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local v42 = v16.strictInterface({
    entries = v16.optional(v16.table), 
    title = if l_FFlagLuaAppSearchGridTiles_0 then v16.optional(v16.string) else v16.string, 
    headerComponent = if l_FFlagLuaAppSearchGridTiles_0 then v16.optional(v16.table) else nil, 
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
    sideMargin = v16.optional(v16.number), 
    shouldHideTileMetadata = v16.optional(v16.boolean), 
    shouldHideTileTitle = v16.optional(v16.boolean), 
    containedTile = v16.optional(v16.boolean), 
    numUpdatesToDelayImpressions = v16.optional(v16.number), 
    selectionOrderBase = v16.optional(v16.number), 
    enableExplicitFeedback = v16.optional(v16.boolean), 
    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v16.optional(v16.string) else nil, 
    enableSponsoredFeedback = v16.optional(v16.boolean), 
    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v16.optional(v16.boolean) else nil, 
    searchParams = if l_FFlagLuaAppSearchGridTiles_0 then v16.optional(v16.table) else nil, 
    layoutOverrides = if l_FFlagLuaAppSearchGridTiles_0 then v16.optional(v16.table) else nil, 
    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v16.optional(v16.boolean) else nil, 
    launchExperienceEventContextOverride = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v16.optional(v16.string) else nil, 
    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.string) else nil, 
    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil, 
    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil
});
return v14.memo(function(v43) --[[ Line: 151 ]] --[[ Name: GameCollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v42 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v22 (copy), v14 (copy), v8 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), v33 (copy), v5 (copy), v12 (copy), v6 (copy), v10 (copy), v9 (copy), v3 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_useTextSizeOffset_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), l_getGameTileHiddenStore_0 (copy), v15 (copy), v4 (copy), l_AppPage_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), v27 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), v7 (copy), l_CollectionGrid_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), v11 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v42, v43);
    local v45 = l_useAppPolicy_0(function(v44) --[[ Line: 155 ]]
        return v44.useGridPageLayout();
    end);
    local v46 = l_usePreferredInput_0();
    local v47 = v46 == v22.Input.Directional and 4 or 2;
    local v48 = v46 == v22.Input.Directional and 4 or 1;
    local v49 = v43.isHoverSupportEnabled and v45 and v46 == v22.Input.Pointer;
    local v50 = v43.gameTileLayoutType or "Narrow";
    local v51, v52 = v14.useState(nil);
    local v53 = v14.useRef(v51);
    v53.current = v51;
    local v54 = v8(v43.gameSortId, v43.pageContext, if l_FFlagLuaAppSearchGridTiles_0 then v43.searchParams and v43.searchParams.searchUuid else nil);
    local v55 = nil;
    v55 = if l_FFlagLuaAppSearchGridTiles_0 then v14.useMemo(function() --[[ Line: 185 ]]
        -- upvalues: v45 (copy), v43 (copy), v33 (ref)
        local v56 = if v45 then nil else v43.sideMargin;
        if not v43.layoutOverrides and not v56 then
            return nil;
        else
            return v33.Dictionary.join(v43.layoutOverrides or {}, {
                sideMargin = if v43.layoutOverrides and v43.layoutOverrides.sideMargin then v43.layoutOverrides.sideMargin else v56
            });
        end;
    end, {
        v43.layoutOverrides, 
        v45, 
        v43.sideMargin
    }) else if v45 then nil else {
        sideMargin = v43.sideMargin
    };
    local v57 = v5(v50, v51, false, v55);
    local v58 = if l_FFlagLuaAppSearchGridTiles_0 then v12(v43.entries, v57.columnGap, v57.verticalPadding) else nil;
    local v59, v60 = v6(v54.sort, v54.isOmni, v43.sortIndex, v43.pageContext, nil, if l_FFlagLuaAppSearchGridTiles_0 then v58 else v43.entries, v57.numColumns or 0, v43.startRow);
    local v61, v62 = v10(v54.sort, v54.isOmni, v43.infoText);
    local v63, v64, v65 = v9(v54.sort, v54.isOmni, v43.sortIndex, v43.pageContext, v43.useGridTiles, v43.componentType, v54.gamesApiSortPageId, v43.gameSortId, v43.scrollViewPositionChangedSignal, v57.numColumns or 0, v43.startRow, if l_FFlagLuaAppSearchGridTiles_0 then v58 else v43.entries, if l_FFlagLuaAppSearchGridTiles_0 then v43.searchParams else nil);
    local v66 = ("GameGrid_%*_%*"):format(v43.gameSortId, v43.sortIndex);
    local v67 = v3();
    local v68 = l_useHoldToPlayStateAndCallbacks_0();
    local v69 = l_useControllerBarFocusNavigationBindings_0(nil, if v67 then v68.holdToPlayEventHandler else nil);
    v14.useEffect(function() --[[ Line: 251 ]]
        -- upvalues: v69 (copy), v51 (copy)
        if v69 then
            v69(v51);
        end;
    end, {
        v69, 
        v51
    });
    local v70 = v43.shouldHideTileTitle or false;
    local v71 = v43.shouldHideTileMetadata or false;
    local v72 = v43.containedTile or false;
    local v73 = l_useTextSizeOffset_0();
    local v74 = l_GameTileConstants_0.TileTextLines[v50] and l_GameTileConstants_0.TileTextLines[v50].titleTextLines;
    local v75 = v2(v49, v50, v72, v71, v70, v73, nil, v74);
    local v76 = l_getGameTileHiddenStore_0(v43.gameSortId);
    local v77 = v15.useSignalState(v76.getHiddenGames);
    local l_setGameHidden_0 = v76.setGameHidden;
    local v79 = nil;
    v79 = if not (v50 == "Narrow") or v43.playerCountStyle then v43.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v80 = v4(v79, v43.isSponsoredFooterAllowed, v50, v43.friendFooterEnabled, v43.pageContext == l_AppPage_0.Home, v66, v49, v59, v60, if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 and v43.launchExperienceEventContextOverride then v43.launchExperienceEventContextOverride else v27.Constants.Context.ExperienceTile, nil, nil, nil, if v54.isOmni then v43.gameSortId else nil, nil, nil, v43.playButtonStyle, v72, v70, v71, if v67 then v68.onHoldableFocused else nil, if v67 then v68.onHoldableUnfocused else nil, if v67 then v68.shouldDisableHoldable else nil, v73, v74, nil, nil, nil, nil, v43.selectionOrderBase, v43.enableExplicitFeedback, v77, l_setGameHidden_0, v43.pageContext, if l_FFlagLuaAppEnableWhyThisAdModal_0 then v43.sponsoredUserCohort else nil, v43.enableSponsoredFeedback, if l_FFlagLuaAppEnableSponsoredReportAd_0 then v43.enableReportAd else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then #if l_FFlagLuaAppSearchGridTiles_0 then v58 else v43.entries else nil, if l_FFlagLuaAppSupportAdRatingFooter_0 then v43.isSponsoredRatingFooterAllowed else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v43.sponsoredFooterAdLabelText else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v43.sponsoredFooterAdLabelFirst else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v43.sponsoredFooterIncludeRatingContent else nil);
    local v81 = v14.useRef(0);
    v14.useEffect(function() --[[ Line: 342 ]]
        -- upvalues: v57 (copy), v81 (copy), v43 (copy)
        if v57.numColumns ~= v81.current then
            v81.current = v57.numColumns;
            if v43.onItemsPerRowChanged then
                v43.onItemsPerRowChanged(v57.numColumns);
            end;
        end;
    end, {
        v57.numColumns, 
        v43.onItemsPerRowChanged, 
        v81
    });
    if not v54.gameSortDataFound then
        return nil;
    else
        local v82 = v14.createElement(v7, {
            parentRef = v53, 
            pageContext = v43.pageContext, 
            impressionsTag = v66, 
            scrollViewPositionChangedSignal = v64, 
            sendGameImpressions = v63, 
            dataUpdatedTimestamp = v54.gameSortContents and v54.gameSortContents.updatedTimestamp or nil
        });
        return v14.createElement(v14.Fragment, nil, {
            GameGrid = v14.createElement(l_CollectionGrid_0, {
                title = v43.title, 
                subtitle = v54.sort and v54.sort.subtitle or nil, 
                onViewableItemsChanged = v65, 
                containerRef = v52, 
                tooltipInfoText = v62, 
                hideHeaderButton = true, 
                items = if l_FFlagLuaAppSearchGridTiles_0 then v58 else v43.entries, 
                onActivateInfoIcon = v61, 
                verticalScrollingFrameRef = v43.verticalScrollingFrameRef, 
                renderItem = v80, 
                getItemHeight = v75, 
                numColumns = v57.numColumns, 
                columnGap = v57.columnGap, 
                sideMargin = v57.sideMargin, 
                verticalPadding = v57.verticalPadding, 
                maxNumRows = v43.maxNumRows, 
                bufferRowsBelowScreen = v47, 
                bufferRowsAboveScreen = v48, 
                headerComponent = if l_FFlagLuaAppSearchGridTiles_0 then v43.headerComponent else nil, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v43.gameSortId then ("--%*-game-collection-grid"):format(v43.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v14.createElement(v11, {
                waitForProp = v43.startRow, 
                maxUpdatesToDelay = v43.numUpdatesToDelayImpressions, 
                wrappedComponent = v82
            }), 
            HoldToPlayLauncher = if v67 and v68.shouldRenderHoldToPlayLauncher then v14.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v68.selectedIndex, 
                selectedEntry = v68.selectedEntry, 
                selectedNavigationUniverseId = v68.selectedNavigationUniverseId, 
                holdState = v68.holdState, 
                holdProgress = v68.holdProgress, 
                cancelHold = v68.cancelHold, 
                launchContext = v27.Constants.Context.HoldToPlayLauncher, 
                referralSource = v43.pageContext, 
                reportExperienceLaunched = v60
            }) else nil
        });
    end;
end);