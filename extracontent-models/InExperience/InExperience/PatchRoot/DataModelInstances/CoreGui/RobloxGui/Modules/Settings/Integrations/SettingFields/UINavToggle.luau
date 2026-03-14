local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GameSettings_0 = UserSettings().GameSettings;
local v4 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v4.ValueChangedSignal;
local l_AvailabilitySignal_0 = v4.AvailabilitySignal;
local l_SettingEnum_0 = v4.SettingEnum;
local l_LAYOUT_ORDER_0 = require(l_script_FirstAncestor_0.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER;
local function _() --[[ Line: 23 ]] --[[ Name: UINavValue ]]
    -- upvalues: l_ValueChangedSignal_0 (copy), l_GameSettings_0 (copy)
    local v9 = l_ValueChangedSignal_0.new(l_GameSettings_0.UiNavigationKeyBindEnabled);
    v9:connect(function(v10) --[[ Line: 26 ]]
        -- upvalues: l_GameSettings_0 (ref)
        if l_GameSettings_0.UiNavigationKeyBindEnabled == v10 then
            return;
        else
            l_GameSettings_0.UiNavigationKeyBindEnabled = v10;
            return;
        end;
    end);
    return v9;
end;
local function _() --[[ Line: 39 ]] --[[ Name: UINavAvailability ]]
    -- upvalues: l_AvailabilitySignal_0 (copy), l_UserInputService_0 (copy)
    local v12 = l_AvailabilitySignal_0.new(l_UserInputService_0.KeyboardEnabled);
    l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 42 ]]
        -- upvalues: v12 (copy), l_UserInputService_0 (ref)
        v12:set(l_UserInputService_0.KeyboardEnabled);
    end);
    return v12;
end;
local v14 = {
    id = "ui-nav-toggle", 
    field_type = l_SettingEnum_0.Toggle, 
    label = "CoreScripts.InGameMenu.GameSettings.UINavToggle", 
    description = "CoreScripts.InGameMenu.GameSettings.UINavToggleDescription", 
    alreadyLocalized = false
};
local v15 = l_ValueChangedSignal_0.new(l_GameSettings_0.UiNavigationKeyBindEnabled);
v15:connect(function(v16) --[[ Line: 26 ]]
    -- upvalues: l_GameSettings_0 (copy)
    if l_GameSettings_0.UiNavigationKeyBindEnabled == v16 then
        return;
    else
        l_GameSettings_0.UiNavigationKeyBindEnabled = v16;
        return;
    end;
end);
v14.onChanged = v15;
v15 = l_AvailabilitySignal_0.new(l_UserInputService_0.KeyboardEnabled);
l_UserInputService_0:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ Line: 42 ]]
    -- upvalues: v15 (copy), l_UserInputService_0 (copy)
    v15:set(l_UserInputService_0.KeyboardEnabled);
end);
v14.availability = v15;
v14.layoutOrder = l_LAYOUT_ORDER_0.UiNavigationKeyBindEnabledFrame;
return v14;