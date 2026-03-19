local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v5 = require(l_script_FirstAncestor_0.Actions.RequestBundlePurchase);
local v6 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlowUUID);
local v7 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v8 = require(l_script_FirstAncestor_0.Network.getBundleDetails);
local v9 = require(l_script_FirstAncestor_0.Network.getProductPurchasableDetails);
local v10 = require(l_script_FirstAncestor_0.Network.getCatalogItemDetails);
local v11 = require(l_script_FirstAncestor_0.Network.getAccountInfo);
local v12 = require(l_script_FirstAncestor_0.Network.getBalanceInfo);
local v13 = require(l_script_FirstAncestor_0.Network.getIsAlreadyOwned);
local v14 = require(l_script_FirstAncestor_0.Services.Network);
local v15 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v16 = require(l_script_FirstAncestor_0.Utils.hasPendingRequest);
local v17 = require(l_script_FirstAncestor_0.Promise);
local v18 = require(l_script_FirstAncestor_0.Thunk);
local _ = require(l_Parent_0.AppCommonLib).Logging;
local v20 = require(l_Parent_0.LoggingProtocol);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v22 = require(l_script_FirstAncestor_0.Network.getUnifiedPurchaseFlowEligibility);
local v23 = require(l_script_FirstAncestor_0.Flags.FFlagRemoveAcountInfoFetchFromPurchase);
local v24 = require(script.Parent.resolveBundlePromptState);
local v25 = require(l_script_FirstAncestor_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagEnablePurchaseFlowUUIDMigration);
local l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace;
local v28 = require(l_script_FirstAncestor_0.Events.PurchaseFlowUUIDTelemetry);
local v29 = {
    v14, 
    v15
};
return function(v30, v31, v32, v33, v34, v35, v36) --[[ Line: 44 ]] --[[ Name: initiateBundlePurchase ]]
    -- upvalues: v18 (copy), v29 (copy), v14 (copy), v15 (copy), v16 (copy), v26 (copy), l_HttpService_0 (copy), v6 (copy), v20 (copy), v28 (copy), v5 (copy), v4 (copy), v7 (copy), l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (copy), v17 (copy), v8 (copy), v23 (copy), l_Players_0 (copy), v11 (copy), v12 (copy), v13 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v22 (copy), v24 (copy), v25 (copy), v10 (copy), v9 (copy)
    return v18.new(script.Name, v29, function(v37, v38) --[[ Line: 53 ]]
        -- upvalues: v14 (ref), v15 (ref), v16 (ref), v26 (ref), l_HttpService_0 (ref), v6 (ref), v20 (ref), v28 (ref), v5 (ref), v30 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), v36 (copy), v4 (ref), v7 (ref), l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (ref), v17 (ref), v8 (ref), v23 (ref), l_Players_0 (ref), v11 (ref), v12 (ref), v13 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v22 (ref), v24 (ref), v25 (ref), v10 (ref), v9 (ref)
        local v39 = v38[v14];
        local v40 = v38[v15];
        if v16(v37:getState()) then
            return nil;
        else
            if v26 then
                local v41 = l_HttpService_0:GenerateGUID(false);
                v37:dispatch(v6(v41));
                v20.default:logRobloxTelemetryCounter(v28.InitiatePurchaseCounter, 1, {
                    method = "initiateBundlePurchase"
                });
            end;
            v37:dispatch(v5(v30, v31, v32, v33, v34, v35, v36));
            if v40.getFlagOrder66() then
                v37:dispatch(v4(v7.PurchaseDisabled));
                return nil;
            else
                local v42 = nil;
                local v43 = nil;
                local v44 = nil;
                if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then
                    local v45 = v37:getState();
                    local l_purchaseOptions_0 = v45.purchaseOptions;
                    local l_purchaseCallbacks_0 = v45.purchaseCallbacks;
                    if l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.shouldSkipOwnershipCheck == true then
                        v42 = true;
                    end;
                    if l_purchaseOptions_0 ~= nil and l_purchaseOptions_0.providedRobuxBalance ~= nil then
                        v43 = l_purchaseOptions_0.providedRobuxBalance;
                    end;
                    if l_purchaseCallbacks_0 ~= nil and l_purchaseCallbacks_0.fetchProductInfo ~= nil then
                        v44 = l_purchaseCallbacks_0.fetchProductInfo;
                    end;
                end;
                return v17.all({
                    bundleDetails = if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 and v44 ~= nil then v44() else v8(v39, v30), 
                    accountInfo = if v23 then v17.resolve({
                        isPremium = l_Players_0.LocalPlayer.MembershipType == Enum.MembershipType.Premium
                    }) else v11(v39, v40), 
                    balanceInfo = v12(v39, v40, false, nil, if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then v43 else nil), 
                    alreadyOwned = v13(v39, v30, Enum.InfoType.Bundle, if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then v42 else nil), 
                    isUserEligibleForUnifiedPurchaseFlow = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v22(v39) else nil
                }):andThen(function(v48) --[[ Line: 134 ]]
                    -- upvalues: l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 (ref), v37 (copy), v24 (ref), v36 (ref), v25 (ref), v10 (ref), v39 (copy), v30 (ref), v4 (ref), v9 (ref), v7 (ref)
                    if v48.bundleDetails.product then
                        if l_FFlagUnifiedPurchaseOptimizeTTIMarketplace_0 then
                            v37:dispatch(v24(nil, v48.bundleDetails, v48.accountInfo, v48.balanceInfo, v36, v48.alreadyOwned, v48.isUserEligibleForUnifiedPurchaseFlow));
                            return;
                        elseif v25() then
                            v10(v39, v30, "bundle"):andThen(function(v49) --[[ Line: 153 ]]
                                -- upvalues: v37 (ref), v24 (ref), v48 (copy), v36 (ref)
                                v37:dispatch(v24(v49, v48.bundleDetails, v48.accountInfo, v48.balanceInfo, v36, v48.alreadyOwned, v48.isUserEligibleForUnifiedPurchaseFlow));
                            end):catch(function(v50) --[[ Line: 166 ]]
                                -- upvalues: v37 (ref), v4 (ref)
                                v37:dispatch(v4(v50));
                            end);
                            return;
                        else
                            local l_id_0 = v48.bundleDetails.product.id;
                            v9(v39, l_id_0):andThen(function(v52) --[[ Line: 172 ]]
                                -- upvalues: v37 (ref), v24 (ref), v48 (copy), v36 (ref)
                                v37:dispatch(v24(v52, v48.bundleDetails, v48.accountInfo, v48.balanceInfo, v36, v48.alreadyOwned, v48.isUserEligibleForUnifiedPurchaseFlow));
                            end);
                            return;
                        end;
                    else
                        v37:dispatch(v4(v7.NotForSale));
                        return;
                    end;
                end):catch(function(v53) --[[ Line: 192 ]]
                    -- upvalues: v37 (copy), v4 (ref)
                    v37:dispatch(v4(v53));
                end);
            end;
        end;
    end);
end;