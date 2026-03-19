local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
return function(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) --[[ Line: 10 ]] --[[ Name: buildProductPayloadFromInitiateArgs ]]
    -- upvalues: l_ProductTypeEnum_0 (copy)
    local v13 = v12 or {};
    if v3 == Enum.InfoType.Asset then
        return {
            kind = l_ProductTypeEnum_0.Asset, 
            id = tostring(v2), 
            equipIfPurchased = v4 or false, 
            isRobloxPurchase = v5 or false, 
            idempotencyKey = v6 or "", 
            purchaseAuthToken = v7 or "", 
            collectibleItemId = v8 or "", 
            collectibleItemInstanceId = v9 or "", 
            collectibleProductId = v10 or "", 
            expectedPrice = v11 or 0
        };
    elseif v3 == Enum.InfoType.GamePass then
        return {
            kind = l_ProductTypeEnum_0.Gamepass, 
            id = tostring(v2)
        };
    elseif v3 == Enum.InfoType.Product then
        return {
            kind = l_ProductTypeEnum_0.Product, 
            id = tostring(v2), 
            equipIfPurchased = v4 or false, 
            universeId = nil
        };
    elseif v3 == Enum.InfoType.Bundle then
        return {
            kind = l_ProductTypeEnum_0.Bundle, 
            id = tostring(v2), 
            idempotencyKey = v6 or "", 
            collectibleItemId = v8 or "", 
            collectibleItemInstanceId = v9 or "", 
            collectibleProductId = v10 or "", 
            expectedPrice = v11 or 0
        };
    elseif v3 == l_ProductTypeEnum_0.Experience then
        return {
            kind = l_ProductTypeEnum_0.Experience, 
            universeId = tostring(v2), 
            experienceName = v13.name or "", 
            experienceIconUrl = v13.imageUrl or ""
        };
    elseif v3 == l_ProductTypeEnum_0.Look then
        return {
            kind = l_ProductTypeEnum_0.Look, 
            id = tostring(v2), 
            expectedPrice = v13.expectedPrice or v11 or 0, 
            salesLocationId = 0, 
            excludedAssetIds = {}, 
            excludedBundleIds = {}
        };
    else
        return nil;
    end;
end;