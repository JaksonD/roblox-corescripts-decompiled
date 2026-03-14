local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v3 = require(l_script_FirstAncestor_0.Actions.SetPurchaseAnalyticsMetadata);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_Parent_0.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
return (l_Rodux_0.createReducer({}, {
    [v3.name] = function(_, v6) --[[ Line: 14 ]]
        -- upvalues: l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy)
        return {
            purchaseFlowUUID = v6.purchaseAnalyticsMetadata.purchaseFlowUUID, 
            surface = v6.purchaseAnalyticsMetadata.surface, 
            productId = v6.purchaseAnalyticsMetadata.productId, 
            productType = v6.purchaseAnalyticsMetadata.productType, 
            productTargetId = v6.purchaseAnalyticsMetadata.productTargetId, 
            saleLocationUniverseId = v6.purchaseAnalyticsMetadata.saleLocationUniverseId, 
            productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v6.purchaseAnalyticsMetadata.productUniverseId else nil, 
            price = v6.purchaseAnalyticsMetadata.price, 
            userRobuxBalance = v6.purchaseAnalyticsMetadata.userRobuxBalance, 
            eventMetadata = v6.purchaseAnalyticsMetadata.eventMetadata
        };
    end
}));