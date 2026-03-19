local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.LoggingProtocol);
local _ = require(l_script_FirstAncestor_0.types);
local v5 = require(l_script_FirstAncestor_0.Flags.getFIntSongbirdTelemetryThrottle);
local l_default_0 = v3.default;
local v7 = {
    eventName = "NowPlayingPeekAnalytics", 
    backends = {
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v5(), 
    lastUpdated = {
        24, 
        30, 
        9
    }, 
    description = " Peek UI related analytics ", 
    links = "https://roblox.atlassian.net/l/cp/VLpzDBz5"
};
return function(v8) --[[ Line: 30 ]] --[[ Name: sendAnalytics ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), v2 (copy), l_default_0 (copy), v7 (copy)
    local v9 = {
        placeid = tostring(game.PlaceId), 
        sessionid = l_RbxAnalyticsService_0:GetSessionId(), 
        universeid = tostring(game.GameId)
    };
    local v10 = v2.Dictionary.join(v8, v9);
    l_default_0:logRobloxTelemetryEvent(v7, nil, v10);
    return nil;
end;