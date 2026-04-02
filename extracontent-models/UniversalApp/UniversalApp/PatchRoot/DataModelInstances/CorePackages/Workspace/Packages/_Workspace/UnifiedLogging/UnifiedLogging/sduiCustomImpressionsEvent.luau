local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000);
return function(v2, v3, v4) --[[ Line: 7 ]] --[[ Name: sduiCustomImpressionsEvent ]]
    -- upvalues: l_TelemetryService_0 (copy), v1 (copy)
    l_TelemetryService_0:LogEvent({
        eventName = v2, 
        backends = {
            "EventIngest", 
            "Points"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            26, 
            3, 
            17
        }, 
        description = ("SDUI custom impression event: %*"):format(v2)
    }, {
        eventContext = v3, 
        standardizedFields = {
            "addSessionInfo", 
            "addSessionId", 
            "addOSInfo"
        }, 
        customFields = v4
    });
end;