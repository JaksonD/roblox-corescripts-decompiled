local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.Analytics.PageHeartbeatTimer);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAppRouter);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = v2.Component:extend("RouterAnalyticsReporter");
v7.render = function(v8) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local l_currentPage_0 = v8.props.currentPage;
    return l_currentPage_0 and l_currentPage_0 ~= v4.None and v2.createElement(v3, {
        currentPageGoal = l_currentPage_0
    });
end;
v7.didUpdate = function(v10, v11) --[[ Line: 24 ]] --[[ Name: didUpdate ]]
    local l_currentPage_1 = v10.props.currentPage;
    local l_analytics_0 = v10.props.analytics;
    if l_currentPage_1 ~= v11.currentPage and l_analytics_0 then
        l_analytics_0.reportPageChanged(l_currentPage_1);
    end;
end;
return l_RoactServices_0.connect({
    analytics = v5
})(v7);