local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlow);
local v4 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v5 = require(l_script_FirstAncestor_0.Actions.ProductInfoReceived);
local v6 = require(l_script_FirstAncestor_0.Actions.AccountInfoReceived);
local v7 = require(l_script_FirstAncestor_0.Actions.BalanceInfoRecieved);
local v8 = require(l_script_FirstAncestor_0.Actions.PromptNativeUpsellSuggestions);
local v9 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v10 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local v11 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v12 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v13 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v14 = require(l_script_FirstAncestor_0.Enums.PaymentPlatform);
local v15 = require(l_script_FirstAncestor_0.Enums.RequestType);
local _ = require(l_script_FirstAncestor_0.Models.RobuxUpsell);
local v17 = require(l_script_FirstAncestor_0.Network.getRobuxUpsellSuggestions);
local v18 = require(l_script_FirstAncestor_0.Services.ABTest);
local v19 = require(l_script_FirstAncestor_0.Services.Analytics);
local v20 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v21 = require(l_script_FirstAncestor_0.Services.Network);
local v22 = require(l_script_FirstAncestor_0.Enums.Counter);
local v23 = require(l_script_FirstAncestor_0.Thunks.sendCounter);
local v24 = require(l_script_FirstAncestor_0.Utils.meetsPrerequisites);
local v25 = require(l_script_FirstAncestor_0.Utils.getPlayerProductInfoPrice);
local v26 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local _ = require(l_script_FirstAncestor_0.Utils.getPaymentFromPlatformLegacy);
local _ = require(l_script_FirstAncestor_0.Utils.getHasAmazonUserAgent);
local v29 = require(l_script_FirstAncestor_0.Utils.hasPendingRequest);
local v30 = require(l_script_FirstAncestor_0.Actions.SetPurchaseAnalyticsMetadata);
local v31 = require(l_script_FirstAncestor_0.Utils.getPurchaseSurface);
local v32 = require(l_script_FirstAncestor_0.Thunk);
local v33 = require(l_script_FirstAncestor_0.Utils.getProductTypeFromRequestType);
local _ = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local l_GetFStringLargerRobuxUpsellIxpLayer_0 = require(l_Parent_0.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer;
local v36 = require(l_script_FirstAncestor_0.Flags.LargerRobuxUpsellTest);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v38 = require(l_script_FirstAncestor_0.Actions.SetIsUserEligibleForUnifiedPurchaseFlow);
local v39 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local _ = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
local v42 = require(l_script_FirstAncestor_0.Actions.SetRobloxSubscriptionProducts);
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local v44 = {
    v18, 
    v19, 
    v20, 
    v21
};
local l_FFlagEnableUpsellSuggestionsAnalyticsId_0 = require(l_Parent_0.SharedFlags).FFlagEnableUpsellSuggestionsAnalyticsId;
local function v48(v46, v47) --[[ Line: 67 ]] --[[ Name: handleSuccessfulUpsellSuggestions ]]
    -- upvalues: v29 (copy), v8 (copy), v23 (copy), v22 (copy)
    if not v29(v46:getState()) then
        return;
    else
        v46:dispatch(v8(v47.products, 1, v47.virtualItemBadgeType));
        v46:dispatch(v23(v22.UpsellModalShown));
        return;
    end;
end;
local function v51(v49, _) --[[ Line: 77 ]] --[[ Name: handleFailedUpsellProduct ]]
    -- upvalues: v29 (copy), v11 (copy), v4 (copy), v12 (copy), v23 (copy), v22 (copy), v9 (copy), v13 (copy)
    if not v29(v49:getState()) then
        return;
    elseif v49:getState().purchaseFlow == v11.LargeRobuxUpsell then
        v49:dispatch(v4(v12.LargeRobuxUpsell));
        v49:dispatch(v23(v22.UpsellModalShown));
        return;
    else
        v49:dispatch(v9(v13.NotEnoughRobuxXbox));
        v49:dispatch(v23(v22.UpsellGenericModalShown));
        return;
    end;
end;
return function(v52, v53, v54, v55, v56, v57, v58, v59) --[[ Line: 93 ]] --[[ Name: resolvePromptState ]]
    -- upvalues: v32 (copy), v44 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v5 (copy), v6 (copy), v7 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v38 (copy), v30 (copy), v31 (copy), v33 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v42 (copy), v24 (copy), v13 (copy), v10 (copy), v9 (copy), v25 (copy), l_UserInputService_0 (copy), v26 (copy), v14 (copy), v3 (copy), v11 (copy), v39 (copy), v36 (copy), l_GetFStringLargerRobuxUpsellIxpLayer_0 (copy), l_FFlagEnableUpsellSuggestionsAnalyticsId_0 (copy), v17 (copy), v48 (copy), v51 (copy), v15 (copy), v4 (copy), v12 (copy)
    return v32.new(script.Name, v44, function(v60, v61) --[[ Line: 103 ]]
        -- upvalues: v18 (ref), v19 (ref), v20 (ref), v21 (ref), v5 (ref), v52 (copy), v6 (ref), v53 (copy), v7 (ref), v54 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v58 (copy), v38 (ref), v30 (ref), v31 (ref), v33 (ref), v57 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v59 (copy), v42 (ref), v56 (copy), v24 (ref), v55 (copy), v13 (ref), v10 (ref), v9 (ref), v25 (ref), l_UserInputService_0 (ref), v26 (ref), v14 (ref), v3 (ref), v11 (ref), v39 (ref), v36 (ref), l_GetFStringLargerRobuxUpsellIxpLayer_0 (ref), l_FFlagEnableUpsellSuggestionsAnalyticsId_0 (ref), v17 (ref), v48 (ref), v51 (ref), v15 (ref), v4 (ref), v12 (ref)
        local v62 = v60:getState();
        local v63 = v61[v18];
        local v64 = v61[v19];
        local v65 = v61[v20];
        local _ = v61[v21];
        v60:dispatch(v5(v52));
        v60:dispatch(v6(v53));
        v60:dispatch(v7(v54));
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
            if v58 then
                v60:dispatch(v38(true));
                local v67 = v60:getState();
                v60:dispatch(v30({
                    purchaseFlowUUID = v67.purchaseFlowUUID, 
                    surface = v31(v67.purchaseAnalyticsMetadata), 
                    productType = v33(v67.promptRequest.requestType), 
                    productId = v67.productInfo.productId, 
                    productTargetId = v67.productInfo.productTargetId, 
                    saleLocationUniverseId = game.GameId or 0, 
                    price = if v67.productInfo.price then v67.productInfo.price else v57, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v67.purchaseAnalyticsMetadata.productUniverseId else nil, 
                    userRobuxBalance = v67.accountInfo.balance
                }));
                if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v59 then
                    v60:dispatch(v42(v59));
                end;
            else
                v60:dispatch(v38(false));
            end;
        end;
        local v68 = (not v65.getFlagBypassThirdPartySettingForRobloxPurchase() or not v56) and (v65.getLuaUseThirdPartyPermissions() or v65.getFlagRestrictSales2());
        local v69, v70 = v24(v52, v55, v68, v65, v57);
        if not v69 then
            if not v65.isStudio() and v70 == v13.ThirdPartyDisabled then
                return v60:dispatch(v10());
            else
                return v60:dispatch(v9(v70));
            end;
        else
            local l_robux_0 = v54.robux;
            local l_hasFailed_0 = v54.hasFailed;
            local l_isPremium_0 = v53.isPremium;
            local v74 = v25(v52, l_isPremium_0);
            if v57 ~= nil then
                v74 = v57;
            end;
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if not l_hasFailed_0 and l_robux_0 < v74 then
                if v65.getFFlagDisableRobuxUpsell() then
                    return v60:dispatch(v9(v13.NotEnoughRobuxNoUpsell));
                else
                    local v76 = v26(l_l_UserInputService_0_Platform_0);
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v58 or v76 ~= v14.Web then
                        v60:dispatch(v3(v11.RobuxUpsellV2));
                    end;
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v58 then
                        v60:dispatch(v39({}));
                    end;
                    local _ = false;
                    if v36.isEnabled() then
                        local v78 = l_GetFStringLargerRobuxUpsellIxpLayer_0();
                        local v79 = v63.getLayerData(v78);
                        if v79 then
                            v63.logUserLayerExposure(v78);
                            if v36.isUserEnrolled(v79) then
                                v60:dispatch(v3(v11.LargeRobuxUpsell));
                            end;
                        end;
                    end;
                    local l_GameId_0 = game.GameId;
                    local l_ProductId_0 = v52.ProductId;
                    local l_DisplayName_0 = v52.DisplayName;
                    local v83 = l_FFlagEnableUpsellSuggestionsAnalyticsId_0 and v62.purchaseFlowUUID or nil;
                    return v17(v74, l_robux_0, v76, l_ProductId_0, l_DisplayName_0, l_GameId_0, v83):andThen(function(v84) --[[ Line: 218 ]]
                        -- upvalues: v48 (ref), v60 (copy)
                        return v48(v60, v84);
                    end, function() --[[ Line: 222 ]]
                        -- upvalues: v51 (ref), v60 (copy), v62 (copy)
                        return v51(v60, v62);
                    end);
                end;
            else
                if v62.requestType ~= v15.AvatarCreationFee then
                    v64.signalProductPurchaseShown(v52.productId, v62.requestType);
                end;
                return v60:dispatch(v4(v12.PromptPurchase));
            end;
        end;
    end);
end;