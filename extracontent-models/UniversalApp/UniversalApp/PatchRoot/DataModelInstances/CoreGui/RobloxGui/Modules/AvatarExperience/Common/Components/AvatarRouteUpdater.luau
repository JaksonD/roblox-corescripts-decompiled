local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_AvatarRoute_0 = v4.AvatarRoute.AvatarRoute;
local l_SetAvatarSceneRoute_0 = v5.Actions.SetAvatarSceneRoute;
local v8 = v1.PureComponent:extend("AvatarRouteUpdater");
v8.validateProps = v3.strictInterface({
    avatarRoute = l_AvatarRoute_0.Interface, 
    setAvatarSceneRoute = v3.callback
});
v8.render = function(_) --[[ Line: 32 ]] --[[ Name: render ]]
    return nil;
end;
v8.didMount = function(v10) --[[ Line: 36 ]] --[[ Name: didMount ]]
    local l_avatarRoute_0 = v10.props.avatarRoute;
    v10.props.setAvatarSceneRoute(l_avatarRoute_0);
end;
v8.didUpdate = function(v12, v13) --[[ Line: 42 ]] --[[ Name: didUpdate ]]
    local l_avatarRoute_1 = v12.props.avatarRoute;
    if l_avatarRoute_1 ~= v13.avatarRoute then
        v12.props.setAvatarSceneRoute(l_avatarRoute_1);
    end;
end;
return (v2.connect(nil, function(v15) --[[ Line: 51 ]]
    -- upvalues: l_SetAvatarSceneRoute_0 (copy)
    return {
        setAvatarSceneRoute = function(v16) --[[ Line: 53 ]] --[[ Name: setAvatarSceneRoute ]]
            -- upvalues: v15 (copy), l_SetAvatarSceneRoute_0 (ref)
            v15(l_SetAvatarSceneRoute_0(v16));
        end
    };
end)(v8));