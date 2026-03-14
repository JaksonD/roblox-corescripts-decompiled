local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetPurchaseCallbacks);
local l_FFlagAddFetchProductInfoAsACallback_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback;
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v6) --[[ Line: 11 ]]
        -- upvalues: l_FFlagAddFetchProductInfoAsACallback_0 (copy)
        return {
            onFlowComplete = v6.purchaseCallbacks.onFlowComplete, 
            onPurchaseSuccess = v6.purchaseCallbacks.onPurchaseSuccess, 
            onBuyItemButtonMounted = v6.purchaseCallbacks.onBuyItemButtonMounted, 
            onPurchaseAttempt = v6.purchaseCallbacks.onPurchaseAttempt, 
            fetchProductInfo = if l_FFlagAddFetchProductInfoAsACallback_0 then v6.purchaseCallbacks.fetchProductInfo else nil
        };
    end
}));