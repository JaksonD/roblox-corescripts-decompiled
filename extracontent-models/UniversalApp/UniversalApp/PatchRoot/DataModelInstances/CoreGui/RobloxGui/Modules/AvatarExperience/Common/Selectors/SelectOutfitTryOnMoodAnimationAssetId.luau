local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectOutfitTryOnMostRecentAssetId);
return function(v4) --[[ Line: 38 ]]
    -- upvalues: v3 (copy), v2 (copy)
    local _, v6, v7 = v3(v4, v2.AssetTypeIdStrings.DynamicHead);
    local _, _, v10 = v3(v4, v2.AssetTypeIdStrings.Head);
    if v10 and (not v7 or v7 < v10) then
        return nil;
    elseif not v6 then
        return nil;
    else
        assert(v6, "tryOnBundleInfo is non-nil. Silence type checker");
        for v11, v12 in v6 do
            if v12.assetType == v2.AssetTypeIdStrings.MoodAnimation then
                return v11;
            end;
        end;
        return nil;
    end;
end;