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
local l_FFlagLuaAppEnableCustomSpawnSearch_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local v48 = game:DefineFastFlag("LuaAppDefaultInitialItemsPerRowForSearch", false);
local v49 = {};
local v50 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
return function(v51) --[[ Line: 83 ]]
    -- upvalues: v28 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v49 (copy), l_OmniFeedConstants_0 (copy), l_useTokens_0 (copy), l_useAppPolicy_0 (copy), v2 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), v30 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_CollectionItemSize_0 (copy), v22 (copy), l_usePageSideMargin_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v50 (copy), l_LayoutConfig_0 (copy), l_useResponsiveLayout_0 (copy), v48 (copy), v27 (copy), v7 (copy), v31 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_GameCollectionItemBuilder_0 (copy), l_AppPage_0 (copy), v33 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_SendGameImpressions_0 (copy), l_GameTileConstants_0 (copy), l_GameCollectionGrid_0 (copy), v32 (copy), l_SearchTypes_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_GameSortImpressionsDetector_0 (copy), v29 (copy), l_WaitForPropWrapper_0 (copy)
    local l_searchUuid_0 = v51.searchUuid;
    local l_feedItemPosition_0 = v51[v28.key].feedItemPosition;
    local v54 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v51[v28.key].appCompositionEnabled else nil;
    local v55 = v51.topicLayoutData or v49;
    local v56 = v55[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile];
    local v57 = v55[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
    local v58 = v57 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile;
    local v59 = v55[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableCollectionGrid] or v58;
    local v60 = l_useTokens_0();
    local v62 = l_useAppPolicy_0(function(v61) --[[ Line: 99 ]]
        return v61.useGridPageLayout();
    end);
    local v63 = if not (not v58 or v56) and v62 then v60.Padding.XXLarge else nil;
    local v64 = v2.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: v63 (copy)
        return {
            verticalPadding = v63
        };
    end, {
        v63
    });
    local v65 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v66 = l_useRoactService_0(l_RoactAnalytics_0);
    local v67 = l_useRoactService_0(l_AppEventIngestService_0);
    local v68 = v2.useRef(nil);
    local v69 = if v59 then nil else ("SearchResults_%*_%*_%*"):format(l_searchUuid_0, v51.topicId, l_feedItemPosition_0);
    local v71 = l_useSelector_0(function(v70) --[[ Line: 124 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v70.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v73 = l_useSelector_0(function(v72) --[[ Line: 127 ]]
        -- upvalues: v30 (ref)
        return v30(v72);
    end);
    local v75 = l_useSelector_0(function(v74) --[[ Line: 130 ]]
        return v74.ScreenSize;
    end);
    local v76 = nil;
    if l_FFlagLuaAppCompositionAlways_0 then
        v76 = nil;
    elseif l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v51[v28.key].sduiContext;
        local l_Small_0 = l_CollectionItemSize_0.Small;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 22 -> 55 ]];
        local l_l_Small_0_0 = l_Small_0 --[[ copy: 23 -> 56 ]];
        local v82 = v2.useCallback(function(v81) --[[ Line: 143 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_Small_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_Small_0_0)(v81).sideMargin;
        end, {
            l_Small_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v76 = v22.useSignalState(v82);
    else
        v76 = l_usePageSideMargin_0(v51[v28.key].verticalScrollingFrameRef.current);
    end;
    local v83, v84 = v2.useState(v75);
    local v85, v86 = v2.useState(if v54 then v75 else Vector2.new(v75.X - 2 * v76, v75.Y));
    local function v91(v87) --[[ Line: 157 ]]
        -- upvalues: v51 (copy)
        local v88 = {};
        for _, v90 in ipairs(v87) do
            if v90.topicId == v51.topicId then
                table.insert(v88, v90);
            end;
        end;
        return v88;
    end;
    local v94 = v2.useMemo(function() --[[ Line: 167 ]]
        -- upvalues: v71 (copy), v91 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v50 (ref)
        local v92 = false;
        local v93;
        if v71 then
            v93 = v91(v71.entries);
            v92 = v93;
        end;
        if not v92 then
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
                return v50;
            else
                v93 = {};
            end;
        end;
        v92 = false;
        return v93;
    end, {
        v71
    });
    local v95, v96 = v2.useState(v94);
    v2.useEffect(function() --[[ Line: 174 ]]
        -- upvalues: v96 (copy), v94 (copy)
        v96(v94);
    end, {
        v94
    });
    local function v99(v97) --[[ Line: 178 ]]
        -- upvalues: v85 (copy), v86 (copy)
        if v97 then
            local l_AbsoluteContentSize_0 = v97.AbsoluteContentSize;
            if v85.X == l_AbsoluteContentSize_0.X and v85.Y == l_AbsoluteContentSize_0.Y then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v86(l_AbsoluteContentSize_0);
            end;
        end;
    end;
    local function v101(v100) --[[ Line: 191 ]]
        -- upvalues: v84 (copy)
        if v100 then
            v84(v100.AbsoluteSize);
        end;
    end;
    local l_WithFooter_0 = l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v103 = l_useResponsiveLayout_0("columns", l_WithFooter_0);
    local v104, v105 = v2.useState(if v48 then v103 or 2 else v103);
    local function v107(v106) --[[ Line: 203 ]]
        -- upvalues: v105 (copy)
        v105(v106);
    end;
    local v108 = if v55.numOfRows and v55.numOfRows >= 0 then v55.numOfRows else 1e999;
    local v109 = ("%*_%*"):format(v51.topicId, l_searchUuid_0);
    local v110 = v27(v109, l_feedItemPosition_0, v104, v108, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v95 else nil) or {};
    local v111 = v71 and v71.emphasis or false;
    local v112 = false;
    if v110.firstIndex == 1 then
        v112 = v111;
    end;
    if v112 then
        v7.assert(v108 >= 2, "feed item with emphasis takes at least 2 rows");
    end;
    local v116 = v2.useMemo(function() --[[ Line: 228 ]]
        -- upvalues: v31 (ref), v95 (copy), v110 (copy), v111 (copy), v104 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v108 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v59 (copy), v112 (copy), l_GameCollectionItemTypes_0 (ref)
        local v113 = v31(v95, v110, v111, v104, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v108 else nil);
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and not v59 then
            for v114, v115 in v113 do
                v115.tileType = if v112 and v114 == 1 then l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile else l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile;
            end;
        end;
        return v113;
    end, {
        v95, 
        v110, 
        v111, 
        v104, 
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v108 else nil, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v59 else nil, 
        if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v112 else nil
    });
    local v119 = v2.useMemo(function() --[[ Line: 262 ]]
        -- upvalues: v59 (copy), v112 (copy), l_GameCollectionItemTypes_0 (ref), l_GameCollectionItemBuilder_0 (ref), v116 (copy), v104 (copy), v62 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_AppPage_0 (ref)
        if not v59 then
            return nil;
        else
            local v117 = if v112 then {
                [1] = {
                    colSpan = 2, 
                    rowSpan = 2
                }
            } else nil;
            local v118 = if v112 then {
                [1] = l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile
            } else nil;
            return l_GameCollectionItemBuilder_0.BuildCollectionEntries(v116, v104, v117, v118, not v62, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then l_AppPage_0.SearchPage else nil, nil, nil);
        end;
    end, {
        v112, 
        v116, 
        v104, 
        v62, 
        v59
    });
    local l_showHeader_0 = v55.showHeader;
    local v123 = v2.useMemo(function() --[[ Line: 303 ]]
        -- upvalues: v110 (copy), v116 (copy), v104 (copy), v108 (copy)
        if next(v110) == nil then
            return nil;
        else
            local v121 = if #v116 > 0 then v116[#v116].uiIndex else 0;
            local v122 = if v121 and v104 and v104 > 0 then math.ceil(v121 / v104) else 0;
            if not v108 or v108 < 0 or v122 < v108 then
                return v122;
            else
                return v108;
            end;
        end;
    end, {
        v110, 
        v116, 
        v104, 
        v108
    });
    local l_feedItemStartRow_0 = v51[v28.key].feedItemStartRow;
    v33(l_AppPage_0.SearchPage, v51.searchUuid, l_feedItemPosition_0, v123);
    local v127 = v2.useCallback(function(v125) --[[ Line: 334 ]]
        -- upvalues: l_feedItemStartRow_0 (copy), v104 (copy)
        if not v125 or not l_feedItemStartRow_0 or not v104 or v104 <= 0 then
            return nil;
        else
            local v126 = math.ceil(v125 / v104);
            return l_feedItemStartRow_0 + v126 - 1;
        end;
    end, {
        v104, 
        l_feedItemStartRow_0
    });
    local v137 = if v59 then nil else function(v128) --[[ Line: 345 ]]
        -- upvalues: v116 (copy), v127 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), v65 (copy), v73 (copy), l_feedItemPosition_0 (copy), v51 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        local v129 = v116[v128];
        local v130 = v127(v129.uiIndex or v128);
        if v129 ~= nil then
            local v131 = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v129.placeIdOverride or v129.placeId else v129.placeId;
            local l_isSponsored_0 = v129.isSponsored;
            local l_adId_0 = v129.adId;
            local v134 = #v116;
            local l_universeId_0 = v129.universeId;
            local v136 = v129.topicContentsIndex or v128;
            v65.reportOpenGameDetailFromSearch(v131, v128, v134, l_isSponsored_0, l_adId_0, l_universeId_0, v73, l_feedItemPosition_0, v51.topicId, v130, v136, if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v129.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil);
        end;
    end;
    local v141 = if v59 then nil else function(v138) --[[ Line: 381 ]]
        -- upvalues: v127 (copy), l_gamePlayIntent_0 (ref), v67 (copy), l_Context_0 (ref), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), l_feedItemPosition_0 (copy), v51 (copy), v73 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref)
        local v139 = v127(v138.uiIndex or v138.index);
        local v140 = v138.topicContentsIndex or v138.index;
        l_gamePlayIntent_0(v67, l_Context_0.SearchExperienceTile, {
            placeId = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v138.placeIdOverride or v138.placeId else v138.placeId, 
            rootPlaceId = tonumber(v138.placeId), 
            sortEntryIndex = tostring(v138.index), 
            sortIndex = l_feedItemPosition_0, 
            gameSetTypeId = v51.topicId, 
            rowOnPage = v139, 
            topicDataPosition = v140, 
            universeId = v138.universeId, 
            nativeAdData = v138.adId, 
            pageName = v73, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v138.launchDataOverride else nil, 
            tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v138.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile else nil
        });
    end;
    local v144 = if v59 then nil else function(v142) --[[ Line: 407 ]]
        -- upvalues: v71 (copy), l_searchUuid_0 (copy), v112 (copy), l_feedItemPosition_0 (copy), v51 (copy), l_SendGameImpressions_0 (ref), v67 (copy), v66 (copy), v116 (copy), l_AppPage_0 (ref), v104 (copy), l_feedItemStartRow_0 (copy)
        if not v71 then
            return;
        else
            local v143 = {
                searchUuid = l_searchUuid_0, 
                emphasisFlag = v112 and 1 or 0, 
                seeAllFlag = 1, 
                sortPos = l_feedItemPosition_0, 
                gameSetTypeId = v51.topicId
            };
            l_SendGameImpressions_0.sendFromSearch(v67, v66, v142, v116, l_AppPage_0.SearchPage, v143, v104, l_feedItemStartRow_0);
            return;
        end;
    end;
    local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v146 = v2.useMemo(function() --[[ Line: 433 ]]
        -- upvalues: l_searchUuid_0 (copy), v112 (copy)
        return {
            searchUuid = l_searchUuid_0, 
            hasEmphasizedTile = v112
        };
    end, {
        l_searchUuid_0, 
        v112
    });
    local v147 = if v59 then v2.createElement(l_GameCollectionGrid_0, {
        entries = v119, 
        headerComponent = if l_showHeader_0 then v2.createElement(v32, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Games
        }) else nil, 
        verticalScrollingFrameRef = v51[v28.key].verticalScrollingFrameRef, 
        maxNumRows = v108, 
        useGridTiles = v58, 
        gameSortId = v51.topicId, 
        sortIndex = l_feedItemPosition_0, 
        pageContext = l_AppPage_0.SearchPage, 
        scrollViewPositionChangedSignal = v51[v28.key].scrollViewPositionChangedSignal, 
        friendFooterEnabled = false, 
        playerCountStyle = l_Footer_0, 
        isSponsoredFooterAllowed = true, 
        componentType = v57, 
        gameTileLayoutType = v58 and "Wide" or "Narrow", 
        gridSupportAllowed = true, 
        isHoverSupportEnabled = true, 
        onItemsPerRowChanged = v107, 
        startRow = l_feedItemStartRow_0, 
        playButtonStyle = "Default", 
        sideMargin = if v54 then nil else v76, 
        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v54 else nil, 
        shouldHideTileMetadata = false, 
        shouldHideTileTitle = false, 
        numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
        selectionOrderBase = v51[v28.key].selectionOrderBase, 
        searchParams = v146, 
        containedTile = v56, 
        layoutOverrides = if v54 then nil else v64, 
        launchExperienceEventContextOverride = l_Context_0.SearchExperienceTile
    }) else nil;
    local v148 = if v59 then nil else v2.createElement(l_GameSortImpressionsDetector_0, {
        parentRef = v68, 
        pageContext = l_AppPage_0.SearchPage, 
        impressionsTag = v69, 
        scrollViewPositionChangedSignal = v51[v28.key].scrollViewPositionChangedSignal, 
        sendGameImpressions = v144
    });
    if v59 then
        return v147;
    else
        return (v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            [v2.Change.AbsoluteSize] = v101, 
            ref = v68
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 16), 
                [v2.Change.AbsoluteContentSize] = v99
            }), 
            Padding = if not (#v116 ~= 0) or v54 then nil else v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v76), 
                PaddingRight = UDim.new(0, v76)
            }), 
            Header = if #v116 == 0 then nil else if l_showHeader_0 then v2.createElement(v32, {
                LayoutOrder = 1, 
                selectionType = l_SearchTypes_0.Games
            }) else nil, 
            GameGrid = v2.createElement(v29, {
                LayoutOrder = 2, 
                entries = v116, 
                source = "SearchResults", 
                reportGameDetailOpened = v137, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                windowSize = Vector2.new(v85.X, v83.Y), 
                screenSize = v75, 
                searchResultGrid = true, 
                gameEmphasis = v112, 
                currentSidePadding = v76, 
                scrollViewPositionChangedSignal = v51[v28.key].scrollViewPositionChangedSignal, 
                impressionsTag = v69, 
                reportExperienceLaunched = v141, 
                launchExperienceEventContext = l_Context_0.SearchExperienceTile, 
                onItemsPerRowChanged = v107, 
                playerCountStyle = l_Footer_0, 
                enableCollectionLayout = v55.enableCollectionLayout
            }), 
            GameSortImpressionsDetector = v2.createElement(l_WaitForPropWrapper_0, {
                waitForProp = l_feedItemStartRow_0, 
                maxUpdatesToDelay = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
                wrappedComponent = v148
            })
        }));
    end;
end;