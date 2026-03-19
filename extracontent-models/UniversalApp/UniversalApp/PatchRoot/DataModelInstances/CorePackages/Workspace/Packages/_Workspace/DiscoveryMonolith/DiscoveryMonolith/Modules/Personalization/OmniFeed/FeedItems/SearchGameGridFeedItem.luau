local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalyticsCommonGameEvents_0 = v3.RoactAnalyticsCommonGameEvents;
local l_RoactAnalytics_0 = v3.RoactAnalytics;
local l_AppEventIngestService_0 = v3.AppEventIngestService;
local v7 = require(l_Parent_0.ArgCheck);
local _ = require(l_Parent_0.AppCommonLib);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GameSortImpressionsDetector_0 = require(l_Parent_0.GameCollections).GameSortImpressionsDetector;
local l_SendGameImpressions_0 = require(l_Parent_0.GameCollections).SendGameImpressions;
local l_WaitForPropWrapper_0 = require(l_Parent_0.GameCollections).WaitForPropWrapper;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SearchTypes_0 = require(l_Parent_0.RobloxAppEnums).SearchTypes;
local v16 = require(l_Parent_0.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v16.Events.gamePlayIntent;
local l_Context_0 = v16.Constants.Context;
local l_GameTileConstants_0 = require(l_Parent_0.GameTile).GameTileConstants;
local l_LayoutConfig_0 = require(l_Parent_0.RobloxAppEnums).LayoutConfig;
local l_useResponsiveLayout_0 = require(l_Parent_0.UIBlox).Core.Layout.Responsive.useResponsiveLayout;
local v22 = require(l_Parent_0.SignalsReact);
local l_OmniFeedConstants_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedConstants;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v27 = require(l_Modules_0.Personalization.OmniFeed.useGridFlexFeedItemBounds);
local v28 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v29 = require(l_Modules_0.LuaApp.Components.Games.GameGridSelector);
local v30 = require(l_Modules_0.LuaApp.getCurrentPage);
local v31 = require(l_Modules_0.Personalization.OmniFeed.getEntitiesForPartialFeedItem);
local v32 = require(l_Modules_0.LuaApp.Components.Search.SearchTypeSelection.SearchSelectionTypeHeader);
local v33 = require(l_Modules_0.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows);
local v34 = require(l_Parent_0.CollectionViews);
local l_CollectionItemSize_0 = v34.CollectionViewTypes.CollectionItemSize;
local l_usePageSideMargin_0 = v34.usePageSideMargin;
local v37 = require(l_Parent_0.GameCollections);
local l_GameCollectionGrid_0 = v37.GameCollectionGrid;
local l_GameCollectionItemBuilder_0 = v37.GameCollectionItemBuilder;
local l_GameCollectionItemTypes_0 = v37.GameCollectionItemTypes;
local l_FIntLuaAppDelayImpressionsMaxUpdates_0 = require(l_Parent_0.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates;
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGameSortAnalyticFromSearch;
local l_FFlagLuaAppEnableCustomSpawnSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch;
local v47 = game:DefineFastFlag("LuaAppDefaultInitialItemsPerRowForSearch", false);
local v48 = if l_FFlagLuaAppSearchGridTiles_0 then {} else nil;
local v49 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
return function(v50) --[[ Line: 82 ]]
    -- upvalues: v28 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), v48 (copy), l_OmniFeedConstants_0 (copy), l_useTokens_0 (copy), l_useAppPolicy_0 (copy), v2 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), v30 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_CollectionItemSize_0 (copy), v22 (copy), l_usePageSideMargin_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v49 (copy), l_LayoutConfig_0 (copy), l_useResponsiveLayout_0 (copy), v47 (copy), v27 (copy), v7 (copy), v31 (copy), l_GameCollectionItemTypes_0 (copy), l_GameCollectionItemBuilder_0 (copy), l_AppPage_0 (copy), v33 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_SendGameImpressions_0 (copy), l_GameTileConstants_0 (copy), l_GameCollectionGrid_0 (copy), v32 (copy), l_SearchTypes_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), l_GameSortImpressionsDetector_0 (copy), v29 (copy), l_WaitForPropWrapper_0 (copy)
    local l_searchUuid_0 = v50.searchUuid;
    local l_feedItemPosition_0 = v50[v28.key].feedItemPosition;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    if l_FFlagLuaAppSearchGridTiles_0 then
        v53 = v50.topicLayoutData or v48;
        v54 = v53[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile];
        v55 = v53[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
        v56 = v55 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile;
        v57 = v53[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableCollectionGrid] or v56;
        v58 = l_useTokens_0();
        v59 = l_useAppPolicy_0(function(v61) --[[ Line: 103 ]]
            return v61.useGridPageLayout();
        end);
        local v62 = if not (not v56 or v54) and v59 then v58.Padding.XXLarge else nil;
        local l_v62_0 = v62 --[[ copy: 12 -> 55 ]];
        v60 = v2.useMemo(function() --[[ Line: 115 ]]
            -- upvalues: l_v62_0 (copy)
            return {
                verticalPadding = l_v62_0
            };
        end, {
            v62
        });
    end;
    local v64 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v65 = l_useRoactService_0(l_RoactAnalytics_0);
    local v66 = l_useRoactService_0(l_AppEventIngestService_0);
    local v67 = v2.useRef(nil);
    local v68 = if l_FFlagLuaAppSearchGridTiles_0 and v57 then nil else ("SearchResults_%*_%*_%*"):format(l_searchUuid_0, v50.topicId, l_feedItemPosition_0);
    local v70 = l_useSelector_0(function(v69) --[[ Line: 129 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v69.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v72 = l_useSelector_0(function(v71) --[[ Line: 132 ]]
        -- upvalues: v30 (ref)
        return v30(v71);
    end);
    local v74 = l_useSelector_0(function(v73) --[[ Line: 135 ]]
        return v73.ScreenSize;
    end);
    local v75 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v50[v28.key].sduiContext;
        local l_Small_0 = l_CollectionItemSize_0.Small;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 20 -> 53 ]];
        local l_l_Small_0_0 = l_Small_0 --[[ copy: 21 -> 54 ]];
        local v81 = v2.useCallback(function(v80) --[[ Line: 146 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_Small_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_Small_0_0)(v80).sideMargin;
        end, {
            l_Small_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v75 = v22.useSignalState(v81);
    else
        v75 = l_usePageSideMargin_0(v50[v28.key].verticalScrollingFrameRef.current);
    end;
    local v82, v83 = v2.useState(v74);
    local v84, v85 = v2.useState(Vector2.new(v74.X - 2 * v75, v74.Y));
    local function v90(v86) --[[ Line: 158 ]]
        -- upvalues: v50 (copy)
        local v87 = {};
        for _, v89 in ipairs(v86) do
            if v89.topicId == v50.topicId then
                table.insert(v87, v89);
            end;
        end;
        return v87;
    end;
    local v93 = v2.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: v70 (copy), v90 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v49 (ref)
        local v91 = false;
        local v92;
        if v70 then
            v92 = v90(v70.entries);
            v91 = v92;
        end;
        if not v91 then
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
                return v49;
            else
                v92 = {};
            end;
        end;
        v91 = false;
        return v92;
    end, {
        v70
    });
    local v94, v95 = v2.useState(v93);
    v2.useEffect(function() --[[ Line: 175 ]]
        -- upvalues: v95 (copy), v93 (copy)
        v95(v93);
    end, {
        v93
    });
    local function v98(v96) --[[ Line: 179 ]]
        -- upvalues: v84 (copy), v85 (copy)
        if v96 then
            local l_AbsoluteContentSize_0 = v96.AbsoluteContentSize;
            if v84.X == l_AbsoluteContentSize_0.X and v84.Y == l_AbsoluteContentSize_0.Y then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v85(l_AbsoluteContentSize_0);
            end;
        end;
    end;
    local function v100(v99) --[[ Line: 192 ]]
        -- upvalues: v83 (copy)
        if v99 then
            v83(v99.AbsoluteSize);
        end;
    end;
    if not l_FFlagLuaAppSearchGridTiles_0 then
        v53 = v50.topicLayoutData or {};
    end;
    local l_WithFooter_0 = l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v102 = l_useResponsiveLayout_0("columns", l_WithFooter_0);
    local v103, v104 = v2.useState(if v47 then v102 or 2 else v102);
    local function v106(v105) --[[ Line: 208 ]]
        -- upvalues: v104 (copy)
        v104(v105);
    end;
    local v107 = if v53.numOfRows and v53.numOfRows >= 0 then v53.numOfRows else 1e999;
    local v108 = ("%*_%*"):format(v50.topicId, l_searchUuid_0);
    local v109 = v27(v108, l_feedItemPosition_0, v103, v107, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v94 else nil) or {};
    local v110 = v70 and v70.emphasis or false;
    local v111 = false;
    if v109.firstIndex == 1 then
        v111 = v110;
    end;
    if v111 then
        v7.assert(v107 >= 2, "feed item with emphasis takes at least 2 rows");
    end;
    local v112 = v2.useMemo(function() --[[ Line: 233 ]]
        -- upvalues: v31 (ref), v94 (copy), v109 (copy), v110 (copy), v103 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v107 (copy)
        return v31(v94, v109, v110, v103, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v107 else nil);
    end, {
        v94, 
        v109, 
        v110, 
        v103, 
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v107 else nil
    });
    local v115 = if l_FFlagLuaAppSearchGridTiles_0 then v2.useMemo(function() --[[ Line: 254 ]]
        -- upvalues: v57 (ref), v111 (copy), l_GameCollectionItemTypes_0 (ref), l_GameCollectionItemBuilder_0 (ref), v112 (copy), v103 (copy), v59 (ref), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_AppPage_0 (ref)
        if not v57 then
            return nil;
        else
            local v113 = if v111 then {
                [1] = {
                    colSpan = 2, 
                    rowSpan = 2
                }
            } else nil;
            local v114 = if v111 then {
                [1] = l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile
            } else nil;
            return l_GameCollectionItemBuilder_0.BuildCollectionEntries(v112, v103, v113, v114, not v59, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then l_AppPage_0.SearchPage else nil, nil, nil);
        end;
    end, {
        v111, 
        v112, 
        v103, 
        v59, 
        v57
    }) else nil;
    local l_showHeader_0 = v53.showHeader;
    local v119 = v2.useMemo(function() --[[ Line: 296 ]]
        -- upvalues: v109 (copy), v112 (copy), v103 (copy), v107 (copy)
        if next(v109) == nil then
            return nil;
        else
            local v117 = if #v112 > 0 then v112[#v112].uiIndex else 0;
            local v118 = if v117 and v103 and v103 > 0 then math.ceil(v117 / v103) else 0;
            if not v107 or v107 < 0 or v118 < v107 then
                return v118;
            else
                return v107;
            end;
        end;
    end, {
        v109, 
        v112, 
        v103, 
        v107
    });
    local l_feedItemStartRow_0 = v50[v28.key].feedItemStartRow;
    v33(l_AppPage_0.SearchPage, v50.searchUuid, l_feedItemPosition_0, v119);
    local v123 = v2.useCallback(function(v121) --[[ Line: 327 ]]
        -- upvalues: l_feedItemStartRow_0 (copy), v103 (copy)
        if not v121 or not l_feedItemStartRow_0 or not v103 or v103 <= 0 then
            return nil;
        else
            local v122 = math.ceil(v121 / v103);
            return l_feedItemStartRow_0 + v122 - 1;
        end;
    end, {
        v103, 
        l_feedItemStartRow_0
    });
    local v133 = if l_FFlagLuaAppSearchGridTiles_0 and v57 then nil else function(v124) --[[ Line: 338 ]]
        -- upvalues: v112 (copy), v123 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), v64 (copy), v72 (copy), l_feedItemPosition_0 (copy), v50 (copy)
        local v125 = v112[v124];
        local v126 = v123(v125.uiIndex or v124);
        if v125 ~= nil then
            local v127 = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v125.placeIdOverride or v125.placeId else v125.placeId;
            local l_isSponsored_0 = v125.isSponsored;
            local l_adId_0 = v125.adId;
            local v130 = #v112;
            local l_universeId_0 = v125.universeId;
            local v132 = v125.topicContentsIndex or v124;
            v64.reportOpenGameDetailFromSearch(v127, v124, v130, l_isSponsored_0, l_adId_0, l_universeId_0, v72, l_feedItemPosition_0, v50.topicId, v126, v132);
        end;
    end;
    local v137 = if l_FFlagLuaAppSearchGridTiles_0 and v57 then nil else function(v134) --[[ Line: 371 ]]
        -- upvalues: v123 (copy), l_gamePlayIntent_0 (ref), v66 (copy), l_Context_0 (ref), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), l_feedItemPosition_0 (copy), v50 (copy), v72 (copy)
        local v135 = v123(v134.uiIndex or v134.index);
        local v136 = v134.topicContentsIndex or v134.index;
        l_gamePlayIntent_0(v66, l_Context_0.SearchExperienceTile, {
            placeId = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v134.placeIdOverride or v134.placeId else v134.placeId, 
            rootPlaceId = tonumber(v134.placeId), 
            sortEntryIndex = tostring(v134.index), 
            sortIndex = l_feedItemPosition_0, 
            gameSetTypeId = v50.topicId, 
            rowOnPage = v135, 
            topicDataPosition = v136, 
            universeId = v134.universeId, 
            nativeAdData = v134.adId, 
            pageName = v72, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v134.launchDataOverride else nil
        });
    end;
    local v140 = if l_FFlagLuaAppSearchGridTiles_0 and v57 then nil else function(v138) --[[ Line: 394 ]]
        -- upvalues: v70 (copy), l_searchUuid_0 (copy), v111 (copy), l_feedItemPosition_0 (copy), v50 (copy), l_SendGameImpressions_0 (ref), v66 (copy), v65 (copy), v112 (copy), l_AppPage_0 (ref), v103 (copy), l_feedItemStartRow_0 (copy)
        if not v70 then
            return;
        else
            local v139 = {
                searchUuid = l_searchUuid_0, 
                emphasisFlag = v111 and 1 or 0, 
                seeAllFlag = 1, 
                sortPos = l_feedItemPosition_0, 
                gameSetTypeId = v50.topicId
            };
            l_SendGameImpressions_0.sendFromSearch(v66, v65, v138, v112, l_AppPage_0.SearchPage, v139, v103, l_feedItemStartRow_0);
            return;
        end;
    end;
    local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v142 = if l_FFlagLuaAppSearchGridTiles_0 then v2.useMemo(function() --[[ Line: 421 ]]
        -- upvalues: l_searchUuid_0 (copy), v111 (copy)
        return {
            searchUuid = l_searchUuid_0, 
            hasEmphasizedTile = v111
        };
    end, {
        l_searchUuid_0, 
        v111
    }) else nil;
    local v143 = if l_FFlagLuaAppSearchGridTiles_0 and v57 then v2.createElement(l_GameCollectionGrid_0, {
        entries = v115, 
        headerComponent = if l_showHeader_0 then v2.createElement(v32, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Games
        }) else nil, 
        verticalScrollingFrameRef = v50[v28.key].verticalScrollingFrameRef, 
        maxNumRows = v107, 
        useGridTiles = v56, 
        gameSortId = v50.topicId, 
        sortIndex = l_feedItemPosition_0, 
        pageContext = l_AppPage_0.SearchPage, 
        scrollViewPositionChangedSignal = v50[v28.key].scrollViewPositionChangedSignal, 
        friendFooterEnabled = false, 
        playerCountStyle = l_Footer_0, 
        isSponsoredFooterAllowed = true, 
        componentType = v55, 
        gameTileLayoutType = v56 and "Wide" or "Narrow", 
        gridSupportAllowed = true, 
        isHoverSupportEnabled = true, 
        onItemsPerRowChanged = v106, 
        startRow = l_feedItemStartRow_0, 
        playButtonStyle = "Default", 
        sideMargin = v75, 
        shouldHideTileMetadata = false, 
        shouldHideTileTitle = false, 
        numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
        selectionOrderBase = v50[v28.key].selectionOrderBase, 
        searchParams = v142, 
        containedTile = v54, 
        layoutOverrides = v60, 
        launchExperienceEventContextOverride = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then l_Context_0.SearchExperienceTile else nil
    }) else nil;
    local v144 = if l_FFlagLuaAppSearchGridTiles_0 and v57 then nil else v2.createElement(l_GameSortImpressionsDetector_0, {
        parentRef = v67, 
        pageContext = l_AppPage_0.SearchPage, 
        impressionsTag = v68, 
        scrollViewPositionChangedSignal = v50[v28.key].scrollViewPositionChangedSignal, 
        sendGameImpressions = v140
    });
    return if l_FFlagLuaAppSearchGridTiles_0 and v57 then v143 else v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v100, 
        ref = v67
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16), 
            [v2.Change.AbsoluteContentSize] = v98
        }), 
        Padding = if #v112 == 0 then nil else v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v75), 
            PaddingRight = UDim.new(0, v75)
        }), 
        Header = if #v112 == 0 then nil else if l_showHeader_0 then v2.createElement(v32, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Games
        }) else nil, 
        GameGrid = v2.createElement(v29, {
            LayoutOrder = 2, 
            entries = v112, 
            source = "SearchResults", 
            reportGameDetailOpened = v133, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            windowSize = Vector2.new(v84.X, v82.Y), 
            screenSize = v74, 
            searchResultGrid = true, 
            gameEmphasis = v111, 
            currentSidePadding = v75, 
            scrollViewPositionChangedSignal = v50[v28.key].scrollViewPositionChangedSignal, 
            impressionsTag = v68, 
            reportExperienceLaunched = v137, 
            launchExperienceEventContext = l_Context_0.SearchExperienceTile, 
            onItemsPerRowChanged = v106, 
            playerCountStyle = l_Footer_0, 
            enableCollectionLayout = v53.enableCollectionLayout
        }), 
        GameSortImpressionsDetector = v2.createElement(l_WaitForPropWrapper_0, {
            waitForProp = l_feedItemStartRow_0, 
            maxUpdatesToDelay = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
            wrappedComponent = v144
        })
    });
end;