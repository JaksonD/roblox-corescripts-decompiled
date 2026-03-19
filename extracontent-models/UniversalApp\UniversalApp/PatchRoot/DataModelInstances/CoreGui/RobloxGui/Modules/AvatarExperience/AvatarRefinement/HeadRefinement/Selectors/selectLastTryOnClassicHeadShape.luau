local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceHeadRefinement);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
return function(v4) --[[ Line: 8 ]] --[[ Name: selectLastSelectedHeadShape ]]
    return v4.AvatarExperience.AvatarScene.OutfitTryOn.LastTryOnClassicHeadShape;
end;