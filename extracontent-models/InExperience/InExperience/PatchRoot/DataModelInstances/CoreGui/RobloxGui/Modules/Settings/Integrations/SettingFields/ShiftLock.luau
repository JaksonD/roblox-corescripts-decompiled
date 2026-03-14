local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Players_0 = game:GetService("Players");
local v5 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v5.ValueChangedSignal;
local l_AvailabilitySignal_0 = v5.AvailabilitySignal;
local l_VisibilitySignal_0 = v5.VisibilitySignal;
local l_SettingEnum_0 = v5.SettingEnum;
local v10 = require(l_script_FirstAncestor_0.Integrations.Constants);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_LAYOUT_ORDER_0 = v10.GAMESETTINGS.LAYOUT_ORDER;
local v13 = {
    [Enum.ControlMode.MouseLockSwitch] = true, 
    [Enum.ControlMode.Classic] = false
};
local function _() --[[ Line: 31 ]] --[[ Name: ShiftLockValue ]]
    -- upvalues: v13 (copy), l_GameSettings_0 (copy), l_ValueChangedSignal_0 (copy)
    local v14 = v13[l_GameSettings_0.ControlMode];
    local v15 = l_ValueChangedSignal_0.new(v14);
    v15:connect(function(v16) --[[ Line: 34 ]]
        -- upvalues: v13 (ref), l_GameSettings_0 (ref)
        if v13[l_GameSettings_0.ControlMode] == v16 then
            return;
        else
            l_GameSettings_0.ControlMode = if v16 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic;
            return;
        end;
    end);
    return v15;
end;
local function v31(_, v19) --[[ Line: 45 ]] --[[ Name: ShiftLockAvailability ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_UserInputService_0 (copy), l_AvailabilitySignal_0 (copy)
    local function _() --[[ Line: 46 ]] --[[ Name: available ]]
        -- upvalues: l_LocalPlayer_0 (ref), l_UserInputService_0 (ref)
        local v20 = not l_LocalPlayer_0 or l_LocalPlayer_0.DevEnableMouseLock;
        return l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled and v20;
    end;
    local l_new_0 = l_AvailabilitySignal_0.new;
    local v23 = not l_LocalPlayer_0 or l_LocalPlayer_0.DevEnableMouseLock;
    l_new_0 = l_new_0(l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled and v23);
    l_new_0:connect(function(v24) --[[ Line: 52 ]]
        -- upvalues: v19 (copy)
        if v24 then
            v19:set(v24);
        end;
    end, true);
    if l_LocalPlayer_0 then
        l_LocalPlayer_0.Changed:Connect(function(v25) --[[ Line: 59 ]]
            -- upvalues: l_new_0 (copy), l_LocalPlayer_0 (ref), l_UserInputService_0 (ref)
            if v25 == "DevEnableMouseLock" then
                local l_l_new_0_0 = l_new_0;
                local v27 = not l_LocalPlayer_0 or l_LocalPlayer_0.DevEnableMouseLock;
                l_l_new_0_0:set(l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled and v27);
            end;
        end);
    end;
    l_UserInputService_0.Changed:Connect(function(v28) --[[ Line: 66 ]]
        -- upvalues: l_new_0 (copy), l_LocalPlayer_0 (ref), l_UserInputService_0 (ref)
        if v28 == "MouseEnabled" or v28 == "KeyboardEnabled" then
            local l_l_new_0_1 = l_new_0;
            local v30 = not l_LocalPlayer_0 or l_LocalPlayer_0.DevEnableMouseLock;
            l_l_new_0_1:set(l_UserInputService_0.MouseEnabled and l_UserInputService_0.KeyboardEnabled and v30);
        end;
    end);
    return l_new_0;
end;
local v32 = v13[l_GameSettings_0.ControlMode];
local v33 = l_ValueChangedSignal_0.new(v32);
v33:connect(function(v34) --[[ Line: 34 ]]
    -- upvalues: v13 (copy), l_GameSettings_0 (copy)
    if v13[l_GameSettings_0.ControlMode] == v34 then
        return;
    else
        l_GameSettings_0.ControlMode = if v34 then Enum.ControlMode.MouseLockSwitch else Enum.ControlMode.Classic;
        return;
    end;
end);
local l_v33_0 = v33;
v32 = l_VisibilitySignal_0.new(true);
v33 = v31(l_v33_0, v32);
return {
    id = "shift-lock", 
    field_type = l_SettingEnum_0.Toggle, 
    label = "CoreScripts.InGameMenu.GameSettings.ShiftLock", 
    alreadyLocalized = false, 
    onChanged = l_v33_0, 
    availability = v33, 
    visibility = v32, 
    layoutOrder = l_LAYOUT_ORDER_0.ShiftLockFrame
};