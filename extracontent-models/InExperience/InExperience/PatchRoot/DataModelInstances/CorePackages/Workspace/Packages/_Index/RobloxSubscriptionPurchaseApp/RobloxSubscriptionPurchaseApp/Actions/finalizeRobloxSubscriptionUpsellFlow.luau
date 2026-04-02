local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v3 = require(l_script_FirstAncestor_0.Enums.RobloxSubscriptionFlowCompleteReason);
local v4 = require(l_script_FirstAncestor_0.Actions.cleanupSubscriptionFlow);
local v5 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local v6 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local function _(v7, v8, v9, v10) --[[ Line: 26 ]]
    -- upvalues: v3 (copy)
    if not v7 then
        return v3.UpsellDismissed;
    elseif v8 then
        return v3.UpsellPurchaseSucceeded;
    elseif v9 and not v10 then
        return v3.UpsellPurchaseFailed;
    else
        return v3.UpsellPurchaseAttempted;
    end;
end;
local function v13(v12) --[[ Line: 58 ]] --[[ Name: emitCompletionTelemetryEvent ]]
    -- upvalues: v3 (copy), v5 (copy), v6 (copy)
    if v12 == v3.UpsellDismissed then
        v5(v6.RobloxSubscriptionUpsellDismissedCounter);
    elseif v12 == v3.UpsellPurchaseSucceeded then
        v5(v6.RobloxSubscriptionUpsellPurchaseSucceededCounter);
    elseif v12 == v3.UpsellPurchaseFailed then
        v5(v6.RobloxSubscriptionUpsellNativePurchasePollingTimeoutCounter);
    elseif v12 == v3.UpsellPurchaseAttempted then
        v5(v6.RobloxSubscriptionPurchaseAttemptedCounter);
    end;
    v5(v6.RobloxSubscriptionUpsellFlowCompletedCounter);
end;
return function(v14) --[[ Line: 82 ]] --[[ Name: finalizeRobloxSubscriptionUpsellFlow ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v13 (copy), v4 (copy)
    local v15 = v1.get();
    local v16 = v15.getDidTryPurchasing();
    local v17 = v15.getIsNativePurchase();
    local v18 = v15.getPurchaseFlowOptions().skipWaitingForPurchaseResult or false;
    local v19 = if not v16 then v3.UpsellDismissed else if v14 then v3.UpsellPurchaseSucceeded else if not v17 or v18 then v3.UpsellPurchaseAttempted else v3.UpsellPurchaseFailed;
    v15.setPromptState(v2.SubscriptionPurchaseCompleted);
    v13(v19);
    v15.triggerOnFlowComplete(v19);
    v4();
end;