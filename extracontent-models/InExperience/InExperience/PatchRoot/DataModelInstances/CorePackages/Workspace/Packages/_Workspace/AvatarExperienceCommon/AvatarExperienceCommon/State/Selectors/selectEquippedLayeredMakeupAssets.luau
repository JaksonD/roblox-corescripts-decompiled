local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local v1 = require(l_script_FirstAncestor_0.Constants);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local l_EquippedAssets_0 = v2.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    if l_EquippedAssets_0 == nil then
        return {};
    else
        local v4 = {};
        for v5, _ in v1.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
            if l_EquippedAssets_0[v5] then
                for _, v8 in l_EquippedAssets_0[v5] do
                    table.insert(v4, v8);
                end;
            end;
        end;
        return v4;
    end;
end;