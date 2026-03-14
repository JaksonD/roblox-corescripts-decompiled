local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {
    eventName = "LuaAppSentryReporterInit", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        2026, 
        2, 
        19
    }, 
    description = "Counter to track SentryReporter initialization success and failure."
};
local v2 = {
    eventName = "LuaAppSentryReporterErrorSent", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        2026, 
        2, 
        19
    }, 
    description = "Track successful and failed error reports to Sentry"
};
local v3 = {
    eventName = "LuaAppSentryReporterLogAttachment", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        2026, 
        2, 
        19
    }, 
    description = "Track successful and failed log attachments to Sentry"
};
return {
    logInitSuccess = function() --[[ Line: 143 ]] --[[ Name: logInitSuccess ]]
        -- upvalues: l_TelemetryService_0 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v1, {
            customFields = {
                isSuccess = "true"
            }
        }, 1);
    end, 
    logInitFailure = function() --[[ Line: 166 ]] --[[ Name: logInitFailure ]]
        -- upvalues: l_TelemetryService_0 (copy), v1 (copy)
        l_TelemetryService_0:LogCounter(v1, {
            customFields = {
                isSuccess = "false"
            }
        }, 1);
    end, 
    logErrorSentSuccess = function() --[[ Line: 186 ]] --[[ Name: logErrorSentSuccess ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy)
        l_TelemetryService_0:LogCounter(v2, {
            customFields = {
                isSuccess = "true"
            }
        }, 1);
    end, 
    logErrorSentFailure = function() --[[ Line: 206 ]] --[[ Name: logErrorSentFailure ]]
        -- upvalues: l_TelemetryService_0 (copy), v2 (copy)
        l_TelemetryService_0:LogCounter(v2, {
            customFields = {
                isSuccess = "false"
            }
        }, 1);
    end, 
    logLogAttachmentSuccess = function() --[[ Line: 226 ]] --[[ Name: logLogAttachmentSuccess ]]
        -- upvalues: l_TelemetryService_0 (copy), v3 (copy)
        l_TelemetryService_0:LogCounter(v3, {
            customFields = {
                isSuccess = "true"
            }
        }, 1);
    end, 
    logLogAttachmentFailure = function() --[[ Line: 246 ]] --[[ Name: logLogAttachmentFailure ]]
        -- upvalues: l_TelemetryService_0 (copy), v3 (copy)
        l_TelemetryService_0:LogCounter(v3, {
            customFields = {
                isSuccess = "false"
            }
        }, 1);
    end
};