local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Controls);
local v7 = require(l_Parent_0.Actions.SetControlLayout);
local v8 = l_Roact_0.PureComponent:extend("ControlLayoutSetter");
v8.init = function(v9) --[[ Line: 16 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), l_UserInputService_0 (copy)
    local v10 = v6.inputToControlTypeMap[l_UserInputService_0:GetLastInputType()];
    if v10 then
        v9.props.dispatchSetControlLayout(v10);
    end;
end;
v8.render = function(_) --[[ Line: 23 ]] --[[ Name: render ]]
    return nil;
end;
v8.didMount = function(v12) --[[ Line: 27 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), v6 (copy)
    v12.inputChangedConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v13) --[[ Line: 28 ]]
        -- upvalues: v6 (ref), v12 (copy)
        local v14 = v6.inputToControlTypeMap[v13];
        if v14 then
            v12.props.dispatchSetControlLayout(v14);
        end;
    end);
end;
v8.willUnmount = function(v15) --[[ Line: 39 ]] --[[ Name: willUnmount ]]
    if v15.inputChangedConnection then
        v15.inputChangedConnection:Disconnect();
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v16) --[[ Line: 45 ]]
    -- upvalues: v7 (copy)
    return {
        dispatchSetControlLayout = function(v17) --[[ Line: 47 ]] --[[ Name: dispatchSetControlLayout ]]
            -- upvalues: v16 (copy), v7 (ref)
            v16(v7(v17));
        end
    };
end)(v8);