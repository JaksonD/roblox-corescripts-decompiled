local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v3 = require(l_script_FirstAncestor_0.Hooks.useObservableValue);
local v4 = require(script.ChromeAnalytics);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUnibarLuaOcclusionMetrics();
local v7 = require(script.OcclusionMetricsManager);
return function(_) --[[ Line: 14 ]] --[[ Name: ChromeAnalyticsListener ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v6 (copy), v5 (copy), v7 (copy)
    v4.default:setScreenSize((v3(v2.screenSize)));
    if v6 then
        return v5.createElement(v7);
    else
        return nil;
    end;
end;