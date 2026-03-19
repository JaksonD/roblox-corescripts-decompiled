local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local _ = require(l_script_FirstAncestor_0.SduiIntegrationTypes);
local v3 = game:DefineFastInt("SduiPageTimerEventHundredthsPercent", 0);
local v4 = game:DefineFastInt("SduiLoadMoreFromApiEventHundredthsPercent", 0);
local v5 = {
    eventName = "Sdui_PageLoadTimer", 
    description = "Duration for sdui page loading, network requests", 
    lastUpdated = {
        25, 
        11, 
        18
    }, 
    backends = {
        "Points", 
        "EventIngest"
    }, 
    throttlingPercentage = v3
};
local v6 = {
    eventName = "Sdui_LoadMoreFromApi", 
    description = "Event log for pagination request", 
    lastUpdated = {
        26, 
        1, 
        9
    }, 
    backends = {
        "Points", 
        "EventIngest"
    }, 
    throttlingPercentage = v4
};
local v7 = {
    eventName = "Sdui_PageStatus", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        25, 
        11, 
        18
    }, 
    description = "Status code for sdui page requests"
};
local v8 = {
    eventName = "Sdui_PagePayloadSize", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        25, 
        11, 
        19
    }, 
    description = "Payload size for sdui page requests"
};
local function v10(v9) --[[ Line: 64 ]] --[[ Name: sendLoadTimerEvent ]]
    -- upvalues: l_TelemetryService_0 (copy), v5 (copy)
    l_TelemetryService_0:LogEvent(v5, {
        customFields = v9, 
        standardizedFields = {
            "addOSInfo"
        }
    });
end;
local v11 = {
    [Enum.HttpError.OK] = "OK", 
    [Enum.HttpError.InvalidUrl] = "InvalidUrl", 
    [Enum.HttpError.DnsResolve] = "DnsResolve", 
    [Enum.HttpError.ConnectFail] = "ConnectFail", 
    [Enum.HttpError.OutOfMemory] = "OutOfMemory", 
    [Enum.HttpError.TimedOut] = "Timedout", 
    [Enum.HttpError.TooManyRedirects] = "TooManyRedirects", 
    [Enum.HttpError.InvalidRedirect] = "InvalidRedirect", 
    [Enum.HttpError.NetFail] = "NetFail", 
    [Enum.HttpError.Aborted] = "Aborted", 
    [Enum.HttpError.SslConnectFail] = "SslConnectFail", 
    [Enum.HttpError.SslVerificationFail] = "SslVerificationFail", 
    [Enum.HttpError.Unknown] = "Unknown"
};
return {
    sendLoadTimerEvent = v10, 
    sendPageStatusEvent = function(v12, v13, v14) --[[ Line: 87 ]] --[[ Name: sendPageStatusEvent ]]
        -- upvalues: l_TelemetryService_0 (copy), v7 (copy), v11 (copy)
        l_TelemetryService_0:LogCounter(v7, {
            customFields = {
                pageKey = v12, 
                statusCode = v13 or "unknown", 
                httpError = if v14 then v11[v14] else nil
            }
        });
    end, 
    sendPagePayloadSizeEvent = function(v15, v16) --[[ Line: 97 ]] --[[ Name: sendPagePayloadSizeEvent ]]
        -- upvalues: l_TelemetryService_0 (copy), v8 (copy)
        local v17 = nil;
        if typeof(v16) == "buffer" then
            v17 = buffer.len(v16);
        elseif typeof(v16) == "string" then
            v17 = string.len(v16);
        else
            return;
        end;
        l_TelemetryService_0:LogStat(v8, {
            customFields = {
                pageKey = v15
            }
        }, v17);
    end, 
    sendLoadMoreEvent = function(v18) --[[ Line: 113 ]] --[[ Name: sendLoadMoreEvent ]]
        -- upvalues: l_TelemetryService_0 (copy), v6 (copy)
        l_TelemetryService_0:LogEvent(v6, {
            customFields = {
                surfaceKey = v18
            }, 
            standardizedFields = {
                "addOSInfo"
            }
        });
    end
};