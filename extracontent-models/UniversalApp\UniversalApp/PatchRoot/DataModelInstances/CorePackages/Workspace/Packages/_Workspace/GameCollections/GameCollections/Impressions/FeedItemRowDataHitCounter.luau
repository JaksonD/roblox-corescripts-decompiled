local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local v2 = require(script.Parent.FIntFeedItemRowDataCounterThrottle);
return {
    eventName = "feedItemRowDataHitCounter", 
    backends = {
        v1.TelemetryBackends.Counter
    }, 
    throttlingPercentage = v2, 
    lastUpdated = {
        24, 
        5, 
        29
    }, 
    description = "Count the number of times feed item row data is accessible when game impression is sent"
};