local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    VirtualItemBadgeShownCounter = {
        eventName = "VirtualItemBadgeShownCounter", 
        backends = {
            v1.TelemetryBackends.Counter
        }, 
        lastUpdated = {
            2025, 
            5, 
            15
        }, 
        throttlingPercentage = 100, 
        description = "Counter on all virtual item badge shown", 
        links = ""
    }
};