local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen);
local v5 = v2.Component:extend("RedirectToAppRouterScreen");
v5.didMount = function(v6) --[[ Line: 16 ]] --[[ Name: didMount ]]
    local l_navigation_0 = v6.props.navigation;
    local l_routeName_0 = l_navigation_0.state.routeName;
    local l_key_0 = l_navigation_0.state.key;
    local l_params_0 = l_navigation_0.state.params;
    v6.props.navigateDownToAvatarScreen(l_routeName_0, l_key_0, l_params_0);
    l_navigation_0.pop();
end;
v5.render = function(_) --[[ Line: 25 ]] --[[ Name: render ]]
    return nil;
end;
return v3.connect(nil, function(v12) --[[ Line: 29 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v4 (copy)
    return {
        navigateDownToAvatarScreen = function(v13, v14, v15) --[[ Line: 31 ]] --[[ Name: navigateDownToAvatarScreen ]]
            -- upvalues: v12 (copy), v4 (ref)
            return v12(v4(v13, v14, v15));
        end
    };
end)(v5);