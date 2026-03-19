local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_ASSET_TYPE_NAME_TO_ID_STRING_0 = require(l_script_FirstAncestor_0.Constants).ASSET_TYPE_NAME_TO_ID_STRING;
local v2 = require(script.Parent.getEquippedAssetIdsForType);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_ASSET_TYPE_NAME_TO_ID_STRING_0 (copy)
    local l_EquippedAssets_0 = v3.AvatarEditor.Character.EquippedAssets;
    if l_EquippedAssets_0 == nil then
        return 0;
    else
        local v5 = v2(l_EquippedAssets_0, l_ASSET_TYPE_NAME_TO_ID_STRING_0.Gear);
        local _, v7 = next(v5);
        if v7 then
            return tonumber(v7) or 0;
        else
            return 0;
        end;
    end;
end;