local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.IAPExperience);
local v4 = require(l_script_FirstAncestor_0.Components.PurchasePromptApp);
local v5 = require(l_script_FirstAncestor_0.Actions.SetPurchaseCallbacks);
local v6 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local v7 = require(l_script_FirstAncestor_0.Actions.SetProductPayload);
local v8 = require(l_script_FirstAncestor_0.Actions.SetPurchaseAnalyticsMetadata);
local v9 = require(l_script_FirstAncestor_0.Actions.SetPurchaseOptions);
local v10 = require(l_script_FirstAncestor_0.Thunks.initiatePurchase);
local v11 = require(l_script_FirstAncestor_0.Thunks.initiateBundlePurchase);
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v13 = require(l_Parent_0.SharedFlags);
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = v13.FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = v13.FFlagPurchasePromptSubtitleForTimedOptions;
local _ = require(l_script_FirstAncestor_0.types);
return function(v17) --[[ Line: 34 ]] --[[ Name: UnifiedPurchasePrompt ]]
    -- upvalues: v2 (copy), v7 (copy), v5 (copy), v6 (copy), v8 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), v9 (copy), l_ProductTypeEnum_0 (copy), v10 (copy), v11 (copy), v4 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy)
    local l_store_0 = v17.store;
    v2.useEffect(function() --[[ Line: 36 ]]
        -- upvalues: v17 (copy), l_store_0 (copy), v7 (ref), v5 (ref), v6 (ref), v8 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), v9 (ref), l_ProductTypeEnum_0 (ref), v10 (ref), v11 (ref)
        local l_productPayload_0 = v17.productPayload;
        l_store_0:dispatch(v7(l_productPayload_0));
        if v17.purchaseCallbacks then
            l_store_0:dispatch(v5(v17.purchaseCallbacks));
        end;
        if v17.postPurchaseActions then
            l_store_0:dispatch(v6(v17.postPurchaseActions));
        end;
        if v17.purchaseAnalyticsMetadata then
            l_store_0:dispatch(v8({
                surface = v17.purchaseAnalyticsMetadata.surface, 
                productUniverseId = v17.purchaseAnalyticsMetadata.productUniverseId
            }));
        end;
        if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 and v17.purchaseOptions then
            l_store_0:dispatch(v9(v17.purchaseOptions));
        end;
        if l_productPayload_0.kind == l_ProductTypeEnum_0.Asset then
            l_store_0:dispatch(v10(l_productPayload_0.id, Enum.InfoType.Asset, l_productPayload_0.equipIfPurchased, l_productPayload_0.isRobloxPurchase, l_productPayload_0.idempotencyKey, nil, l_productPayload_0.collectibleItemId, l_productPayload_0.collectibleItemInstanceId, l_productPayload_0.collectibleProductId, l_productPayload_0.expectedPrice));
            return;
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Gamepass then
            l_store_0:dispatch(v10(l_productPayload_0.id, Enum.InfoType.GamePass));
            return;
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Product then
            l_store_0:dispatch(v10(l_productPayload_0.id, Enum.InfoType.Product, l_productPayload_0.equipIfPurchased));
            return;
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Bundle then
            l_store_0:dispatch(v11(l_productPayload_0.id, l_productPayload_0.idempotencyKey, nil, l_productPayload_0.collectibleItemId, l_productPayload_0.collectibleItemInstanceId, l_productPayload_0.collectibleProductId, l_productPayload_0.expectedPrice));
            return;
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Experience then
            l_store_0:dispatch(v10(l_productPayload_0.universeId, l_ProductTypeEnum_0.Experience, nil, nil, nil, nil, nil, nil, nil, nil, {
                name = l_productPayload_0.experienceName, 
                imageUrl = l_productPayload_0.experienceIconUrl
            }));
            return;
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Look then
            l_store_0:dispatch(v10(l_productPayload_0.id, l_ProductTypeEnum_0.Look, nil, nil, nil, nil, nil, nil, nil, nil, {
                expectedPrice = l_productPayload_0.expectedPrice
            }));
            return;
        else
            if l_productPayload_0.kind == l_ProductTypeEnum_0.DeveloperSubscription then
                l_store_0:dispatch(v10(l_productPayload_0.subscriptionId, l_ProductTypeEnum_0.DeveloperSubscription, nil, nil, nil, nil, nil, nil, nil, l_productPayload_0.expectedPrice, {
                    expectedPrice = l_productPayload_0.expectedPrice, 
                    name = l_productPayload_0.name, 
                    iconImageAssetId = l_productPayload_0.iconImageAssetId, 
                    displayPrice = l_productPayload_0.displayPrice
                }));
            end;
            return;
        end;
    end, {
        v17.productPayload, 
        v17.purchaseCallbacks, 
        v17.postPurchaseActions
    });
    return v2.createElement(v4, {
        store = l_store_0, 
        subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v17.subtitleView else nil
    });
end;