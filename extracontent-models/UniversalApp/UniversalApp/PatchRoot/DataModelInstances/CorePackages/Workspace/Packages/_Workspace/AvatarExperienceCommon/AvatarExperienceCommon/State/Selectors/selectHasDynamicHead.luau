local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_DynamicHead_0 = require(l_script_FirstAncestor_0.Constants).ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead;
local v2 = game:DefineFastFlag("AXDHEquippedAssetsNilCheck", false);
return function(v3) --[[ Line: 7 ]] --[[ Name: selectHasDynamicHead ]]
    -- upvalues: v2 (copy), l_DynamicHead_0 (copy)
    local l_EquippedAssets_0 = v3.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if v2 and not l_EquippedAssets_0 then
        return false;
    else
        local v5 = l_EquippedAssets_0[l_DynamicHead_0];
        if v5 then
            for _ in v5 do
                return true;
            end;
        end;
        local v7 = v3.AvatarExperience.AvatarScene.OutfitTryOn and v3.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        if v7 then
            for _, v9 in v7 do
                if v9.assetType == l_DynamicHead_0 then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;