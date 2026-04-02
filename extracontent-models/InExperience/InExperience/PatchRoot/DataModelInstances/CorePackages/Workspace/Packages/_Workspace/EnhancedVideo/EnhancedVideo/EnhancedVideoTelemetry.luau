local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {
    "addPlaceId", 
    "addUniverseId", 
    "addSessionId", 
    "addOSInfo", 
    "addSessionInfo"
};
local v2 = {
    eventName = "ServeEnhancedVideoError", 
    backends = {
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("ServeEnhancedVideoErrorTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        26, 
        3, 
        20
    }, 
    description = "        This is fired when there is an error calling /serve-enhanced-video.\n    "
};
return {
    logServeEnhancedVideoError = function(v3) --[[ Line: 19 ]] --[[ Name: logServeEnhancedVideoError ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v1 (copy)
        l_TelemetryService_0:LogEvent(v2, {
            standardizedFields = v1, 
            customFields = {
                error = v3
            }
        });
    end
};