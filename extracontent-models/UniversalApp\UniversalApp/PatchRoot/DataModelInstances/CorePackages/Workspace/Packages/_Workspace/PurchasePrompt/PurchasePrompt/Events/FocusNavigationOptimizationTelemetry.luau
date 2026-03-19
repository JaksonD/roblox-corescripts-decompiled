local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local _ = require(l_Parent_0.LoggingProtocol);
return {
    RerenderTimingStat = {
        eventName = "PurchasePromptAppRerenderTiming", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            8, 
            4
        }, 
        throttlingPercentage = 1000, 
        description = "Stat for tracking re-render timing in PurchasePromptApp to detect performance issues", 
        links = "https://roblox.atlassian.net/browse/APPEXP-2951"
    }
};