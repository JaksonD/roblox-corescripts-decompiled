local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = game:DefineFastFlag("EnableAppAgeSignalsErrorTelemetry", false);
local v2 = {
    ErrorCounter = {
        eventName = "AppAgeSignalsErrorCounter", 
        backends = {
            "RobloxTelemetryCounter"
        }, 
        lastUpdated = {
            2026, 
            3, 
            4
        }, 
        description = "Error counter for app age signals collection flow"
    }, 
    ErrorEvent = {
        eventName = "AppAgeSignalsError", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = 10000, 
        lastUpdated = {
            2026, 
            3, 
            4
        }, 
        description = "Error event for app age signals collection flow"
    }
};
return {
    reportError = function(v3) --[[ Line: 28 ]] --[[ Name: reportError ]]
        -- upvalues: v1 (copy), l_TelemetryService_0 (copy), v2 (copy)
        if not v1 then
            return;
        else
            l_TelemetryService_0:LogCounter(v2.ErrorCounter, {
                customFields = {
                    error = v3.error, 
                    signalSource = v3.signalSource
                }
            }, 1);
            l_TelemetryService_0:LogEvent(v2.ErrorEvent, {
                standardizedFields = {
                    "addSessionInfo", 
                    "addSessionId", 
                    "addOSInfo"
                }, 
                customFields = {
                    error = v3.error, 
                    signalSource = v3.signalSource
                }
            });
            return;
        end;
    end
};