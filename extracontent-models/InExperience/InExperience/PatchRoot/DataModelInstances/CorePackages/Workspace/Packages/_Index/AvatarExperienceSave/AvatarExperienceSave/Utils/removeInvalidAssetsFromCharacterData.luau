local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: removeInvalidAssetsFromCharacterData ]]
    -- upvalues: v2 (copy)
    local v6 = false;
    for v7, v8 in v5 do
        if v4.equipped.EquippedAssets[v8] and v4.equipped.EquippedAssets[v8][v7] then
            v6 = true;
            v4.equipped.EquippedAssets[v8][v7] = nil;
            if v2.fieldCount(v4.equipped.EquippedAssets[v8]) == 0 then
                v4.equipped.EquippedAssets[v8] = nil;
            end;
        end;
    end;
    return v4, v6;
end;