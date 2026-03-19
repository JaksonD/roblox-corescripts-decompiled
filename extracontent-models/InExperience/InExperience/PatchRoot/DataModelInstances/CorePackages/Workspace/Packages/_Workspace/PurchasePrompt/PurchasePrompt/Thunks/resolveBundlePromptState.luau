local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v5 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v6 = require(l_script_FirstAncestor_0.Actions.BundleProductInfoReceived);
local v7 = require(l_script_FirstAncestor_0.Actions.AccountInfoReceived);
local v8 = require(l_script_FirstAncestor_0.Actions.BalanceInfoRecieved);
local v9 = require(l_script_FirstAncestor_0.Actions.PromptNativeUpsellSuggestions);
local v10 = require(l_script_FirstAncestor_0.Actions.SetPurchaseFlow);
local v11 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v12 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local v13 = require(l_script_FirstAncestor_0.Enums.UpsellFlow);
local v14 = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local _ = require(l_script_FirstAncestor_0.Models.RobuxUpsell);
local v16 = require(l_script_FirstAncestor_0.NativeUpsell.getUpsellFlow);
local v17 = require(l_script_FirstAncestor_0.Network.getRobuxUpsellSuggestions);
local v18 = require(l_script_FirstAncestor_0.Services.Analytics);
local v19 = require(l_script_FirstAncestor_0.Services.Network);
local v20 = require(l_script_FirstAncestor_0.Utils.getPaymentPlatform);
local _ = require(l_script_FirstAncestor_0.Utils.getPaymentFromPlatformLegacy);
local _ = require(l_script_FirstAncestor_0.Utils.getHasAmazonUserAgent);
local v23 = require(l_script_FirstAncestor_0.Flags.GetFFlagRespectBalanceInfoForBundleUpsellInStudio);
local v24 = require(l_script_FirstAncestor_0.Thunk);
local v25 = require(l_script_FirstAncestor_0.Utils.getPurchaseSurface);
local _ = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableLuobuInGameUpsell);
local v27 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableInsufficientRobuxForBundleUpsellFix);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v29 = require(l_script_FirstAncestor_0.Actions.SetIsUserEligibleForUnifiedPurchaseFlow);
local v30 = require(l_script_FirstAncestor_0.Actions.SetPurchaseAnalyticsMetadata);
local v31 = require(l_script_FirstAncestor_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local v32 = require(l_script_FirstAncestor_0.Utils.getProductTypeFromRequestType);
local v33 = require(l_script_FirstAncestor_0.Actions.SetPostPurchaseActions);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local _ = require(l_script_FirstAncestor_0.Parent.RobloxSubscriptionPurchaseApp);
local v36 = require(l_script_FirstAncestor_0.Actions.SetRobloxSubscriptionProducts);
local l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal;
local function _(v38, v39) --[[ Line: 58 ]] --[[ Name: getBundlePriceFromProductInfo ]]
    if v38 and v38.product ~= nil then
        if v39 and v38.product.premiumPricing ~= nil then
            return v38.product.premiumPricing.premiumPriceInRobux or 0;
        else
            return v38.product.priceInRobux or 0;
        end;
    else
        return 0;
    end;
end;
local function v49(v41, v42, v43, v44) --[[ Line: 71 ]] --[[ Name: meetsBundlePrerequisitesV2 ]]
    -- upvalues: v12 (copy)
    local l_owned_0 = v41.owned;
    local l_collectibleItemDetail_0 = v42.collectibleItemDetail;
    local v47 = l_collectibleItemDetail_0 and l_collectibleItemDetail_0.collectibleItemId ~= nil and l_collectibleItemDetail_0.collectibleItemId ~= "";
    local v48 = l_collectibleItemDetail_0 and l_collectibleItemDetail_0.collectibleItemType == "Limited";
    if v47 then
        if not v48 and l_owned_0 then
            return false, v12.AlreadyOwn;
        end;
    elseif l_owned_0 then
        return false, v12.AlreadyOwn;
    end;
    if not v41.isPurchasable then
        return false, v12.NotForSale;
    elseif v44 ~= nil and v43.robux ~= nil and v43.robux < v44 then
        return false, v12.NotEnoughRobux;
    else
        return true, nil;
    end;
end;
local function v60(v50, v51, v52, v53) --[[ Line: 108 ]] --[[ Name: meetsBundlePrerequisites ]]
    -- upvalues: v12 (copy), l_Players_0 (copy)
    local l_collectibleItemDetail_1 = v50.collectibleItemDetail;
    local v55 = l_collectibleItemDetail_1 and l_collectibleItemDetail_1.collectibleItemId ~= nil and l_collectibleItemDetail_1.collectibleItemId ~= "";
    local v56 = l_collectibleItemDetail_1 and l_collectibleItemDetail_1.collectibleItemType ~= nil and l_collectibleItemDetail_1.collectibleItemType == "Limited";
    if v55 then
        if not v56 and v53 then
            return false, v12.AlreadyOwn;
        end;
    elseif v53 then
        return false, v12.AlreadyOwn;
    end;
    local _ = nil;
    if not if v55 then l_collectibleItemDetail_1.saleStatus == "OnSale" else v50.product and v50.product.isForSale then
        return false, v12.NotForSale;
    elseif v52 ~= nil and v51.robux ~= nil and v51.robux < v52 then
        return false, v12.NotEnoughRobux;
    else
        if v50.itemRestrictions ~= nil then
            for _, v59 in v50.itemRestrictions do
                if v59 == "ThirteenPlus" then
                    if l_Players_0.LocalPlayer:GetUnder13() then
                        return false, v12.Under13;
                    else
                        break;
                    end;
                end;
            end;
        end;
        return true, nil;
    end;
end;
local v61 = {
    v18, 
    v19
};
return function(v62, v63, v64, v65, v66, v67, v68, v69) --[[ Line: 169 ]] --[[ Name: resolveBundlePromptState ]]
    -- upvalues: v24 (copy), v61 (copy), v18 (copy), v19 (copy), v6 (copy), v7 (copy), v8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v29 (copy), v30 (copy), v25 (copy), v32 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (copy), v36 (copy), v31 (copy), v49 (copy), v60 (copy), l_UserInputService_0 (copy), v16 (copy), v12 (copy), l_RunService_0 (copy), v23 (copy), v27 (copy), v13 (copy), v4 (copy), v11 (copy), v10 (copy), v14 (copy), v33 (copy), v20 (copy), v17 (copy), v9 (copy), v5 (copy)
    return v24.new(script.Name, v61, function(v70, v71) --[[ Line: 179 ]]
        -- upvalues: v18 (ref), v19 (ref), v6 (ref), v63 (copy), v7 (ref), v64 (copy), v8 (ref), v65 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v68 (copy), v29 (ref), v30 (ref), v25 (ref), v32 (ref), v66 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 (ref), v69 (copy), v36 (ref), v31 (ref), v49 (ref), v62 (copy), v60 (ref), v67 (copy), l_UserInputService_0 (ref), v16 (ref), v12 (ref), l_RunService_0 (ref), v23 (ref), v27 (ref), v13 (ref), v4 (ref), v11 (ref), v10 (ref), v14 (ref), v33 (ref), v20 (ref), v17 (ref), v9 (ref), v5 (ref)
        local _ = v70:getState();
        local _ = v71[v18];
        local _ = v71[v19];
        v70:dispatch(v6(v63));
        v70:dispatch(v7(v64));
        v70:dispatch(v8(v65));
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
            if v68 then
                v70:dispatch(v29(true));
                local v75 = v70:getState();
                v70:dispatch(v30({
                    purchaseFlowUUID = v75.purchaseFlowUUID, 
                    surface = v25(v75.purchaseAnalyticsMetadata), 
                    productType = v32(v75.promptRequest.requestType), 
                    productId = v75.productInfo.productId, 
                    productTargetId = v75.productInfo.productTargetId, 
                    saleLocationUniverseId = game.GameId or 0, 
                    price = if v75.productInfo.price then v75.productInfo.price else v66, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v75.purchaseAnalyticsMetadata.productUniverseId else nil, 
                    userRobuxBalance = v75.accountInfo.balance
                }));
                if l_FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal_0 and v69 then
                    v70:dispatch(v36(v69));
                end;
            else
                v70:dispatch(v29(false));
            end;
        end;
        if v66 == nil then
            local l_isPremium_0 = v64.isPremium;
            local l_v63_0 = v63;
            v66 = if l_v63_0 and l_v63_0.product ~= nil then if l_isPremium_0 and l_v63_0.product.premiumPricing ~= nil then l_v63_0.product.premiumPricing.premiumPriceInRobux or 0 else l_v63_0.product.priceInRobux or 0 else 0;
        end;
        local v78 = nil;
        local v79 = nil;
        if v31() then
            local v80, v81 = v49(v62, v63, v65, v66);
            v78 = v80;
            v79 = v81;
        else
            local v82, v83 = v60(v63, v65, v66, v67);
            v78 = v82;
            v79 = v83;
        end;
        local l_v66_0 = v66;
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v86 = v16(l_l_UserInputService_0_Platform_0);
        local v87 = v79 == v12.NotEnoughRobux;
        if l_RunService_0:IsStudio() and v23() and v87 then
            v87 = v65.robux < l_v66_0;
            if not v78 then
                v78 = not v87;
            end;
        end;
        if not v78 then
            if v87 then
                if not v27() and v86 == v13.Web then
                    return v70:dispatch(v4(v11.RobuxUpsell));
                else
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v68 then
                        v70:dispatch(v10(v14.RobuxUpsellV2));
                    end;
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v68 then
                        v70:dispatch(v33({}));
                    end;
                    local _ = l_v66_0 - v65.robux;
                    local _ = v64.isPremium;
                    local v90 = v20(l_l_UserInputService_0_Platform_0);
                    local l_robux_0 = v65.robux;
                    return v17(l_v66_0, l_robux_0, v90):andThen(function(v92) --[[ Line: 272 ]]
                        -- upvalues: v70 (copy), v9 (ref)
                        v70:dispatch(v9(v92.products, 1, v92.virtualItemBadgeType));
                    end, function() --[[ Line: 282 ]]
                        -- upvalues: v70 (copy), v5 (ref), v12 (ref)
                        v70:dispatch(v5(v12.NotEnoughRobuxXbox));
                    end);
                end;
            else
                return v70:dispatch(v5(v79));
            end;
        else
            return v70:dispatch(v4(v11.PromptPurchase));
        end;
    end);
end;