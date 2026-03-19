local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.OutfitSwitcherFrame.useOutfitSwitcherFrameProps);
return function() --[[ Line: 17 ]] --[[ Name: useMakeupOutfitSwitcherFrameProps ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    return v2.useMemo(function() --[[ Line: 18 ]]
        -- upvalues: v3 (ref), v4 (ref)
        return {
            outfitKey = v3.MakeupOutfitKey, 
            outfitType = v4.OutfitTypes.Makeup, 
            showSettingsTile = false
        };
    end, {});
end;