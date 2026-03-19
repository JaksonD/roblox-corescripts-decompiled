local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Actions.SetABVariation);
local v5 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v6 = require(l_script_FirstAncestor_0.Actions.RequestAssetPurchase);
local v7 = require(l_script_FirstAncestor_0.Actions.RequestGamepassPurchase);
local v8 = require(l_script_FirstAncestor_0.Actions.RequestProductPurchase);
local v9 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v10 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local _ = require(l_script_FirstAncestor_0.Misc.Constants);
local v12 = require(l_script_FirstAncestor_0.Services.Network);
local v13 = require(l_script_FirstAncestor_0.Network.deprecated_GetProductInfo);
local v14 = require(l_script_FirstAncestor_0.Network.getProductInfo);
local v15 = require(l_script_FirstAncestor_0.Network.getBalanceInfo);
local v16 = require(l_script_FirstAncestor_0.Network.getIsAlreadyOwned);
local v17 = require(l_script_FirstAncestor_0.Network.getAccountInfo);
local v18 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v19 = require(l_script_FirstAncestor_0.Utils.hasPendingRequest);
local v20 = require(l_script_FirstAncestor_0.Promise);
local v21 = require(l_script_FirstAncestor_0.Thunk);
local _ = require(l_Parent_0.AppCommonLib).Logging;
local v23 = require(l_Parent_0.LoggingProtocol);
local l_ProductTypeEnum_0 = require(l_script_FirstAncestor_0.types).ProductTypeEnum;
local v25 = require(l_script_FirstAncestor_0.Actions.RequestExperiencePurchase);
local v26 = require(l_script_FirstAncestor_0.Actions.RequestLookPurchase);
local v27 = require(l_script_FirstAncestor_0.Actions.RequestDeveloperSubscriptionPurchase);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagRemoveAcountInfoFetchFromPurchase);
local v31 = require(l_script_FirstAncestor_0.Actions.SetIsUserEligibleForUnifiedPurchaseFlow);
local v32 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v33 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v34 = require(l_script_FirstAncestor_0.Actions.SetProductPayload);
local v35 = require(script.Parent.resolvePromptState);
local v36 = require(l_script_FirstAncestor_0.Utils.buildProductPayloadFromInitiateArgs);
local l_FFlagAddFetchProductInfoAsACallback_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback;
local v38 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v40 = require(l_script_FirstAncestor_0.Network.getUnifiedPurchaseFlowEligibility);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagFixPurchasingErrorCounter);
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local l_FFlagAddPurchaseOptionForProvidingBalance_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local l_getRobloxSubscriptionProducts_0 = require(l_Parent_0.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts;
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local v47 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v48 = {
    v12, 
    v18
};
return function(v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60) --[[ Line: 73 ]] --[[ Name: initiatePurchase ]]
    -- upvalues: v21 (copy), v48 (copy), v12 (copy), v18 (copy), v19 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v39 (copy), l_HttpService_0 (copy), v9 (copy), v23 (copy), v47 (copy), v6 (copy), v7 (copy), v8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_ProductTypeEnum_0 (copy), v25 (copy), v26 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v27 (copy), v5 (copy), v10 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), l_FFlagAddPurchaseOptionForProvidingBalance_0 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_FFlagAddFetchProductInfoAsACallback_0 (copy), v31 (copy), v32 (copy), v33 (copy), v20 (copy), v38 (copy), v14 (copy), v13 (copy), v30 (copy), l_Players_0 (copy), v17 (copy), v16 (copy), v15 (copy), v40 (copy), l_getRobloxSubscriptionProducts_0 (copy), v34 (copy), v36 (copy), v35 (copy), v41 (copy)
    return v21.new(script.Name, v48, function(v61, v62) --[[ Line: 87 ]]
        -- upvalues: v12 (ref), v18 (ref), v19 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v60 (copy), v39 (ref), l_HttpService_0 (ref), v9 (ref), v23 (ref), v47 (ref), v50 (copy), v6 (ref), v49 (copy), v51 (copy), v52 (copy), v53 (copy), v54 (copy), v55 (copy), v56 (copy), v57 (copy), v58 (copy), v7 (ref), v8 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_ProductTypeEnum_0 (ref), v25 (ref), v26 (ref), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v27 (ref), v5 (ref), v10 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_FFlagAddPurchaseOptionForProvidingBalance_0 (ref), l_FFlagUnifiedPurchaseAddSkeleton_0 (ref), l_FFlagAddFetchProductInfoAsACallback_0 (ref), v59 (copy), v31 (ref), v32 (ref), v33 (ref), v20 (ref), v38 (ref), v14 (ref), v13 (ref), v30 (ref), l_Players_0 (ref), v17 (ref), v16 (ref), v15 (ref), v40 (ref), l_getRobloxSubscriptionProducts_0 (ref), v34 (ref), v36 (ref), v35 (ref), v41 (ref)
        local v63 = v62[v12];
        local v64 = v62[v18];
        if v19(v61:getState()) and (not l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 or not v60) then
            return nil;
        else
            if v39 then
                local v65 = l_HttpService_0:GenerateGUID(false);
                v61:dispatch(v9(v65));
                v23.default:logRobloxTelemetryCounter(v47.InitiatePurchaseCounter, 1, {
                    method = "initiatePurchase"
                });
            end;
            if v50 == Enum.InfoType.Asset then
                v61:dispatch(v6(v49, v51, v52, v53, v54, v55, v56, v57, v58));
            elseif v50 == Enum.InfoType.GamePass then
                v61:dispatch(v7(v49));
            elseif v50 == Enum.InfoType.Product then
                v61:dispatch(v8(v49, v51));
            elseif l_FFlagEnableUnifiedProductPurchaseFlow_0 and v50 == l_ProductTypeEnum_0.Experience then
                v61:dispatch(v25(v49));
            elseif l_FFlagEnableUnifiedProductPurchaseFlow_0 and v50 == l_ProductTypeEnum_0.Look then
                v61:dispatch(v26(v49));
            elseif l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v50 == l_ProductTypeEnum_0.DeveloperSubscription then
                v61:dispatch(v27(v49, v58));
            else
                assert(false, "Invalid product type");
                return nil;
            end;
            if v64.getFlagOrder66() then
                v61:dispatch(v5(v10.PurchaseDisabled));
                return nil;
            else
                local v66 = nil;
                local v67 = nil;
                local v68 = nil;
                if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then
                    local l_purchaseOptions_0 = v61:getState().purchaseOptions;
                    if l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.shouldSkipOwnershipCheck == true then
                        v66 = true;
                    end;
                    if l_FFlagAddPurchaseOptionForProvidingBalance_0 and l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.providedRobuxBalance ~= nil then
                        v67 = l_purchaseOptions_0.providedRobuxBalance;
                    end;
                    if l_FFlagUnifiedPurchaseAddSkeleton_0 and l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.enablePreloadedPurchaseUI == true then
                        v68 = true;
                    end;
                end;
                local v70 = nil;
                if l_FFlagAddFetchProductInfoAsACallback_0 then
                    local l_purchaseCallbacks_0 = v61:getState().purchaseCallbacks;
                    if l_purchaseCallbacks_0 ~= nil and l_purchaseCallbacks_0.fetchProductInfo ~= nil then
                        v70 = l_purchaseCallbacks_0.fetchProductInfo;
                    end;
                end;
                local v72 = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v59 else nil;
                if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_FFlagUnifiedPurchaseAddSkeleton_0 and v68 then
                    v61:dispatch(v31(true));
                    v61:dispatch(v32(v33.InitializingPurchase));
                end;
                return v20.all({
                    productInfo = if v38() then if not (l_FFlagAddFetchProductInfoAsACallback_0 and v70 ~= nil) or l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v60 then v14(v63, v49, v50, v72) else v70() else v13(v63, v49, v50), 
                    accountInfo = if v30 then v20.resolve({
                        isPremium = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium
                    }) else v17(v63, v64), 
                    alreadyOwned = v16(v63, v49, v50, v66), 
                    balanceInfo = v15(v63, v64, false, true, v67), 
                    isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v40(v63, v50) else nil, 
                    robloxSubscriptionProducts = if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then l_getRobloxSubscriptionProducts_0():catch(function() --[[ Line: 208 ]]
                        return nil;
                    end) else nil
                }):andThen(function(v73) --[[ Line: 213 ]]
                    -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), l_ProductTypeEnum_0 (ref), v61 (copy), v34 (ref), v49 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v36 (ref), v50 (ref), v51 (ref), v52 (ref), v53 (ref), v54 (ref), v55 (ref), v56 (ref), v57 (ref), v58 (ref), v72 (copy), v35 (ref)
                    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v73.productInfo.ProductType == l_ProductTypeEnum_0.DeveloperSubscription and (v61:getState().productPayload == nil or v61:getState().productPayload.kind == nil) then
                        local l_v61_0 = v61;
                        local l_v34_0 = v34;
                        local v76 = {
                            subscriptionId = v49, 
                            kind = l_ProductTypeEnum_0.DeveloperSubscription, 
                            expectedPrice = v73.productInfo.PriceInRobux, 
                            iconImageAssetId = v73.productInfo.IconImageAssetId
                        };
                        local v77 = false;
                        if v73.productInfo.PriceInRobux ~= nil then
                            v77 = v73.productInfo.PriceInRobux > 0;
                        end;
                        v76.isSubscriptionInRobux = v77;
                        l_v61_0:dispatch(l_v34_0(v76));
                    end;
                    if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then
                        local l_productPayload_0 = v61:getState().productPayload;
                        if not l_productPayload_0 or not l_productPayload_0.kind then
                            local v79 = v36(v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v72);
                            if v79 then
                                v61:dispatch(v34(v79));
                            end;
                        end;
                    end;
                    v61:dispatch(v35(v73.productInfo, v73.accountInfo, v73.balanceInfo, v73.alreadyOwned, v52, v58, v73.isUserEligibleForUnifiedPurchaseFlow, if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 then v73.robloxSubscriptionProducts else nil));
                end):catch(function(v80) --[[ Line: 269 ]]
                    -- upvalues: v41 (ref), v10 (ref), v61 (copy), v5 (ref)
                    if v41 then
                        if v10.isMember(v80) then
                            v61:dispatch(v5(v80));
                            return;
                        else
                            v61:dispatch(v5(v10.UnknownFailure));
                            return;
                        end;
                    else
                        v61:dispatch(v5(v80));
                        return;
                    end;
                end);
            end;
        end;
    end);
end;