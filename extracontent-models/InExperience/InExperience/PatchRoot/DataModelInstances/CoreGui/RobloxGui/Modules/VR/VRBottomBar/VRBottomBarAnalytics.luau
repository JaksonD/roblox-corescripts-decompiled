local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_game_EngineFeature_0 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled");
return {
    sendEventToTelemetryV2 = function(v3) --[[ Line: 12 ]] --[[ Name: sendEventToTelemetryV2 ]]
        -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy)
        local v4 = {
            eventName = "coreui_vr_bottom_bar_action", 
            backends = {
                "EventIngest"
            }, 
            throttlingPercentage = game:DefineFastInt("VRBottomBarActionEventThrottleHunderedthsPercent", 0), 
            lastUpdated = {
                2025, 
                5, 
                12
            }, 
            description = "Event fired from the client every time VRBottomBar buttons are clicked", 
            links = "https://github.rbx.com/Roblox/proto-schemas/pull/5803"
        };
        local v5 = {
            "addPlaceId", 
            "addUniverseId", 
            "addSessionInfo"
        };
        local v6 = {
            integration_id = v3.integrationId, 
            is_toggle_on = tostring(v3.isToggleOn), 
            source = v3.source
        };
        if l_game_EngineFeature_0 then
            table.insert(v5, "addPlaySessionId");
        else
            v6.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
        end;
        l_TelemetryService_0:LogEvent(v4, {
            standardizedFields = v5, 
            customFields = v6
        });
    end
};