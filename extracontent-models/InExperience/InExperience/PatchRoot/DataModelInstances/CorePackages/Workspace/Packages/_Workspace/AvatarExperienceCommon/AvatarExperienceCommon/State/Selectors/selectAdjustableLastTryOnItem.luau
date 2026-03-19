local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local l_OutfitTryOn_0 = v2.AvatarExperience.AvatarScene.OutfitTryOn;
    if l_OutfitTryOn_0.LastToggledItem and l_OutfitTryOn_0.AdjustableTryOnIds then
        local l_itemId_0 = l_OutfitTryOn_0.LastToggledItem.itemId;
        if v1.List.find(l_OutfitTryOn_0.AdjustableTryOnIds, l_itemId_0) then
            return l_itemId_0;
        end;
    end;
    return nil;
end;