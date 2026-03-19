local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("GameVoteThrottleHundrethsPercent", 0);
local v5 = v2.strictInterface({
    placeId = v2.string, 
    vote = v2.union(v2.literal("UpVoted"), v2.literal("DownVoted"), v2.literal("NotVoted")), 
    prevVote = v2.union(v2.literal("UpVoted"), v2.literal("DownVoted"), v2.literal("NotVoted")), 
    uid = v2.string
});
return function(v6, v7) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), l_DiscoveryEventErrorLogger_0 (copy), v4 (copy), l_TelemetryService_0 (copy)
    local v8, v9 = v5(v6);
    if not v8 then
        l_DiscoveryEventErrorLogger_0.reportError("GameVoteInvalidInterface", v9);
    end;
    local v10 = {
        eventName = "vote", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v4, 
        lastUpdated = {
            25, 
            11, 
            11
        }, 
        description = "User has voted on a game"
    };
    l_TelemetryService_0:LogEvent(v10, {
        eventContext = v7, 
        standardizedFields = {
            "addSessionInfo"
        }, 
        customFields = v6
    });
end;