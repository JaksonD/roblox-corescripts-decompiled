local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagLuaAppIedpSendPoints_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpSendPoints;
local v5 = game:DefineFastInt("InExperienceDetailsPromptOpenedHundredthsPercent", 0);
local v6 = v2.strictInterface({
    targetUniverseId = v2.string
});
local v7 = {
    eventName = "inExperienceDetailsPromptOpened", 
    backends = if l_FFlagLuaAppIedpSendPoints_0 then {
        "EventIngest", 
        "Points"
    } else {
        "EventIngest"
    }, 
    throttlingPercentage = v5, 
    lastUpdated = if l_FFlagLuaAppIedpSendPoints_0 then {
        25, 
        11, 
        19
    } else {
        25, 
        11, 
        11
    }, 
    description = "Fires when the in-experience details prompt is opened"
};
return function(v8) --[[ Line: 24 ]] --[[ Name: fireInExperienceDetailsPromptOpenedEvent ]]
    -- upvalues: v6 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_TelemetryService_0 (copy), v7 (copy)
    local v9, v10 = v6(v8);
    if not v9 then
        l_DiscoveryEventErrorLogger_0.reportError("InExperienceDetailsPromptOpenedInvalidInterface", v10);
    end;
    l_TelemetryService_0:LogEvent(v7, {
        standardizedFields = {
            "addUniverseId", 
            "addOSInfo"
        }, 
        customFields = v8
    });
end;