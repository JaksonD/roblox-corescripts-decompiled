local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics);
local v2 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_fireTelemetry_0 = v1.Analytics.FireEvent.fireTelemetry;
local _ = require(script.Parent.EventNames);
local v5 = require(script.Parent.TelemetryActionList);
local v6 = l_fireTelemetry_0({
    telemetryImpl = v2.default, 
    eventList = v5
});
return function(v7, v8) --[[ Line: 16 ]]
    -- upvalues: v5 (copy), v6 (copy)
    if v5[v7] then
        v6(v7, v8);
    end;
end;