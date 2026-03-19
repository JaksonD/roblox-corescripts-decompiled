local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent;
local v1 = require(l_Parent_0.AXCommon);
local l_ItemRestrictions_0 = v1.Enums.ItemRestrictions;
local l_CatalogItemCardItemTypeEnum_0 = v1.Components.CatalogItemCard.CatalogItemCardItemTypeEnum;
return function(v4) --[[ Line: 13 ]] --[[ Name: getCatalogCardItemType ]]
    -- upvalues: l_ItemRestrictions_0 (copy), l_CatalogItemCardItemTypeEnum_0 (copy)
    if not v4 then
        return nil;
    elseif v4[l_ItemRestrictions_0.Limited] then
        return l_CatalogItemCardItemTypeEnum_0.Limited;
    elseif v4[l_ItemRestrictions_0.Collectible] or v4[l_ItemRestrictions_0.LimitedUnique] then
        return l_CatalogItemCardItemTypeEnum_0.Collectible;
    else
        return nil;
    end;
end;