local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("GameFavoriteThrottleHundrethsPercent", 10000);
local v5 = v2.strictInterface({
    placeId = v2.string, 
    state = v2.union(v2.literal("on"), v2.literal("off")), 
    ctx = v2.string, 
    uid = v2.string
});
return function(v6, v7) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), l_DiscoveryEventErrorLogger_0 (copy), v4 (copy), l_TelemetryService_0 (copy)
    local v8, v9 = v5(v6);
    if not v8 then
        l_DiscoveryEventErrorLogger_0.reportError("GameFavoriteInvalidInterface", v9);
    end;
    local v10 = {
        eventName = "favorite", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v4, 
        lastUpdated = {
            25, 
            11, 
            11
        }, 
        description = "User has favorited/unfavorited a game"
    };
    l_TelemetryService_0:LogEvent(v10, {
        eventContext = v7, 
        standardizedFields = {
            "addSessionInfo"
        }, 
        customFields = v6
    });
end;