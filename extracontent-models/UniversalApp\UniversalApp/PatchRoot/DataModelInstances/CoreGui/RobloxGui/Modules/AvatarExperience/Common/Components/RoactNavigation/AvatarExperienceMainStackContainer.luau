local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_SetTabBarVisible_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local v7 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v7.useNavBarPlacement;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceMainStackNavigator);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = v4.Component:extend("AvatarExperienceMainStackContainer");
v13.didMount = function(v14) --[[ Line: 33 ]] --[[ Name: didMount ]]
    v14:setTabBarVisibility(v14.props);
end;
v13.willUpdate = function(v15, v16) --[[ Line: 37 ]] --[[ Name: willUpdate ]]
    v15:setTabBarVisibility(v16);
end;
v13.setTabBarVisibility = function(_, v18) --[[ Line: 41 ]] --[[ Name: setTabBarVisibility ]]
    -- upvalues: v11 (copy)
    if not v18.avatarRoute.isVisible then
        return;
    else
        local l_navigation_0 = v18.navigation;
        local v20 = v11(l_navigation_0);
        local v21 = if v20.tabBarVisible ~= nil then v20.tabBarVisible == true else v18.defaultTabBarVisible;
        if v21 ~= v18.tabBarVisible then
            v18.setTabBarVisible(v21);
        end;
        return;
    end;
end;
v13.render = function(v22) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v10 (copy)
    local l_navigation_1 = v22.props.navigation;
    return v4.createElement(v10, {
        navigation = l_navigation_1
    });
end;
local l_v13_0 = v13;
v13 = function(v25) --[[ Line: 66 ]]
    -- upvalues: l_useNavBarPlacement_0 (copy), v7 (copy), v3 (copy), v4 (copy), l_v13_0 (copy)
    local v26 = l_useNavBarPlacement_0() == v7.Placement.Left;
    local v27 = v3.Dictionary.join(v25, {
        defaultTabBarVisible = v26
    });
    return v4.createElement(l_v13_0, v27);
end;
local function v30(v28, _) --[[ Line: 76 ]] --[[ Name: mapStateToProps ]]
    return {
        tabBarVisible = v28.TabBarVisible
    };
end;
local function v33(v31) --[[ Line: 82 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_SetTabBarVisible_0 (copy)
    return {
        setTabBarVisible = function(v32) --[[ Line: 84 ]] --[[ Name: setTabBarVisible ]]
            -- upvalues: v31 (copy), l_SetTabBarVisible_0 (ref)
            v31(l_SetTabBarVisible_0(v32));
        end
    };
end;
v13 = v9(v13);
v13 = v5.connect(v30, v33)(v13);
v13.router = v10.router;
return v13;