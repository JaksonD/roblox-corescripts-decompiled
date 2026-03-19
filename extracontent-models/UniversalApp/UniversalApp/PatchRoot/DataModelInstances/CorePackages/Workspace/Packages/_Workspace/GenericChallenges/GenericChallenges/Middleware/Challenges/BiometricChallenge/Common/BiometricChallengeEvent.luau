local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
return {
    eventName = "accountSecurityChallengeBiometricEvent", 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        25, 
        9, 
        11
    }, 
    description = "Tracks lifecycle events for the Biometric GCS challenge", 
    links = "https://roblox.atlassian.net/wiki/x/rQR02"
};