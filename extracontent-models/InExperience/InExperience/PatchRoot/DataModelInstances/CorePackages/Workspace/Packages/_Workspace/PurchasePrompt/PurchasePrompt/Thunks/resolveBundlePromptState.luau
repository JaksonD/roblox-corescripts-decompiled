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
local function _(v35, v36) --[[ Line: 51 ]] --[[ Name: getBundlePriceFromProductInfo ]]
    if v35 and v35.product ~= nil then
        if v36 and v35.product.premiumPricing ~= nil then
            return v35.product.premiumPricing.premiumPriceInRobux or 0;
        else
            return v35.product.priceInRobux or 0;
        end;
    else
        return 0;
    end;
end;
local function v46(v38, v39, v40, v41) --[[ Line: 64 ]] --[[ Name: meetsBundlePrerequisitesV2 ]]
    -- upvalues: v12 (copy)
    local l_owned_0 = v38.owned;
    local l_collectibleItemDetail_0 = v39.collectibleItemDetail;
    local v44 = l_collectibleItemDetail_0 and l_collectibleItemDetail_0.collectibleItemId ~= nil and l_collectibleItemDetail_0.collectibleItemId ~= "";
    local v45 = l_collectibleItemDetail_0 and l_collectibleItemDetail_0.collectibleItemType == "Limited";
    if v44 then
        if not v45 and l_owned_0 then
            return false, v12.AlreadyOwn;
        end;
    elseif l_owned_0 then
        return false, v12.AlreadyOwn;
    end;
    if not v38.isPurchasable then
        return false, v12.NotForSale;
    elseif v41 ~= nil and v40.robux ~= nil and v40.robux < v41 then
        return false, v12.NotEnoughRobux;
    else
        return true, nil;
    end;
