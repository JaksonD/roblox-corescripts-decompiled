local l_Parent_0 = script:FindFirstAncestor("Achievements").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
game:DefineFastInt("AchievementGrantedThrottleHundrethsPercent", 0);
return {
    eventName = "AchievementGranted", 
    backends = {
        v1.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("AchievementGrantedThrottleHundrethsPercent"), 
    lastUpdated = {
        24, 
        7, 
        3
    }, 
    description = "Report whenever an achievement is granted to Points with document name \"achievementgranted\""
};