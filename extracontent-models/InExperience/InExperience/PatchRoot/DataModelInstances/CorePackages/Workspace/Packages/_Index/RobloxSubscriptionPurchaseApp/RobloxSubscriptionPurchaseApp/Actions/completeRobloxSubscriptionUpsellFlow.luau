local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v2 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v3 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local v5 = require(l_script_FirstAncestor_0.Actions.finalizeRobloxSubscriptionUpsellFlow);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnablePromptSignalRobloxSubscriptionPurchaseFinished");
return function() --[[ Line: 15 ]] --[[ Name: completeRobloxSubscriptionUpsellFlow ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), l_game_EngineFeature_0 (copy), l_MarketplaceService_0 (copy)
    local v7 = v2.get();
    local v8 = v7.getDidTryPurchasing();
    local v9 = v7.getRobloxSubscriptionProductId();
    local l_skipWaitingForPurchaseResult_0 = v7.getPurchaseFlowOptions().skipWaitingForPurchaseResult;
    if v7.getPromptState() == v3.Error then
        v5(false);
        return;
    else
        v7.setPromptState(v3.SubscriptionPurchaseCompleted);
        if l_game_EngineFeature_0 then
            l_MarketplaceService_0:signalPromptRobloxSubscriptionPurchaseFinished(v9, v8);
        end;
        if l_skipWaitingForPurchaseResult_0 or not v8 then
            v5(false);
            return;
        else
            v7.setPromptState(v3.SubscriptionStatusPolling);
            return;
        end;
    end;
end;