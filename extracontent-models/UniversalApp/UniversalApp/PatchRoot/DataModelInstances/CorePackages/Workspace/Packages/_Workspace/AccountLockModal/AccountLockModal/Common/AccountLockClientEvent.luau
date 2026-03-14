local l_Parent_0 = script:FindFirstAncestor("AccountLockModal").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    eventName = "accountLockClientEvent", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        25, 
        9, 
        17
    }, 
    description = "Tracks lifecycle events for account lock", 
    links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/3666281428/Tech+Spec+Account+Locking+System"
};