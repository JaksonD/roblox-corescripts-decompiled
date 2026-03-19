local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_VRService_0 = game:GetService("VRService");
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_t_0 = v4.t;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameMenu");
local v8 = require(l_script_FirstAncestor_0.Resources.Constants);
local v9 = l_Roact_0.PureComponent:extend("BlurredModalPortal");
v9.validateProps = l_t_0.strictInterface({
    Enabled = l_t_0.boolean, 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
v9.render = function(v10) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_CoreGui_0 (copy), v8 (copy)
    return l_Roact_0.createElement(l_Roact_0.Portal, {
        target = l_CoreGui_0
    }, {
        InGameMenuModalBlur = l_Roact_0.createElement("ScreenGui", {
            OnTopOfCoreBlur = true, 
            Enabled = v10.props.Enabled, 
            IgnoreGuiInset = true, 
            DisplayOrder = v8.DisplayOrder.BlurredModalPortal
        }, v10.props[l_Roact_0.Children])
    });
end;
v9.didUpdate = function(v11, v12) --[[ Line: 34 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_VRService_0 (copy), l_RunService_0 (copy)
    if l_VRService_0.VREnabled then
        return;
    else
        local l_Enabled_0 = v12.Enabled;
        local l_Enabled_1 = v11.props.Enabled;
        if l_Enabled_0 ~= l_Enabled_1 then
            l_RunService_0:SetRobloxGuiFocused(l_Enabled_1);
        end;
        return;
    end;
end;
return v9;