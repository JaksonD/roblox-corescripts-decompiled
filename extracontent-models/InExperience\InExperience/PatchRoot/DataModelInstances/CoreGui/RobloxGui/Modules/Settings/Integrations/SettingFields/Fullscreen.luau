local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v4.ValueChangedSignal;
local l_AvailabilitySignal_0 = v4.AvailabilitySignal;
local l_SettingEnum_0 = v4.SettingEnum;
local v8 = require(l_script_FirstAncestor_0.Integrations.Constants);
local v9 = require(l_script_FirstAncestor_0.Integrations.Utils);
local l_LAYOUT_ORDER_0 = v8.GAMESETTINGS.LAYOUT_ORDER;
local v14 = (function() --[[ Line: 24 ]] --[[ Name: FullScreenValue ]]
    -- upvalues: l_ValueChangedSignal_0 (copy), l_GameSettings_0 (copy), l_GuiService_0 (copy)
    local v11 = l_ValueChangedSignal_0.new(l_GameSettings_0:InFullScreen());
    v11:connect(function(v12) --[[ Line: 27 ]]
        -- upvalues: l_GameSettings_0 (ref), l_GuiService_0 (ref)
        if v12 == l_GameSettings_0:InFullScreen() then
            return;
        else
            l_GuiService_0:ToggleFullscreen();
            return;
        end;
    end, true);
    l_GameSettings_0.FullscreenChanged:Connect(function(v13) --[[ Line: 35 ]]
        -- upvalues: v11 (copy)
        v11:set(v13);
    end);
    return v11;
end)();
local function _() --[[ Line: 45 ]] --[[ Name: initAvailability ]]
    -- upvalues: v9 (copy)
    local v15 = true;
    if v9.getDeviceType() ~= v9.DeviceTypes.Desktop then
        v15 = v9.getDeviceType() == v9.DeviceTypes.Unknown;
    end;
    return v15;
end;
local l_new_0 = l_AvailabilitySignal_0.new;
local v18 = true;
if v9.getDeviceType() ~= v9.DeviceTypes.Desktop then
    v18 = v9.getDeviceType() == v9.DeviceTypes.Unknown;
end;
l_new_0 = l_new_0(v18);
return {
    id = "fullscreen", 
    field_type = l_SettingEnum_0.Toggle, 
    label = "CoreScripts.InGameMenu.GameSettings.FullScreen", 
    layoutOrder = l_LAYOUT_ORDER_0.FullScreenFrame, 
    onChanged = v14, 
    alreadyLocalized = false, 
    availability = l_new_0
};