local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v4 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded);
local l_AvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarVRPanelWrapper);
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v16 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.stackvis");
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.with10ftUIPadding);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_useEventMap_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useEventMap;
local l_GetFFlagEnableUseShowTopBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUseShowTopBar;
local v22 = v7.PureComponent:extend("StackVisibilityWrapper");
v22.validateProps = v8.strictInterface({
    component = v8.union(v8.callback, v8.table), 
    innerProps = v8.optional(v8.table), 
    navigation = v8.table, 
    designTokens = v8.any, 
    eventMapRef = if l_GetFFlagEnableUseShowTopBar_0() then v8.any else nil, 
    guiService = v8.optional(v8.union(v8.Instance, v8.table)), 
    avatarRoute = l_AvatarRoute_0.Interface
});
v22.getRouteName = function(v23) --[[ Line: 50 ]] --[[ Name: getRouteName ]]
    return v23.props.navigation.state.routeName;
end;
v22.render = function(v24) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagEnableUseShowTopBar_0 (copy), v13 (copy), v6 (copy), v16 (copy), l_IsVRAppBuild_0 (copy), v7 (copy), v14 (copy), l_AvatarScreenProperties_0 (copy)
    local v25 = v24:getRouteName();
    local l_navigation_0 = v24.props.navigation;
    local l_avatarRoute_0 = v24.props.avatarRoute;
    local l_component_0 = v24.props.component;
    local l_innerProps_0 = v24.props.innerProps;
    local l_designTokens_0 = v24.props.designTokens;
    local l_topPadding_0 = l_designTokens_0.topPadding;
    local l_leftPadding_0 = l_designTokens_0.leftPadding;
    local l_bottomPadding_0 = l_designTokens_0.bottomPadding;
    local l_rightPadding_0 = l_designTokens_0.rightPadding;
    local v35 = if l_GetFFlagEnableUseShowTopBar_0() then v24.props.eventMapRef else nil;
    local v36 = v13(v24.props);
    l_innerProps_0 = v6.Dictionary.join(l_innerProps_0, {
        navigation = l_navigation_0, 
        avatarRoute = l_avatarRoute_0
    });
    v16:trace("[{}]: {}", v36 and "VISIBLE" or "NOT VISIBLE", v25);
    if l_IsVRAppBuild_0() then
        return v7.createElement(v14, {
            visible = v36, 
            roundedCornersFrame = l_AvatarScreenProperties_0[v25].VRPanelRoundedCorners, 
            panelPlacement = l_AvatarScreenProperties_0[v25].VRPanelPlacement
        }, {
            StackScreen = v7.createElement(l_component_0, l_innerProps_0)
        });
    else
        return v7.createElement("Frame", {
            Size = UDim2.new(1, l_rightPadding_0, 1, l_bottomPadding_0), 
            Position = UDim2.fromOffset(l_leftPadding_0, l_topPadding_0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = false, 
            BorderSizePixel = 0, 
            Visible = v36, 
            ref = v35
        }, {
            StackScreen = v7.createElement(l_component_0, l_innerProps_0)
        });
    end;
end;
v22.didMount = function(v37) --[[ Line: 102 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy), v4 (copy)
    local v38 = v37:getRouteName();
    local l_guiService_0 = v37.props.guiService;
    if l_guiService_0 and v13(v37.props) then
        l_guiService_0:BroadcastNotification(v38, v4.APP_READY);
    end;
end;
v22.didUpdate = function(v40, v41, _) --[[ Line: 112 ]] --[[ Name: didUpdate ]]
    -- upvalues: v13 (copy), v4 (copy)
    local l_guiService_1 = v40.props.guiService;
    if l_guiService_1 and not v13(v41) and v13(v40.props) then
        l_guiService_1:BroadcastNotification(v40:getRouteName(), v4.APP_READY);
    end;
end;
v22 = v18((l_withNavigation_0((v12((l_RoactServices_0.connect({
    guiService = l_AppGuiService_0
})(v22)))))));
if l_GetFFlagEnableUseShowTopBar_0() then
    local v44 = {
        [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NoOpEvent, 
        [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NoOpEvent
    };
    local l_v22_0 = v22;
    v22 = function(v46) --[[ Line: 140 ]]
        -- upvalues: l_useEventMap_0 (copy), v44 (copy), v7 (copy), l_v22_0 (copy), v6 (copy)
        local v47 = l_useEventMap_0(v44);
        return v7.createElement(l_v22_0, v6.Dictionary.join(v46, {
            eventMapRef = v47
        }));
    end;
end;
return function(v48) --[[ Line: 165 ]] --[[ Name: withStackVisibilityWrapper ]]
    -- upvalues: v10 (copy), v7 (copy), v22 (ref)
    v48 = v10(v48);
    return function(v49) --[[ Line: 170 ]]
        -- upvalues: v7 (ref), v22 (ref), v48 (ref)
        return v7.createElement(v22, {
            component = v48, 
            innerProps = v49, 
            navigation = v49.navigation
        });
    end;
end;