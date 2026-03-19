local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v2 = game:DefineFastInt("TopBarToggledThrottleHundredthsPercent", 0);
local l_game_EngineFeature_0 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled");
local v4 = {
    eventName = "topbar_toggled", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v2, 
    lastUpdated = {
        25, 
        6, 
        10
    }, 
    description = "Event fired every time TopBar is toggled open/close in UI-less mode", 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/6270"
};
return function(v5) --[[ Line: 22 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy), v4 (copy)
    local v6 = nil;
    local v7 = nil;
    if l_game_EngineFeature_0 then
        v6 = {
            "addPlaceId", 
            "addUniverseId", 
            "addPlaySessionId", 
            "addSessionInfo"
        };
        v7 = {
            is_toggled_on = tostring(v5)
        };
    else
        v6 = {
            "addPlaceId", 
            "addUniverseId", 
            "addSessionInfo"
        };
        v7 = {
            is_toggled_on = tostring(v5), 
            playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId()
        };
    end;
    l_TelemetryService_0:LogEvent(v4, {
        standardizedFields = v6, 
        customFields = v7
    });
end;