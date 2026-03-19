local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    NotInterestedMissingAppPage = {
        eventName = "Discovery_NotInterestedMissingAppPage", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            25, 
            8, 
            14
        }, 
        description = "Counter for Not Interested Missing App Page"
    }, 
    NotInterestedUserSignalFailed = {
        eventName = "Discovery_NotInterestedUserSignalFailed", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            25, 
            8, 
            14
        }, 
        description = "Counter for Not Interested User Signal Failed"
    }
};