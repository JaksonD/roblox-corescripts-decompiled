local l_Parent_0 = script:FindFirstAncestor("NotificationsUpsell").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local v2 = require(script.Parent.Parent.ModalEventConstants);
game:DefineFastInt("LuaPushUpsellEventThrottleHundrethsPercent", 10000);
return {
    eventName = v2.OptInPushUpsellEventName, 
    backends = {
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = game:GetFastInt("LuaPushUpsellEventThrottleHundrethsPercent"), 
    lastUpdated = {
        24, 
        6, 
        30
    }, 
    description = "Tracks events related to push notifications upsell modal"
};