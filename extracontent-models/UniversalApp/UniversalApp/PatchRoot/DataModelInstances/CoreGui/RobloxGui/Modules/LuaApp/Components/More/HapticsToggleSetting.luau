local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local l_InputSize_0 = v5.Enums.InputSize;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v9 = require(l_Modules_0.LuaApp.Components.More.DeviceSettings.DeviceSettingsPageSetting);
local l_Toggle_0 = v5.Toggle;
return function(v11) --[[ Line: 18 ]] --[[ Name: HapticsToggle ]]
    -- upvalues: v3 (copy), l_UserGameSettings_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v9 (copy), l_Toggle_0 (copy), l_InputSize_0 (copy)
    local v12, v13 = v3.useState(l_UserGameSettings_0.HapticStrength);
    local v14 = l_useStyle_0();
    local v15 = l_useLocalization_0({
        hapticToggleDescription = "Feature.Accessibility.Description.Haptics", 
        hapticHeader = "Feature.Accessibility.Header.Haptics"
    });
    local v16 = v3.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: l_UserGameSettings_0 (ref)
        l_UserGameSettings_0.HapticStrength = l_UserGameSettings_0.HapticStrength == 1 and 0 or 1;
    end, {});
    v3.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v13 (copy)
        local v17 = l_UserGameSettings_0:GetPropertyChangedSignal("HapticStrength"):Connect(function() --[[ Line: 33 ]]
            -- upvalues: v13 (ref), l_UserGameSettings_0 (ref)
            v13(l_UserGameSettings_0.HapticStrength);
        end);
        return function() --[[ Line: 36 ]]
            -- upvalues: v17 (copy)
            if v17 then
                v17:Disconnect();
            end;
        end;
    end);
    return v3.createElement(v9, {
        style = v14, 
        header = v15.hapticHeader, 
        description = v15.hapticToggleDescription, 
        layoutOrder = v11.layoutOrder, 
        Control = v3.createElement(l_Toggle_0, {
            isChecked = v12 ~= 0, 
            onActivated = v16, 
            label = "", 
            size = l_InputSize_0.Large
        })
    });
end;