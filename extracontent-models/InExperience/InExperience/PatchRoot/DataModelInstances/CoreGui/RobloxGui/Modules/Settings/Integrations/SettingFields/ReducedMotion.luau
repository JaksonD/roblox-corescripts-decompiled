local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v3 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v3.ValueChangedSignal;
local l_SettingEnum_0 = v3.SettingEnum;
local l_LAYOUT_ORDER_0 = require(l_script_FirstAncestor_0.Integrations.Constants).GAMESETTINGS.LAYOUT_ORDER;
local function _() --[[ Line: 21 ]] --[[ Name: ReducedMotionValue ]]
    -- upvalues: l_GameSettings_0 (copy), l_ValueChangedSignal_0 (copy)
    local l_ReducedMotion_0 = l_GameSettings_0.ReducedMotion;
    local v8 = l_ValueChangedSignal_0.new(l_ReducedMotion_0);
    v8:connect(function(v9) --[[ Line: 25 ]]
        -- upvalues: l_GameSettings_0 (ref)
        if l_GameSettings_0.ReducedMotion == v9 then
            return;
        else
            l_GameSettings_0.ReducedMotion = v9;
            return;
        end;
    end);
    return v8;
end;
local v11 = {
    id = "reduced-motion", 
    field_type = l_SettingEnum_0.Toggle, 
    label = "CoreScripts.InGameMenu.GameSettings.ReduceMotionLabel", 
    description = "CoreScripts.InGameMenu.GameSettings.ReduceMotionDescription", 
    alreadyLocalized = false
};
local l_ReducedMotion_1 = l_GameSettings_0.ReducedMotion;
local v13 = l_ValueChangedSignal_0.new(l_ReducedMotion_1);
v13:connect(function(v14) --[[ Line: 25 ]]
    -- upvalues: l_GameSettings_0 (copy)
    if l_GameSettings_0.ReducedMotion == v14 then
        return;
    else
        l_GameSettings_0.ReducedMotion = v14;
        return;
    end;
end);
v11.onChanged = v13;
v11.layoutOrder = l_LAYOUT_ORDER_0.ReducedMotionFrame;
return v11;