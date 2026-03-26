local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.GameFilters);
local l_GameFilterCarousel_0 = v3.GameFilterCarousel;
local l_useGameFiltersSelector_0 = v3.DataStore.useGameFiltersSelector;
local l_useGameFilterAnalyticsInfo_0 = v3.useGameFilterAnalyticsInfo;
local l_GameSortGroups_0 = require(l_Parent_0.DiscoveryTypes).GameSortGroups;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v14 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local v15 = require(l_Modules_0.LuaApp.Thunks.FetchGamesPageData);
local v16 = require(l_Modules_0.Personalization.OmniFeed.useGameFiltersFeedItemSideMargin);
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_Games_0 = l_GameSortGroups_0.Games;
return function(v22) --[[ Line: 38 ]] --[[ Name: GameFiltersFeedItem ]]
    -- upvalues: v14 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_useGameFiltersSelector_0 (copy), l_Games_0 (copy), l_useGameFilterAnalyticsInfo_0 (copy), v2 (copy), v16 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), v15 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_GameFilterCarousel_0 (copy)
    local v23 = v22[v14.key];
    local v24 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v23.appCompositionEnabled else nil;
    local v25 = l_useGameFiltersSelector_0(l_Games_0);
    local v26 = l_useGameFilterAnalyticsInfo_0(v22.gameSortId, v22.sortIndex);
    local v27 = v2.useRef(nil);
    local v28 = if not l_FFlagLuaAppCompositionAlways_0 then v16(v27.current) else nil;
    local v29 = if v24 then nil else v28;
    local v30 = l_useDispatch_0();
    local v31 = l_useRoactService_0(l_RoactNetworking_0);
    local v32 = l_useRoactService_0(l_RoactAnalytics_0);
    local v36 = v2.useCallback(function(v33, v34) --[[ Line: 59 ]]
        -- upvalues: v30 (copy), v15 (ref), v31 (copy), v32 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref)
        local v35 = {
            [v33] = v34
        };
        return v30(v15(v31, v32, nil, v35, l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 and true or nil));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v31, 
        v32, 
        if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v30 else nil
    } else l_dependencyArray_0(v31, v32, if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v30 else nil));
    if v25 and #v25.allFilters > 0 then
        return v2.createElement(l_GameFilterCarousel_0, {
            title = v22.topicName, 
            filters = v25.allFilters, 
            sideMargin = v29, 
            sortIndex = v22.sortIndex, 
            onFilterApplied = v36, 
            containerRef = v27, 
            pageContext = v23.appPage, 
            dataUpdatedTimestamp = v25.updatedTimestamp, 
            analyticsInfo = v26, 
            scrollViewPositionChangedSignal = v23.scrollViewPositionChangedSignal
        });
    else
        return nil;
    end;
end;