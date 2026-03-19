local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Actions.SetInputType);
local v8 = require(l_Parent_0.Utility.ExternalEventConnection);
local l_InputTypeMap_0 = require(l_Parent_0.Resources.Constants).InputTypeMap;
local v10 = l_Roact_0.PureComponent:extend("LastInputTypeConnector");
v10.updateInputType = function(v11, v12) --[[ Line: 19 ]] --[[ Name: updateInputType ]]
    -- upvalues: l_VRService_0 (copy), l_InputTypeMap_0 (copy)
    if l_VRService_0.VREnabled then
        v12 = l_InputTypeMap_0[Enum.UserInputType.MouseMovement];
    end;
    if v12 then
        v11.props.setInputType(v12);
    end;
end;
v10.init = function(v13) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: l_InputTypeMap_0 (copy), l_UserInputService_0 (copy)
    v13:updateInputType(l_InputTypeMap_0[l_UserInputService_0:GetLastInputType()]);
end;
v10.render = function(v14) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), l_UserInputService_0 (copy), l_InputTypeMap_0 (copy)
    return l_Roact_0.createElement(v8, {
        event = l_UserInputService_0.LastInputTypeChanged, 
        callback = function(v15) --[[ Line: 40 ]] --[[ Name: callback ]]
            -- upvalues: l_InputTypeMap_0 (ref), v14 (copy)
            local v16 = l_InputTypeMap_0[v15];
            v14:updateInputType(v16);
        end
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v17) --[[ Line: 47 ]]
    -- upvalues: v7 (copy)
    return {
        setInputType = function(v18) --[[ Line: 49 ]] --[[ Name: setInputType ]]
            -- upvalues: v17 (copy), v7 (ref)
            return v17(v7(v18));
        end
    };
end)(v10);