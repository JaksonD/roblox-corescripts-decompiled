local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_AvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute;
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAvatarSceneRoute);
local v7 = v2.PureComponent:extend("AvatarRouteUpdater");
v7.validateProps = v4.strictInterface({
    avatarRoute = l_AvatarRoute_0.Interface, 
    setAvatarSceneRoute = v4.callback
});
v7.render = function(_) --[[ Line: 32 ]] --[[ Name: render ]]
    return nil;
end;
v7.didMount = function(v9) --[[ Line: 36 ]] --[[ Name: didMount ]]
    local l_avatarRoute_0 = v9.props.avatarRoute;
    v9.props.setAvatarSceneRoute(l_avatarRoute_0);
end;
v7.didUpdate = function(v11, v12) --[[ Line: 42 ]] --[[ Name: didUpdate ]]
    local l_avatarRoute_1 = v11.props.avatarRoute;
    if l_avatarRoute_1 ~= v12.avatarRoute then
        v11.props.setAvatarSceneRoute(l_avatarRoute_1);
    end;
end;
return (v3.connect(nil, function(v14) --[[ Line: 51 ]]
    -- upvalues: v6 (copy)
    return {
        setAvatarSceneRoute = function(v15) --[[ Line: 53 ]] --[[ Name: setAvatarSceneRoute ]]
            -- upvalues: v14 (copy), v6 (ref)
            v14(v6(v15));
        end
    };
end)(v7));