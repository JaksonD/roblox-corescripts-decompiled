local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.AvatarExperienceCommon);
local l_FFlagParseHeadShapeFromAPIResponse_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse;
local l_Constants_0 = v1.Constants;
return function(v4) --[[ Line: 16 ]] --[[ Name: getEquippableAssetsFromTryOnItems ]]
    -- upvalues: l_Constants_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy)
    table.sort(v4, function(v5, v6) --[[ Line: 28 ]]
        return tonumber(v5.itemRecency) < tonumber(v6.itemRecency);
    end);
    local v7 = {};
    for _, v9 in v4 do
        if v9.itemId ~= l_Constants_0.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
            if v9.itemType == Enum.AvatarItemType.Asset.Name then
                table.insert(v7, {
                    assetId = v9.itemId, 
                    assetTypeId = v9.itemSubType
                });
            elseif v9.itemType == Enum.AvatarItemType.Bundle.Name then
                for v10, v11 in v9.bundleInfo do
                    table.insert(v7, {
                        assetId = v10, 
                        assetTypeId = v11.assetType, 
                        headShape = if l_FFlagParseHeadShapeFromAPIResponse_0 and v11 then v11.headShape else nil
                    });
                end;
            end;
        end;
    end;
    return v7;
end;