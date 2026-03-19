local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v2 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v4 = require(l_script_FirstAncestor_0.Enums.RobloxSubscriptionFlowCompleteReason);
local v5 = require(l_script_FirstAncestor_0.Actions.cleanupSubscriptionFlow);
local v6 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v7 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished");
local function _(v9, v10) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v7 (copy), v6 (copy)
    if v9 then
        if v10 then
            return v4.NativePurchaseCompleted;
        else
            return v4.PurchaseWebviewOpened;
        end;
    else
        v7(v6.RobloxSubscriptionUpsellDismissedCounter);
        return v4.UpsellDismissed;
    end;
end;
local function _(v12) --[[ Line: 34 ]] --[[ Name: emitCompletionTelemetryEvent ]]
    -- upvalues: v4 (copy), v7 (copy), v6 (copy)
    if v12 == v4.UpsellDismissed then
        v7(v6.RobloxSubscriptionUpsellDismissedCounter);
    elseif v12 == v4.NativePurchaseCompleted then
        v7(v6.RobloxSubscriptionUpsellNativePurchaseCompletedCounter);
    end;
    v7(v6.RobloxSubscriptionUpsellFlowCompletedCounter);
end;
return function() --[[ Line: 47 ]] --[[ Name: completeRobloxSubscriptionUpsellFlow ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v7 (copy), v6 (copy), l_game_EngineFeature_0 (copy), l_MarketplaceService_0 (copy), v5 (copy)
    local v14 = v2.get();
    v14.setPromptState(v3.SubscriptionPurchaseCompleted);
    local v15 = v14.getDidTryPurchasing();
    local v16 = v14.getIsNativePurchase();
    local l_productId_0 = v14.getRobloxSubscriptionProduct().productId;
    local v18;
    if v15 then
        v18 = if v16 then v4.NativePurchaseCompleted else v4.PurchaseWebviewOpened;
    else
        v7(v6.RobloxSubscriptionUpsellDismissedCounter);
        v18 = v4.UpsellDismissed;
    end;
    if v18 == v4.UpsellDismissed then
        v7(v6.RobloxSubscriptionUpsellDismissedCounter);
    elseif v18 == v4.NativePurchaseCompleted then
        v7(v6.RobloxSubscriptionUpsellNativePurchaseCompletedCounter);
    end;
    v7(v6.RobloxSubscriptionUpsellFlowCompletedCounter);
    if l_game_EngineFeature_0 then
        l_MarketplaceService_0:signalPromptRobloxSubscriptionPurchaseFinished(l_productId_0, v15);
    end;
    v14.triggerOnFlowComplete(v18);
    v5();
end;