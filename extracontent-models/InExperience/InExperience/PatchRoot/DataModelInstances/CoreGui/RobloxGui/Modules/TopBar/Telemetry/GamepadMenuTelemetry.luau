local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GamepadMenu_0 = script.Parent.Parent.Components.Presentation.GamepadMenu;
local _ = require(l_GamepadMenu_0.EnumGamepadMenuOptions);
local l_game_EngineFeature_0 = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled");
local v5 = game:DefineFastInt("GamepadMenuActionThrottleHundrethsPercent", 0);
local function _(v6, v7) --[[ Line: 26 ]] --[[ Name: mapProp ]]
    if v6 ~= nil then
        return (v7(v6));
    else
        return nil;
    end;
end;
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    return (setmetatable({}, v9));
end;
v9.onOptionSelected = function(v10) --[[ Line: 39 ]] --[[ Name: onOptionSelected ]]
    -- upvalues: v5 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy)
    local v11 = {
        eventName = "coreui_gamepad_menu_action", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v5, 
        lastUpdated = {
            25, 
            4, 
            30
        }, 
        description = "Event fired from the client every time GamepadMenu Options are Selected", 
        links = "https://github.rbx.com/Roblox/proto-schemas/pull/5803"
    };
    local v12 = {
        "addPlaceId", 
        "addUniverseId", 
        "addSessionInfo"
    };
    local v13 = {
        menu_option_name = v10.menuOptionName
    };
    local l_usedShortcut_0 = v10.usedShortcut;
    local l_tostring_0 = tostring;
    v13.used_shortcut = if l_usedShortcut_0 ~= nil then l_tostring_0(l_usedShortcut_0) else nil;
    l_usedShortcut_0 = v10.isToggleOpen;
    l_tostring_0 = tostring;
    v13.is_toggle_open = if l_usedShortcut_0 ~= nil then l_tostring_0(l_usedShortcut_0) else nil;
    if l_game_EngineFeature_0 then
        table.insert(v12, "addPlaySessionId");
    else
        v12 = {
            "addPlaceId", 
            "addUniverseId", 
            "addSessionInfo"
        };
        v13.playsessionid = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    l_TelemetryService_0:LogEvent(v11, {
        standardizedFields = v12, 
        customFields = v13
    });
end;
v9.default = v9.new();
return v9;