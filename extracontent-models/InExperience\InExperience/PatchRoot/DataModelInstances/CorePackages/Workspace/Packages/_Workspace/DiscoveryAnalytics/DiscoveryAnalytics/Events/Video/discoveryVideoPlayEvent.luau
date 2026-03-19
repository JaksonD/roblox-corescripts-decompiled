local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_Parent_0.t);
local v4 = game:DefineFastInt("DiscoveryVideoPlayEventHundredthsPercent", 0);
local v5 = v3.strictInterface({
    videoAssetId = v3.string, 
    videoPlaybackSessionId = v3.string, 
    universeId = v3.string, 
    rootPlaceId = v3.string, 
    gameSetTypeId = v3.optional(v3.string), 
    sortPos = v3.optional(v3.number)
});
local v6 = {
    eventName = "discoveryVideoPlay", 
    backends = {
        v1.TelemetryBackends.Points, 
        v1.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        25, 
        4, 
        23
    }, 
    description = "Fire when discovery video playback session starts", 
    links = ""
};
return function(v7, v8) --[[ Line: 34 ]] --[[ Name: discoveryVideoPlayEvent ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy), v1 (copy), v6 (copy)
    local v9, v10 = v5(v8);
    if not v9 then
        l_mutedError_0(v10);
    end;
    v1.default:logRobloxTelemetryEvent(v6, {
        "addSessionInfo", 
        v1.StandardizedFields.addOsInfo
    }, v8, v7);
end;