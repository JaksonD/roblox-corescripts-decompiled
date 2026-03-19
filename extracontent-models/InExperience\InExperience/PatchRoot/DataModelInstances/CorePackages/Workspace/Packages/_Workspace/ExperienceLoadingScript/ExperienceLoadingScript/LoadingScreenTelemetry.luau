local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {
    "addPlaceId", 
    "addUniverseId", 
    "addOSInfo"
};
return {
    countPlayerLocalizationChoiceNotReady = function() --[[ Line: 6 ]] --[[ Name: countPlayerLocalizationChoiceNotReady ]]
        -- upvalues: l_TelemetryService_0 (copy), v1 (copy)
        local v2 = {
            eventName = "PlayerLocalizationChoiceNotReady", 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            lastUpdated = {
                2026, 
                2, 
                24
            }, 
            description = "Counter to track when the auto translate badge doesn't mount before the API response arrived.", 
            links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1"
        };
        l_TelemetryService_0:LogCounter(v2, {
            standardizedFields = v1
        }, 1);
    end, 
    countPlayerLocalizationChoiceFailed = function(v3) --[[ Line: 17 ]] --[[ Name: countPlayerLocalizationChoiceFailed ]]
        -- upvalues: l_TelemetryService_0 (copy), v1 (copy)
        local v4 = {
            eventName = "PlayerLocalizationChoiceFailed", 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            lastUpdated = {
                2026, 
                2, 
                24
            }, 
            description = "Counter to track when the player localization choice API returns an error.", 
            links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1"
        };
        l_TelemetryService_0:LogCounter(v4, {
            standardizedFields = v1, 
            customFields = {
                responseCode = v3.responseCode, 
                errorType = v3.errorType
            }
        }, 1);
    end, 
    countAutoTranslateZeroUniverseId = function() --[[ Line: 34 ]] --[[ Name: countAutoTranslateZeroUniverseId ]]
        -- upvalues: l_TelemetryService_0 (copy), v1 (copy)
        local v5 = {
            eventName = "AutoTranslateZeroUniverseId", 
            backends = {
                "RobloxTelemetryCounter"
            }, 
            lastUpdated = {
                2026, 
                3, 
                11
            }, 
            description = "Counter to track when AutoTranslateBadge skips the API request because universeId is 0.", 
            links = "https://grafana.rbx.com/goto/cfe9j31p1wge8a?orgId=1"
        };
        l_TelemetryService_0:LogCounter(v5, {
            standardizedFields = v1
        }, 1);
    end
};