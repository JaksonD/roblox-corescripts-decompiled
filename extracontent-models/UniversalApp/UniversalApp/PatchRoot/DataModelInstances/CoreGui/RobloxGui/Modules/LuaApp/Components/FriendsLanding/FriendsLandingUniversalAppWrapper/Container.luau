local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v5 = require(script.Parent.FriendsLandingUniversalAppWrapper);
local v6 = require(script.Parent.mapStateToProps);
local v7 = require(script.Parent.mapDispatchToProps);
local l_compose_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose;
local l_FriendsLandingNavigator_0 = require(l_CorePackages_0.Workspace.Packages.FriendsLanding).FriendsLandingNavigator;
local v11 = l_compose_0(v2.connect(v6, v7), l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0
}))(function(v10) --[[ Line: 19 ]] --[[ Name: Container ]]
    -- upvalues: v1 (copy), v5 (copy)
    return v1.createElement(v5, v10);
end);
local v12 = v1.PureComponent:extend("ClassWrapper");
v12.render = function(v13) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v11 (ref)
    return v1.createElement(v11, v13.props);
end;
v12.router = l_FriendsLandingNavigator_0.router;
return v12;