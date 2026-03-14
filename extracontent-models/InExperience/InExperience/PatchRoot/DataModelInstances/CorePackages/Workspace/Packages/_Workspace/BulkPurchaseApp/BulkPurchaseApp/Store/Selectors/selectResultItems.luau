local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
local function _(v2) --[[ Line: 8 ]] --[[ Name: getMarketPlaceProductTypeFromItemType ]]
    if v2 == "AvatarBundle" then
        return Enum.MarketplaceProductType.AvatarBundle;
    else
        return Enum.MarketplaceProductType.AvatarAsset;
    end;
end;
return function(v4) --[[ Line: 16 ]] --[[ Name: selectResultItems ]]
    local v5 = {};
    if v4.itemData then
        for _, v7 in v4.itemData do
            table.insert(v5, {
                id = v7.id, 
                type = if v7.type == "AvatarBundle" then Enum.MarketplaceProductType.AvatarBundle else Enum.MarketplaceProductType.AvatarAsset, 
                status = if v4.itemStatuses then v4.itemStatuses[v7.id] or Enum.MarketplaceItemPurchaseStatus.SystemError else Enum.MarketplaceItemPurchaseStatus.SystemError
            });
        end;
    end;
    return v5;
end;