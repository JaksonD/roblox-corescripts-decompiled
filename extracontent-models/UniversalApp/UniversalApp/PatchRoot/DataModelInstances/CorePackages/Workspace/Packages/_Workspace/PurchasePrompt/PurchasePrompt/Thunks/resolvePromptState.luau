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
local v41 = {
    v18, 
    v19, 
    v20, 
    v21
};
local l_FFlagEnableUpsellSuggestionsAnalyticsId_0 = require(l_Parent_0.SharedFlags).FFlagEnableUpsellSuggestionsAnalyticsId;
local function v45(v43, v44) --[[ Line: 60 ]] --[[ Name: handleSuccessfulUpsellSuggestions ]]
    -- upvalues: v29 (copy), v8 (copy), v23 (copy), v22 (copy)
    if not v29(v43:getState()) then
        return;
    else
        v43:dispatch(v8(v44.products, 1, v44.virtualItemBadgeType));
        v43:dispatch(v23(v22.UpsellModalShown));
        return;
    end;
end;
local function v48(v46, _) --[[ Line: 70 ]] --[[ Name: handleFailedUpsellProduct ]]
    -- upvalues: v29 (copy), v11 (copy), v4 (copy), v12 (copy), v23 (copy), v22 (copy), v9 (copy), v13 (copy)
    if not v29(v46:getState()) then
        return;
    elseif v46:getState().purchaseFlow == v11.LargeRobuxUpsell then
        v46:dispatch(v4(v12.LargeRobuxUpsell));
        v46:dispatch(v23(v22.UpsellModalShown));
        return;
    else
        v46:dispatch(v9(v13.NotEnoughRobuxXbox));
        v46:dispatch(v23(v22.UpsellGenericModalShown));
        return;
    end;
end;
return function(v49, v50, v51, v52, v53, v54, v55) --[[ Line: 86 ]] --[[ Name: resolvePromptState ]]
    -- upvalues: v32 (copy), v41 (copy), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v5 (copy), v6 (copy), v7 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v38 (copy), v30 (copy), v31 (copy), v33 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v24 (copy), v13 (copy), v10 (copy), v9 (copy), v25 (copy), l_UserInputService_0 (copy), v26 (copy), v14 (copy), v3 (copy), v11 (copy), v39 (copy), v36 (copy), l_GetFStringLargerRobuxUpsellIxpLayer_0 (copy), l_FFlagEnableUpsellSuggestionsAnalyticsId_0 (copy), v17 (copy), v45 (copy), v48 (copy), v15 (copy), v4 (copy), v12 (copy)
    return v32.new(script.Name, v41, function(v56, v57) --[[ Line: 95 ]]
        -- upvalues: v18 (ref), v19 (ref), v20 (ref), v21 (ref), v5 (ref), v49 (copy), v6 (ref), v50 (copy), v7 (ref), v51 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v55 (copy), v38 (ref), v30 (ref), v31 (ref), v33 (ref), v54 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v53 (copy), v24 (ref), v52 (copy), v13 (ref), v10 (ref), v9 (ref), v25 (ref), l_UserInputService_0 (ref), v26 (ref), v14 (ref), v3 (ref), v11 (ref), v39 (ref), v36 (ref), l_GetFStringLargerRobuxUpsellIxpLayer_0 (ref), l_FFlagEnableUpsellSuggestionsAnalyticsId_0 (ref), v17 (ref), v45 (ref), v48 (ref), v15 (ref), v4 (ref), v12 (ref)
        local v58 = v56:getState();
        local v59 = v57[v18];
        local v60 = v57[v19];
        local v61 = v57[v20];
        local _ = v57[v21];
        v56:dispatch(v5(v49));
        v56:dispatch(v6(v50));
        v56:dispatch(v7(v51));
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
            if v55 then
                v56:dispatch(v38(true));
                local v63 = v56:getState();
                v56:dispatch(v30({
                    purchaseFlowUUID = v63.purchaseFlowUUID, 
                    surface = v31(v63.purchaseAnalyticsMetadata), 
                    productType = v33(v63.promptRequest.requestType), 
                    productId = v63.productInfo.productId, 
                    productTargetId = v63.productInfo.productTargetId, 
                    saleLocationUniverseId = game.GameId or 0, 
                    price = if v63.productInfo.price then v63.productInfo.price else v54, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v63.purchaseAnalyticsMetadata.productUniverseId else nil, 
                    userRobuxBalance = v63.accountInfo.balance
                }));
            else
                v56:dispatch(v38(false));
            end;
        end;
        local v64 = (not v61.getFlagBypassThirdPartySettingForRobloxPurchase() or not v53) and (v61.getLuaUseThirdPartyPermissions() or v61.getFlagRestrictSales2());
        local v65, v66 = v24(v49, v52, v64, v61, v54);
        if not v65 then
            if not v61.isStudio() and v66 == v13.ThirdPartyDisabled then
                return v56:dispatch(v10());
            else
                return v56:dispatch(v9(v66));
            end;
        else
            local l_robux_0 = v51.robux;
            local l_hasFailed_0 = v51.hasFailed;
            local l_isPremium_0 = v50.isPremium;
            local v70 = v25(v49, l_isPremium_0);
            if v54 ~= nil then
                v70 = v54;
            end;
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if not l_hasFailed_0 and l_robux_0 < v70 then
                if v61.getFFlagDisableRobuxUpsell() then
                    return v56:dispatch(v9(v13.NotEnoughRobuxNoUpsell));
                else
                    local v72 = v26(l_l_UserInputService_0_Platform_0);
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v55 or v72 ~= v14.Web then
                        v56:dispatch(v3(v11.RobuxUpsellV2));
                    end;
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v55 then
                        v56:dispatch(v39({}));
                    end;
                    local _ = false;
                    if v36.isEnabled() then
                        local v74 = l_GetFStringLargerRobuxUpsellIxpLayer_0();
                        local v75 = v59.getLayerData(v74);
                        if v75 then
                            v59.logUserLayerExposure(v74);
                            if v36.isUserEnrolled(v75) then
                                v56:dispatch(v3(v11.LargeRobuxUpsell));
                            end;
                        end;
                    end;
                    local l_GameId_0 = game.GameId;
                    local l_ProductId_0 = v49.ProductId;
                    local l_DisplayName_0 = v49.DisplayName;
                    local v79 = l_FFlagEnableUpsellSuggestionsAnalyticsId_0 and v58.purchaseFlowUUID or nil;
                    return v17(v70, l_robux_0, v72, l_ProductId_0, l_DisplayName_0, l_GameId_0, v79):andThen(function(v80) --[[ Line: 207 ]]
                        -- upvalues: v45 (ref), v56 (copy)
                        return v45(v56, v80);
                    end, function() --[[ Line: 211 ]]
                        -- upvalues: v48 (ref), v56 (copy), v58 (copy)
                        return v48(v56, v58);
                    end);
                end;
            else
                if v58.requestType ~= v15.AvatarCreationFee then
                    v60.signalProductPurchaseShown(v49.productId, v58.requestType);
                end;
                return v56:dispatch(v4(v12.PromptPurchase));
            end;
        end;
    end);
end;