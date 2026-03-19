local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local _ = require(script.Parent.telemetryNewConfig);
local v2 = require(l_script_FirstAncestor_0.Analytics.FireEvent.fireTelemetry);
return function(v3) --[[ Line: 25 ]] --[[ Name: telemetrySetup ]]
    -- upvalues: v2 (copy)
    local function v6(v4, v5) --[[ Line: 26 ]] --[[ Name: emitTelemetry ]]
        -- upvalues: v2 (ref), v3 (copy)
        return v2({
            telemetryImpl = v3.telemetryImpl, 
            eventList = {
                defaults = v3.defaultTelemetryConfig, 
                [v4.name] = v4
            }, 
            loggerImpl = v3.loggerImpl
        })(v4.name, v5, if v3.getSharedInfo then v3.getSharedInfo() else {}, v4.eventStreamCtx);
    end;
    return {
        emit = v6, 
        fireAnalyticsEvent = v6, 
        getSharedInfo = v3.getSharedInfo
    };
end;