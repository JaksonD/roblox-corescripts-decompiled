local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_DynamicHead_0 = require(l_script_FirstAncestor_0.Constants).ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead;
return function(v2) --[[ Line: 6 ]] --[[ Name: selectHasDynamicHead ]]
    -- upvalues: l_DynamicHead_0 (copy)
    local v3 = v2.AvatarExperience.AvatarEditor.Character.EquippedAssets[l_DynamicHead_0];
    if v3 then
        for _ in v3 do
            return true;
        end;
    end;
    local v5 = v2.AvatarExperience.AvatarScene.OutfitTryOn and v2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    if v5 then
        for _, v7 in v5 do
            if v7.assetType == l_DynamicHead_0 then
                return true;
            end;
        end;
    end;
    return false;
end;