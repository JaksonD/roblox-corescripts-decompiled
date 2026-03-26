local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.IAPExperience);
local l_isEconomicRestrictionResponse_0 = v3.Utility.isEconomicRestrictionResponse;
local v5 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v6 = require(l_script_FirstAncestor_0.Actions.SetEconomicRestrictionError);
local v7 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v8 = require(l_script_FirstAncestor_0.Services.Network);
local v9 = require(l_script_FirstAncestor_0.Services.Analytics);
local v10 = require(l_script_FirstAncestor_0.Thunk);
local v11 = require(l_script_FirstAncestor_0.Promise);
local v12 = require(l_script_FirstAncestor_0.Misc.Constants);
local _ = require(l_script_FirstAncestor_0.types);
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v15 = require(script.Parent.completePurchase);
local v16 = require(l_script_FirstAncestor_0.Network.performDevProductEdpPurchase);
local v17 = require(l_script_FirstAncestor_0.Network.performExperiencePurchase);
local v18 = require(l_script_FirstAncestor_0.Network.performLookPurchase);
local v19 = require(l_script_FirstAncestor_0.Network.performDeveloperSubscriptionRobuxPurchase);
local v20 = require(l_script_FirstAncestor_0.Network.performDeveloperSubscriptionFiatPurchase);
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 = require(l_Parent_0.SharedFlags).FFlagAXUnifiedPurchasePromptTimedOptionsInLooks;
local l_parseEconomicRestrictionsFailureReason_0 = v3.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v3.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local v25 = {
    v8, 
    v9
};
local function v30(v26, v27) --[[ Line: 39 ]] --[[ Name: handleGenericPurchaseError ]]
    -- upvalues: l_isEconomicRestrictionResponse_0 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), v6 (copy), v5 (copy), v7 (copy)
    if l_isEconomicRestrictionResponse_0(v27) then
        local v28 = l_parseEconomicRestrictionsFailureReason_0(v27);
        local v29 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v27);
        v26:dispatch(v6(v28, v29));
        v26:dispatch(v5(v7.EconomicRestriction));
        return;
    else
        if v7.isMember(v27) then
            v26:dispatch(v5(v27));
        end;
        v26:dispatch(v5(v7.UnknownFailure));
        return;
    end;
end;
return function() --[[ Line: 55 ]] --[[ Name: performLuaPurchase ]]
    -- upvalues: v10 (copy), v25 (copy), v8 (copy), v9 (copy), v12 (copy), v16 (copy), v15 (copy), v11 (copy), v30 (copy), l_ProductTypeEnum_0 (copy), v17 (copy), l_HttpService_0 (copy), l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 (copy), v18 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v19 (copy), v20 (copy)
    return v10.new(script.Name, v25, function(v31, v32) --[[ Line: 56 ]]
        -- upvalues: v8 (ref), v9 (ref), v12 (ref), v16 (ref), v15 (ref), v11 (ref), v30 (ref), l_ProductTypeEnum_0 (ref), v17 (ref), l_HttpService_0 (ref), l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 (ref), v18 (ref), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v19 (ref), v20 (ref)
        local v33 = v32[v8];
        local v34 = v32[v9];
        local v35 = v31:getState();
        local l_productInfo_0 = v35.productInfo;
        local l_price_0 = l_productInfo_0.price;
        local l_productId_0 = l_productInfo_0.productId;
        local _ = v35.promptRequest;
        local l_id_0 = v35.promptRequest.id;
        local l_productPayload_0 = v35.productPayload;
        if l_productPayload_0.kind == "Product" then
            local v42 = {
                expectedCurrency = v12.Currency.Robux, 
                expectedPrice = l_price_0, 
                saleLocationId = l_productPayload_0.universeId
            };
            return v16(v33, l_productId_0, v42):andThen(function(v43) --[[ Line: 82 ]]
                -- upvalues: v31 (copy), v15 (ref), v34 (copy), l_id_0 (copy), v11 (ref)
                v31:dispatch(v15(v43));
                v34.signalPurchaseSuccess(l_id_0, Enum.InfoType.Product, nil, v43);
                return v11.resolve(v43);
            end):catch(function(v44) --[[ Line: 89 ]]
                -- upvalues: v30 (ref), v31 (copy)
                v30(v31, v44);
            end);
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Experience then
            local v45 = {
                expectedCurrency = v12.Currency.Robux, 
                expectedPrice = l_price_0, 
                sellerId = l_productInfo_0.sellerId
            };
            return v17(v33, l_productId_0, v45):andThen(function(v46) --[[ Line: 99 ]]
                -- upvalues: v31 (copy), v15 (ref), v11 (ref)
                v31:dispatch(v15(v46));
                return v11.resolve(v46);
            end):catch(function(v47) --[[ Line: 104 ]]
                -- upvalues: v30 (ref), v31 (copy)
                v30(v31, v47);
            end);
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Look then
            local v48 = {
                lookId = l_productPayload_0.id, 
                idempotencyKey = l_HttpService_0:GenerateGUID(false), 
                expectedPrice = l_productPayload_0.expectedPrice, 
                salesLocationId = l_productPayload_0.salesLocationId, 
                excludedAssets = l_productPayload_0.excludedAssetIds, 
                excludedBundles = l_productPayload_0.excludedBundleIds, 
                timedOptions = if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 then l_productPayload_0.timedOptions else nil
            };
            return v18(v33, l_productPayload_0.id, v48):andThen(function(v49) --[[ Line: 121 ]]
                -- upvalues: v31 (copy), v15 (ref), v11 (ref)
                v31:dispatch(v15(v49));
                return v11.resolve(v49);
            end):catch(function(v50) --[[ Line: 126 ]]
                -- upvalues: v30 (ref), v31 (copy)
                v30(v31, v50);
            end);
        elseif l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_productPayload_0.kind == l_ProductTypeEnum_0.DeveloperSubscription then
            local l_subscriptionId_0 = l_productPayload_0.subscriptionId;
            local v52 = nil;
            if l_productPayload_0.isSubscriptionInRobux then
                local l_expectedPrice_0 = l_productPayload_0.expectedPrice;
                v52 = v19(v33, l_subscriptionId_0, l_expectedPrice_0);
            else
                v52 = v20(v33, l_subscriptionId_0);
            end;
            return v52:andThen(function() --[[ Line: 145 ]]
                -- upvalues: v31 (copy), v15 (ref), v11 (ref)
                v31:dispatch(v15());
                return v11.resolve();
            end):catch(function(v54) --[[ Line: 149 ]]
                -- upvalues: v30 (ref), v31 (copy)
                v30(v31, v54);
            end);
        else
            return;
        end;
    end);
end;