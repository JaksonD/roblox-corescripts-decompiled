local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience);
local v5 = v2.Component:extend("RedirectToAvatarScreen");
v5.didMount = function(v6) --[[ Line: 19 ]] --[[ Name: didMount ]]
    local l_navigation_0 = v6.props.navigation;
    v6.props.navigateIntoAvatarExperience(l_navigation_0.state.routeName, l_navigation_0.state.params);
    l_navigation_0.pop();
end;
v5.render = function(_) --[[ Line: 25 ]] --[[ Name: render ]]
    return nil;
end;
return v3.connect(nil, function(v9) --[[ Line: 29 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v4 (copy)
    return {
        navigateIntoAvatarExperience = function(v10, v11) --[[ Line: 31 ]] --[[ Name: navigateIntoAvatarExperience ]]
            -- upvalues: v9 (copy), v4 (ref)
            return v9(v4(v10, v11, true));
        end
    };
end)(v5);