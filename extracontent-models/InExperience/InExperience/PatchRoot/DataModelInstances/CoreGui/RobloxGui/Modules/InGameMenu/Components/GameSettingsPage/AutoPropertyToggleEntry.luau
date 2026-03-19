local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Utility.ExternalEventConnection);
local v6 = require(script.Parent.ToggleEntry);
local v7 = require(l_Parent_0.Utility.SendAnalytics);
local v8 = require(l_Parent_0.Resources.Constants);
local v9 = l_Roact_0.PureComponent:extend("AutoPropertyToggleEntry");
v9.validateProps = l_t_0.strictInterface({
    instance = l_t_0.Instance, 
    valueKey = l_t_0.string, 
    lockedToOff = l_t_0.optional(l_t_0.boolean), 
    onValue = l_t_0.optional(l_t_0.any), 
    offValue = l_t_0.optional(l_t_0.any), 
    labelKey = l_t_0.string, 
    LayoutOrder = l_t_0.integer, 
    subtextEnabled = l_t_0.optional(l_t_0.boolean), 
    subtextKey = l_t_0.optional(l_t_0.string)
});
v9.defaultProps = {
    onValue = true, 
    offValue = false, 
    lockedToOff = false, 
    subtextEnabled = false, 
    subtextKey = ""
};
v9.init = function(v10, v11) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v8 (copy)
    local v12 = v11.instance[v11.valueKey];
    v10.changeEvent = v11.instance:GetPropertyChangedSignal(v11.valueKey);
    v10:setState({
        checked = not v11.lockedToOff and v12 == v11.onValue
    });
    v10.onExternalChange = function() --[[ Line: 45 ]]
        -- upvalues: v11 (copy), v10 (copy)
        local v13 = v11.instance[v11.valueKey];
        v10:setState({
            checked = v13 == v11.onValue
        });
    end;
    v10.onToggled = function() --[[ Line: 52 ]]
        -- upvalues: v10 (copy), v11 (copy), v7 (ref), v8 (ref)
        if v10.props.lockedToOff then
            return;
        else
            if v11.instance[v11.valueKey] == v11.onValue then
                v11.instance[v11.valueKey] = v11.offValue;
            else
                v11.instance[v11.valueKey] = v11.onValue;
            end;
            v7(v8.AnalyticsSettingsChangeName, nil, {}, true);
            return;
        end;
    end;
end;
v9.render = function(v14) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v6 (copy), v5 (copy)
    local l_props_0 = v14.props;
    return l_Roact_0.createFragment({
        Toggle = l_Roact_0.createElement(v6, {
            checked = v14.state.checked, 
            lockedToOff = l_props_0.lockedToOff, 
            labelKey = l_props_0.labelKey, 
            LayoutOrder = l_props_0.LayoutOrder, 
            onToggled = v14.onToggled, 
            subtextEnabled = l_props_0.subtextEnabled, 
            subtextKey = l_props_0.subtextKey
        }), 
        Listener = l_Roact_0.createElement(v5, {
            event = v14.changeEvent, 
            callback = v14.onExternalChange
        })
    });
end;
return v9;