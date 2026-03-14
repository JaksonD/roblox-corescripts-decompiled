local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v7 = v2.PureComponent:extend("ItemDetailsCloser");
v7.validateProps = v4.strictInterface({
    navigation = v4.table, 
    isAvatarExperienceRoute = v4.boolean
});
v7.render = function(_) --[[ Line: 25 ]] --[[ Name: render ]]
    return nil;
end;
v7.didUpdate = function(v9, v10) --[[ Line: 29 ]] --[[ Name: didUpdate ]]
    -- upvalues: v6 (copy)
    local l_isAvatarExperienceRoute_0 = v9.props.isAvatarExperienceRoute;
    if v10.isAvatarExperienceRoute and not l_isAvatarExperienceRoute_0 then
        v6.closeFiltersAndItemDetails(v9.props.navigation);
    end;
end;
return (v3.connect(function(v12, _) --[[ Line: 38 ]]
    -- upvalues: v5 (copy)
    return {
        isAvatarExperienceRoute = v5.isAvatarExperienceRoute(v12)
    };
end, nil)(v7));