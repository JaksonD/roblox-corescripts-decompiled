local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v3 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v3.ValueChangedSignal;
local l_SettingEnum_0 = v3.SettingEnum;
local l_LAYOUT_ORDER_0 = require(l_script_FirstAncestor_0.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER;
local v7 = {
    ON = true, 
    OFF = false
};
local v8 = {
    MAX = 1, 
    MIN = 0
};
return {
    id = "haptics", 
    field_type = l_SettingEnum_0.Toggle, 
    label = "CoreScripts.InGameMenu.GameSettings.Haptics", 
    layoutOrder = l_LAYOUT_ORDER_0.HapticsFrame, 
    onChanged = (function() --[[ Line: 29 ]] --[[ Name: HapticValue ]]
        -- upvalues: l_GameSettings_0 (copy), v8 (copy), v7 (copy), l_ValueChangedSignal_0 (copy)
        local function _() --[[ Line: 30 ]]
            -- upvalues: l_GameSettings_0 (ref), v8 (ref), v7 (ref)
            if l_GameSettings_0.HapticStrength == v8.MIN then
                return v7.OFF;
            else
                return v7.ON;
            end;
        end;
        local v10 = l_ValueChangedSignal_0.new(if l_GameSettings_0.HapticStrength == v8.MIN then v7.OFF else v7.ON);
        v10:connect(function(v11) --[[ Line: 35 ]]
            -- upvalues: l_GameSettings_0 (ref), v8 (ref), v7 (ref)
            if (if l_GameSettings_0.HapticStrength == v8.MIN then v7.OFF else v7.ON) == v11 then
                return;
            else
                l_GameSettings_0.HapticStrength = if v11 == v7.ON then v8.MAX else v8.MIN;
                return;
            end;
        end);
        return v10;
    end)(), 
    alreadyLocalized = false
};