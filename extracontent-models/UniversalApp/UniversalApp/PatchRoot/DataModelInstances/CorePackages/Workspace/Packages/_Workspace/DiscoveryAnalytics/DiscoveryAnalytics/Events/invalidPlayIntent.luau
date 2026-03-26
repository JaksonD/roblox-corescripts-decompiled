local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("LuaAppInvalidPlayIntentThrottlingHundredthsPercent", 10000);
local v5 = {
    eventName = "invalidPlayIntent", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        26, 
        3, 
        18
    }, 
    description = "Fires when the user clicks on a Play Button that is in an invalid state to play (i.e. Loading)"
};
local v6 = v2.strictInterface({
    universeId = v2.string, 
    playButtonState = v2.string, 
    playabilityStatus = v2.optional(v2.string)
});
return function(v7, v8) --[[ Line: 26 ]]
    -- upvalues: v6 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_TelemetryService_0 (copy), v5 (copy)
    local v9, v10 = v6(v8);
    if not v9 then
        l_DiscoveryEventErrorLogger_0.reportError("InvalidPlayIntentInvalidInterface", v10);
    end;
    l_TelemetryService_0:LogEvent(v5, {
        eventContext = v7, 
        standardizedFields = {
            "addSessionInfo", 
            "addSessionId", 
            "addOSInfo"
        }, 
        customFields = {
            universeId = v8.universeId, 
            playButtonState = v8.playButtonState, 
            playabilityStatus = v8.playabilityStatus
        }
    });
end;