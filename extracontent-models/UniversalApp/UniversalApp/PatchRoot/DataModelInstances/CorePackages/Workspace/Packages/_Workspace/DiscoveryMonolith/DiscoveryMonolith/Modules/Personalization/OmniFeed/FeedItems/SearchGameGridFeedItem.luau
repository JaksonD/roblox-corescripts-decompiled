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
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixGameSortAnalyticFromSearch;
local l_FFlagLuaAppEnableCustomSpawnSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local v49 = game:DefineFastFlag("LuaAppDefaultInitialItemsPerRowForSearch", false);
local v50 = {};
local v51 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
return function(v52) --[[ Line: 84 ]]
    -- upvalues: v28 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v50 (copy), l_OmniFeedConstants_0 (copy), l_useTokens_0 (copy), l_useAppPolicy_0 (copy), v2 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), v30 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_CollectionItemSize_0 (copy), v22 (copy), l_usePageSideMargin_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v51 (copy), l_LayoutConfig_0 (copy), l_useResponsiveLayout_0 (copy), v49 (copy), v27 (copy), v7 (copy), v31 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GameCollectionItemBuilder_0 (copy), l_AppPage_0 (copy), v33 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_SendGameImpressions_0 (copy), l_GameTileConstants_0 (copy), l_GameCollectionGrid_0 (copy), v32 (copy), l_SearchTypes_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), l_GameSortImpressionsDetector_0 (copy), v29 (copy), l_WaitForPropWrapper_0 (copy)
    local l_searchUuid_0 = v52.searchUuid;
    local l_feedItemPosition_0 = v52[v28.key].feedItemPosition;
    local v55 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v52[v28.key].appCompositionEnabled else nil;
    local v56 = v52.topicLayoutData or v50;
    local v57 = v56[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile];
    local v58 = v56[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
    local v59 = v58 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile;
    local v60 = v56[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableCollectionGrid] or v59;
    local v61 = l_useTokens_0();
    local v63 = l_useAppPolicy_0(function(v62) --[[ Line: 100 ]]
        return v62.useGridPageLayout();
    end);
    local v64 = if not (not v59 or v57) and v63 then v61.Padding.XXLarge else nil;
    local v65 = v2.useMemo(function() --[[ Line: 112 ]]
        -- upvalues: v64 (copy)
        return {
            verticalPadding = v64
        };
    end, {
        v64
    });
    local v66 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v67 = l_useRoactService_0(l_RoactAnalytics_0);
    local v68 = l_useRoactService_0(l_AppEventIngestService_0);
    local v69 = v2.useRef(nil);
    local v70 = if v60 then nil else ("SearchResults_%*_%*_%*"):format(l_searchUuid_0, v52.topicId, l_feedItemPosition_0);
    local v72 = l_useSelector_0(function(v71) --[[ Line: 125 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v71.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v74 = l_useSelector_0(function(v73) --[[ Line: 128 ]]
        -- upvalues: v30 (ref)
        return v30(v73);
    end);
    local v76 = l_useSelector_0(function(v75) --[[ Line: 131 ]]
        return v75.ScreenSize;
    end);
    local v77 = nil;
    if l_FFlagLuaAppCompositionAlways_0 then
        v77 = nil;
    elseif l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v52[v28.key].sduiContext;
        local l_Small_0 = l_CollectionItemSize_0.Small;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 22 -> 55 ]];
        local l_l_Small_0_0 = l_Small_0 --[[ copy: 23 -> 56 ]];
        local v83 = v2.useCallback(function(v82) --[[ Line: 144 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_Small_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_Small_0_0)(v82).sideMargin;
        end, {
            l_Small_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v77 = v22.useSignalState(v83);
    else
        v77 = l_usePageSideMargin_0(v52[v28.key].verticalScrollingFrameRef.current);
    end;
    local v84, v85 = v2.useState(v76);
    local v86, v87 = v2.useState(if v55 then v76 else Vector2.new(v76.X - 2 * v77, v76.Y));
    local function v92(v88) --[[ Line: 158 ]]
        -- upvalues: v52 (copy)
        local v89 = {};
        for _, v91 in ipairs(v88) do
            if v91.topicId == v52.topicId then
                table.insert(v89, v91);
            end;
        end;
        return v89;
    end;
    local v95 = v2.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: v72 (copy), v92 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v51 (ref)
        local v93 = false;
        local v94;
        if v72 then
            v94 = v92(v72.entries);
            v93 = v94;
        end;
        if not v93 then
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
                return v51;
            else
                v94 = {};
            end;
        end;
        v93 = false;
        return v94;
    end, {
        v72
    });
    local v96, v97 = v2.useState(v95);
    v2.useEffect(function() --[[ Line: 175 ]]
        -- upvalues: v97 (copy), v95 (copy)
        v97(v95);
    end, {
        v95
    });
    local function v100(v98) --[[ Line: 179 ]]
        -- upvalues: v86 (copy), v87 (copy)
        if v98 then
            local l_AbsoluteContentSize_0 = v98.AbsoluteContentSize;
            if v86.X == l_AbsoluteContentSize_0.X and v86.Y == l_AbsoluteContentSize_0.Y then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v87(l_AbsoluteContentSize_0);
            end;
        end;
    end;
    local function v102(v101) --[[ Line: 192 ]]
        -- upvalues: v85 (copy)
        if v101 then
            v85(v101.AbsoluteSize);
        end;
    end;
    local l_WithFooter_0 = l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v104 = l_useResponsiveLayout_0("columns", l_WithFooter_0);
    local v105, v106 = v2.useState(if v49 then v104 or 2 else v104);
    local function v108(v107) --[[ Line: 204 ]]
        -- upvalues: v106 (copy)
        v106(v107);
    end;
    local v109 = if v56.numOfRows and v56.numOfRows >= 0 then v56.numOfRows else 1e999;
    local v110 = ("%*_%*"):format(v52.topicId, l_searchUuid_0);
    local v111 = v27(v110, l_feedItemPosition_0, v105, v109, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v96 else nil) or {};
    local v112 = v72 and v72.emphasis or false;
    local v113 = false;
    if v111.firstIndex == 1 then
        v113 = v112;
    end;
    if v113 then
        v7.assert(v109 >= 2, "feed item with emphasis takes at least 2 rows");
    end;
    local v117 = v2.useMemo(function() --[[ Line: 229 ]]
        -- upvalues: v31 (ref), v96 (copy), v111 (copy), v112 (copy), v105 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v109 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v60 (copy), v113 (copy), l_GameCollectionItemTypes_0 (ref)
        local v114 = v31(v96, v111, v112, v105, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v109 else nil);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and not v60 then
            for v115, v116 in v114 do
                v116.tileType = if v113 and v115 == 1 then l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile else l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile;
            end;
        end;
        return v114;
    end, {
        v96, 
        v111, 
        v112, 
        v105, 
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v109 else nil, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v60 else nil, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v113 else nil
    });
    local v120 = v2.useMemo(function() --[[ Line: 263 ]]
        -- upvalues: v60 (copy), v113 (copy), l_GameCollectionItemTypes_0 (ref), l_GameCollectionItemBuilder_0 (ref), v117 (copy), v105 (copy), v63 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_AppPage_0 (ref)
        if not v60 then
            return nil;
        else
            local v118 = if v113 then {
                [1] = {
                    colSpan = 2, 
                    rowSpan = 2
                }
            } else nil;
            local v119 = if v113 then {
                [1] = l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile
            } else nil;
            return l_GameCollectionItemBuilder_0.BuildCollectionEntries(v117, v105, v118, v119, not v63, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then l_AppPage_0.SearchPage else nil, nil, nil);
        end;
    end, {
        v113, 
        v117, 
        v105, 
        v63, 
        v60
    });
    local l_showHeader_0 = v56.showHeader;
    local v124 = v2.useMemo(function() --[[ Line: 304 ]]
        -- upvalues: v111 (copy), v117 (copy), v105 (copy), v109 (copy)
        if next(v111) == nil then
            return nil;
        else
            local v122 = if #v117 > 0 then v117[#v117].uiIndex else 0;
            local v123 = if v122 and v105 and v105 > 0 then math.ceil(v122 / v105) else 0;
            if not v109 or v109 < 0 or v123 < v109 then
                return v123;
            else
                return v109;
            end;
        end;
    end, {
        v111, 
        v117, 
        v105, 
        v109
    });
    local l_feedItemStartRow_0 = v52[v28.key].feedItemStartRow;
    v33(l_AppPage_0.SearchPage, v52.searchUuid, l_feedItemPosition_0, v124);
    local v128 = v2.useCallback(function(v126) --[[ Line: 335 ]]
        -- upvalues: l_feedItemStartRow_0 (copy), v105 (copy)
        if not v126 or not l_feedItemStartRow_0 or not v105 or v105 <= 0 then
            return nil;
        else
            local v127 = math.ceil(v126 / v105);
            return l_feedItemStartRow_0 + v127 - 1;
        end;
    end, {
        v105, 
        l_feedItemStartRow_0
    });
    local v138 = if v60 then nil else function(v129) --[[ Line: 346 ]]
        -- upvalues: v117 (copy), v128 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), v66 (copy), v74 (copy), l_feedItemPosition_0 (copy), v52 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        local v130 = v117[v129];
        local v131 = v128(v130.uiIndex or v129);
        if v130 ~= nil then
            local v132 = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v130.placeIdOverride or v130.placeId else v130.placeId;
            local l_isSponsored_0 = v130.isSponsored;
            local l_adId_0 = v130.adId;
            local v135 = #v117;
            local l_universeId_0 = v130.universeId;
            local v137 = v130.topicContentsIndex or v129;
            v66.reportOpenGameDetailFromSearch(v132, v129, v135, l_isSponsored_0, l_adId_0, l_universeId_0, v74, l_feedItemPosition_0, v52.topicId, v131, v137, if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v130.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil);
        end;
    end;
    local v142 = if v60 then nil else function(v139) --[[ Line: 382 ]]
        -- upvalues: v128 (copy), l_gamePlayIntent_0 (ref), v68 (copy), l_Context_0 (ref), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), l_feedItemPosition_0 (copy), v52 (copy), v74 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        local v140 = v128(v139.uiIndex or v139.index);
        local v141 = v139.topicContentsIndex or v139.index;
        l_gamePlayIntent_0(v68, l_Context_0.SearchExperienceTile, {
            placeId = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v139.placeIdOverride or v139.placeId else v139.placeId, 
            rootPlaceId = tonumber(v139.placeId), 
            sortEntryIndex = tostring(v139.index), 
            sortIndex = l_feedItemPosition_0, 
            gameSetTypeId = v52.topicId, 
            rowOnPage = v140, 
            topicDataPosition = v141, 
            universeId = v139.universeId, 
            nativeAdData = v139.adId, 
            pageName = v74, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v139.launchDataOverride else nil, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v139.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil
        });
    end;
    local v145 = if v60 then nil else function(v143) --[[ Line: 408 ]]
        -- upvalues: v72 (copy), l_searchUuid_0 (copy), v113 (copy), l_feedItemPosition_0 (copy), v52 (copy), l_SendGameImpressions_0 (ref), v68 (copy), v67 (copy), v117 (copy), l_AppPage_0 (ref), v105 (copy), l_feedItemStartRow_0 (copy)
        if not v72 then
            return;
        else
            local v144 = {
                searchUuid = l_searchUuid_0, 
                emphasisFlag = v113 and 1 or 0, 
                seeAllFlag = 1, 
                sortPos = l_feedItemPosition_0, 
                gameSetTypeId = v52.topicId
            };
            l_SendGameImpressions_0.sendFromSearch(v68, v67, v143, v117, l_AppPage_0.SearchPage, v144, v105, l_feedItemStartRow_0);
            return;
        end;
    end;
    local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v147 = v2.useMemo(function() --[[ Line: 434 ]]
        -- upvalues: l_searchUuid_0 (copy), v113 (copy)
        return {
            searchUuid = l_searchUuid_0, 
            hasEmphasizedTile = v113
        };
    end, {
        l_searchUuid_0, 
        v113
    });
    local v148 = if v60 then v2.createElement(l_GameCollectionGrid_0, {
        entries = v120, 
        headerComponent = if l_showHeader_0 then v2.createElement(v32, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Games
        }) else nil, 
        verticalScrollingFrameRef = v52[v28.key].verticalScrollingFrameRef, 
        maxNumRows = v109, 
        useGridTiles = v59, 
        gameSortId = v52.topicId, 
        sortIndex = l_feedItemPosition_0, 
        pageContext = l_AppPage_0.SearchPage, 
        scrollViewPositionChangedSignal = v52[v28.key].scrollViewPositionChangedSignal, 
        friendFooterEnabled = false, 
        playerCountStyle = l_Footer_0, 
        isSponsoredFooterAllowed = true, 
        componentType = v58, 
        gameTileLayoutType = v59 and "Wide" or "Narrow", 
        gridSupportAllowed = true, 
        isHoverSupportEnabled = true, 
        onItemsPerRowChanged = v108, 
        startRow = l_feedItemStartRow_0, 
        playButtonStyle = "Default", 
        sideMargin = if v55 then nil else v77, 
        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v55 else nil, 
        shouldHideTileMetadata = false, 
        shouldHideTileTitle = false, 
        numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
        selectionOrderBase = v52[v28.key].selectionOrderBase, 
        searchParams = v147, 
        containedTile = v57, 
        layoutOverrides = if v55 then nil else v65, 
        launchExperienceEventContextOverride = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then l_Context_0.SearchExperienceTile else nil
    }) else nil;
    local v149 = if v60 then nil else v2.createElement(l_GameSortImpressionsDetector_0, {
        parentRef = v69, 
        pageContext = l_AppPage_0.SearchPage, 
        impressionsTag = v70, 
        scrollViewPositionChangedSignal = v52[v28.key].scrollViewPositionChangedSignal, 
        sendGameImpressions = v145
    });
    if v60 then
        return v148;
    else
        return (v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            [v2.Change.AbsoluteSize] = v102, 
            ref = v69
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 16), 
                [v2.Change.AbsoluteContentSize] = v100
            }), 
            Padding = if not (#v117 ~= 0) or v55 then nil else v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v77), 
                PaddingRight = UDim.new(0, v77)
            }), 
            Header = if #v117 == 0 then nil else if l_showHeader_0 then v2.createElement(v32, {
                LayoutOrder = 1, 
                selectionType = l_SearchTypes_0.Games
            }) else nil, 
            GameGrid = v2.createElement(v29, {
                LayoutOrder = 2, 
                entries = v117, 
                source = "SearchResults", 
                reportGameDetailOpened = v138, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                windowSize = Vector2.new(v86.X, v84.Y), 
                screenSize = v76, 
                searchResultGrid = true, 
                gameEmphasis = v113, 
                currentSidePadding = v77, 
                scrollViewPositionChangedSignal = v52[v28.key].scrollViewPositionChangedSignal, 
                impressionsTag = v70, 
                reportExperienceLaunched = v142, 
                launchExperienceEventContext = l_Context_0.SearchExperienceTile, 
                onItemsPerRowChanged = v108, 
                playerCountStyle = l_Footer_0, 
                enableCollectionLayout = v56.enableCollectionLayout
            }), 
            GameSortImpressionsDetector = v2.createElement(l_WaitForPropWrapper_0, {
                waitForProp = l_feedItemStartRow_0, 
                maxUpdatesToDelay = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
                wrappedComponent = v149
            })
        }));
    end;
end;