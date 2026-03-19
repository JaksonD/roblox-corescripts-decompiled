local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
game:DefineFastInt("LoginByUsernameSSOErrorsThrottleHundrethsPercent", 0);
return {
    eventName = "LoginByUsernameSSOErrors", 
    backends = {
        v1.TelemetryBackends.Points
    }, 
    throttlingPercentage = game:GetFastInt("LoginByUsernameSSOErrorsThrottleHundrethsPercent"), 
    lastUpdated = {
        24, 
        5, 
        3
    }, 
    description = "Report LoginByUsernameSSO Error codes to Points with document name \"loginbyusernamessoerrors\""
};