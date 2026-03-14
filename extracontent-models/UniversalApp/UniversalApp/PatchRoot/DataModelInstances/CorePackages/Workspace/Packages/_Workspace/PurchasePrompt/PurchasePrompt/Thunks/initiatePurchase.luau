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
local l_FFlagAddFetchProductInfoAsACallback_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback;
local v37 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local v39 = require(l_script_FirstAncestor_0.Network.getUnifiedPurchaseFlowEligibility);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagFixPurchasingErrorCounter);
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local l_FFlagAddPurchaseOptionForProvidingBalance_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local v44 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v45 = {
    v12, 
    v18
};
return function(v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56) --[[ Line: 63 ]] --[[ Name: initiatePurchase ]]
    -- upvalues: v21 (copy), v45 (copy), v12 (copy), v18 (copy), v19 (copy), v38 (copy), l_HttpService_0 (copy), v9 (copy), v23 (copy), v44 (copy), v6 (copy), v7 (copy), v8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_ProductTypeEnum_0 (copy), v25 (copy), v26 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v27 (copy), v5 (copy), v10 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), l_FFlagAddPurchaseOptionForProvidingBalance_0 (copy), l_FFlagUnifiedPurchaseAddSkeleton_0 (copy), l_FFlagAddFetchProductInfoAsACallback_0 (copy), v31 (copy), v32 (copy), v33 (copy), v20 (copy), v37 (copy), v14 (copy), v13 (copy), v30 (copy), l_Players_0 (copy), v17 (copy), v16 (copy), v15 (copy), v39 (copy), v34 (copy), v35 (copy), v40 (copy)
    return v21.new(script.Name, v45, function(v57, v58) --[[ Line: 76 ]]
        -- upvalues: v12 (ref), v18 (ref), v19 (ref), v38 (ref), l_HttpService_0 (ref), v9 (ref), v23 (ref), v44 (ref), v47 (copy), v6 (ref), v46 (copy), v48 (copy), v49 (copy), v50 (copy), v51 (copy), v52 (copy), v53 (copy), v54 (copy), v55 (copy), v7 (ref), v8 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), l_ProductTypeEnum_0 (ref), v25 (ref), v26 (ref), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v27 (ref), v5 (ref), v10 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_FFlagAddPurchaseOptionForProvidingBalance_0 (ref), l_FFlagUnifiedPurchaseAddSkeleton_0 (ref), l_FFlagAddFetchProductInfoAsACallback_0 (ref), v56 (copy), v31 (ref), v32 (ref), v33 (ref), v20 (ref), v37 (ref), v14 (ref), v13 (ref), v30 (ref), l_Players_0 (ref), v17 (ref), v16 (ref), v15 (ref), v39 (ref), v34 (ref), v35 (ref), v40 (ref)
        local v59 = v58[v12];
        local v60 = v58[v18];
        if v19(v57:getState()) then
            return nil;
        else
            if v38 then
                local v61 = l_HttpService_0:GenerateGUID(false);
                v57:dispatch(v9(v61));
                v23.default:logRobloxTelemetryCounter(v44.InitiatePurchaseCounter, 1, {
                    method = "initiatePurchase"
                });
            end;
            if v47 == Enum.InfoType.Asset then
                v57:dispatch(v6(v46, v48, v49, v50, v51, v52, v53, v54, v55));
            elseif v47 == Enum.InfoType.GamePass then
                v57:dispatch(v7(v46));
            elseif v47 == Enum.InfoType.Product then
                v57:dispatch(v8(v46, v48));
            elseif l_FFlagEnableUnifiedProductPurchaseFlow_0 and v47 == l_ProductTypeEnum_0.Experience then
                v57:dispatch(v25(v46));
            elseif l_FFlagEnableUnifiedProductPurchaseFlow_0 and v47 == l_ProductTypeEnum_0.Look then
                v57:dispatch(v26(v46));
            elseif l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v47 == l_ProductTypeEnum_0.DeveloperSubscription then
                v57:dispatch(v27(v46, v55));
            else
                assert(false, "Invalid product type");
                return nil;
            end;
            if v60.getFlagOrder66() then
                v57:dispatch(v5(v10.PurchaseDisabled));
                return nil;
            else
                local v62 = nil;
                local v63 = nil;
                local v64 = nil;
                if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then
                    local l_purchaseOptions_0 = v57:getState().purchaseOptions;
                    if l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.shouldSkipOwnershipCheck == true then
                        v62 = true;
                    end;
                    if l_FFlagAddPurchaseOptionForProvidingBalance_0 and l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.providedRobuxBalance ~= nil then
                        v63 = l_purchaseOptions_0.providedRobuxBalance;
                    end;
                    if l_FFlagUnifiedPurchaseAddSkeleton_0 and l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.enablePreloadedPurchaseUI == true then
                        v64 = true;
                    end;
                end;
                local v66 = nil;
                if l_FFlagAddFetchProductInfoAsACallback_0 then
                    local l_purchaseCallbacks_0 = v57:getState().purchaseCallbacks;
                    if l_purchaseCallbacks_0 ~= nil and l_purchaseCallbacks_0.fetchProductInfo ~= nil then
                        v66 = l_purchaseCallbacks_0.fetchProductInfo;
                    end;
                end;
                local v68 = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v56 else nil;
                if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_FFlagUnifiedPurchaseAddSkeleton_0 and v64 then
                    v57:dispatch(v31(true));
                    v57:dispatch(v32(v33.InitializingPurchase));
                end;
                return v20.all({
                    productInfo = if v37() then if l_FFlagAddFetchProductInfoAsACallback_0 and v66 ~= nil then v66() else v14(v59, v46, v47, v68) else v13(v59, v46, v47), 
                    accountInfo = if v30 then v20.resolve({
                        isPremium = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium
                    }) else v17(v59, v60), 
                    alreadyOwned = v16(v59, v46, v47, v62), 
                    balanceInfo = v15(v59, v60, false, true, v63), 
                    isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v39(v59, v47) else nil
                }):andThen(function(v69) --[[ Line: 189 ]]
                    -- upvalues: l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), l_ProductTypeEnum_0 (ref), v57 (copy), v34 (ref), v46 (ref), v35 (ref), v49 (ref), v55 (ref)
                    if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v69.productInfo.ProductType == l_ProductTypeEnum_0.DeveloperSubscription and (v57:getState().productPayload == nil or v57:getState().productPayload.kind == nil) then
                        local l_v57_0 = v57;
                        local l_v34_0 = v34;
                        local v72 = {
                            subscriptionId = v46, 
                            kind = l_ProductTypeEnum_0.DeveloperSubscription, 
                            expectedPrice = v69.productInfo.PriceInRobux, 
                            iconImageAssetId = v69.productInfo.IconImageAssetId
                        };
                        local v73 = false;
                        if v69.productInfo.PriceInRobux ~= nil then
                            v73 = v69.productInfo.PriceInRobux > 0;
                        end;
                        v72.isSubscriptionInRobux = v73;
                        l_v57_0:dispatch(l_v34_0(v72));
                    end;
                    v57:dispatch(v35(v69.productInfo, v69.accountInfo, v69.balanceInfo, v69.alreadyOwned, v49, v55, v69.isUserEligibleForUnifiedPurchaseFlow));
                end):catch(function(v74) --[[ Line: 219 ]]
                    -- upvalues: v40 (ref), v10 (ref), v57 (copy), v5 (ref)
                    if v40 then
                        if v10.isMember(v74) then
                            v57:dispatch(v5(v74));
                            return;
                        else
                            v57:dispatch(v5(v10.UnknownFailure));
                            return;
                        end;
                    else
                        v57:dispatch(v5(v74));
                        return;
                    end;
                end);
            end;
        end;
    end);
end;