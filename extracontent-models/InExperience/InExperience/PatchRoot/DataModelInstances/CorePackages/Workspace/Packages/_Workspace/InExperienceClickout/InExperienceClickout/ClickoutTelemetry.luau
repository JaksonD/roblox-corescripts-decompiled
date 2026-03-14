local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {
    "addPlaceId", 
    "addUniverseId", 
    "addSessionId", 
    "addOSInfo", 
    "addSessionInfo"
};
local v2 = {
    "addPlaceId", 
    "addUniverseId", 
    "addOSInfo"
};
local v3 = {
    eventName = "InExperienceClickoutToggled", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("InExperienceClickoutToggledTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        26, 
        1, 
        28
    }, 
    description = "        This is fired when the in-experience clickout webview is opened or closed.\n\t\thttps://github.rbx.com/Roblox/proto-schemas/pull/9488\n    "
};
local v4 = {
    eventName = "InExperienceClickoutToggledCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        26, 
        1, 
        28
    }, 
    description = "\t\tCounter for InExperienceClickoutToggled events.\n\t"
};
return {
    logWebviewToggled = function(v5, v6, v7) --[[ Line: 33 ]] --[[ Name: logWebviewToggled ]]
        -- upvalues: l_TelemetryService_0 (copy), v3 (copy), v1 (copy), v4 (copy), v2 (copy)
        local v8 = {
            is_opened = tostring(v5), 
            flow_id = v6, 
            target_url = v7
        };
        l_TelemetryService_0:LogEvent(v3, {
            standardizedFields = v1, 
            customFields = v8
        });
        l_TelemetryService_0:LogCounter(v4, {
            standardizedFields = v2, 
            customFields = {
                is_opened = tostring(v5)
            }
        }, 1);
    end
};