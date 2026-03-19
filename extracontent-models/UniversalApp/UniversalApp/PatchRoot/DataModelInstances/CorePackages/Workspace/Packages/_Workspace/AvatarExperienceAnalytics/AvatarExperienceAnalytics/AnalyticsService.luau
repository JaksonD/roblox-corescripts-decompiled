local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_SessionService_0 = game:GetService("SessionService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v5 = require(l_Parent_0.Analytics);
local v6 = v5.Analytics.new(l_RbxAnalyticsService_0);
local l_getPlatformTarget_0 = v5.getPlatformTarget;
local v8 = game:DefineFastFlag("AXSendSessionForEvents", false);
return {
    Diag = v6.Diag, 
    EventStream = {
        setRBXEventStream = function(_, v10, v11, v12) --[[ Line: 17 ]] --[[ Name: setRBXEventStream ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v13 = v12 or {};
            l_EventIngestService_0:SetRBXEventStream(l_getPlatformTarget_0(), v10, v11, v13);
        end, 
        sendEventDeferred = function(_, v15, v16, v17) --[[ Line: 22 ]] --[[ Name: sendEventDeferred ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v18 = v17 or {};
            l_EventIngestService_0:SendEventDeferred(l_getPlatformTarget_0(), v15, v16, v18);
        end, 
        sendEventImmediately = function(_, v20, v21, v22) --[[ Line: 27 ]] --[[ Name: sendEventImmediately ]]
            -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
            local v23 = v22 or {};
            l_EventIngestService_0:SendEventImmediately(l_getPlatformTarget_0(), v20, v21, v23);
        end, 
        sendTelemetryEvent = function(_, v25, v26, v27) --[[ Line: 32 ]] --[[ Name: sendTelemetryEvent ]]
            -- upvalues: l_default_0 (copy), v8 (copy), l_SessionService_0 (copy)
            l_default_0:logRobloxTelemetryEvent({
                eventName = v26, 
                backends = {
                    l_default_0.TelemetryBackends.EventIngest
                }, 
                throttlingPercentage = 10000
            }, {
                "addSessionId", 
                "addSessionInfo"
            }, v27, v25);
            if v8 then
                l_default_0:logRobloxTelemetryEvent({
                    eventName = "sessionIdDebugEvent", 
                    backends = {
                        l_default_0.TelemetryBackends.EventIngest
                    }, 
                    throttlingPercentage = 10000
                }, {
                    "addSessionInfo"
                }, {
                    testEventName = v26, 
                    sessionTagL2a = l_SessionService_0:GetSessionTag("level2a")
                }, v25);
            end;
        end
    }
};