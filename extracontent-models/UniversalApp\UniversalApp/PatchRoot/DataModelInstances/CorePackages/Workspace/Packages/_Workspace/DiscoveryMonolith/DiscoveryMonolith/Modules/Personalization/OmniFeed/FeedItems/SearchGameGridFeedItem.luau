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
local v46 = game:DefineFastFlag("LuaAppDefaultInitialItemsPerRowForSearch", false);
local v47 = {};
local v48 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
return function(v49) --[[ Line: 81 ]]
    -- upvalues: v28 (copy), v47 (copy), l_OmniFeedConstants_0 (copy), l_useTokens_0 (copy), l_useAppPolicy_0 (copy), v2 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), v30 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_CollectionItemSize_0 (copy), v22 (copy), l_usePageSideMargin_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), v48 (copy), l_LayoutConfig_0 (copy), l_useResponsiveLayout_0 (copy), v46 (copy), v27 (copy), v7 (copy), v31 (copy), l_GameCollectionItemTypes_0 (copy), l_GameCollectionItemBuilder_0 (copy), l_AppPage_0 (copy), v33 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (copy), l_gamePlayIntent_0 (copy), l_Context_0 (copy), l_SendGameImpressions_0 (copy), l_GameTileConstants_0 (copy), l_GameCollectionGrid_0 (copy), v32 (copy), l_SearchTypes_0 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 (copy), l_GameSortImpressionsDetector_0 (copy), v29 (copy), l_WaitForPropWrapper_0 (copy)
    local l_searchUuid_0 = v49.searchUuid;
    local l_feedItemPosition_0 = v49[v28.key].feedItemPosition;
    local v52 = v49.topicLayoutData or v47;
    local v53 = v52[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile];
    local v54 = v52[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
    local v55 = v54 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile;
    local v56 = v52[l_OmniFeedConstants_0.TopicLayoutDataKeys.EnableCollectionGrid] or v55;
    local v57 = l_useTokens_0();
    local v59 = l_useAppPolicy_0(function(v58) --[[ Line: 93 ]]
        return v58.useGridPageLayout();
    end);
    local v60 = if not (not v55 or v53) and v59 then v57.Padding.XXLarge else nil;
    local v61 = v2.useMemo(function() --[[ Line: 105 ]]
        -- upvalues: v60 (copy)
        return {
            verticalPadding = v60
        };
    end, {
        v60
    });
    local v62 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v63 = l_useRoactService_0(l_RoactAnalytics_0);
    local v64 = l_useRoactService_0(l_AppEventIngestService_0);
    local v65 = v2.useRef(nil);
    local v66 = if v56 then nil else ("SearchResults_%*_%*_%*"):format(l_searchUuid_0, v49.topicId, l_feedItemPosition_0);
    local v68 = l_useSelector_0(function(v67) --[[ Line: 118 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v67.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v70 = l_useSelector_0(function(v69) --[[ Line: 121 ]]
        -- upvalues: v30 (ref)
        return v30(v69);
    end);
    local v72 = l_useSelector_0(function(v71) --[[ Line: 124 ]]
        return v71.ScreenSize;
    end);
    local v73 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v49[v28.key].sduiContext;
        local l_Small_0 = l_CollectionItemSize_0.Small;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 21 -> 54 ]];
        local l_l_Small_0_0 = l_Small_0 --[[ copy: 22 -> 55 ]];
        local v79 = v2.useCallback(function(v78) --[[ Line: 135 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_Small_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_Small_0_0)(v78).sideMargin;
        end, {
            l_Small_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v73 = v22.useSignalState(v79);
    else
        v73 = l_usePageSideMargin_0(v49[v28.key].verticalScrollingFrameRef.current);
    end;
    local v80, v81 = v2.useState(v72);
    local v82, v83 = v2.useState(Vector2.new(v72.X - 2 * v73, v72.Y));
    local function v88(v84) --[[ Line: 147 ]]
        -- upvalues: v49 (copy)
        local v85 = {};
        for _, v87 in ipairs(v84) do
            if v87.topicId == v49.topicId then
                table.insert(v85, v87);
            end;
        end;
        return v85;
    end;
    local v91 = v2.useMemo(function() --[[ Line: 157 ]]
        -- upvalues: v68 (copy), v88 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v48 (ref)
        local v89 = false;
        local v90;
        if v68 then
            v90 = v88(v68.entries);
            v89 = v90;
        end;
        if not v89 then
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then
                return v48;
            else
                v90 = {};
            end;
        end;
        v89 = false;
        return v90;
    end, {
        v68
    });
    local v92, v93 = v2.useState(v91);
    v2.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: v93 (copy), v91 (copy)
        v93(v91);
    end, {
        v91
    });
    local function v96(v94) --[[ Line: 168 ]]
        -- upvalues: v82 (copy), v83 (copy)
        if v94 then
            local l_AbsoluteContentSize_0 = v94.AbsoluteContentSize;
            if v82.X == l_AbsoluteContentSize_0.X and v82.Y == l_AbsoluteContentSize_0.Y then
                return;
            elseif l_AbsoluteContentSize_0.X > 0 and l_AbsoluteContentSize_0.Y > 0 then
                v83(l_AbsoluteContentSize_0);
            end;
        end;
    end;
    local function v98(v97) --[[ Line: 181 ]]
        -- upvalues: v81 (copy)
        if v97 then
            v81(v97.AbsoluteSize);
        end;
    end;
    local l_WithFooter_0 = l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v100 = l_useResponsiveLayout_0("columns", l_WithFooter_0);
    local v101, v102 = v2.useState(if v46 then v100 or 2 else v100);
    local function v104(v103) --[[ Line: 193 ]]
        -- upvalues: v102 (copy)
        v102(v103);
    end;
    local v105 = if v52.numOfRows and v52.numOfRows >= 0 then v52.numOfRows else 1e999;
    local v106 = ("%*_%*"):format(v49.topicId, l_searchUuid_0);
    local v107 = v27(v106, l_feedItemPosition_0, v101, v105, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v92 else nil) or {};
    local v108 = v68 and v68.emphasis or false;
    local v109 = false;
    if v107.firstIndex == 1 then
        v109 = v108;
    end;
    if v109 then
        v7.assert(v105 >= 2, "feed item with emphasis takes at least 2 rows");
    end;
    local v110 = v2.useMemo(function() --[[ Line: 218 ]]
        -- upvalues: v31 (ref), v92 (copy), v107 (copy), v108 (copy), v101 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v105 (copy)
        return v31(v92, v107, v108, v101, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v105 else nil);
    end, {
        v92, 
        v107, 
        v108, 
        v101, 
        if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v105 else nil
    });
    local v113 = v2.useMemo(function() --[[ Line: 238 ]]
        -- upvalues: v56 (copy), v109 (copy), l_GameCollectionItemTypes_0 (ref), l_GameCollectionItemBuilder_0 (ref), v110 (copy), v101 (copy), v59 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_AppPage_0 (ref)
        if not v56 then
            return nil;
        else
            local v111 = if v109 then {
                [1] = {
                    colSpan = 2, 
                    rowSpan = 2
                }
            } else nil;
            local v112 = if v109 then {
                [1] = l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile
            } else nil;
            return l_GameCollectionItemBuilder_0.BuildCollectionEntries(v110, v101, v111, v112, not v59, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then l_AppPage_0.SearchPage else nil, nil, nil);
        end;
    end, {
        v109, 
        v110, 
        v101, 
        v59, 
        v56
    });
    local l_showHeader_0 = v52.showHeader;
    local v117 = v2.useMemo(function() --[[ Line: 279 ]]
        -- upvalues: v107 (copy), v110 (copy), v101 (copy), v105 (copy)
        if next(v107) == nil then
            return nil;
        else
            local v115 = if #v110 > 0 then v110[#v110].uiIndex else 0;
            local v116 = if v115 and v101 and v101 > 0 then math.ceil(v115 / v101) else 0;
            if not v105 or v105 < 0 or v116 < v105 then
                return v116;
            else
                return v105;
            end;
        end;
    end, {
        v107, 
        v110, 
        v101, 
        v105
    });
    local l_feedItemStartRow_0 = v49[v28.key].feedItemStartRow;
    v33(l_AppPage_0.SearchPage, v49.searchUuid, l_feedItemPosition_0, v117);
    local v121 = v2.useCallback(function(v119) --[[ Line: 310 ]]
        -- upvalues: l_feedItemStartRow_0 (copy), v101 (copy)
        if not v119 or not l_feedItemStartRow_0 or not v101 or v101 <= 0 then
            return nil;
        else
            local v120 = math.ceil(v119 / v101);
            return l_feedItemStartRow_0 + v120 - 1;
        end;
    end, {
        v101, 
        l_feedItemStartRow_0
    });
    local v131 = if v56 then nil else function(v122) --[[ Line: 321 ]]
        -- upvalues: v110 (copy), v121 (copy), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), v62 (copy), v70 (copy), l_feedItemPosition_0 (copy), v49 (copy)
        local v123 = v110[v122];
        local v124 = v121(v123.uiIndex or v122);
        if v123 ~= nil then
            local v125 = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v123.placeIdOverride or v123.placeId else v123.placeId;
            local l_isSponsored_0 = v123.isSponsored;
            local l_adId_0 = v123.adId;
            local v128 = #v110;
            local l_universeId_0 = v123.universeId;
            local v130 = v123.topicContentsIndex or v122;
            v62.reportOpenGameDetailFromSearch(v125, v122, v128, l_isSponsored_0, l_adId_0, l_universeId_0, v70, l_feedItemPosition_0, v49.topicId, v124, v130);
        end;
    end;
    local v135 = if v56 then nil else function(v132) --[[ Line: 354 ]]
        -- upvalues: v121 (copy), l_gamePlayIntent_0 (ref), v64 (copy), l_Context_0 (ref), l_FFlagLuaAppEnableCustomSpawnSearch_0 (ref), l_feedItemPosition_0 (copy), v49 (copy), v70 (copy)
        local v133 = v121(v132.uiIndex or v132.index);
        local v134 = v132.topicContentsIndex or v132.index;
        l_gamePlayIntent_0(v64, l_Context_0.SearchExperienceTile, {
            placeId = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v132.placeIdOverride or v132.placeId else v132.placeId, 
            rootPlaceId = tonumber(v132.placeId), 
            sortEntryIndex = tostring(v132.index), 
            sortIndex = l_feedItemPosition_0, 
            gameSetTypeId = v49.topicId, 
            rowOnPage = v133, 
            topicDataPosition = v134, 
            universeId = v132.universeId, 
            nativeAdData = v132.adId, 
            pageName = v70, 
            launchData = if l_FFlagLuaAppEnableCustomSpawnSearch_0 then v132.launchDataOverride else nil
        });
    end;
    local v138 = if v56 then nil else function(v136) --[[ Line: 377 ]]
        -- upvalues: v68 (copy), l_searchUuid_0 (copy), v109 (copy), l_feedItemPosition_0 (copy), v49 (copy), l_SendGameImpressions_0 (ref), v64 (copy), v63 (copy), v110 (copy), l_AppPage_0 (ref), v101 (copy), l_feedItemStartRow_0 (copy)
        if not v68 then
            return;
        else
            local v137 = {
                searchUuid = l_searchUuid_0, 
                emphasisFlag = v109 and 1 or 0, 
                seeAllFlag = 1, 
                sortPos = l_feedItemPosition_0, 
                gameSetTypeId = v49.topicId
            };
            l_SendGameImpressions_0.sendFromSearch(v64, v63, v136, v110, l_AppPage_0.SearchPage, v137, v101, l_feedItemStartRow_0);
            return;
        end;
    end;
    local l_Footer_0 = l_GameTileConstants_0.PlayerCountStyleValues.Footer;
    local v140 = v2.useMemo(function() --[[ Line: 403 ]]
        -- upvalues: l_searchUuid_0 (copy), v109 (copy)
        return {
            searchUuid = l_searchUuid_0, 
            hasEmphasizedTile = v109
        };
    end, {
        l_searchUuid_0, 
        v109
    });
    local v141 = if v56 then v2.createElement(l_GameCollectionGrid_0, {
        entries = v113, 
        headerComponent = if l_showHeader_0 then v2.createElement(v32, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Games
        }) else nil, 
        verticalScrollingFrameRef = v49[v28.key].verticalScrollingFrameRef, 
        maxNumRows = v105, 
        useGridTiles = v55, 
        gameSortId = v49.topicId, 
        sortIndex = l_feedItemPosition_0, 
        pageContext = l_AppPage_0.SearchPage, 
        scrollViewPositionChangedSignal = v49[v28.key].scrollViewPositionChangedSignal, 
        friendFooterEnabled = false, 
        playerCountStyle = l_Footer_0, 
        isSponsoredFooterAllowed = true, 
        componentType = v54, 
        gameTileLayoutType = v55 and "Wide" or "Narrow", 
        gridSupportAllowed = true, 
        isHoverSupportEnabled = true, 
        onItemsPerRowChanged = v104, 
        startRow = l_feedItemStartRow_0, 
        playButtonStyle = "Default", 
        sideMargin = v73, 
        shouldHideTileMetadata = false, 
        shouldHideTileTitle = false, 
        numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
        selectionOrderBase = v49[v28.key].selectionOrderBase, 
        searchParams = v140, 
        containedTile = v53, 
        layoutOverrides = v61, 
        launchExperienceEventContextOverride = if l_FFlagLuaAppFixGameSortAnalyticFromSearch_0 then l_Context_0.SearchExperienceTile else nil
    }) else nil;
    local v142 = if v56 then nil else v2.createElement(l_GameSortImpressionsDetector_0, {
        parentRef = v65, 
        pageContext = l_AppPage_0.SearchPage, 
        impressionsTag = v66, 
        scrollViewPositionChangedSignal = v49[v28.key].scrollViewPositionChangedSignal, 
        sendGameImpressions = v138
    });
    if v56 then
        return v141;
    else
        return (v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            [v2.Change.AbsoluteSize] = v98, 
            ref = v65
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 16), 
                [v2.Change.AbsoluteContentSize] = v96
            }), 
            Padding = if #v110 == 0 then nil else v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v73), 
                PaddingRight = UDim.new(0, v73)
            }), 
            Header = if #v110 == 0 then nil else if l_showHeader_0 then v2.createElement(v32, {
                LayoutOrder = 1, 
                selectionType = l_SearchTypes_0.Games
            }) else nil, 
            GameGrid = v2.createElement(v29, {
                LayoutOrder = 2, 
                entries = v110, 
                source = "SearchResults", 
                reportGameDetailOpened = v131, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                windowSize = Vector2.new(v82.X, v80.Y), 
                screenSize = v72, 
                searchResultGrid = true, 
                gameEmphasis = v109, 
                currentSidePadding = v73, 
                scrollViewPositionChangedSignal = v49[v28.key].scrollViewPositionChangedSignal, 
                impressionsTag = v66, 
                reportExperienceLaunched = v135, 
                launchExperienceEventContext = l_Context_0.SearchExperienceTile, 
                onItemsPerRowChanged = v104, 
                playerCountStyle = l_Footer_0, 
                enableCollectionLayout = v52.enableCollectionLayout
            }), 
            GameSortImpressionsDetector = v2.createElement(l_WaitForPropWrapper_0, {
                waitForProp = l_feedItemStartRow_0, 
                maxUpdatesToDelay = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
                wrappedComponent = v142
            })
        }));
    end;
end;