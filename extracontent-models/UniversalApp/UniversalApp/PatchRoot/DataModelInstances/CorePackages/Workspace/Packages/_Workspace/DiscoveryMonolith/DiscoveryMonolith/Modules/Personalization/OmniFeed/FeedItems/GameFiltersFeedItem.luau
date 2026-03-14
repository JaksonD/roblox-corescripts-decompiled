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
local l_Games_0 = l_GameSortGroups_0.Games;
return function(v19) --[[ Line: 34 ]] --[[ Name: GameFiltersFeedItem ]]
    -- upvalues: v14 (copy), l_useGameFiltersSelector_0 (copy), l_Games_0 (copy), l_useGameFilterAnalyticsInfo_0 (copy), v2 (copy), v16 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), v15 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), l_dependencyArray_0 (copy), l_GameFilterCarousel_0 (copy)
    local v20 = v19[v14.key];
    local v21 = l_useGameFiltersSelector_0(l_Games_0);
    local v22 = l_useGameFilterAnalyticsInfo_0(v19.gameSortId, v19.sortIndex);
    local v23 = v2.useRef(nil);
    local v24 = v16(v23.current);
    local v25 = l_useDispatch_0();
    local v26 = l_useRoactService_0(l_RoactNetworking_0);
    local v27 = l_useRoactService_0(l_RoactAnalytics_0);
    local v31 = v2.useCallback(function(v28, v29) --[[ Line: 48 ]]
        -- upvalues: v25 (copy), v15 (ref), v26 (copy), v27 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref)
        local v30 = {
            [v28] = v29
        };
        return v25(v15(v26, v27, nil, v30, l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 and true or nil));
    end, l_dependencyArray_0(v26, v27, if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v25 else nil));
    if v21 and #v21.allFilters > 0 then
        return v2.createElement(l_GameFilterCarousel_0, {
            title = v19.topicName, 
            filters = v21.allFilters, 
            sideMargin = v24, 
            sortIndex = v19.sortIndex, 
            onFilterApplied = v31, 
            containerRef = v23, 
            pageContext = v20.appPage, 
            dataUpdatedTimestamp = v21.updatedTimestamp, 
            analyticsInfo = v22, 
            scrollViewPositionChangedSignal = v20.scrollViewPositionChangedSignal
        });
    else
        return nil;
    end;
end;