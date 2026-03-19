local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v3 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v3.ValueChangedSignal;
local l_AvailabilitySignal_0 = v3.AvailabilitySignal;
local l_SettingEnum_0 = v3.SettingEnum;
local l_LAYOUT_ORDER_0 = require(l_script_FirstAncestor_0.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER;
local function _() --[[ Line: 22 ]] --[[ Name: CameraInvertedValue ]]
    -- upvalues: l_ValueChangedSignal_0 (copy), l_GameSettings_0 (copy)
    local v8 = l_ValueChangedSignal_0.new(l_GameSettings_0.CameraYInverted);
    v8:connect(function(v9) --[[ Line: 25 ]]
        -- upvalues: l_GameSettings_0 (ref)
        if l_GameSettings_0.CameraYInverted == v9 then
            return;
        else
            l_GameSettings_0.CameraYInverted = v9;
            return;
        end;
    end, true);
    return v8;
end;
local function _() --[[ Line: 36 ]] --[[ Name: CameraInvertedAvailability ]]
    -- upvalues: l_AvailabilitySignal_0 (copy), l_GameSettings_0 (copy)
    local v11 = l_AvailabilitySignal_0.new(l_GameSettings_0.IsUsingCameraYInverted);
    l_GameSettings_0.Changed:Connect(function(v12) --[[ Line: 39 ]]
        -- upvalues: v11 (copy), l_GameSettings_0 (ref)
        if v12 == "IsUsingCameraYInverted" then
            v11:set(l_GameSettings_0.IsUsingCameraYInverted);
        end;
    end);
    return v11;
end;
local v14 = {
    id = "camera-inverted", 
    field_type = l_SettingEnum_0.Toggle, 
    label = "CoreScripts.InGameMenu.GameSettings.InvertedCamera", 
    alreadyLocalized = false
};
local v15 = l_ValueChangedSignal_0.new(l_GameSettings_0.CameraYInverted);
v15:connect(function(v16) --[[ Line: 25 ]]
    -- upvalues: l_GameSettings_0 (copy)
    if l_GameSettings_0.CameraYInverted == v16 then
        return;
    else
        l_GameSettings_0.CameraYInverted = v16;
        return;
    end;
end, true);
v14.onChanged = v15;
v15 = l_AvailabilitySignal_0.new(l_GameSettings_0.IsUsingCameraYInverted);
l_GameSettings_0.Changed:Connect(function(v17) --[[ Line: 39 ]]
    -- upvalues: v15 (copy), l_GameSettings_0 (copy)
    if v17 == "IsUsingCameraYInverted" then
        v15:set(l_GameSettings_0.IsUsingCameraYInverted);
    end;
end);
v14.availability = v15;
v14.layoutOrder = l_LAYOUT_ORDER_0.CameraInvertedFrame;
return v14;