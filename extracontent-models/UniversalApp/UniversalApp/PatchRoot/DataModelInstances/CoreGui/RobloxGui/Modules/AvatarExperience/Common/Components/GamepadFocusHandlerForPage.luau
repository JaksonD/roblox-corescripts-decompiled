local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_AvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute;
local v7 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.gamepad");
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusRecovery);
local l_withIsGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).withIsGamepadInput;
local v10 = v2.PureComponent:extend("GamepadFocusHandlerForPage");
v10.validateProps = v4.strictInterface({
    focusController = v4.table, 
    captureFocusOnMount = v4.optional(v4.boolean), 
    isGamepadInput = v4.optional(v4.boolean), 
    navigation = v4.table, 
    avatarRoute = l_AvatarRoute_0.Interface
});
v10.defaultProps = {
    captureFocusOnMount = false
};
v10.debugName = function(v11) --[[ Line: 44 ]] --[[ Name: debugName ]]
    local l_state_0 = v11.props.navigation.state;
    return (l_state_0.routeName or "") .. ":" .. (l_state_0.key or "");
end;
v10.render = function(v13) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v8 (copy)
    return v2.createElement(v8, {
        focusController = v13.props.focusController, 
        isGamepadInput = v13.props.isGamepadInput, 
        debugName = v13:debugName()
    });
end;
local function _(v14) --[[ Line: 57 ]] --[[ Name: isCurrentScreen ]]
    local l_current_0 = v14.avatarRoute.current;
    return v14.navigation.state.key == l_current_0.key;
end;
v10.canCaptureFocus = function(v17, v18) --[[ Line: 62 ]] --[[ Name: canCaptureFocus ]]
    -- upvalues: v7 (copy)
    local l_avatarRoute_0 = v17.props.avatarRoute;
    local l_isGamepadInput_0 = v17.props.isGamepadInput;
    local l_props_0 = v17.props;
    local l_current_1 = l_props_0.avatarRoute.current;
    local v23 = l_props_0.navigation.state.key == l_current_1.key;
    l_props_0 = v23 and l_avatarRoute_0.isVisible and not l_avatarRoute_0.isOverlayVisible and l_isGamepadInput_0;
    if v18 then
        v7:trace("{} {} canCapture: {}, isCurrentScreen: {}, currentRoute: {}, isVisible: {}, isOverlayVisible: {}, isGamepadInput: {}", v17:debugName(), v18, l_props_0, v23, l_avatarRoute_0.current, l_avatarRoute_0.isVisible, l_avatarRoute_0.isOverlayVisible, l_isGamepadInput_0);
    end;
    return l_props_0;
end;
v10.didMount = function(v24) --[[ Line: 86 ]] --[[ Name: didMount ]]
    -- upvalues: v7 (copy)
    if v24.props.captureFocusOnMount and v24:canCaptureFocus("didMount") then
        v7:debug("captureFocusOnMount page: {}", v24:debugName());
        v24.props.focusController.captureFocus();
    end;
end;
v10.didUpdate = function(v25, v26) --[[ Line: 93 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy)
    if v25:canCaptureFocus("didUpdate") then
        local l_current_2 = v26.avatarRoute.current;
        local v28 = not (v26.navigation.state.key == l_current_2.key);
        local v29 = not v26.isGamepadInput;
        l_current_2 = not v26.avatarRoute.isVisible;
        if v28 or v29 or l_current_2 then
            v7:debug("captureFocus {}, navigatedToThisPage: {}, acquiredVisibility: {}", v25:debugName(), v28, l_current_2);
            v25.props.focusController.captureFocus();
            return;
        end;
    elseif v26.isGamepadInput and not v25.props.isGamepadInput then
        v7:debug("releaseFocus {}", v25:debugName());
        v25.props.focusController.releaseFocus();
    end;
end;
return (l_withNavigation_0((v5((l_withIsGamepadInput_0(v10))))));