local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = game:DefineFastInt("TraversalTelemetryThrottleHundrethsPercent", 0);
local v2 = {
    BackButtonActions = {
        eventName = "coreui_inexp_back_button_actions", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            22, 
            10, 
            25
        }, 
        description = "Event fired every time the User engages with Traversal Back Button", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339"
    }, 
    HistoryMenuButtonActions = {
        eventName = "coreui_inexp_history_chevron_clicks", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            22, 
            10, 
            25
        }, 
        description = "Event fired every time the User engages with Traversal History Menu Button", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339"
    }, 
    HistoryMenuItemClick = {
        eventName = "coreui_inexp_history_dropdown_clicks", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            22, 
            10, 
            25
        }, 
        description = "Event fired every time the User engages with Traversal History Menu Items", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339"
    }, 
    HistoryMenuHistoryClick = {
        eventName = "coreui_inexp_history_landing_entrypoint_clicks", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            22, 
            10, 
            25
        }, 
        description = "Event fired every time the User engages with Traversal History Menu's History Item", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339"
    }, 
    HistoryPageBackButtonClick = {
        eventName = "coreui_inexp_history_back_clicks", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            22, 
            10, 
            25
        }, 
        description = "Event fired every time the User engages with Traversal History Page's Back Button", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339"
    }, 
    HistoryPageExperienceTileClick = {
        eventName = "coreui_inexp_history_landing_tiles_clicks", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            22, 
            10, 
            25
        }, 
        description = "Event fired every time the User engages with Traversal History Page Tiles", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339"
    }, 
    TeleportConfirmationActions = {
        eventName = "coreui_inexp_history_leave_page_actions", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            22, 
            10, 
            25
        }, 
        description = "Event fired every time the User engages with Traversal History Leave Confirmation", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339"
    }
};
local v3 = {
    placeId = "addPlaceId", 
    universeId = "addUniverseId", 
    playsessionId = "addPlaySessionId"
};
local v4 = {};
v4.__index = v4;
v4.sendBackButtonActionEvent = function(v5) --[[ Line: 142 ]] --[[ Name: sendBackButtonActionEvent ]]
    -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v2.BackButtonActions, {
        standardizedFields = {
            v3.placeId, 
            v3.universeId, 
            v3.playsessionId
        }, 
        customFields = v5
    });
end;
v4.sendHistoryMenuButtonActionEvent = function(v6) --[[ Line: 149 ]] --[[ Name: sendHistoryMenuButtonActionEvent ]]
    -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v2.HistoryMenuButtonActions, {
        standardizedFields = {
            v3.placeId, 
            v3.universeId, 
            v3.playsessionId
        }, 
        customFields = v6
    });
end;
v4.sendHistoryMenuItemClick = function(v7) --[[ Line: 156 ]] --[[ Name: sendHistoryMenuItemClick ]]
    -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v2.HistoryMenuItemClick, {
        standardizedFields = {
            v3.placeId, 
            v3.universeId, 
            v3.playsessionId
        }, 
        customFields = v7
    });
end;
v4.sendHistoryMenuHistoryClick = function(v8) --[[ Line: 163 ]] --[[ Name: sendHistoryMenuHistoryClick ]]
    -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v2.HistoryMenuHistoryClick, {
        standardizedFields = {
            v3.placeId, 
            v3.universeId, 
            v3.playsessionId
        }, 
        customFields = v8
    });
end;
v4.sendHistoryPageBackButtonClick = function(v9) --[[ Line: 170 ]] --[[ Name: sendHistoryPageBackButtonClick ]]
    -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v2.HistoryPageBackButtonClick, {
        standardizedFields = {
            v3.placeId, 
            v3.universeId, 
            v3.playsessionId
        }, 
        customFields = v9
    });
end;
v4.sendHistoryPageExperienceTileClick = function(v10) --[[ Line: 177 ]] --[[ Name: sendHistoryPageExperienceTileClick ]]
    -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v2.HistoryPageExperienceTileClick, {
        standardizedFields = {
            v3.placeId, 
            v3.universeId, 
            v3.playsessionId
        }, 
        customFields = v10
    });
end;
v4.sendTeleportConfirmationActions = function(v11) --[[ Line: 184 ]] --[[ Name: sendTeleportConfirmationActions ]]
    -- upvalues: l_TelemetryService_0 (copy), v2 (copy), v3 (copy)
    l_TelemetryService_0:LogEvent(v2.TeleportConfirmationActions, {
        standardizedFields = {
            v3.placeId, 
            v3.universeId, 
            v3.playsessionId
        }, 
        customFields = v11
    });
end;
return v4;