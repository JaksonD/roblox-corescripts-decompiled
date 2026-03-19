local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_FFlagLuaAppIedpSendPoints_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIedpSendPoints;
local v5 = game:DefineFastInt("InExperienceDetailsPromptLoadedHundredthsPercent", 0);
local v6 = v2.strictInterface({
    targetUniverseId = v2.string, 
    gameInfoRetrievalStatus = v2.string, 
    playabilityRetrievalStatus = v2.string, 
    targetRootPlaceId = v2.optional(v2.number), 
    isPlayable = v2.optional(v2.boolean), 
    playabilityStatus = v2.optional(v2.string), 
    gameInfoErrorType = v2.optional(v2.string)
});
local v7 = {
    eventName = "inExperienceDetailsPromptLoaded", 
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
    description = "Fires when the in-experience details prompt gameInfo and playability are loaded"
};
return function(v8) --[[ Line: 30 ]] --[[ Name: fireInExperienceDetailsPromptLoadedEvent ]]
    -- upvalues: v6 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_TelemetryService_0 (copy), v7 (copy)
    local v9, v10 = v6(v8);
    if not v9 then
        l_DiscoveryEventErrorLogger_0.reportError("InExperienceDetailsPromptLoadedInvalidInterface", v10);
    end;
    l_TelemetryService_0:LogEvent(v7, {
        standardizedFields = {
            "addUniverseId", 
            "addOSInfo"
        }, 
        customFields = v8
    });
end;