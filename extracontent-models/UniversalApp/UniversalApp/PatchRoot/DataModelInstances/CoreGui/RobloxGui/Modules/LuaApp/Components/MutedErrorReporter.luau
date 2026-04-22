local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.Common.LuaErrorReporter);
local v4 = require(l_Modules_0.Common.LuaErrorSeverity);
local v5 = require(l_Modules_0.LuaApp.LuaAppSentryReporter);
local v6 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v7 = require(l_Modules_0.LuaApp.LuaAppEvents);
local v8 = require(l_Modules_0.LuaApp.Flags.GetIsClientEnrolledInBacktraceRollout);
local v9 = require(l_Modules_0.Common.FFlagReportMutedErrorsToSentry);
local v10 = game:DefineFastInt("EnableSentryUADebugRolloutPercentage", 0);
local v11 = math.random(1, 100) <= math.clamp(v10, 0, 100);
local v12 = v2.Component:extend("MutedErrorReporter");
local l_FFlagDisableGoogleAnalyticsErrorReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting;
v12.init = function(v14) --[[ Line: 22 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v6 (copy), v9 (copy), v11 (copy), v5 (copy), v3 (copy), v7 (copy), v4 (copy), l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy)
    local l_appName_0 = v14.props.appName;
    local v16 = nil;
    if v8() then
        v16 = v6;
    end;
    local v17 = nil;
    if v9 and v11 then
        v17 = v5;
    end;
    v14.errorReporter = v3.new(v7.ReportMutedError, nil, v16, v4.DEBUG, v17);
    v14.errorReporter:setCurrentApp(l_appName_0);
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v14.errorReporter:startQueueTimers();
    end;
end;
v12.render = function(_) --[[ Line: 49 ]] --[[ Name: render ]]
    return nil;
end;
v12.willUnmount = function(v19) --[[ Line: 53 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy)
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v19.errorReporter:stopQueueTimers();
    end;
end;
return v12;