local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_MessageBus_0 = require(l_Parent_1.MessageBus).MessageBus;
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.ArgCheck);
local _ = require(l_Parent_0.LoggingProtocolTypes);
local v6 = require(l_Parent_1.AppCommonLib);
local l_callOnce_0 = v6.callOnce;
local v8 = require(l_Parent_0.callOncePerDM);
local l_Signal_0 = v6.Signal;
game:DefineFastFlag("EnableTelemetryProtocol", false);
getDomainName = function() --[[ Line: 82 ]] --[[ Name: getDomainName ]]
    if game:GetFastFlag("EnableTelemetryProtocol") then
        return "Telemetry";
    else
        return "Logging";
    end;
end;
local v10 = {
    UNSPECIFIED = "UNSPECIFIED", 
    EventIngest = "EventIngest", 
    Points = "Points", 
    EphemeralCounter = "EphemeralCounter", 
    EphemeralStat = "EphemeralStat", 
    Counter = "RobloxTelemetryCounter", 
    Stats = "RobloxTelemetryStat"
};
local v11 = {
    addPlaceId = "addPlaceId", 
    addUniverseId = "addUniverseId", 
    addPlaceInstanceId = "addPlaceInstanceId", 
    addSessionId = "addSessionId", 
    addOsInfo = "addOSInfo"
};
local v12 = v3.strictInterface({
    eventName = v3.string, 
    timestamp = v3.optional(v3.number), 
    metadata = v3.optional(v3.keys(v3.string))
});
local v13 = {
    TelemetryBackends = v10, 
    StandardizedFields = v11, 
    LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "logEventWithTimestamp"), 
        validateParams = v12
    }, 
    GET_TIMESTAMP_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "getTimestamp"), 
        validateParams = v3.table
    }, 
    LOG_EVENT_FROM_LUA_DESCRIPTOR = {
        fid = l_MessageBus_0.getMessageId(getDomainName(), "logEventFromLua"), 
        validateParams = v3.interface({
            eventType = v3.string, 
            config = v3.optional(v3.strictInterface({
                eventName = v3.string, 
                backends = v3.array(v3.valueOf(v10)), 
                throttlingPercentage = v3.optional(v3.number), 
                lastUpdated = v3.optional(v3.array(v3.integer)), 
                description = v3.optional(v3.string), 
                links = v3.optional(v3.string)
            })), 
            data = v3.optional(v3.table)
        })
    }
};
v13.__index = v13;
v13.new = function(v14) --[[ Line: 150 ]] --[[ Name: new ]]
    -- upvalues: l_MessageBus_0 (copy), l_Signal_0 (copy), v13 (copy)
    local v15 = {
        messageBus = v14 or l_MessageBus_0, 
        durationLoggerSignal = l_Signal_0.new()
    };
    setmetatable(v15, v13);
    return v15;
end;
v13.setDurationLoggerListener = function(v16, v17) --[[ Line: 159 ]] --[[ Name: setDurationLoggerListener ]]
    return v16.durationLoggerSignal:connect(v17);
end;
v13.logEventWithTimestamp = function(v18, v19, v20, v21) --[[ Line: 163 ]] --[[ Name: logEventWithTimestamp ]]
    -- upvalues: v4 (copy)
    v4.isType(v19, "string", "eventName");
    v4.isType(v20, "number", "timestamp");
    local v22 = {
        eventName = v19, 
        timestamp = v20, 
        metadata = v21
    };
    v18.messageBus.call(v18.LOG_EVENT_WITH_TIMESTAMP_DESCRIPTOR, v22);
    v18.durationLoggerSignal:fire(v19);
end;
v13.logEvent = function(v23, v24, v25) --[[ Line: 175 ]] --[[ Name: logEvent ]]
    -- upvalues: v4 (copy)
    v4.isType(v24, "string", "eventName");
    v23:logEventWithTimestamp(v24, 0, v25);
end;
v13.logEventOnce = function(v26, v27, v28) --[[ Line: 180 ]] --[[ Name: logEventOnce ]]
    -- upvalues: v4 (copy), v8 (copy), l_callOnce_0 (copy)
    v4.isType(v27, "string", "eventName");
    if game:DefineFastFlag("LuaAppSendTTIEventsPerDM", false) then
        v8(string.format("logging_protocol_key-%s", v27), function() --[[ Line: 184 ]]
            -- upvalues: v26 (copy), v27 (copy), v28 (copy)
            v26:logEvent(v27, v28);
        end);
        return;
    else
        l_callOnce_0(string.format("logging_protocol_key-%s", v27), function() --[[ Line: 188 ]]
            -- upvalues: v26 (copy), v27 (copy), v28 (copy)
            v26:logEvent(v27, v28);
        end);
        return;
    end;
end;
v13.getTimestamp = function(v29) --[[ Line: 195 ]] --[[ Name: getTimestamp ]]
    return v29.messageBus.call(v29.GET_TIMESTAMP_DESCRIPTOR, {});
end;
v13.logRobloxTelemetryCounter = function(v30, v31, v32, v33) --[[ Line: 199 ]] --[[ Name: logRobloxTelemetryCounter ]]
    local v34 = {
        eventType = "RobloxTelemetryCounter", 
        config = v31, 
        data = if v32 then {
            incrementValue = v32, 
            customFields = v33
        } else if v33 then {
            customFields = v33
        } else nil
    };
    v30.messageBus.call(v30.LOG_EVENT_FROM_LUA_DESCRIPTOR, v34);
end;
v13.logRobloxTelemetryStat = function(v35, v36, v37, v38) --[[ Line: 221 ]] --[[ Name: logRobloxTelemetryStat ]]
    local v39 = {
        eventType = "RobloxTelemetryStat", 
        config = v36, 
        data = {
            statValue = v37, 
            customFields = v38
        }
    };
    v35.messageBus.call(v35.LOG_EVENT_FROM_LUA_DESCRIPTOR, v39);
end;
v13.logRobloxTelemetryEvent = function(v40, v41, v42, v43, v44) --[[ Line: 237 ]] --[[ Name: logRobloxTelemetryEvent ]]
    local v45 = {
        eventType = "RobloxTelemetry", 
        config = v41, 
        data = {
            standardizedFields = v42, 
            customFields = v43, 
            eventContext = v44
        }
    };
    v40.messageBus.call(v40.LOG_EVENT_FROM_LUA_DESCRIPTOR, v45);
end;
v13.logEphemeralCounterEvent = function(v46, v47, v48) --[[ Line: 255 ]] --[[ Name: logEphemeralCounterEvent ]]
    local v49 = {
        eventType = "EphemeralCounter", 
        config = v47, 
        data = if v48 then {
            incrementValue = v48
        } else nil
    };
    v46.messageBus.call(v46.LOG_EVENT_FROM_LUA_DESCRIPTOR, v49);
end;
v13.logEphemeralStatEvent = function(v50, v51, v52) --[[ Line: 269 ]] --[[ Name: logEphemeralStatEvent ]]
    local v53 = {
        eventType = "EphemeralStat", 
        config = v51, 
        data = {
            statValue = v52
        }
    };
    v50.messageBus.call(v50.LOG_EVENT_FROM_LUA_DESCRIPTOR, v53);
end;
v13.default = v13.new();
return v13;