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
local l_parseEconomicRestrictionsFailureReason_0 = v3.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v3.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local v24 = {
    v8, 
    v9
};
local function v29(v25, v26) --[[ Line: 37 ]] --[[ Name: handleGenericPurchaseError ]]
    -- upvalues: l_isEconomicRestrictionResponse_0 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), v6 (copy), v5 (copy), v7 (copy)
    if l_isEconomicRestrictionResponse_0(v26) then
        local v27 = l_parseEconomicRestrictionsFailureReason_0(v26);
        local v28 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v26);
        v25:dispatch(v6(v27, v28));
        v25:dispatch(v5(v7.EconomicRestriction));
        return;
    else
        if v7.isMember(v26) then
            v25:dispatch(v5(v26));
        end;
        v25:dispatch(v5(v7.UnknownFailure));
        return;
    end;
end;
return function() --[[ Line: 53 ]] --[[ Name: performLuaPurchase ]]
    -- upvalues: v10 (copy), v24 (copy), v8 (copy), v9 (copy), v12 (copy), v16 (copy), v15 (copy), v11 (copy), v29 (copy), l_ProductTypeEnum_0 (copy), v17 (copy), l_HttpService_0 (copy), v18 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v19 (copy), v20 (copy)
    return v10.new(script.Name, v24, function(v30, v31) --[[ Line: 54 ]]
        -- upvalues: v8 (ref), v9 (ref), v12 (ref), v16 (ref), v15 (ref), v11 (ref), v29 (ref), l_ProductTypeEnum_0 (ref), v17 (ref), l_HttpService_0 (ref), v18 (ref), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v19 (ref), v20 (ref)
        local v32 = v31[v8];
        local v33 = v31[v9];
        local v34 = v30:getState();
        local l_productInfo_0 = v34.productInfo;
        local l_price_0 = l_productInfo_0.price;
        local l_productId_0 = l_productInfo_0.productId;
        local _ = v34.promptRequest;
        local l_id_0 = v34.promptRequest.id;
        local l_productPayload_0 = v34.productPayload;
        if l_productPayload_0.kind == "Product" then
            local v41 = {
                expectedCurrency = v12.Currency.Robux, 
                expectedPrice = l_price_0, 
                saleLocationId = l_productPayload_0.universeId
            };
            return v16(v32, l_productId_0, v41):andThen(function(v42) --[[ Line: 80 ]]
                -- upvalues: v30 (copy), v15 (ref), v33 (copy), l_id_0 (copy), v11 (ref)
                v30:dispatch(v15(v42));
                v33.signalPurchaseSuccess(l_id_0, Enum.InfoType.Product, nil, v42);
                return v11.resolve(v42);
            end):catch(function(v43) --[[ Line: 87 ]]
                -- upvalues: v29 (ref), v30 (copy)
                v29(v30, v43);
            end);
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Experience then
            local v44 = {
                expectedCurrency = v12.Currency.Robux, 
                expectedPrice = l_price_0, 
                sellerId = l_productInfo_0.sellerId
            };
            return v17(v32, l_productId_0, v44):andThen(function(v45) --[[ Line: 97 ]]
                -- upvalues: v30 (copy), v15 (ref), v11 (ref)
                v30:dispatch(v15(v45));
                return v11.resolve(v45);
            end):catch(function(v46) --[[ Line: 102 ]]
                -- upvalues: v29 (ref), v30 (copy)
                v29(v30, v46);
            end);
        elseif l_productPayload_0.kind == l_ProductTypeEnum_0.Look then
            local v47 = {
                lookId = l_productPayload_0.id, 
                idempotencyKey = l_HttpService_0:GenerateGUID(false), 
                expectedPrice = l_productPayload_0.expectedPrice, 
                salesLocationId = l_productPayload_0.salesLocationId, 
                excludedAssets = l_productPayload_0.excludedAssetIds, 
                excludedBundles = l_productPayload_0.excludedBundleIds
            };
            return v18(v32, l_productPayload_0.id, v47):andThen(function(v48) --[[ Line: 116 ]]
                -- upvalues: v30 (copy), v15 (ref), v11 (ref)
                v30:dispatch(v15(v48));
                return v11.resolve(v48);
            end):catch(function(v49) --[[ Line: 121 ]]
                -- upvalues: v29 (ref), v30 (copy)
                v29(v30, v49);
            end);
        elseif l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_productPayload_0.kind == l_ProductTypeEnum_0.DeveloperSubscription then
            local l_subscriptionId_0 = l_productPayload_0.subscriptionId;
            local v51 = nil;
            if l_productPayload_0.isSubscriptionInRobux then
                local l_expectedPrice_0 = l_productPayload_0.expectedPrice;
                v51 = v19(v32, l_subscriptionId_0, l_expectedPrice_0);
            else
                v51 = v20(v32, l_subscriptionId_0);
            end;
            return v51:andThen(function(v53) --[[ Line: 140 ]]
                -- upvalues: v30 (copy), v15 (ref), v11 (ref)
                v30:dispatch(v15(v53));
                return v11.resolve(v53);
            end):catch(function(v54) --[[ Line: 145 ]]
                -- upvalues: v29 (ref), v30 (copy)
                v29(v30, v54);
            end);
        else
            return;
        end;
    end);
end;