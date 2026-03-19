local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local l_getTryOnItemReducerKey_0 = require(l_Parent_0.AvatarExperienceCommon).Utils.getTryOnItemReducerKey;
local _ = require(script.Parent.PurchaseItemsTypes);
return function(v3) --[[ Line: 10 ]] --[[ Name: mapPurchaseItemsResponse ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy)
    local v4 = {};
    for _, v6 in v3.fulfillmentGroups do
        for _, v8 in v6.lineItems do
            local v9 = if v8.assetId then v8.assetId else v8.bundleId;
            local v10 = if v8.assetId then Enum.AvatarItemType.Asset.Name else Enum.AvatarItemType.Bundle.Name;
            if v9 and v10 then
                v4[l_getTryOnItemReducerKey_0(v9, v10)] = {
                    collectibleProductId = v8.collectibleProductId, 
                    agreedPriceRobux = v8.agreedPriceRobux, 
                    assetId = v8.assetId, 
                    bundleId = v8.bundleId, 
                    status = v8.status, 
                    errorReason = v8.errorReason
                };
            end;
        end;
    end;
    return {
        status = v3.status, 
        lineItems = v4
    };
end;