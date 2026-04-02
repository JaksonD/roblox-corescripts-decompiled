local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Actions.SetAvatarSceneRoute);
local v4 = require(l_Parent_0.AvatarExperienceNavigation).AvatarRoute.AvatarRoute.new({});
return v2.createReducer(v4, {
    [v3.name] = function(_, v6) --[[ Line: 16 ]]
        return v6.avatarRoute;
    end
});