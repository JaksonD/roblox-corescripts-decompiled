local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v4 = require(l_CorePackages_0.Packages.tutils);
local v6 = l_memoize_0(function(v5) --[[ Line: 9 ]]
    -- upvalues: v4 (copy)
    return v4.fieldCount(v5);
end);
return function(v7) --[[ Line: 13 ]] --[[ Name: selectNumTryOnItems ]]
    -- upvalues: v6 (copy)
    local l_TryOnItems_0 = v7.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    return v6(l_TryOnItems_0);
end;