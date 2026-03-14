local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2LogUniverseIdForEvents;
local v6 = game:DefineFastInt("ApiFetchExperienceDetailsPageThrottlingHundredthsPercent", 0);
local v7 = game:DefineFastInt("ApiFetchExperienceDetailsPageCounterThrottlingHundredthsPercent", 0);
local v8 = game:DefineFastFlag("LuaAppEdpBackendV2LogMissingFetchEventData3", false);
local v9 = {
    ParseFailure = {
        eventName = "experienceDetailsParseFailure", 
        backends = if v8 then {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        } else {
            l_default_0.TelemetryBackends.Counter
        }, 
        throttlingPercentage = v6, 
        description = "\"Failed to parse data from API response\"", 
        lastUpdated = {
            25, 
            8, 
            7
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    }, 
    MissingData = {
        eventName = "experienceDetailsMissingData", 
        backends = if v8 then {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        } else {
            l_default_0.TelemetryBackends.Counter
        }, 
        throttlingPercentage = v6, 
        description = "\"Data missing from API response\"", 
        lastUpdated = {
            25, 
            8, 
            7
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    }, 
    InvalidData = {
        eventName = "experienceDetailsInvalidData", 
        backends = if v8 then {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        } else {
            l_default_0.TelemetryBackends.Counter
        }, 
        throttlingPercentage = v6, 
        description = "\"Invalid data found in API response\"", 
        lastUpdated = {
            25, 
            8, 
            7
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    }, 
    SduiLayoutOrderConflict = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then {
        eventName = "experienceDetailsSduiLayoutOrderConflict", 
        backends = {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v6, 
        description = "\"SDUI component layout order conflicts with existing EDP layout order\"", 
        lastUpdated = {
            25, 
            8, 
            28
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    } else nil, 
    FetchRequest = {
        eventName = "experienceDetailsFetchRequest", 
        backends = if v8 then {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        } else {
            l_default_0.TelemetryBackends.Counter
        }, 
        throttlingPercentage = if v8 then v7 else v6, 
        description = "\"Experience details page fetch request\"", 
        lastUpdated = {
            25, 
            10, 
            29
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    }, 
    FetchRequestEvent = if v8 then {
        eventName = "experienceDetailsFetchRequestEvent", 
        backends = {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v7, 
        description = "Experience details page fetch request", 
        lastUpdated = {
            25, 
            10, 
            29
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    } else nil, 
    FetchMissingData = {
        eventName = "experienceDetailsFetchMissingData", 
        backends = if v8 then {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        } else {
            l_default_0.TelemetryBackends.Counter
        }, 
        throttlingPercentage = v6, 
        description = "\"Data missing during fetch request\"", 
        lastUpdated = {
            25, 
            8, 
            7
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    }, 
    FetchSuccess = if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then {
        eventName = "experienceDetailsFetchSuccess", 
        backends = {
            l_default_0.TelemetryBackends.Counter
        }, 
        throttlingPercentage = if v8 then v7 else v6, 
        description = "\"Fetch request succeeded\"", 
        lastUpdated = {
            25, 
            10, 
            29
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    } else nil, 
    FetchSuccessEvent = if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then {
        eventName = "experienceDetailsFetchSuccessEvent", 
        backends = {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v7, 
        description = "Fetch request succeeded", 
        lastUpdated = {
            25, 
            10, 
            29
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    } else nil, 
    FetchFailure = if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then {
        eventName = "experienceDetailsFetchFailure", 
        backends = {
            l_default_0.TelemetryBackends.Counter, 
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v7, 
        description = "\"Fetch request failed\"", 
        lastUpdated = {
            25, 
            10, 
            29
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    } else nil, 
    FetchFailureEvent = if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 then {
        eventName = "experienceDetailsFetchFailureEvent", 
        backends = {
            l_default_0.TelemetryBackends.EventIngest, 
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v7, 
        description = "Fetch request failed", 
        lastUpdated = {
            25, 
            10, 
            29
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    } else nil, 
    VisibilityVariables = {
        eventName = "experienceDetailsVisibilityVariables", 
        backends = {
            l_default_0.TelemetryBackends.Points
        }, 
        throttlingPercentage = v6, 
        description = "\"Visibility variables\"", 
        lastUpdated = {
            25, 
            11, 
            12
        }, 
        links = "https://roblox.atlassian.net/wiki/x/q4Ji4w"
    }
};
v9.logParseFailure = function(v10, v11) --[[ Line: 201 ]]
    -- upvalues: v8 (copy), l_default_0 (copy), v9 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    if v8 then
        l_default_0:logRobloxTelemetryEvent(v9.ParseFailure, {}, {
            dataType = v10, 
            universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v11 else nil
        });
        return;
    else
        l_default_0:logRobloxTelemetryCounter(v9.ParseFailure, 1, {
            dataType = v10
        });
        return;
    end;
end;
v9.logMissingData = function(v12, v13) --[[ Line: 216 ]]
    -- upvalues: v8 (copy), l_default_0 (copy), v9 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    if v8 then
        l_default_0:logRobloxTelemetryEvent(v9.MissingData, {}, {
            dataType = v12, 
            universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v13 else nil
        });
        return;
    else
        l_default_0:logRobloxTelemetryCounter(v9.MissingData, 1, {
            dataType = v12
        });
        return;
    end;
end;
v9.logInvalidData = function(v14, v15) --[[ Line: 231 ]]
    -- upvalues: v8 (copy), l_default_0 (copy), v9 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    if v8 then
        l_default_0:logRobloxTelemetryEvent(v9.InvalidData, {}, {
            dataType = v14, 
            universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v15 else nil
        });
        return;
    else
        l_default_0:logRobloxTelemetryCounter(v9.InvalidData, 1, {
            dataType = v14
        });
        return;
    end;
end;
v9.logFetchRequest = function(v16, v17) --[[ Line: 246 ]]
    -- upvalues: v8 (copy), v9 (copy), l_default_0 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    if v8 and v9.FetchRequestEvent then
        l_default_0:logRobloxTelemetryEvent(v9.FetchRequest, {}, {
            requestType = v16, 
            universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v17 else nil
        });
        l_default_0:logRobloxTelemetryEvent(v9.FetchRequestEvent, {}, {
            requestType = v16, 
            universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v17 else nil
        });
        return;
    else
        l_default_0:logRobloxTelemetryCounter(v9.FetchRequest, 1, {
            requestType = v16
        });
        return;
    end;
end;
v9.logFetchMissingData = function(v18, v19) --[[ Line: 265 ]]
    -- upvalues: v8 (copy), l_default_0 (copy), v9 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
    if v8 then
        l_default_0:logRobloxTelemetryEvent(v9.FetchMissingData, {}, {
            dataType = v18, 
            universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v19 else nil
        });
        return;
    else
        l_default_0:logRobloxTelemetryCounter(v9.FetchMissingData, 1, {
            dataType = v18
        });
        return;
    end;
end;
if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 and v9.FetchSuccess and v9.FetchSuccessEvent then
    v9.logFetchSuccess = function(v20) --[[ Line: 285 ]]
        -- upvalues: v8 (copy), l_default_0 (copy), v9 (copy), l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 (copy)
        if v8 then
            l_default_0:logRobloxTelemetryEvent(v9.FetchSuccessEvent, {}, {
                universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v20 else nil
            });
            l_default_0:logRobloxTelemetryCounter(v9.FetchSuccess, 1, {
                universeId = if l_FFlagLuaAppEdpBackendV2LogUniverseIdForEvents_0 then v20 else nil
            });
            return;
        else
            l_default_0:logRobloxTelemetryCounter(v9.FetchSuccess, 1);
            return;
        end;
    end;
end;
if l_FFlagLuaAppEdpBackendV2LogFetchSuccessAndFailure_0 and v9.FetchFailure and v9.FetchFailureEvent then
    v9.logFetchFailure = function(v21, v22, v23) --[[ Line: 306 ]]
        -- upvalues: l_default_0 (copy), v9 (copy)
        l_default_0:logRobloxTelemetryEvent(v9.FetchFailureEvent, {}, {
            universeId = v21, 
            errorCode = v22, 
            errorMessage = v23
        });
        l_default_0:logRobloxTelemetryCounter(v9.FetchFailure, 1, {
            universeId = v21, 
            errorCode = v22, 
            errorMessage = v23
        });
    end;
end;
if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0) and v9.SduiLayoutOrderConflict then
    v9.logSduiLayoutOrderConflict = function(v24) --[[ Line: 328 ]]
        -- upvalues: l_default_0 (copy), v9 (copy)
        l_default_0:logRobloxTelemetryEvent(v9.SduiLayoutOrderConflict, {}, v24);
    end;
end;
if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0) and v9.VisibilityVariables then
    v9.logVisibilityVariables = function(v25) --[[ Line: 345 ]]
        -- upvalues: l_default_0 (copy), v9 (copy)
        l_default_0:logRobloxTelemetryEvent(v9.VisibilityVariables, {}, {
            presentVarsString = v25
        });
    end;
end;
return v9;