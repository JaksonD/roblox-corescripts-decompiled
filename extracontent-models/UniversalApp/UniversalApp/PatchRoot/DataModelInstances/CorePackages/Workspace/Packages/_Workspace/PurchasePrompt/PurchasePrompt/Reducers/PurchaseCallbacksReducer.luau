local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetPurchaseCallbacks);
local l_FFlagAddFetchProductInfoAsACallback_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback;
local l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal;
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v7) --[[ Line: 13 ]]
        -- upvalues: l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 (copy), l_FFlagAddFetchProductInfoAsACallback_0 (copy)
        return {
            onFlowComplete = v7.purchaseCallbacks.onFlowComplete, 
            onPurchaseSuccess = v7.purchaseCallbacks.onPurchaseSuccess, 
            onBuyItemButtonMounted = v7.purchaseCallbacks.onBuyItemButtonMounted, 
            onPurchaseAttempt = v7.purchaseCallbacks.onPurchaseAttempt, 
            onRobloxSubscriptionUpsellSuccess = if l_FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal_0 then v7.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil, 
            fetchProductInfo = if l_FFlagAddFetchProductInfoAsACallback_0 then v7.purchaseCallbacks.fetchProductInfo else nil
        };
    end
}));