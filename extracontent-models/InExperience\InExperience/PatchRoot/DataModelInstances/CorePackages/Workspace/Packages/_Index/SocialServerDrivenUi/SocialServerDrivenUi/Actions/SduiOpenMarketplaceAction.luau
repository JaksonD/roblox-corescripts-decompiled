local l_Parent_0 = script:FindFirstAncestor("SocialServerDrivenUi").Parent;
local _ = require(l_Parent_0.SduiCoreSystem);
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
return function(_, _, v5, _) --[[ Line: 12 ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    v5.dependencies.getNavigation().navigate(l_AvatarScreen_0.Catalog);
end;