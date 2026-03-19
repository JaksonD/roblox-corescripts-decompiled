local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_GameSortLoadSource_0 = require(l_Parent_0.DiscoveryAvailability).GameSortLoadSource;
local l_reportWarning_0 = require(l_Parent_0.DiscoveryAnalytics).Points.reportWarning;
local v10 = require(l_Parent_0.LoggingProtocol);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v12 = require(script.Parent.SendGameImpressions);
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local function _(v16, v17) --[[ Line: 28 ]] --[[ Name: getGameSetTypeId ]]
    if v16 ~= nil then
        if v17 then
            return v16.topicId;
        else
            return v16.gameSetTypeId;
        end;
    else
        return nil;
    end;
end;
local function _(v19, v20) --[[ Line: 40 ]] --[[ Name: getGameSetTargetId ]]
    if not v20 and v19 ~= nil then
        return v19.gameSetTargetId;
    else
        return nil;
    end;
end;
local function _(v22, v23) --[[ Line: 50 ]] --[[ Name: getAppliedFilters ]]
    if not v23 and v22 then
        return v22.appliedFilters;
    else
        return nil;
    end;
end;
return function(v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37) --[[ Line: 66 ]] --[[ Name: useGameSortImpressionsParams ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_AppPage_0 (copy), l_GameSortLoadSource_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v1 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_reportWarning_0 (copy), v10 (copy), v12 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (copy), l_Signal_0 (copy)
    local v38 = l_useRoactService_0(l_AppEventIngestService_0);
    local v39 = l_useRoactService_0(l_RoactAnalytics_0);
    local v40 = if v28 == l_AppPage_0.Home and v25 and v25.topicId then l_GameSortLoadSource_0.getSortLoadSource(v25.topicId) else nil;
    local v41 = if l_FFlagLuaAppAddSubIdToHomeEvents_0 and v25 then v25.sortSubId else nil;
    local v42 = if l_FFlagLuaAppLogOmniAnalyticsData_0 and v25 then v25.analyticsData else nil;
    local v49 = v1.useCallback(function(v43) --[[ Line: 94 ]]
        -- upvalues: v36 (copy), l_DiscoveryEventErrorLogger_0 (ref), v28 (copy), v32 (copy), l_AppPage_0 (ref), v37 (copy), l_reportWarning_0 (ref), v10 (ref), v27 (copy), v25 (copy), v12 (ref), v38 (copy), v39 (copy), v34 (copy), v35 (copy), v29 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (ref), v30 (copy), v26 (copy), v31 (copy), v40 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v41 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v42 (copy)
        if v36 == nil or #v36 == 0 then
            l_DiscoveryEventErrorLogger_0.reportError("useGameSortImpressionsParams_MissingEntries", "useGameSortImpressionsParams: entries is nil or empty for game sort impressions", {
                pageContext = v28, 
                gameSortId = v32
            });
            return;
        elseif v28 == l_AppPage_0.SearchPage then
            if not v37 then
                l_reportWarning_0(v10.default, "useGameSortImpressionsParams_MissingSearchParams", "useGameSortImpressionsParams: searchParams is nil for search page game sort impressions");
            end;
            local v44 = {
                searchUuid = v37 and v37.searchUuid, 
                emphasisFlag = v37 and v37.hasEmphasizedTile and 1 or 0, 
                seeAllFlag = 1, 
                sortPos = v27, 
                gameSetTypeId = v25 and v25.topicId
            };
            v12.sendFromSearch(v38, v39, v43, v36, v28, v44, v34, v35, v29, if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then v30 else nil);
            return;
        else
            local l_v25_0 = v25;
            local l_v26_0 = v26;
            local v47 = if l_v25_0 ~= nil then if l_v26_0 then l_v25_0.topicId else l_v25_0.gameSetTypeId else nil;
            l_v26_0 = v25;
            l_v25_0 = if not v26 and l_v26_0 ~= nil then l_v26_0.gameSetTargetId else nil;
            local l_v25_1 = v25;
            l_v26_0 = if not v26 and l_v25_1 then l_v25_1.appliedFilters else nil;
            v12.sendFromTopicContents(v38, v39, v43, v36, v28, v47, v27, v35, l_v25_0, v31, v34, v29, v30, l_v26_0, v40, nil, if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v41 else nil, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v42 else nil);
            return;
        end;
    end, {
        v38, 
        v39, 
        v27, 
        v29, 
        v30, 
        v26, 
        v25, 
        v28, 
        v34, 
        v35, 
        v31, 
        v36, 
        v40, 
        if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v41 else nil, 
        if l_FFlagLuaAppLogOmniAnalyticsData_0 then v42 else nil
    });
    local v50 = v1.useRef(nil);
    if v50.current == nil then
        v50.current = l_Signal_0.new();
    end;
    local l_current_0 = v50.current;
    v1.useEffect(function() --[[ Line: 188 ]]
        -- upvalues: l_current_0 (copy), v33 (copy)
        l_current_0:fire();
        local v52 = nil;
        if v33 then
            v52 = v33:connect(function() --[[ Line: 197 ]]
                -- upvalues: l_current_0 (ref)
                l_current_0:fire();
            end);
        end;
        return function() --[[ Line: 202 ]]
            -- upvalues: v52 (ref)
            if v52 then
                v52:disconnect();
            end;
        end;
    end, {
        v33, 
        l_current_0
    });
    return v49, l_current_0, (v1.useCallback(function() --[[ Line: 209 ]]
        -- upvalues: l_current_0 (copy)
        l_current_0:fire();
    end, {
        l_current_0
    }));
end;