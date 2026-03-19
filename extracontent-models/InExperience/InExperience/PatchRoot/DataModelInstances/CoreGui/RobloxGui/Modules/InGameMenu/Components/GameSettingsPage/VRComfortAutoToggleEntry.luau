local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Utility.ExternalEventConnection);
local v7 = require(script.Parent.ToggleEntry);
local v8 = require(l_Parent_0.Utility.SendAnalytics);
local v9 = require(l_Parent_0.Resources.Constants);
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("VRComfortSetting");
local v11 = l_Roact_0.PureComponent:extend("VRComfortAutoToggleEntry");
v11.validateProps = l_t_0.strictInterface({
    customValueKey = l_t_0.string, 
    derivedValueKey = l_t_0.string, 
    labelKey = l_t_0.string, 
    LayoutOrder = l_t_0.integer, 
    checkedValue = l_t_0.optional(l_t_0.any)
});
v11.defaultProps = {
    checkedValue = true
};
v11.init = function(v12, v13) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_UserGameSettings_0 (copy), v8 (copy), v9 (copy)
    v12.derivedValueChangeEvent = l_UserGameSettings_0:GetPropertyChangedSignal(v13.derivedValueKey);
    v12:setState({
        checked = l_UserGameSettings_0[v13.derivedValueKey] == v13.checkedValue, 
        vrComfortSetting = l_UserGameSettings_0.VRComfortSetting
    });
    v12.onExternalChange = function() --[[ Line: 53 ]]
        -- upvalues: l_UserGameSettings_0 (ref), v13 (copy), v12 (copy)
        local v14 = l_UserGameSettings_0[v13.derivedValueKey];
        v12:setState({
            checked = v14 == v13.checkedValue
        });
    end;
    v12.onToggled = function() --[[ Line: 60 ]]
        -- upvalues: v12 (copy), l_UserGameSettings_0 (ref), v13 (copy), v8 (ref), v9 (ref)
        if v12.state.vrComfortSetting == Enum.VRComfortSetting.Custom then
            if l_UserGameSettings_0[v13.customValueKey] == v13.checkedValue then
                l_UserGameSettings_0[v13.customValueKey] = not v13.checkedValue;
            else
                l_UserGameSettings_0[v13.customValueKey] = v13.checkedValue;
            end;
            v8(v9.AnalyticsSettingsChangeName, nil, {}, true);
        end;
    end;
end;
v11.render = function(v15) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v7 (copy), v6 (copy), l_l_UserGameSettings_0_PropertyChangedSignal_0 (copy), l_UserGameSettings_0 (copy)
    local l_props_0 = v15.props;
    return l_Roact_0.createFragment({
        Toggle = l_Roact_0.createElement(v7, {
            checked = v15.state.checked, 
            labelKey = l_props_0.labelKey, 
            LayoutOrder = l_props_0.LayoutOrder, 
            onToggled = v15.onToggled, 
            isDisabled = v15.state.vrComfortSetting ~= Enum.VRComfortSetting.Custom
        }), 
        DerivedValueListener = l_Roact_0.createElement(v6, {
            event = v15.derivedValueChangeEvent, 
            callback = v15.onExternalChange
        }), 
        VRComfortSettingListener = l_Roact_0.createElement(v6, {
            event = l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = function() --[[ Line: 91 ]] --[[ Name: callback ]]
                -- upvalues: v15 (copy), l_UserGameSettings_0 (ref)
                v15:setState({
                    vrComfortSetting = l_UserGameSettings_0.VRComfortSetting
                });
            end
        })
    });
end;
return v11;