local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = require(l_CorePackages_0.Workspace.Packages.MockableProxyServices).VRService;
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Controls);
local v9 = require(script.ControlLayouts.KeyboardControls);
local v10 = require(script.ControlLayouts.GamepadControls);
local v11 = require(script.ControlLayouts.VRGamepadControlsWrapper);
local l_VRUtil_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRUtil;
local v13 = require(l_Parent_0.Components.Connection.FocusHandler);
local v14 = l_Roact_0.PureComponent:extend("ControlsPage");
v14.validateProps = l_t_0.strictInterface({
    pageTitle = l_t_0.string, 
    controlLayout = l_t_0.optional(l_t_0.string), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean)
});
v14.init = function(v15) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v15.closeButtonRef = l_Roact_0.createRef();
end;
v14.render = function(v16) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_Roact_0 (copy), v9 (copy), l_VRService_0 (copy), l_VRUtil_0 (copy), v11 (copy), v10 (copy), v13 (copy), l_GuiService_0 (copy)
    local l_controlLayout_0 = v16.props.controlLayout;
    if l_controlLayout_0 == v8.ControlLayouts.KEYBOARD then
        return l_Roact_0.createElement(v9);
    elseif l_controlLayout_0 == v8.ControlLayouts.GAMEPAD then
        if l_VRService_0.VREnabled and l_VRUtil_0.getCurrentControllerType() == "Touch" then
            return l_Roact_0.createElement(v11);
        else
            return l_Roact_0.createFragment({
                GamepadControls = l_Roact_0.createElement(v10, {
                    closeButtonRef = v16.closeButtonRef
                }), 
                FocusHandler = l_Roact_0.createElement(v13, {
                    isFocused = v16.props.canCaptureFocus, 
                    didFocus = function() --[[ Line: 52 ]] --[[ Name: didFocus ]]
                        -- upvalues: v16 (copy), l_GuiService_0 (ref)
                        local v18 = v16.closeButtonRef:getValue();
                        l_GuiService_0:AddSelectionParent("IGMControlsPage_CloseButtonSelectionGroup", v18);
                        l_GuiService_0.SelectedCoreObject = v18;
                    end, 
                    didBlur = function() --[[ Line: 57 ]] --[[ Name: didBlur ]]
                        -- upvalues: l_GuiService_0 (ref)
                        l_GuiService_0:RemoveSelectionGroup("IGMControlsPage_CloseButtonSelectionGroup");
                    end
                })
            });
        end;
    else
        return nil;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v19) --[[ Line: 69 ]]
    return {
        controlLayout = v19.controlLayout, 
        canCaptureFocus = v19.menuPage == "Controls"
    };
end)(v14);