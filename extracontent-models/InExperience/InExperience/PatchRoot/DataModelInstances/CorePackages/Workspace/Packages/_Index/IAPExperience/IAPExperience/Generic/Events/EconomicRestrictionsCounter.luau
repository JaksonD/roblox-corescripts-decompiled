local l_Parent_0 = script:FindFirstAncestor("IAPExperience").Parent;
local _ = require(l_Parent_0.LoggingProtocol);
return {
    EconomicRestrictionsPromptCounter = {
        eventName = "InAppEconomicRestrictionPromptShown", 
        backends = {
            "RobloxTelemetryCounter"
        }, 
        lastUpdated = {
            2025, 
            8, 
            19
        }, 
        description = "Counter for tracking the number of times the in-app economic restriction prompt is shown"
    }, 
    UniversalEconomicRestrictionsCounter = {
        eventName = "UniversalEconomicRestrictionPromptShown", 
        backends = {
            "RobloxTelemetryCounter"
        }, 
        lastUpdated = {
            2025, 
            8, 
            25
        }, 
        description = "Counter for tracking the number of times economic restriction prompt is shown for all surfaces"
    }, 
    EconomicRestrictionsSurface = {
        InExperience = "InExperience", 
        Gamepass = "Gamepass", 
        DeveloperProduct = "DeveloperProduct", 
        BulkPurchase = "BulkPurchase", 
        AvatarExperience = "AvatarExperience", 
        AvatarExperienceLook = "AvatarExperienceLook"
    }
};