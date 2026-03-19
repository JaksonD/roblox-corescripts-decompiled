local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local v5 = {
    l_UserGameSettings_0:GetPropertyChangedSignal("GamepadCameraSensitivity"), 
    l_UserGameSettings_0:GetPropertyChangedSignal("MouseSensitivity"), 
    l_UserGameSettings_0:GetPropertyChangedSignal("MouseSensitivityFirstPerson"), 
    l_UserGameSettings_0:GetPropertyChangedSignal("MouseSensitivityThirdPerson")
};
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Utility.ExternalEventConnection);
local v8 = require(script.Parent.SliderEntry);
local v9 = require(l_Parent_0.Utility.SendAnalytics);
local v10 = require(l_Parent_0.Resources.Constants);
local _ = function(v11) --[[ Line: 30 ]] --[[ Name: guiToEngineSensitivity ]]
    local _ = nil;
    return (math.clamp(if v11 <= 5 then 0.198 * v11 + 0.01 else 0.6 * v11 - 2, 0, 10));
end;
local _ = function(v14) --[[ Line: 41 ]] --[[ Name: engineToGuiSensitivity ]]
    local _ = nil;
    return (math.clamp(math.floor((if v14 <= 1 then (v14 - 0.01) / 0.198 else (v14 + 2) / 0.6) / 0.01 + 0.5) * 0.01, 0, 10));
end;
local v17 = l_Roact_0.PureComponent:extend("CameraSensitivityEntry");
v17.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean)
});
v17.init = function(v18) --[[ Line: 62 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    v18.onSensitivityChanged = function() --[[ Line: 63 ]]
        -- upvalues: v18 (copy), l_UserGameSettings_0 (ref)
        v18:setState({
            engineSensitivity = l_UserGameSettings_0.MouseSensitivityFirstPerson.X
        });
    end;
    v18.onSensitivityChanged();
end;
v17.render = function(v19) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), l_UserGameSettings_0 (copy), v9 (copy), v10 (copy), v5 (copy), v7 (copy)
    local v20 = {};
    local l_createElement_0 = l_Roact_0.createElement;
    local l_v8_0 = v8;
    local v23 = {
        LayoutOrder = v19.props.LayoutOrder, 
        labelKey = "CoreScripts.InGameMenu.GameSettings.CameraSensitivity"
    };
    local l_engineSensitivity_0 = v19.state.engineSensitivity;
    local _ = nil;
    v23.value = math.clamp(math.floor((if l_engineSensitivity_0 <= 1 then (l_engineSensitivity_0 - 0.01) / 0.198 else (l_engineSensitivity_0 + 2) / 0.6) / 0.01 + 0.5) * 0.01, 0, 10);
    v23.min = 0;
    v23.max = 10;
    v23.stepInterval = 1;
    v23.keyboardInputStepInterval = 0.01;
    v23.valueChanged = function(v26) --[[ Line: 84 ]] --[[ Name: valueChanged ]]
        -- upvalues: l_UserGameSettings_0 (ref), v9 (ref), v10 (ref)
        local v27 = nil;
        local v28 = math.clamp(if v26 <= 5 then 0.198 * v26 + 0.01 else 0.6 * v26 - 2, 0, 10);
        v27 = Vector2.new(v28, v28);
        l_UserGameSettings_0.MouseSensitivityFirstPerson = v27;
        l_UserGameSettings_0.MouseSensitivityThirdPerson = v27;
        v9(v10.AnalyticsSettingsChangeName, nil, {}, true);
    end;
    v23.canCaptureFocus = v19.props.canCaptureFocus;
    v23.isMenuOpen = v19.props.isMenuOpen;
    v20.CameraSensitivityMouseSlider = l_createElement_0(l_v8_0, v23);
    for _, v30 in ipairs(v5) do
        v20[tostring(v30) .. "CameraSensitivityControlConnection"] = l_Roact_0.createElement(v7, {
            event = v30, 
            callback = v19.onSensitivityChanged
        });
    end;
    return l_Roact_0.createFragment(v20);
end;
return v17;