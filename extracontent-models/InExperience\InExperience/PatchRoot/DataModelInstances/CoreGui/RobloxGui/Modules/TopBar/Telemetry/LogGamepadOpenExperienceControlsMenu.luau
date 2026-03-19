local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Flags.FFlagLoggingGamepadOpenExpControlsMenu);
local v4 = game:DefineFastInt("GamepadOpenExperienceControlsMenuThrottleHundrethsPercent", 0);
local l_game_EngineFeature_0 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled");
local v6 = {
    eventName = "coreui_gamepad_toggle_exp_controls", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        25, 
        4, 
        25
    }, 
    description = "Event fired from the client every time Experience Controls Menu is toggled open/closed", 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/5750"
};
return function(v7) --[[ Line: 24 ]]
    -- upvalues: v3 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy), v6 (copy)
    if not v3 then
        return;
    else
        local v8 = nil;
        local v9 = nil;
        if l_game_EngineFeature_0 then
            v8 = {
                "addPlaceId", 
                "addUniverseId", 
                "addPlaySessionId", 
                "addSessionInfo"
            };
            v9 = {
                is_toggle_open = tostring(v7)
            };
        else
            v8 = {
                "addPlaceId", 
                "addUniverseId", 
                "addSessionInfo"
            };
            v9 = {
                is_toggle_open = tostring(v7), 
                playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId()
            };
        end;
        l_TelemetryService_0:LogEvent(v6, {
            standardizedFields = v8, 
            customFields = v9
        });
        return;
    end;
end;