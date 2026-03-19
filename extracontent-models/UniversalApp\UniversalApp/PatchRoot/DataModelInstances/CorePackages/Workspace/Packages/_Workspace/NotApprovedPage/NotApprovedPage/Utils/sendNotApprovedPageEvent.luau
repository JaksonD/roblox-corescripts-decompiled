local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.ArgCheck);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v5 = game:DefineFastInt("NotApprovedPageEventThrottleHunderedthsPercent", 10000);
sendNotApprovedPageEvent = function(v6) --[[ Line: 23 ]] --[[ Name: sendNotApprovedPageEvent ]]
    -- upvalues: v2 (copy), v5 (copy), v1 (copy), l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy)
    v2.assert(v6 ~= nil, "Additional arguments need to be provided to NotApprovedPageEventReporter.");
    v2.assert(v6.eventType ~= nil, "Event type needs to be provided to NotApprovedPageEventReporter");
    local v7 = {
        eventName = "NotApprovedPageEvent", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v5, 
        lastUpdated = {
            2025, 
            6, 
            12
        }, 
        description = "Event for the Not Approved Page", 
        links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/trustsafety/trustsafety_not_approved_page_event.proto"
    };
    v6 = v1.Dictionary.join(v6 or {}, {
        context = "NotApprovedPageV2", 
        timestamp = DateTime.now().UnixTimestampMillis, 
        platform = "UniversalApp", 
        sid = l_RbxAnalyticsService_0:GetSessionId()
    });
    l_TelemetryService_0:LogEvent(v7, {
        customFields = v6
    });
end;
return sendNotApprovedPageEvent;