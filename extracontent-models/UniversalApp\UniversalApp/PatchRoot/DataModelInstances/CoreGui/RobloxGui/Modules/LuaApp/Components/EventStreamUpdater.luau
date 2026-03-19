local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v6 = v3.Component:extend("EventStreamUpdateComponent");
v6.render = function(_) --[[ Line: 10 ]] --[[ Name: render ]]
    return nil;
end;
v6.didMount = function(v8) --[[ Line: 14 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    local l_analytics_0 = v8.props.analytics;
    local l_releasePeriod_0 = v8.props.releasePeriod;
    local function _() --[[ Line: 18 ]] --[[ Name: releaseStream ]]
        -- upvalues: l_analytics_0 (copy)
        l_analytics_0.EventStream:releaseRBXEventStream();
    end;
    v8.releaseEvents = true;
    spawn(function() --[[ Line: 26 ]]
        -- upvalues: l_releasePeriod_0 (copy), v8 (copy), l_analytics_0 (copy)
        wait(l_releasePeriod_0);
        while v8.releaseEvents do
            l_analytics_0.EventStream:releaseRBXEventStream();
            wait(l_releasePeriod_0);
        end;
    end);
    if not l_RunService_0:IsStudio() then
        game:BindToClose(function() --[[ Line: 36 ]]
            -- upvalues: v8 (copy), l_analytics_0 (copy)
            v8.releaseEvents = false;
            l_analytics_0.EventStream:releaseRBXEventStream();
        end);
    end;
end;
return l_RoactServices_0.connect({
    analytics = v5
})(v6);