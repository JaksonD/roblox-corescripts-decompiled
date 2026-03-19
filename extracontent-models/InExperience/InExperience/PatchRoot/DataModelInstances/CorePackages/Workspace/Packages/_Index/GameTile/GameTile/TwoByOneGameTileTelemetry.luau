local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local v3 = {
    "addOSInfo", 
    "addSessionInfo", 
    "addSessionId"
};
local v4 = {
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
local v5 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
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
} else nil;
local v6 = {
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
local v7 = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then {
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
} else nil;
return {
    logTwoByOneTileActivated = function() --[[ Line: 52 ]] --[[ Name: logTwoByOneTileActivated ]]
        -- upvalues: l_TelemetryService_0 (copy), v4 (copy), v3 (copy)
        l_TelemetryService_0:LogCounter(v4, {
            standardizedFields = v3, 
            customFields = {}
        }, 1);
    end, 
    logTwoByOneTileCtaActivated = function() --[[ Line: 60 ]] --[[ Name: logTwoByOneTileCtaActivated ]]
        -- upvalues: l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_TelemetryService_0 (copy), v5 (copy), v3 (copy)
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            return;
        else
            l_TelemetryService_0:LogCounter(v5, {
                standardizedFields = v3, 
                customFields = {}
            }, 1);
            return;
        end;
    end, 
    logTwoByOneTileGameJoinInitiated = function() --[[ Line: 72 ]] --[[ Name: logTwoByOneTileGameJoinInitiated ]]
        -- upvalues: l_TelemetryService_0 (copy), v6 (copy), v3 (copy)
        l_TelemetryService_0:LogCounter(v6, {
            standardizedFields = v3, 
            customFields = {}
        }, 1);
    end, 
    logTwoByOneTileViewGameDetailsActivated = function() --[[ Line: 80 ]] --[[ Name: logTwoByOneTileViewGameDetailsActivated ]]
        -- upvalues: l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_TelemetryService_0 (copy), v7 (copy), v3 (copy)
        if not l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then
            return;
        else
            l_TelemetryService_0:LogCounter(v7, {
                standardizedFields = v3, 
                customFields = {}
            }, 1);
            return;
        end;
    end
};