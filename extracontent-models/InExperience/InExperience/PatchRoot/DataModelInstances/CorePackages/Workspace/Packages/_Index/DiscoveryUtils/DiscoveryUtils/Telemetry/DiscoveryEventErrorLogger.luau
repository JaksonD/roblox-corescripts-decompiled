local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryUtils").Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = game:DefineFastFlag("UpdateDiscoveryEventErrorDetailsLogging", false);
local v4 = game:DefineFastInt("DiscoveryEventErrorDetailsHundredthsPercent", 0);
local v5 = {
    eventName = "DiscoveryEventErrorLogger_ErrorDetails", 
    description = "Error messages related to discovery events", 
    lastUpdated = {
        25, 
        10, 
        14
    }, 
    backends = {
        "Points", 
        v3 and "EventIngest" or nil
    }, 
    links = "https://roblox.atlassian.net/browse/CLIGROW-2890", 
    throttlingPercentage = v4
};
local v6 = {
    eventName = "DiscoveryEventErrorLogger_ErrorCounter", 
    description = "Counter related to discovery event errors", 
    lastUpdated = {
        25, 
        10, 
        14
    }, 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    links = "https://roblox.atlassian.net/browse/CLIGROW-2890"
};
return {
    reportError = function(v7, v8, v9) --[[ Line: 33 ]] --[[ Name: reportError ]]
        -- upvalues: l_TelemetryService_0 (copy), v6 (copy), v5 (copy), v3 (copy), v2 (copy)
        if not _G.__TESTEZ_RUNNING_TEST__ then
            warn((("[DiscoveryEventErrorLogger]\nError Type: %*\nError Message: %*"):format(v7, v8)));
        end;
        l_TelemetryService_0:LogCounter(v6, {
            customFields = {
                errorType = v7
            }
        }, 1);
        l_TelemetryService_0:LogEvent(v5, {
            standardizedFields = if v3 then {
                "addSessionInfo"
            } else nil, 
            customFields = v2.Dictionary.join(v9 or {}, {
                errorType = v7, 
                errorMessage = v8
            })
        });
    end
};