local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_Parent_0.Actions.CompleteRequest);
local v5 = require(l_Parent_0.Enums.PromptState);
local v6 = require(l_Parent_0.Enums.RequestType);
local v7 = require(l_Parent_0.Enums.PurchaseError);
local v8 = require(l_Parent_0.Utils.SelectedRobuxPackage);
local v9 = require(l_Parent_0.Enums.Counter);
local v10 = require(l_Parent_0.Thunks.sendCounter);
local v11 = require(l_Parent_0.Services.Analytics);
local v12 = require(l_Parent_0.Services.PublicBindables);
local v13 = require(l_Parent_0.Thunk);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v15 = {
    v11, 
    v12
};
return function() --[[ Line: 29 ]] --[[ Name: completeRequest ]]
    -- upvalues: v13 (copy), v15 (copy), v11 (copy), v8 (copy), v5 (copy), v10 (copy), v9 (copy), v6 (copy), l_Players_0 (copy), l_MarketplaceService_0 (copy), v7 (copy), v12 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v4 (copy)
    return v13.new(script.Name, v15, function(v16, v17) --[[ Line: 30 ]]
        -- upvalues: v11 (ref), v8 (ref), v5 (ref), v10 (ref), v9 (ref), v6 (ref), l_Players_0 (ref), l_MarketplaceService_0 (ref), v7 (ref), v12 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v4 (ref)
        local v18 = v17[v11];
        local v19 = v16:getState();
        local l_requestType_0 = v19.promptRequest.requestType;
        local l_purchaseError_0 = v19.purchaseError;
        local l_id_0 = v19.promptRequest.id;
        local l_hasCompletedPurchase_0 = v19.hasCompletedPurchase;
        local v24 = v8.getRobuxProductId(v19);
        local v25 = v19.productInfo and v19.productInfo.productId;
        if v19.promptState == v5.U13PaymentModal then
            v18.signalScaryModalCanceled(v25, "U13PaymentModal", v24);
        elseif v19.promptState == v5.U13MonthlyThreshold1Modal then
            v18.signalScaryModalCanceled(v25, "U13MonthlyThreshold1Modal", v24);
        elseif v19.promptState == v5.U13MonthlyThreshold2Modal then
            v18.signalScaryModalCanceled(v25, "U13MonthlyThreshold2Modal", v24);
        elseif v19.promptState == v5.ParentalConsentWarningPaymentModal13To17 then
            v18.signalScaryModalCanceled(v25, "ParentalConsentWarningPaymentModal13To17", v24);
        end;
        if v19.promptState == v5.PurchaseComplete then
            v16:dispatch(v10(v9.Success));
        elseif v19.promptState == v5.Error then
            v16:dispatch(v10(v9.Failed));
        else
            v16:dispatch(v10(v9.Cancelled));
        end;
        if l_requestType_0 == v6.Product then
            local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
            l_MarketplaceService_0:SignalPromptProductPurchaseFinished(l_UserId_0, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v6.GamePass then
            l_MarketplaceService_0:SignalPromptGamePassPurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v6.Bundle then
            l_MarketplaceService_0:SignalPromptBundlePurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
        elseif l_requestType_0 == v6.Asset then
            l_MarketplaceService_0:SignalPromptPurchaseFinished(l_Players_0.LocalPlayer, l_id_0, l_hasCompletedPurchase_0);
            local l_assetTypeId_0 = v19.productInfo.assetTypeId;
            if l_hasCompletedPurchase_0 and l_assetTypeId_0 then
                pcall(function() --[[ Line: 73 ]]
                    -- upvalues: l_MarketplaceService_0 (ref), l_Players_0 (ref), l_assetTypeId_0 (copy)
                    l_MarketplaceService_0:SignalAssetTypePurchased(l_Players_0.LocalPlayer, l_assetTypeId_0);
                end);
            end;
        elseif l_requestType_0 == v6.Premium then
            l_MarketplaceService_0:SignalPromptPremiumPurchaseFinished(l_hasCompletedPurchase_0 or l_purchaseError_0 == v7.AlreadyPremium);
        elseif l_requestType_0 == v6.Subscription then
            l_MarketplaceService_0:SignalPromptSubscriptionPurchaseFinished(l_id_0, l_hasCompletedPurchase_0 or l_purchaseError_0 == v7.AlreadySubscribed);
        end;
        local v28 = v17[v12].getWindowStateChangedBindable();
        if v28 then
            v28:Fire({
                isShown = false, 
                hasCompletedPurchase = l_hasCompletedPurchase_0
            });
        end;
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v19.purchaseCallbacks.onFlowComplete then
            v19.purchaseCallbacks.onFlowComplete();
        end;
        return v16:dispatch(v4());
    end);
end;