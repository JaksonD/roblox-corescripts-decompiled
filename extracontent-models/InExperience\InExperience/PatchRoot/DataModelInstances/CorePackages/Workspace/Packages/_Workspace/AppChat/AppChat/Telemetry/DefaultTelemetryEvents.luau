local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local v2 = require(l_Parent_0.SocialLuaAnalytics);
local v3 = require(l_Parent_0.Cryo);
local v4 = game:DefineFastFlag("AppChatTelemetryCounterAddSharedInfo", false);
local v5 = game:DefineFastFlag("AppChatTelemetryStatAddSharedInfo", false);
local function v8(_, v7) --[[ Line: 13 ]] --[[ Name: defaultFormatCounter ]]
    -- upvalues: v4 (copy)
    if v4 then
        return {
            placement = v7.placement, 
            entryPoint = v7.entryPoint, 
            hasActiveParty = v7.currentSquadId ~= nil
        };
    else
        return {
            placement = v7.placement
        };
    end;
end;
local function v13(v9, v10) --[[ Line: 26 ]] --[[ Name: namedCounterConfigurationAndFormat ]]
    -- upvalues: v2 (copy), v3 (copy), v8 (copy)
    return {
        type = v2.Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryCounter, 
        overrideName = function() --[[ Line: 32 ]] --[[ Name: overrideName ]]
            -- upvalues: v9 (copy)
            return v9;
        end, 
        format = function(v11, v12) --[[ Line: 35 ]] --[[ Name: format ]]
            -- upvalues: v3 (ref), v8 (ref), v10 (copy)
            return v3.Dictionary.join(v8(v11, v12), v10(v11, v12));
        end, 
        standardizedFields = nil, 
        throttlingThousandths = nil
    };
end;
local function v17(v14) --[[ Line: 42 ]] --[[ Name: namedCounterConfigurationNoEmittedInfo ]]
    -- upvalues: v13 (copy)
    return (v13(v14, function(_, _) --[[ Line: 45 ]]
        return {};
    end));
end;
local function v20(_, v19) --[[ Line: 52 ]] --[[ Name: defaultFormatStat ]]
    -- upvalues: v5 (copy)
    if v5 then
        return {
            placement = v19.placement, 
            entryPoint = v19.entryPoint, 
            hasActiveParty = v19.currentSquadId ~= nil
        };
    else
        return {
            placement = v19.placement
        };
    end;
end;
local function v25(v21, v22) --[[ Line: 64 ]] --[[ Name: namedStatConfigurationAndFormat ]]
    -- upvalues: v2 (copy), v3 (copy), v20 (copy)
    return {
        type = v2.Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryStat, 
        overrideName = function() --[[ Line: 70 ]] --[[ Name: overrideName ]]
            -- upvalues: v21 (copy)
            return v21;
        end, 
        format = function(v23, v24) --[[ Line: 73 ]] --[[ Name: format ]]
            -- upvalues: v3 (ref), v20 (ref), v22 (copy)
            return v3.Dictionary.join(v20(v23, v24), v22(v23, v24));
        end, 
        standardizedFields = nil, 
        throttlingThousandths = nil
    };
end;
local _ = function(_, v27) --[[ Line: 81 ]] --[[ Name: defaultEventIngestFormat ]]
    return v27;
end;
local function v32(v29) --[[ Line: 84 ]] --[[ Name: eventIngestWithFormatFunction ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    return {
        type = v2.Analytics.Enums.SupportedTelemetryBackends.EventIngest, 
        standardizedFields = {
            v1.StandardizedFields.addSessionId, 
            v1.StandardizedFields.addSessionInfo
        }, 
        format = function(v30, v31) --[[ Line: 93 ]] --[[ Name: format ]]
            -- upvalues: v3 (ref), v29 (copy)
            return v3.Dictionary.join(v31, v29(v30, v31));
        end, 
        overrideName = nil, 
        throttlingThousandths = nil
    };
end;
local v35 = v32(function(_, _) --[[ Line: 104 ]]
    return {};
end);
return {
    namedCounterConfigurationAndFormat = v13, 
    namedCounterConfigurationNoEmittedInfo = v17, 
    namedStatConfigurationAndFormat = v25, 
    eventIngestWithFormatFunction = v32, 
    EVENT_INGEST_NO_EMITTED_INFO = v35
};