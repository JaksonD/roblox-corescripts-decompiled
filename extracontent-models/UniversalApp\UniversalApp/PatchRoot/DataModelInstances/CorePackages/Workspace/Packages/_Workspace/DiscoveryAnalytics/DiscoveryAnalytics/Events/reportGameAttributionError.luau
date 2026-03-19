local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local v3 = require(l_Parent_0.t);
local v4 = require(l_script_FirstAncestor_0.Points.reportWarning);
local v5 = game:DefineFastInt("LuaAppGameAttributionErrorEventThrottleHundrethsPercent", 0);
local v6 = v3.strictInterface({
    errorType = v3.string, 
    clickedUniverseId = v3.string, 
    universeId = v3.optional(v3.string), 
    gameSetTypeId = v3.optional(v3.string), 
    gameSetTargetId = v3.optional(v3.string), 
    sortIndex = v3.number, 
    sortEntryIndex = v3.optional(v3.number)
});
local v7 = {
    eventName = "GameAttributionError", 
    backends = {
        v2.TelemetryBackends.Points, 
        v2.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v5, 
    lastUpdated = {
        25, 
        7, 
        30
    }, 
    description = "Tracks failures to resolve game attribution errors"
};
return function(v8, v9) --[[ Line: 36 ]] --[[ Name: reportGameAttributionError ]]
    -- upvalues: v6 (copy), v4 (copy), v2 (copy), v7 (copy)
    local v10, v11 = v6(v9);
    if not v10 then
        v4(v2.default, "EventLogging", v11);
    end;
    v2.default:logRobloxTelemetryEvent(v7, {
        "addSessionInfo", 
        v2.StandardizedFields.addOsInfo
    }, v9, v8);
end;