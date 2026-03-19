local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v5 = require(l_script_FirstAncestor_0.Actions.RequestBundlePurchase);
local v6 = require(l_script_FirstAncestor_0.Actions.SetProductPayload);
local v7 = require(l_script_FirstAncestor_0.Utils.buildProductPayloadFromInitiateArgs);
local v8 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v9 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v10 = require(l_script_FirstAncestor_0.Network.getBundleDetails);
local v11 = require(l_script_FirstAncestor_0.Network.getProductPurchasableDetails);
local v12 = require(l_script_FirstAncestor_0.Network.getCatalogItemDetails);
local v13 = require(l_script_FirstAncestor_0.Network.getAccountInfo);
local v14 = require(l_script_FirstAncestor_0.Network.getBalanceInfo);
local v15 = require(l_script_FirstAncestor_0.Network.getIsAlreadyOwned);
local v16 = require(l_script_FirstAncestor_0.Services.Network);
local v17 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v18 = require(l_script_FirstAncestor_0.Utils.hasPendingRequest);
local v19 = require(l_script_FirstAncestor_0.Promise);
local v20 = require(l_script_FirstAncestor_0.Thunk);
local _ = require(l_Parent_0.AppCommonLib).Logging;
local v22 = require(l_Parent_0.LoggingProtocol);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v24 = require(l_script_FirstAncestor_0.Network.getUnifiedPurchaseFlowEligibility);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagRemoveAcountInfoFetchFromPurchase);
local v26 = require(script.Parent.resolveBundlePromptState);
local v27 = require(l_script_FirstAncestor_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local v28 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace;
local l_getRobloxSubscriptionProducts_0 = require(l_Parent_0.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts;
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local v32 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v33 = {
    v16, 
    v17
};
return function(v34, v35, v36, v37, v38, v39, v40, v41) --[[ Line: 52 ]] --[[ Name: initiateBundlePurchase ]]
    -- upvalues: v20 (copy), v33 (copy), v16 (copy), v17 (copy), v18 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v7 (copy), v6 (copy), v28 (copy), l_HttpService_0 (copy), v8 (copy), v22 (copy), v32 (copy), v5 (copy), v4 (copy), v9 (copy), l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (copy), v19 (copy), v10 (copy), v25 (copy), l_Players_0 (copy), v13 (copy), v14 (copy), v15 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v24 (copy), l_getRobloxSubscriptionProducts_0 (copy), v26 (copy), v27 (copy), v12 (copy), v11 (copy)
    return v20.new(script.Name, v33, function(v42, v43) --[[ Line: 62 ]]
        -- upvalues: v16 (ref), v17 (ref), v18 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v41 (copy), v7 (ref), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy), v6 (ref), v28 (ref), l_HttpService_0 (ref), v8 (ref), v22 (ref), v32 (ref), v5 (ref), v4 (ref), v9 (ref), l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (ref), v19 (ref), v10 (ref), v25 (ref), l_Players_0 (ref), v13 (ref), v14 (ref), v15 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v24 (ref), l_getRobloxSubscriptionProducts_0 (ref), v26 (ref), v27 (ref), v12 (ref), v11 (ref)
        local v44 = v43[v16];
        local v45 = v43[v17];
        if v18(v42:getState()) and (not l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 or not v41) then
            return nil;
        else
            if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then
                local l_productPayload_0 = v42:getState().productPayload;
                if not l_productPayload_0 or not l_productPayload_0.kind then
                    local v47 = v7(v34, Enum.InfoType.Bundle, nil, nil, v35, v36, v37, v38, v39, v40, nil);
                    if v47 then
                        v42:dispatch(v6(v47));
                    end;
                end;
            end;
            if v28 then
                local v48 = l_HttpService_0:GenerateGUID(false);
                v42:dispatch(v8(v48));
                v22.default:logRobloxTelemetryCounter(v32.InitiatePurchaseCounter, 1, {
                    method = "initiateBundlePurchase"
                });
            end;
            v42:dispatch(v5(v34, v35, v36, v37, v38, v39, v40));
            if v45.getFlagOrder66() then
                v42:dispatch(v4(v9.PurchaseDisabled));
                return nil;
            else
                local v49 = nil;
                local v50 = nil;
                local v51 = nil;
                if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then
                    local v52 = v42:getState();
                    local l_purchaseOptions_0 = v52.purchaseOptions;
                    local l_purchaseCallbacks_0 = v52.purchaseCallbacks;
                    if l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.shouldSkipOwnershipCheck == true then
                        v49 = true;
                    end;
                    if l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.providedRobuxBalance ~= nil then
                        v50 = l_purchaseOptions_0.providedRobuxBalance;
                    end;
                    if l_purchaseCallbacks_0 ~= nil and l_purchaseCallbacks_0.fetchProductInfo ~= nil then
                        v51 = l_purchaseCallbacks_0.fetchProductInfo;
                    end;
                end;
                return v19.all({
                    bundleDetails = if not (l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 and v51 ~= nil) or l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v41 then v10(v44, v34) else v51(), 
                    accountInfo = if v25 then v19.resolve({
                        isPremium = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium
                    }) else v13(v44, v45), 
                    balanceInfo = v14(v44, v45, false, nil, if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then v50 else nil), 
                    alreadyOwned = v15(v44, v34, Enum.InfoType.Bundle, if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then v49 else nil), 
                    isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v24(v44) else nil, 
                    robloxSubscriptionProducts = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_getRobloxSubscriptionProducts_0(v44):catch(function() --[[ Line: 171 ]]
                        return nil;
                    end) else nil
                }):andThen(function(v55) --[[ Line: 176 ]]
                    -- upvalues: l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (ref), v42 (copy), v26 (ref), v40 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v27 (ref), v12 (ref), v44 (copy), v34 (ref), v4 (ref), v11 (ref), v9 (ref)
                    if v55.bundleDetails.product then
                        if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then
                            v42:dispatch(v26(nil, v55.bundleDetails, v55.accountInfo, v55.balanceInfo, v40, v55.alreadyOwned, v55.isUserEligibleForUnifiedPurchaseFlow, if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v55.robloxSubscriptionProducts else nil));
                            return;
                        elseif v27() then
                            v12(v44, v34, "bundle"):andThen(function(v56) --[[ Line: 198 ]]
                                -- upvalues: v42 (ref), v26 (ref), v55 (copy), v40 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref)
                                v42:dispatch(v26(v56, v55.bundleDetails, v55.accountInfo, v55.balanceInfo, v40, v55.alreadyOwned, v55.isUserEligibleForUnifiedPurchaseFlow, if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v55.robloxSubscriptionProducts else nil));
                            end):catch(function(v57) --[[ Line: 214 ]]
                                -- upvalues: v42 (ref), v4 (ref)
                                v42:dispatch(v4(v57));
                            end);
                            return;
                        else
                            local l_id_0 = v55.bundleDetails.product.id;
                            v11(v44, l_id_0):andThen(function(v59) --[[ Line: 220 ]]
                                -- upvalues: v42 (ref), v26 (ref), v55 (copy), v40 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref)
                                v42:dispatch(v26(v59, v55.bundleDetails, v55.accountInfo, v55.balanceInfo, v40, v55.alreadyOwned, v55.isUserEligibleForUnifiedPurchaseFlow, if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v55.robloxSubscriptionProducts else nil));
                            end);
                            return;
                        end;
                    else
                        v42:dispatch(v4(v9.NotForSale));
                        return;
                    end;
                end):catch(function(v60) --[[ Line: 243 ]]
                    -- upvalues: v42 (copy), v4 (ref)
                    v42:dispatch(v4(v60));
                end);
            end;
        end;
    end);
end;