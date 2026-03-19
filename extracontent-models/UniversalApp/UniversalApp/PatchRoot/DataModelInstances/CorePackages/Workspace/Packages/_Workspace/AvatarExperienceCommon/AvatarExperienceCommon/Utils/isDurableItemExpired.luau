local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_FFlagAXRemoveExpiredItemsFromInventory_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXRemoveExpiredItemsFromInventory;
return function(v2) --[[ Line: 11 ]] --[[ Name: isDurableItemExpired ]]
    -- upvalues: l_FFlagAXRemoveExpiredItemsFromInventory_0 (copy)
    if not l_FFlagAXRemoveExpiredItemsFromInventory_0 then
        return false;
    else
        local v3 = DateTime.fromIsoDate(v2);
        if not v3 then
            return false;
        else
            return DateTime.now().UnixTimestamp >= v3.UnixTimestamp;
        end;
    end;
end;