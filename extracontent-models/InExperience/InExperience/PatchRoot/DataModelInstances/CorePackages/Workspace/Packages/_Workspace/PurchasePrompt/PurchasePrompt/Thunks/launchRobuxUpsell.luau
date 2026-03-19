local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_script_FirstAncestor_0.Actions.ErrorOccurred);
local v4 = require(l_script_FirstAncestor_0.Actions.SetPromptState);
local v5 = require(l_script_FirstAncestor_0.Enums.UpsellFlow);
local v6 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v7 = require(l_script_FirstAncestor_0.Enums.PurchaseError);
local _ = require(l_script_FirstAncestor_0.Enums.PurchaseFlow);
local v9 = require(l_script_FirstAncestor_0.NativeUpsell.getUpsellFlow);
local v10 = require(l_script_FirstAncestor_0.Misc.Constants);
local v11 = require(l_script_FirstAncestor_0.Network.postPurchaseWarningAcknowledge);
local v12 = require(l_script_FirstAncestor_0.Services.Analytics);
local v13 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local v14 = require(l_script_FirstAncestor_0.Services.Network);
local v15 = require(l_script_FirstAncestor_0.Services.PlatformInterface);
local v16 = require(l_script_FirstAncestor_0.Thunk);
local v17 = require(l_script_FirstAncestor_0.Promise);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_GetFStringVNGWebshopUrl_0 = require(l_Parent_0.SharedFlags).GetFStringVNGWebshopUrl;
local v20 = require(script.Parent.retryAfterUpsell);
local v21 = require(l_Parent_0.IAPExperience);
local l_PreparePaymentCheck_0 = v21.PreparePaymentCheck;
local l_GetEnableConsolePreparePaymentCheck_0 = v21.GetEnableConsolePreparePaymentCheck;
local v24 = require(l_script_FirstAncestor_0.Utils.SelectedRobuxPackage);
local l_DesktopUpsellExperiment_0 = v21.Utility.DesktopUpsellExperiment;
local v26 = {
    v12, 
    v13, 
    v14, 
    v15
};
return function() --[[ Line: 41 ]] --[[ Name: launchRobuxUpsell ]]
    -- upvalues: v16 (copy), v26 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v9 (copy), v5 (copy), v24 (copy), l_GetEnableConsolePreparePaymentCheck_0 (copy), l_PreparePaymentCheck_0 (copy), v3 (copy), v7 (copy), v6 (copy), v11 (copy), l_getAppFeaturePolicies_0 (copy), v4 (copy), l_GetFStringVNGWebshopUrl_0 (copy), l_DesktopUpsellExperiment_0 (copy), l_Players_0 (copy), v17 (copy), v10 (copy), v20 (copy)
    return v16.new(script.Name, v26, function(v27, v28) --[[ Line: 42 ]]
        -- upvalues: v12 (ref), v13 (ref), v14 (ref), v15 (ref), v9 (ref), v5 (ref), v24 (ref), l_GetEnableConsolePreparePaymentCheck_0 (ref), l_PreparePaymentCheck_0 (ref), v3 (ref), v7 (ref), v6 (ref), v11 (ref), l_getAppFeaturePolicies_0 (ref), v4 (ref), l_GetFStringVNGWebshopUrl_0 (ref), l_DesktopUpsellExperiment_0 (ref), l_Players_0 (ref), v17 (ref), v10 (ref), v20 (ref)
        local v29 = v28[v12];
        local v30 = v28[v13];
        local v31 = v28[v14];
        local v32 = v28[v15];
        local v33 = v27:getState();
        local v34 = v9(v30.getPlatform());
        local v35 = false;
        if v34 ~= v5.Web then
            v35 = v24.getRobuxProductId(v33);
        end;
        local l_productId_0 = v33.productInfo.productId;
        if l_GetEnableConsolePreparePaymentCheck_0() and not l_PreparePaymentCheck_0(v35) then
            v27:dispatch(v3(v7.NotEnoughRobuxNoUpsell));
            return;
        else
            if v33.promptState == v6.U13PaymentModal then
                v29.signalScaryModalConfirmed(l_productId_0, "U13PaymentModal", v35);
            elseif v33.promptState == v6.U13MonthlyThreshold1Modal then
                v29.signalScaryModalConfirmed(l_productId_0, "U13MonthlyThreshold1Modal", v35);
            elseif v33.promptState == v6.U13MonthlyThreshold2Modal then
                v29.signalScaryModalConfirmed(l_productId_0, "U13MonthlyThreshold2Modal", v35);
            elseif v33.promptState == v6.ParentalConsentWarningPaymentModal13To17 then
                v29.signalScaryModalConfirmed(l_productId_0, "ConfirmedParentalConsentWarningPaymentModal13To17", v35);
            end;
            if v33.promptState == v6.U13PaymentModal then
                v11.Post(v31, v11.UserActionType.ConfirmedU13PaymentModal);
            elseif v33.promptState == v6.U13MonthlyThreshold1Modal then
                v11.Post(v31, v11.UserActionType.ConfirmedU13MonthlyThreshold1Modal);
            elseif v33.promptState == v6.U13MonthlyThreshold2Modal then
                v11.Post(v31, v11.UserActionType.ConfirmedU13MonthlyThreshold2Modal);
            elseif v33.promptState == v6.ParentalConsentWarningPaymentModal13To17 then
                v11.Post(v31, v11.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17);
            end;
            if v30.getFFlagDisableRobuxUpsell() then
                v27:dispatch(v3(v7.NotEnoughRobuxNoUpsell));
                return;
            elseif v34 == v5.Web then
                local l_requestType_0 = v33.requestType;
                v29.signalProductPurchaseUpsellConfirmed(l_productId_0, l_requestType_0, v24.getProductId(v33));
                if l_getAppFeaturePolicies_0().getRedirectBuyRobuxToVNG() then
                    if v33.promptState == v6.LeaveRobloxWarning then
                        v31:getVngShopUrl():andThen(function(v38) --[[ Line: 112 ]]
                            -- upvalues: v32 (copy), v27 (copy), v4 (ref), v6 (ref)
                            v32.openVngStore(v38.vngShopRedirectUrl);
                            v27:dispatch(v4(v6.UpsellInProgress));
                        end):catch(function() --[[ Line: 116 ]]
                            -- upvalues: v32 (copy), l_GetFStringVNGWebshopUrl_0 (ref), v27 (copy), v4 (ref), v6 (ref)
                            v32.openVngStore(l_GetFStringVNGWebshopUrl_0());
                            v27:dispatch(v4(v6.UpsellInProgress));
                        end);
                        return;
                    else
                        v27:dispatch(v4(v6.LeaveRobloxWarning));
                        return;
                    end;
                else
                    local v39 = {
                        analyticId = v33.purchaseFlowUUID
                    };
                    local v40 = l_DesktopUpsellExperiment_0.getVariant();
                    if v40 == l_DesktopUpsellExperiment_0.variants.OpenRobuxStore then
                        v32.openRobuxStoreWithContext(v39, v24.getProductId(v33));
                    elseif v40 == l_DesktopUpsellExperiment_0.variants.OpenPaymentsPage then
                        v32.openPaymentsPageWithContext(v39, v24.getProductId(v33));
                    else
                        v32.startRobuxUpsellWebByFlowWithContext(v39, v33.purchaseFlow, v24.getProductId(v33));
                    end;
                    v27:dispatch(v4(v6.UpsellInProgress));
                    return;
                end;
            elseif v34 == v5.Mobile then
                local v41 = v24.getRobuxProductId(v33);
                local l_productId_1 = v33.productInfo.productId;
                local l_requestType_1 = v33.requestType;
                local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                v29.signalProductPurchaseUpsellConfirmed(l_productId_1, l_requestType_1, v41);
                if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
                    v32.promptNativePurchaseWithLocalPlayer(v41);
                else
                    v32.promptNativePurchase(l_LocalPlayer_0, v41);
                end;
                v27:dispatch(v4(v6.UpsellInProgress));
                return;
            elseif v34 == v5.Xbox then
                local v45 = v24.getRobuxProductId(v33);
                local l_productId_2 = v33.productInfo.productId;
                local l_requestType_2 = v33.requestType;
                v29.signalProductPurchaseUpsellConfirmed(l_productId_2, l_requestType_2, v45);
                v27:dispatch(v4(v6.UpsellInProgress));
                return v17.new(function(v48, v49) --[[ Line: 162 ]]
                    -- upvalues: v32 (copy), v45 (copy)
                    local v50 = nil;
                    local v51 = nil;
                    local v52 = nil;
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 168 ]]
                        -- upvalues: v50 (ref), v32 (ref), v45 (ref)
                        v50 = v32.beginPlatformStorePurchase(v45);
                    end);
                    v51 = l_status_0;
                    v52 = l_result_0;
                    if v51 then
                        v48(v50);
                    else
                        v49(v52);
                    end;
                end):andThen(function(v55) --[[ Line: 177 ]]
                    -- upvalues: v10 (ref), v29 (copy), l_productId_2 (copy), l_requestType_2 (copy), v45 (copy), v27 (copy), v20 (ref), v3 (ref), v7 (ref)
                    if v55 == v10.PlatformPurchaseResult.PurchaseResult_Success then
                        v29.signalXboxInGamePurchaseSuccess(l_productId_2, l_requestType_2, v45);
                    elseif v55 == v10.PlatformPurchaseResult.PurchaseResult_UserCancelled then
                        v29.signalXboxInGamePurchaseCanceled(l_productId_2, l_requestType_2, v45);
                    else
                        v29.signalXboxInGamePurchaseFailure(l_productId_2, l_requestType_2, v45);
                    end;
                    if v55 == v10.PlatformPurchaseResult.PurchaseResult_Success or v55 == v10.PlatformPurchaseResult.PurchaseResult_RobuxUpdated then
                        return v27:dispatch(v20());
                    else
                        return v27:dispatch(v3(v7.UnknownFailure));
                    end;
                end);
            elseif v34 == v5.Unavailable then
                v27:dispatch(v3(v7.NotEnoughRobuxNoUpsell));
                return;
            else
                warn("Need more Robux: platform not supported for Robux purchase");
                return;
            end;
        end;
    end);
end;