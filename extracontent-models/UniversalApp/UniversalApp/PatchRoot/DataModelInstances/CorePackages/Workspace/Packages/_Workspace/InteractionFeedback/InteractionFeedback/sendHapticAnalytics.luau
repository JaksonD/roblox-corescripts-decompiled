local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local v3 = require(l_Parent_0.t);
local l_flaggedMutedError_0 = require(l_Parent_0.Loggers).flaggedMutedError;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v6 = game:DefineFastInt("HapticTriggerAttemptThrottleHundredthsPercent", 0);
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry;
local v8 = v3.interface({
    hapticType = v3.string, 
    contextKey = v3.string, 
    interactionType = v3.string, 
    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v3.string
});
return function(v9, v10) --[[ Line: 24 ]]
    -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v8 (copy), l_flaggedMutedError_0 (copy), v6 (copy), l_UserGameSettings_0 (copy), l_TelemetryService_0 (copy)
    if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 and not v10 then
        l_DiscoveryEventErrorLogger_0.reportError("HapticTriggerAttemptInvalidInterface", "event is missing context");
    end;
    local v11, v12 = v8(v9);
    if not v11 then
        if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then
            l_DiscoveryEventErrorLogger_0.reportError("HapticTriggerAttemptInvalidInterface", v12);
        else
            l_flaggedMutedError_0("HapticTriggerAttemptInvalidInterface", v12);
        end;
    end;
    local v13 = {
        eventName = "hapticTriggerAttempt", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v6, 
        lastUpdated = {
            25, 
            10, 
            21
        }, 
        description = "User has taken an action that may have triggered haptic feedback"
    };
    local v14 = {
        "addOSInfo", 
        "addSessionInfo"
    };
    local l_HapticStrength_0 = l_UserGameSettings_0.HapticStrength;
    v9.hapticEnabledByUser = l_HapticStrength_0 > 0;
    v9.hapticStrength = l_HapticStrength_0;
    l_TelemetryService_0:LogEvent(v13, {
        eventContext = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v10 else nil, 
        standardizedFields = v14, 
        customFields = v9
    });
end;