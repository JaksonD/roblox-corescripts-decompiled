local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {
    "addOSInfo", 
    "addSessionInfo", 
    "addSessionId"
};
local v2 = {
    eventName = "TwoByOneTileActivated", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        1, 
        16
    }, 
    description = "Counter for TwoByOneTileActivated events."
};
local v3 = {
    eventName = "TwoByOneTileCtaActivated", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        2, 
        23
    }, 
    description = "Counter for TwoByOneTileCtaActivated events."
};
local v4 = {
    eventName = "TwoByOneTileGameJoinInitiated", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        1, 
        16
    }, 
    description = "Counter for TwoByOneTileGameJoinInitiated events."
};
local v5 = {
    eventName = "TwoByOneTileViewGameDetailsActivated", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        2, 
        19
    }, 
    description = "Counter for TwoByOneTileViewGameDetailsActivated events."
};
return {
    logTwoByOneTileActivated = function() --[[ Line: 43 ]] --[[ Name: logTwoByOneTileActivated ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v2, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logTwoByOneTileCtaActivated = function() --[[ Line: 51 ]] --[[ Name: logTwoByOneTileCtaActivated ]]
        -- upvalues: l_TelemetryService_0 (copy), v3 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v3, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logTwoByOneTileGameJoinInitiated = function() --[[ Line: 59 ]] --[[ Name: logTwoByOneTileGameJoinInitiated ]]
        -- upvalues: l_TelemetryService_0 (copy), v4 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v4, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end, 
    logTwoByOneTileViewGameDetailsActivated = function() --[[ Line: 67 ]] --[[ Name: logTwoByOneTileViewGameDetailsActivated ]]
        -- upvalues: l_TelemetryService_0 (copy), v5 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v5, {
            standardizedFields = v1, 
            customFields = {}
        }, 1);
    end
};