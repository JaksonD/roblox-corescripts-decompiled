local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v4 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v2.FFlagHeadRefinementFacialAnimationToggle;
return function(v6) --[[ Line: 10 ]] --[[ Name: selectFacialAnimationForHeadAdjustment ]]
    -- upvalues: l_FFlagHeadRefinementFacialAnimationToggle_0 (copy), v4 (copy)
    if not l_FFlagHeadRefinementFacialAnimationToggle_0 then
        return nil;
    else
        local v7 = v6.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems or {};
        if next(v7) ~= nil then
            return v4.getStaticFacialAnimationFromTryOn(v6);
        else
            return v4.getStaticFacialAnimationFromEquippedAssets(v6);
        end;
    end;
end;