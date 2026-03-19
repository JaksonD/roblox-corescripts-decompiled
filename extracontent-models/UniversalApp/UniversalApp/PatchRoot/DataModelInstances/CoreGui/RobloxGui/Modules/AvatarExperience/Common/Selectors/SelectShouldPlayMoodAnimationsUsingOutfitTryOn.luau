local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v2 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMoodAnimationAssetId);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectShouldPlayMoodAnimationsEquipped);
return function(v4) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy)
    if v2(v4) then
        return true;
    else
        return v3(v4);
    end;
end;