end;
local function v57(v47, v48, v49, v50) --[[ Line: 101 ]] --[[ Name: meetsBundlePrerequisites ]]
    -- upvalues: v12 (copy), l_Players_0 (copy)
    local l_collectibleItemDetail_1 = v47.collectibleItemDetail;
    local v52 = l_collectibleItemDetail_1 and l_collectibleItemDetail_1.collectibleItemId ~= nil and l_collectibleItemDetail_1.collectibleItemId ~= "";
    local v53 = l_collectibleItemDetail_1 and l_collectibleItemDetail_1.collectibleItemType ~= nil and l_collectibleItemDetail_1.collectibleItemType == "Limited";
    if v52 then
        if not v53 and v50 then
            return false, v12.AlreadyOwn;
        end;
    elseif v50 then
        return false, v12.AlreadyOwn;
    end;
    local _ = nil;
    if not if v52 then l_collectibleItemDetail_1.saleStatus == "OnSale" else v47.product and v47.product.isForSale then
        return false, v12.NotForSale;
    elseif v49 ~= nil and v48.robux ~= nil and v48.robux < v49 then
        return false, v12.NotEnoughRobux;
    else
        if v47.itemRestrictions ~= nil then
            for _, v56 in v47.itemRestrictions do
                if v56 == "ThirteenPlus" then
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
local v58 = {
    v18, 
    v19
};
return function(v59, v60, v61, v62, v63, v64, v65) --[[ Line: 162 ]] --[[ Name: resolveBundlePromptState ]]
    -- upvalues: v24 (copy), v58 (copy), v18 (copy), v19 (copy), v6 (copy), v7 (copy), v8 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v29 (copy), v30 (copy), v25 (copy), v32 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v31 (copy), v46 (copy), v57 (copy), l_UserInputService_0 (copy), v16 (copy), v12 (copy), l_RunService_0 (copy), v23 (copy), v27 (copy), v13 (copy), v4 (copy), v11 (copy), v10 (copy), v14 (copy), v33 (copy), v20 (copy), v17 (copy), v9 (copy), v5 (copy)
    return v24.new(script.Name, v58, function(v66, v67) --[[ Line: 171 ]]
        -- upvalues: v18 (ref), v19 (ref), v6 (ref), v60 (copy), v7 (ref), v61 (copy), v8 (ref), v62 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v65 (copy), v29 (ref), v30 (ref), v25 (ref), v32 (ref), v63 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v31 (ref), v46 (ref), v59 (copy), v57 (ref), v64 (copy), l_UserInputService_0 (ref), v16 (ref), v12 (ref), l_RunService_0 (ref), v23 (ref), v27 (ref), v13 (ref), v4 (ref), v11 (ref), v10 (ref), v14 (ref), v33 (ref), v20 (ref), v17 (ref), v9 (ref), v5 (ref)
        local _ = v66:getState();
        local _ = v67[v18];
        local _ = v67[v19];
        v66:dispatch(v6(v60));
        v66:dispatch(v7(v61));
        v66:dispatch(v8(v62));
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 then
            if v65 then
                v66:dispatch(v29(true));
                local v71 = v66:getState();
                v66:dispatch(v30({
                    purchaseFlowUUID = v71.purchaseFlowUUID, 
                    surface = v25(v71.purchaseAnalyticsMetadata), 
                    productType = v32(v71.promptRequest.requestType), 
                    productId = v71.productInfo.productId, 
                    productTargetId = v71.productInfo.productTargetId, 
                    saleLocationUniverseId = game.GameId or 0, 
                    price = if v71.productInfo.price then v71.productInfo.price else v63, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v71.purchaseAnalyticsMetadata.productUniverseId else nil, 
                    userRobuxBalance = v71.accountInfo.balance
                }));
            else
                v66:dispatch(v29(false));
            end;
        end;
        if v63 == nil then
            local l_isPremium_0 = v61.isPremium;
            local l_v60_0 = v60;
            v63 = if l_v60_0 and l_v60_0.product ~= nil then if l_isPremium_0 and l_v60_0.product.premiumPricing ~= nil then l_v60_0.product.premiumPricing.premiumPriceInRobux or 0 else l_v60_0.product.priceInRobux or 0 else 0;
        end;
        local v74 = nil;
        local v75 = nil;
        if v31() then
            local v76, v77 = v46(v59, v60, v62, v63);
            v74 = v76;
            v75 = v77;
        else
            local v78, v79 = v57(v60, v62, v63, v64);
            v74 = v78;
            v75 = v79;
        end;
        local l_v63_0 = v63;
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v82 = v16(l_l_UserInputService_0_Platform_0);
        local v83 = v75 == v12.NotEnoughRobux;
        if l_RunService_0:IsStudio() and v23() and v83 then
            v83 = v62.robux < l_v63_0;
            if not v74 then
                v74 = not v83;
            end;
        end;
        if not v74 then
            if v83 then
                if not v27() and v82 == v13.Web then
                    return v66:dispatch(v4(v11.RobuxUpsell));
                else
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v65 then
                        v66:dispatch(v10(v14.RobuxUpsellV2));
                    end;
                    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v65 then
                        v66:dispatch(v33({}));
                    end;
                    local _ = l_v63_0 - v62.robux;
                    local _ = v61.isPremium;
                    local v86 = v20(l_l_UserInputService_0_Platform_0);
                    local l_robux_0 = v62.robux;
                    return v17(l_v63_0, l_robux_0, v86):andThen(function(v88) --[[ Line: 261 ]]
                        -- upvalues: v66 (copy), v9 (ref)
                        v66:dispatch(v9(v88.products, 1, v88.virtualItemBadgeType));
                    end, function() --[[ Line: 271 ]]
                        -- upvalues: v66 (copy), v5 (ref), v12 (ref)
                        v66:dispatch(v5(v12.NotEnoughRobuxXbox));
                    end);
                end;
            else
                return v66:dispatch(v5(v75));
            end;
        else
            return v66:dispatch(v4(v11.PromptPurchase));
        end;
    end);
end;