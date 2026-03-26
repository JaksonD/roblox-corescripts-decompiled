local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local l_Constants_0 = require(l_Parent_0.AvatarExperienceCommon).Constants;
removeMakeupAssetsFromTryOnsIfOverLimit = function(v2) --[[ Line: 8 ]] --[[ Name: removeMakeupAssetsFromTryOnsIfOverLimit ]]
    -- upvalues: l_Constants_0 (copy)
    local v3 = 0;
    local v4 = 1e999;
    for _, v6 in v2 do
        if l_Constants_0.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v6.itemSubType] then
            v3 = v3 + 1;
            v4 = math.min(v6.itemRecency, v4);
        end;
    end;
    if l_Constants_0.MAX_MAKEUP_LAYERS < v3 then
        for v7, v8 in v2 do
            if v8.itemRecency == v4 then
                v2[v7] = nil;
            end;
        end;
    end;
    return v2;
end;
return removeMakeupAssetsFromTryOnsIfOverLimit;