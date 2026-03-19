local l_Parent_0 = script.Parent.Parent;
local l_Workspace_0 = game:GetService("Workspace");
local _ = require(l_Parent_0.types);
local v3 = require(l_Parent_0.Actions.SetPromptState);
local v4 = require(l_Parent_0.Actions.PurchaseCompleteRecieved);
local v5 = require(l_Parent_0.Enums.PromptState);
local v6 = require(l_Parent_0.Thunk);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v8 = require(l_Parent_0.Utils.logUnifiedPurchaseTelemetryCounter);
local v9 = require(l_Parent_0.Events.UnifiedPurchaseTelemetry);
local v10 = require(l_Parent_0.Utils.sendUnifiedPurchaseEventLog);
local v11 = require(l_Parent_0.Enums.UnifiedPurchaseEventNameEnum);
return function(v12) --[[ Line: 28 ]] --[[ Name: completePurchase ]]
    -- upvalues: v6 (copy), l_Workspace_0 (copy), v4 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v3 (copy), v5 (copy)
    return v6.new(script.Name, {}, function(v13, _) --[[ Line: 29 ]]
        -- upvalues: l_Workspace_0 (ref), v4 (ref), l_FFlagEnableUnifiedProductPurchaseFlow_0 (ref), v12 (copy), v8 (ref), v9 (ref), v10 (ref), v11 (ref), v3 (ref), v5 (ref)
        local l_purchasingStartTime_0 = v13:getState().purchasingStartTime;
        local v16 = l_Workspace_0.DistributedGameTime - l_purchasingStartTime_0;
        v13:dispatch(v4());
        if l_FFlagEnableUnifiedProductPurchaseFlow_0 and v13:getState().isUserEligibleForUnifiedPurchaseFlow then
            local v17 = v13:getState();
            local l_postPurchaseActions_0 = v17.postPurchaseActions;
            local v19 = v17.postPurchaseActionsState or {};
            if l_postPurchaseActions_0 then
                for _, v21 in ipairs(l_postPurchaseActions_0) do
                    if v21 and v21.actionKey and v21.isActionSelected ~= nil then
                        v19[v21.actionKey] = v21.isActionSelected;
                    end;
                end;
            end;
            if v17.purchaseCallbacks and v17.purchaseCallbacks.onPurchaseSuccess then
                v17.purchaseCallbacks.onPurchaseSuccess(v12, v19);
            end;
            if v17.purchaseAnalyticsMetadata then
                local l_purchaseAnalyticsMetadata_0 = v17.purchaseAnalyticsMetadata;
                v8(v9.UnifiedProductPurchaseModalPurchaseSuccessCounter, l_purchaseAnalyticsMetadata_0.surface, l_purchaseAnalyticsMetadata_0.productType);
                v10({
                    event_name = v11.ItemPurchaseSuccess, 
                    purchase_flow_uuid = l_purchaseAnalyticsMetadata_0.purchaseFlowUUID, 
                    product_id = l_purchaseAnalyticsMetadata_0.productId, 
                    product_type = l_purchaseAnalyticsMetadata_0.productType, 
                    product_target_id = l_purchaseAnalyticsMetadata_0.productTargetId, 
                    robux_price = l_purchaseAnalyticsMetadata_0.price, 
                    surface = l_purchaseAnalyticsMetadata_0.surface, 
                    user_roblox_balance = l_purchaseAnalyticsMetadata_0.userRobuxBalance, 
                    salelocation_universeid = l_purchaseAnalyticsMetadata_0.saleLocationUniverseId
                });
            end;
        end;
        if v16 >= 1 then
            return v13:dispatch(v3(v5.PurchaseComplete));
        else
            delay(1 - v16, function() --[[ Line: 77 ]]
                -- upvalues: v13 (copy), v3 (ref), v5 (ref)
                return v13:dispatch(v3(v5.PurchaseComplete));
            end);
            return;
        end;
    end);
end;