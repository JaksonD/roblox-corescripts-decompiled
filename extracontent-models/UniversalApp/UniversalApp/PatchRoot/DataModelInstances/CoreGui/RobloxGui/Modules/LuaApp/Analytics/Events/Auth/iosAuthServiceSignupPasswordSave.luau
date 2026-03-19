local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.IosAuthServiceSignupPasswordSave);
return {
    reportAttempted = function(v3) --[[ Line: 10 ]] --[[ Name: reportAttempted ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy)
        local v4 = {
            username = v3, 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v2.Attempted, {
            customFields = v4
        });
    end, 
    reportSuccess = function(v5) --[[ Line: 18 ]] --[[ Name: reportSuccess ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy)
        local v6 = {
            username = v5, 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v2.Success, {
            customFields = v6
        });
    end, 
    reportFailure = function(v7, v8) --[[ Line: 26 ]] --[[ Name: reportFailure ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy)
        local v9 = {
            username = v7, 
            error_message = v8 or "unknown", 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v2.Failure, {
            customFields = v9
        });
    end, 
    reportSkipped = function(v10) --[[ Line: 35 ]] --[[ Name: reportSkipped ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy)
        local v11 = {
            skip_reason = v10, 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v2.Skipped, {
            customFields = v11
        });
    end
};