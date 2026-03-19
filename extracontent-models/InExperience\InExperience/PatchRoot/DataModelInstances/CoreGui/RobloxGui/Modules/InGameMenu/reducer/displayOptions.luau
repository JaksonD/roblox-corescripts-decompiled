local l_CorePackages_0 = game:GetService("CorePackages");
local l_Rodux_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Rodux;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Resources.Constants);
local v4 = require(l_Parent_0.Actions.SetInspectMenuEnabled);
local v5 = require(l_Parent_0.Actions.SetInputType);
local l_InputType_0 = v3.InputType;
return l_Rodux_0.createReducer({
    inspectMenuEnabled = true, 
    inputType = l_InputType_0.MouseAndKeyboard
}, {
    [v4.name] = function(v7, v8) --[[ Line: 20 ]]
        return {
            inspectMenuEnabled = v8.enabled, 
            inputType = v7.inputType
        };
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 27 ]]
        return {
            inspectMenuEnabled = v9.inspectMenuEnabled, 
            inputType = v10.inputType
        };
    end
});