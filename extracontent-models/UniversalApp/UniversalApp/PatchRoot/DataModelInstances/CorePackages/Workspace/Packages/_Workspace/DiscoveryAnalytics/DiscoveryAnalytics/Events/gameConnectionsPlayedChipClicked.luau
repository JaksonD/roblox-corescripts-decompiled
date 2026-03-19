local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("GameConnectionsPlayedChipClickedThrottleHundredthsPercent", 10000);
local v5 = v2.strictInterface({
    universeId = v2.string, 
    placeId = v2.string, 
    uid = v2.string, 
    totalConnections = v2.number
});
return function(v6, v7) --[[ Line: 18 ]]
    -- upvalues: v5 (copy), l_DiscoveryEventErrorLogger_0 (copy), v4 (copy), l_TelemetryService_0 (copy)
    local v8, v9 = v5(v6);
    if not v8 then
        l_DiscoveryEventErrorLogger_0.reportError("GameConnectionsPlayedChipClickedInvalidInterface", v9);
    end;
    local v10 = {
        eventName = "gameConnectionsPlayedChipClicked", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v4, 
        lastUpdated = {
            26, 
            2, 
            10
        }, 
        description = "User has clicked the connections played chip to open the user list"
    };
    l_TelemetryService_0:LogEvent(v10, {
        eventContext = v7, 
        standardizedFields = {
            "addSessionInfo"
        }, 
        customFields = v6
    });
end;