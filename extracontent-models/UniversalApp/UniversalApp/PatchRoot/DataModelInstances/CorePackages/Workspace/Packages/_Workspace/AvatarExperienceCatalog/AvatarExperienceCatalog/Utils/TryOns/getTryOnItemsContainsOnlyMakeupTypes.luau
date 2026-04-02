local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local l_Constants_0 = require(l_Parent_0.AvatarExperienceCommon).Constants;
getTryOnItemsContainsOnlyMakeupTypes = function(v2) --[[ Line: 8 ]] --[[ Name: getTryOnItemsContainsOnlyMakeupTypes ]]
    -- upvalues: l_Constants_0 (copy)
    if #v2 == 0 then
        return false;
    else
        for _, v4 in v2 do
            if not l_Constants_0.MAKEUP_LOOK_ASSET_TYPES[v4.itemSubType] then
                return false;
            end;
        end;
        return true;
    end;
end;
return getTryOnItemsContainsOnlyMakeupTypes;