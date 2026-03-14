local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("NotInterestedFeedbackFormActionThrottleHundredthsPercent", 0);
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry;
local v6 = v2.strictInterface({
    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v2.string, 
    universeId = v2.string, 
    sortId = v2.optional(v2.string), 
    actionType = v2.string
});
local v7 = {
    eventName = "notInterestedFeedbackFormAction", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        25, 
        10, 
        22
    }, 
    description = "User has taken an action with the Not Interested Feedback Form"
};
return function(v8, v9) --[[ Line: 30 ]]
    -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v6 (copy), l_TelemetryService_0 (copy), v7 (copy)
    if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 and not v9 then
        l_DiscoveryEventErrorLogger_0.reportError("NotInterestedFeedbackFormActionInvalidInterface", "event is missing context");
    end;
    local v10, v11 = v6(v8);
    if not v10 then
        l_DiscoveryEventErrorLogger_0.reportError("NotInterestedFeedbackFormActionInvalidInterface", v11);
    end;
    l_TelemetryService_0:LogEvent(v7, {
        eventContext = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v9 else nil, 
        standardizedFields = {
            "addSessionInfo"
        }, 
        customFields = v8
    });
end;