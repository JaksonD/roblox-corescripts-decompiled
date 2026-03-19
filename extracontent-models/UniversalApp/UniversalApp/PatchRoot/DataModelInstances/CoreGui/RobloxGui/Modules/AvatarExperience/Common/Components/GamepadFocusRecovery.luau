local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_withNavigation_0 = v4.withNavigation;
local l_AvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v8 = require(l_CorePackages_0.Packages.t);
local v9 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.gamepad");
local v10 = v3.PureComponent:extend("GamepadFocusRecovery");
v10.defaultProps = {
    debugName = "Unspecified"
};
v10.validateProps = v8.strictInterface({
    focusController = v8.table, 
    isGamepadInput = v8.boolean, 
    debugName = v8.optional(v8.string), 
    avatarRoute = l_AvatarRoute_0.Interface, 
    navigation = v8.table
});
v10.init = function(v11) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: l_GuiService_0 (copy)
    v11:setState({
        isFocused = v11.props.navigation.isFocused()
    });
    v11.onWillFocus = function() --[[ Line: 56 ]]
        -- upvalues: v11 (copy), l_GuiService_0 (ref)
        v11.selectedCoreObjectConnection = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 57 ]]
            -- upvalues: v11 (ref)
            v11:startTrackingSelectedCoreObject();
        end);
        v11:startTrackingSelectedCoreObject();
        v11:setState({
            isFocused = true
        });
    end;
    v11.onWillBlur = function() --[[ Line: 68 ]]
        -- upvalues: v11 (copy)
        v11:onBlurOrUnmount();
        v11:setState({
            isFocused = false
        });
    end;
end;
v10.onBlurOrUnmount = function(v12) --[[ Line: 76 ]] --[[ Name: onBlurOrUnmount ]]
    v12:stopTrackingSelectedCoreObject();
    if v12.selectedCoreObjectConnection then
        v12.selectedCoreObjectConnection:Disconnect();
        v12.selectedCoreObjectConnection = nil;
    end;
end;
v10.handleFocusLost = function(v13, v14) --[[ Line: 85 ]] --[[ Name: handleFocusLost ]]
    -- upvalues: l_GuiService_0 (copy), v9 (copy)
    wait();
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if l_SelectedCoreObject_0 ~= nil and l_SelectedCoreObject_0:IsDescendantOf(game) then
        return;
    else
        if v13:canCaptureFocus() then
            v13.props.focusController:captureFocus();
            if v14 ~= nil then
                v9:debug(string.format("[GamepadFocusRecovery] Lost focus on object: %s, screen: %s, %s", tostring(v14), v13.props.debugName, (tostring(v13.props.avatarRoute))));
            end;
        end;
        return;
    end;
end;
v10.startTrackingSelectedCoreObject = function(v16) --[[ Line: 113 ]] --[[ Name: startTrackingSelectedCoreObject ]]
    -- upvalues: l_GuiService_0 (copy), v9 (copy)
    v16:stopTrackingSelectedCoreObject();
    local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
    v9:trace("SelectedCoreObject: {}", l_SelectedCoreObject_1 and l_SelectedCoreObject_1:GetFullName() or "nil");
    if l_SelectedCoreObject_1 == nil or not l_SelectedCoreObject_1:IsDescendantOf(game) then
        v16:handleFocusLost(l_SelectedCoreObject_1);
        return;
    else
        v16.selectedCoreObjectAncestryConnection = l_SelectedCoreObject_1.AncestryChanged:Connect(function(_, v19) --[[ Line: 122 ]]
            -- upvalues: v16 (copy), l_SelectedCoreObject_1 (copy)
            if not v19 then
                v16:stopTrackingSelectedCoreObject();
                v16:handleFocusLost(l_SelectedCoreObject_1);
            end;
        end);
        return;
    end;
end;
v10.stopTrackingSelectedCoreObject = function(v20) --[[ Line: 131 ]] --[[ Name: stopTrackingSelectedCoreObject ]]
    if v20.selectedCoreObjectAncestryConnection then
        v20.selectedCoreObjectAncestryConnection:Disconnect();
        v20.selectedCoreObjectAncestryConnection = nil;
    end;
end;
v10.render = function(v21) --[[ Line: 138 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy)
    return v3.createElement(v4.NavigationEvents, {
        onWillFocus = v21.onWillFocus, 
        onWillBlur = v21.onWillBlur
    });
end;
v10.willUnmount = function(v22) --[[ Line: 145 ]] --[[ Name: willUnmount ]]
    v22:onBlurOrUnmount();
end;
v10.canCaptureFocus = function(v23) --[[ Line: 149 ]] --[[ Name: canCaptureFocus ]]
    return v23.props.avatarRoute and v23.props.avatarRoute.isVisible and v23.props.isGamepadInput and v23.state.isFocused;
end;
return l_withNavigation_0(v7(v10), nil);