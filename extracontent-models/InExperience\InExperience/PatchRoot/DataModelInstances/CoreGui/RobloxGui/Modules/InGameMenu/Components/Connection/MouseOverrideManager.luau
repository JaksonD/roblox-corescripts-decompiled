local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local v5 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v5.Roact;
local l_RoactRodux_0 = v5.RoactRodux;
local l_t_0 = v5.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v10 = require(l_Parent_0.Resources.Constants);
local v11 = require(l_Parent_0.Utility.ExternalEventConnection);
local v12 = l_Symbol_0.named("InGameMenuCursorOverride");
local l_InputType_0 = v10.InputType;
local v14 = l_Roact_0.PureComponent:extend("MouseOverrideManager");
v14.validateProps = l_t_0.strictInterface({
    menuOpen = l_t_0.boolean, 
    exitModalOpen = l_t_0.boolean, 
    inputType = l_t_0.string
});
v14.render = function(v15) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v11 (copy), l_UserInputService_0 (copy)
    local l_exitModalOpen_0 = v15.props.exitModalOpen;
    return l_Roact_0.createElement(v11, {
        event = l_UserInputService_0:GetPropertyChangedSignal("OverrideMouseIconBehavior"), 
        callback = function() --[[ Line: 35 ]] --[[ Name: callback ]]
            -- upvalues: v15 (copy), l_exitModalOpen_0 (copy), l_UserInputService_0 (ref)
            if (v15.props.menuOpen or l_exitModalOpen_0) and l_UserInputService_0.OverrideMouseIconBehavior == Enum.OverrideMouseIconBehavior.None then
                v15:updateMouseIconOverride();
            end;
        end
    });
end;
v14.init = function(v17) --[[ Line: 48 ]] --[[ Name: init ]]
    v17.didOverrideMouse = false;
end;
v14.updateMouseIconOverride = function(v18) --[[ Line: 52 ]] --[[ Name: updateMouseIconOverride ]]
    -- upvalues: l_InputType_0 (copy), l_VRService_0 (copy), l_MouseIconOverrideService_0 (copy), v12 (copy)
    local l_exitModalOpen_1 = v18.props.exitModalOpen;
    if v18.props.menuOpen or l_exitModalOpen_1 then
        v18.didOverrideMouse = true;
        if v18.props.inputType == l_InputType_0.Gamepad or l_VRService_0.VREnabled then
            l_MouseIconOverrideService_0.push(v12, Enum.OverrideMouseIconBehavior.ForceHide);
            return;
        else
            l_MouseIconOverrideService_0.push(v12, Enum.OverrideMouseIconBehavior.ForceShow);
            return;
        end;
    else
        if v18.didOverrideMouse then
            v18.didOverrideMouse = false;
            l_MouseIconOverrideService_0.pop(v12);
        end;
        return;
    end;
end;
v14.didMount = function(v20) --[[ Line: 68 ]] --[[ Name: didMount ]]
    v20:updateMouseIconOverride();
end;
v14.didUpdate = function(v21) --[[ Line: 72 ]] --[[ Name: didUpdate ]]
    v21:updateMouseIconOverride();
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v22) --[[ Line: 76 ]]
    local l_closingApp_0 = v22.nativeClosePrompt.closingApp;
    return {
        menuOpen = v22.isMenuOpen, 
        exitModalOpen = l_closingApp_0, 
        inputType = v22.displayOptions.inputType
    };
end, nil)(v14);