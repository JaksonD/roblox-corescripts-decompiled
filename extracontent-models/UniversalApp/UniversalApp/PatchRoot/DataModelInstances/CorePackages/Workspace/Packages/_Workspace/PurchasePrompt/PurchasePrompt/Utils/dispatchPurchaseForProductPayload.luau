local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v2 = require(l_script_FirstAncestor_0.Thunks.initiatePurchase);
local v3 = require(l_script_FirstAncestor_0.Thunks.initiateBundlePurchase);
return function(v4, v5, _, v7) --[[ Line: 13 ]] --[[ Name: dispatchPurchaseForProductPayload ]]
    -- upvalues: l_ProductTypeEnum_0 (copy), v2 (copy), v3 (copy)
    if v5.kind == l_ProductTypeEnum_0.Asset then
        v4(v2(v5.id, Enum.InfoType.Asset, v5.equipIfPurchased, v5.isRobloxPurchase, v5.idempotencyKey, nil, v5.collectibleItemId, v5.collectibleItemInstanceId, v5.collectibleProductId, v5.expectedPrice, nil, v7));
        return;
    elseif v5.kind == l_ProductTypeEnum_0.Gamepass then
        v4(v2(v5.id, Enum.InfoType.GamePass, nil, nil, nil, nil, nil, nil, nil, nil, nil, v7));
        return;
    elseif v5.kind == l_ProductTypeEnum_0.Product then
        v4(v2(v5.id, Enum.InfoType.Product, v5.equipIfPurchased, nil, nil, nil, nil, nil, nil, nil, nil, v7));
        return;
    elseif v5.kind == l_ProductTypeEnum_0.Bundle then
        v4(v3(v5.id, v5.idempotencyKey, nil, v5.collectibleItemId, v5.collectibleItemInstanceId, v5.collectibleProductId, v5.expectedPrice, v7));
        return;
    elseif v5.kind == l_ProductTypeEnum_0.Experience then
        v4(v2(v5.universeId, l_ProductTypeEnum_0.Experience, nil, nil, nil, nil, nil, nil, nil, nil, {
            name = v5.experienceName, 
            imageUrl = v5.experienceIconUrl
        }, v7));
        return;
    elseif v5.kind == l_ProductTypeEnum_0.Look then
        v4(v2(v5.id, l_ProductTypeEnum_0.Look, nil, nil, nil, nil, nil, nil, nil, nil, {
            expectedPrice = v5.expectedPrice
        }, v7));
        return;
    else
        if v5.kind == l_ProductTypeEnum_0.DeveloperSubscription then
            v4(v2(v5.subscriptionId, l_ProductTypeEnum_0.DeveloperSubscription, nil, nil, nil, nil, nil, nil, nil, v5.expectedPrice, {
                expectedPrice = v5.expectedPrice, 
                name = v5.name, 
                iconImageAssetId = v5.iconImageAssetId, 
                displayPrice = v5.displayPrice
            }, v7));
        end;
        return;
    end;
end;