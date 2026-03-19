local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.Common.LuaErrorReporter);
local v4 = require(l_Modules_0.Common.LuaErrorSeverity);
local v5 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v6 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v7 = require(l_Modules_0.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout);
local v8 = v2.Component:extend("MutedErrorReporter");
local l_FFlagDisableGoogleAnalyticsErrorReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting;
v8.init = function(v10) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v5 (copy), v3 (copy), v6 (copy), v4 (copy), l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy)
    local l_appName_0 = v10.props.appName;
    local v12 = nil;
    if v7() then
        v12 = v5;
    end;
    v10.errorReporter = v3.new(v6.ReportMutedError, nil, v12, v4.DEBUG);
    v10.errorReporter:setCurrentApp(l_appName_0);
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v10.errorReporter:startQueueTimers();
    end;
end;
v8.render = function(_) --[[ Line: 34 ]] --[[ Name: render ]]
    return nil;
end;
v8.willUnmount = function(v14) --[[ Line: 38 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy)
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v14.errorReporter:stopQueueTimers();
    end;
end;
return v8;