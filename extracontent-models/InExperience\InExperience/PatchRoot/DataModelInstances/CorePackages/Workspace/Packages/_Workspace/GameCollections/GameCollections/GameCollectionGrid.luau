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
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppAddTestIdsForGameCollections_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddTestIdsForGameCollections;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGameSortAnalyticFromSearch;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local v41 = v16.strictInterface({
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
    searchParams = v16.optional(v16.table), 
    layoutOverrides = v16.optional(v16.table), 
    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v16.optional(v16.boolean) else nil, 
    launchExperienceEventContextOverride = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then v16.optional(v16.string) else nil, 
    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.string) else nil, 
    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil, 
    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v16.optional(v16.boolean) else nil
});
return v14.memo(function(v42) --[[ Line: 150 ]] --[[ Name: GameCollectionGrid ]]
    -- upvalues: l_validateProps_0 (copy), v41 (copy), l_useAppPolicy_0 (copy), l_usePreferredInput_0 (copy), v22 (copy), v14 (copy), v8 (copy), v33 (copy), v5 (copy), v12 (copy), v6 (copy), v10 (copy), v9 (copy), v3 (copy), l_useHoldToPlayStateAndCallbacks_0 (copy), l_useControllerBarFocusNavigationBindings_0 (copy), l_useTextSizeOffset_0 (copy), l_GameTileConstants_0 (copy), v2 (copy), l_getGameTileHiddenStore_0 (copy), v15 (copy), v4 (copy), l_AppPage_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), v27 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), v7 (copy), l_CollectionGrid_0 (copy), l_FFlagLuaAppAddTestIdsForGameCollections_0 (copy), v11 (copy), l_HoldToPlayLauncher_0 (copy)
    l_validateProps_0(v41, v42);
    local v44 = l_useAppPolicy_0(function(v43) --[[ Line: 154 ]]
        return v43.useGridPageLayout();
    end);
    local v45 = l_usePreferredInput_0();
    local v46 = v45 == v22.Input.Directional and 4 or 2;
    local v47 = v45 == v22.Input.Directional and 4 or 1;
    local v48 = v42.isHoverSupportEnabled and v44 and v45 == v22.Input.Pointer;
    local v49 = v42.gameTileLayoutType or "Narrow";
    local v50, v51 = v14.useState(nil);
    local v52 = v14.useRef(v50);
    v52.current = v50;
    local v53 = v8(v42.gameSortId, v42.pageContext, v42.searchParams and v42.searchParams.searchUuid);
    local v55 = v14.useMemo(function() --[[ Line: 179 ]]
        -- upvalues: v44 (copy), v42 (copy), v33 (ref)
        local v54 = if v44 then nil else v42.sideMargin;
        if not v42.layoutOverrides and not v54 then
            return nil;
        else
            return v33.Dictionary.join(v42.layoutOverrides or {}, {
                sideMargin = if v42.layoutOverrides and v42.layoutOverrides.sideMargin then v42.layoutOverrides.sideMargin else v54
            });
        end;
    end, {
        v42.layoutOverrides, 
        v44, 
        v42.sideMargin
    });
    local v56 = v5(v49, v50, false, v55);
    local v57 = v12(v42.entries, v56.columnGap, v56.verticalPadding);
    local v58, v59 = v6(v53.sort, v53.isOmni, v42.sortIndex, v42.pageContext, nil, v57, v56.numColumns or 0, v42.startRow);
    local v60, v61 = v10(v53.sort, v53.isOmni, v42.infoText);
    local v62, v63, v64 = v9(v53.sort, v53.isOmni, v42.sortIndex, v42.pageContext, v42.useGridTiles, v42.componentType, v53.gamesApiSortPageId, v42.gameSortId, v42.scrollViewPositionChangedSignal, v56.numColumns or 0, v42.startRow, v57, v42.searchParams);
    local v65 = ("GameGrid_%*_%*"):format(v42.gameSortId, v42.sortIndex);
    local v66 = v3();
    local v67 = l_useHoldToPlayStateAndCallbacks_0();
    local v68 = l_useControllerBarFocusNavigationBindings_0(nil, if v66 then v67.holdToPlayEventHandler else nil);
    v14.useEffect(function() --[[ Line: 237 ]]
        -- upvalues: v68 (copy), v50 (copy)
        if v68 then
            v68(v50);
        end;
    end, {
        v68, 
        v50
    });
    local v69 = v42.shouldHideTileTitle or false;
    local v70 = v42.shouldHideTileMetadata or false;
    local v71 = v42.containedTile or false;
    local v72 = l_useTextSizeOffset_0();
    local v73 = l_GameTileConstants_0.TileTextLines[v49] and l_GameTileConstants_0.TileTextLines[v49].titleTextLines;
    local v74 = v2(v48, v49, v71, v70, v69, v72, nil, v73);
    local v75 = l_getGameTileHiddenStore_0(v42.gameSortId);
    local v76 = v15.useSignalState(v75.getHiddenGames);
    local l_setGameHidden_0 = v75.setGameHidden;
    local v78 = nil;
    v78 = if not (v49 == "Narrow") or v42.playerCountStyle then v42.playerCountStyle else l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v79 = v4(v78, v42.isSponsoredFooterAllowed, v49, v42.friendFooterEnabled, v42.pageContext == l_AppPage_0.Home, v65, v48, v58, v59, if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 and v42.launchExperienceEventContextOverride then v42.launchExperienceEventContextOverride else v27.Constants.Context.ExperienceTile, nil, nil, nil, if v53.isOmni then v42.gameSortId else nil, nil, nil, v42.playButtonStyle, v71, v69, v70, if v66 then v67.onHoldableFocused else nil, if v66 then v67.onHoldableUnfocused else nil, if v66 then v67.shouldDisableHoldable else nil, v72, v73, nil, nil, nil, nil, v42.selectionOrderBase, v42.enableExplicitFeedback, v76, l_setGameHidden_0, v42.pageContext, if l_FFlagLuaAppEnableWhyThisAdModal_0 then v42.sponsoredUserCohort else nil, v42.enableSponsoredFeedback, if l_FFlagLuaAppEnableSponsoredReportAd_0 then v42.enableReportAd else nil, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then #v57 else nil, if l_FFlagLuaAppSupportAdRatingFooter_0 then v42.isSponsoredRatingFooterAllowed else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v42.sponsoredFooterAdLabelText else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v42.sponsoredFooterAdLabelFirst else nil, if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v42.sponsoredFooterIncludeRatingContent else nil);
    local v80 = v14.useRef(0);
    v14.useEffect(function() --[[ Line: 326 ]]
        -- upvalues: v56 (copy), v80 (copy), v42 (copy)
        if v56.numColumns ~= v80.current then
            v80.current = v56.numColumns;
            if v42.onItemsPerRowChanged then
                v42.onItemsPerRowChanged(v56.numColumns);
            end;
        end;
    end, {
        v56.numColumns, 
        v42.onItemsPerRowChanged, 
        v80
    });
    if not v53.gameSortDataFound then
        return nil;
    else
        local v81 = v14.createElement(v7, {
            parentRef = v52, 
            pageContext = v42.pageContext, 
            impressionsTag = v65, 
            scrollViewPositionChangedSignal = v63, 
            sendGameImpressions = v62, 
            dataUpdatedTimestamp = v53.gameSortContents and v53.gameSortContents.updatedTimestamp or nil
        });
        return v14.createElement(v14.Fragment, nil, {
            GameGrid = v14.createElement(l_CollectionGrid_0, {
                title = v42.title, 
                subtitle = v53.sort and v53.sort.subtitle or nil, 
                onViewableItemsChanged = v64, 
                containerRef = v51, 
                tooltipInfoText = v61, 
                hideHeaderButton = true, 
                items = v57, 
                onActivateInfoIcon = v60, 
                verticalScrollingFrameRef = v42.verticalScrollingFrameRef, 
                renderItem = v79, 
                getItemHeight = v74, 
                numColumns = v56.numColumns, 
                columnGap = v56.columnGap, 
                sideMargin = v56.sideMargin, 
                verticalPadding = v56.verticalPadding, 
                maxNumRows = v42.maxNumRows, 
                bufferRowsBelowScreen = v46, 
                bufferRowsAboveScreen = v47, 
                headerComponent = v42.headerComponent, 
                testId = if l_FFlagLuaAppAddTestIdsForGameCollections_0 and v42.gameSortId then ("--%*-game-collection-grid"):format(v42.gameSortId) else nil
            }), 
            GameSortImpressionsDetector = v14.createElement(v11, {
                waitForProp = v42.startRow, 
                maxUpdatesToDelay = v42.numUpdatesToDelayImpressions, 
                wrappedComponent = v81
            }), 
            HoldToPlayLauncher = if v66 and v67.shouldRenderHoldToPlayLauncher then v14.createElement(l_HoldToPlayLauncher_0, {
                selectedIndex = v67.selectedIndex, 
                selectedEntry = v67.selectedEntry, 
                selectedNavigationUniverseId = v67.selectedNavigationUniverseId, 
                holdState = v67.holdState, 
                holdProgress = v67.holdProgress, 
                cancelHold = v67.cancelHold, 
                launchContext = v27.Constants.Context.HoldToPlayLauncher, 
                referralSource = v42.pageContext, 
                reportExperienceLaunched = v59
            }) else nil
        });
    end;
end);