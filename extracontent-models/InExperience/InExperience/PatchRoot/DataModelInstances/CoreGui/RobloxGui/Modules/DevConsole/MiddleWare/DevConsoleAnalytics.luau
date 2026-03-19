local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(script.Parent.Parent.Actions.SetActiveTab);
local v4 = require(script.Parent.Parent.Actions.SetDevConsoleVisibility);
local v5 = require(script.Parent.Parent.Actions.SetDevConsoleMinimized);
local v6 = game:DefineFastInt("ReportDevConsoleTabEventsThrottleHundredthsPercent", 0);
ReportDevConsoleOpenClose = function(v7, v8) --[[ Line: 23 ]] --[[ Name: ReportDevConsoleOpenClose ]]
    -- upvalues: v4 (copy), l_RbxAnalyticsService_0 (copy)
    if v8.type == v4.name then
        local l_isVisible_0 = v7:getState().DisplayOptions.isVisible;
        local l_visibleStartTime_0 = v7:getState().DisplayOptions.visibleStartTime;
        if v8.isVisible ~= l_isVisible_0 then
            if v8.isVisible then
                l_RbxAnalyticsService_0:ReportCounter("DevConsoleStartVisible", 1);
                return;
            else
                local v11 = tick() - l_visibleStartTime_0;
                l_RbxAnalyticsService_0:ReportStats("DevConsoleSessionTime", v11);
            end;
        end;
    end;
end;
getTabAnalyticsKeyName = function(v12, v13) --[[ Line: 39 ]] --[[ Name: getTabAnalyticsKeyName ]]
    if v13 ~= nil then
        return string.format("%s_%s", v12, v13 and "Client" or "Server");
    else
        return string.format("%s", v12);
    end;
end;
dispatchTabAnalytics = function(v14) --[[ Line: 47 ]] --[[ Name: dispatchTabAnalytics ]]
    -- upvalues: v2 (copy), l_RbxAnalyticsService_0 (copy), v6 (copy)
    local v15 = v2.join({
        placeId = game.PlaceId, 
        calledFrom = "devConsoleTabChange"
    }, v14);
    l_RbxAnalyticsService_0:ReportInfluxSeries("devConsoleMetric", v15, v6);
end;
ReportTabChange = function(v16, v17) --[[ Line: 59 ]] --[[ Name: ReportTabChange ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy)
    if v17.type == v3.name then
        local l_MainView_0 = v16:getState().MainView;
        local l_newTabIndex_0 = v17.newTabIndex;
        local l_isClientView_0 = v17.isClientView;
        if l_newTabIndex_0 ~= l_MainView_0.currTabIndex or l_isClientView_0 ~= nil and l_isClientView_0 ~= l_MainView_0.isClientView then
            local v21 = {
                initTab = getTabAnalyticsKeyName(l_MainView_0.currTabIndex, l_MainView_0.isClientView), 
                endTab = getTabAnalyticsKeyName(l_newTabIndex_0, l_isClientView_0)
            };
            dispatchTabAnalytics(v21);
            return;
        end;
    elseif v17.type == v4.name then
        local l_MainView_1 = v16:getState().MainView;
        local l_DisplayOptions_0 = v16:getState().DisplayOptions;
        local v24 = nil;
        v24 = if v17.isVisible then {
            initTab = "StartVisible", 
            endTab = getTabAnalyticsKeyName(l_MainView_1.currTabIndex, l_MainView_1.isClientView)
        } else if l_DisplayOptions_0.isMinimized then {
            initTab = "Minimized", 
            endTab = "EndVisible"
        } else {
            initTab = getTabAnalyticsKeyName(l_MainView_1.currTabIndex, l_MainView_1.isClientView), 
            endTab = "EndVisible"
        };
        dispatchTabAnalytics(v24);
        return;
    elseif v17.type == v5.name then
        local l_MainView_2 = v16:getState().MainView;
        local v26 = nil;
        v26 = if v17.isMinimized then {
            initTab = getTabAnalyticsKeyName(l_MainView_2.currTabIndex, l_MainView_2.isClientView), 
            endTab = "Minimized"
        } else {
            initTab = "Minimized", 
            endTab = getTabAnalyticsKeyName(l_MainView_2.currTabIndex, l_MainView_2.isClientView)
        };
        dispatchTabAnalytics(v26);
    end;
end;
return function(v27, v28) --[[ Line: 117 ]]
    return function(v29) --[[ Line: 118 ]]
        -- upvalues: v28 (copy), v27 (copy)
        ReportTabChange(v28, v29);
        ReportDevConsoleOpenClose(v28, v29);
        v27(v29);
    end;
end;