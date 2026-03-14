local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Rodux_0 = require(l_Parent_0.PurchasePromptDeps).Rodux;
local v4 = require(l_script_FirstAncestor_0.Actions.RequestAssetPurchase);
local v5 = require(l_script_FirstAncestor_0.Actions.RequestBundlePurchase);
local v6 = require(l_script_FirstAncestor_0.Actions.RequestGamepassPurchase);
local v7 = require(l_script_FirstAncestor_0.Actions.RequestProductPurchase);
local v8 = require(l_script_FirstAncestor_0.Actions.RequestPremiumPurchase);
local v9 = require(l_script_FirstAncestor_0.Actions.RequestSubscriptionPurchase);
local v10 = require(l_script_FirstAncestor_0.Actions.RequestAvatarCreationFeePurchase);
local v11 = require(l_script_FirstAncestor_0.Actions.RequestExperiencePurchase);
local v12 = require(l_script_FirstAncestor_0.Actions.RequestLookPurchase);
local v13 = require(l_script_FirstAncestor_0.Actions.RequestDeveloperSubscriptionPurchase);
local v14 = require(l_script_FirstAncestor_0.Actions.CompleteRequest);
local v15 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v16 = {
    requestType = v15.None
};
return (l_Rodux_0.createReducer(v16, {
    [v4.name] = function(_, v18) --[[ Line: 25 ]]
        -- upvalues: l_HttpService_0 (copy), v15 (copy)
        local l_idempotencyKey_0 = v18.idempotencyKey;
        if l_idempotencyKey_0 == nil or l_idempotencyKey_0 == "" then
            l_idempotencyKey_0 = l_HttpService_0:GenerateGUID(false);
        end;
        return {
            id = v18.id, 
            infoType = Enum.InfoType.Asset, 
            requestType = v15.Asset, 
            equipIfPurchased = v18.equipIfPurchased, 
            isRobloxPurchase = v18.isRobloxPurchase, 
            idempotencyKey = l_idempotencyKey_0, 
            purchaseAuthToken = v18.purchaseAuthToken or "", 
            collectibleItemId = v18.collectibleItemId or "", 
            collectibleItemInstanceId = v18.collectibleItemInstanceId or "", 
            collectibleProductId = v18.collectibleProductId or "", 
            expectedPrice = v18.expectedPrice or 0
        };
    end, 
    [v6.name] = function(_, v21) --[[ Line: 44 ]]
        -- upvalues: v15 (copy)
        return {
            id = v21.id, 
            infoType = Enum.InfoType.GamePass, 
            requestType = v15.GamePass, 
            isRobloxPurchase = false
        };
    end, 
    [v7.name] = function(_, v23) --[[ Line: 52 ]]
        -- upvalues: v15 (copy)
        return {
            id = v23.id, 
            infoType = Enum.InfoType.Product, 
            requestType = v15.Product, 
            isRobloxPurchase = false
        };
    end, 
    [v5.name] = function(_, v25) --[[ Line: 60 ]]
        -- upvalues: l_HttpService_0 (copy), v15 (copy)
        local l_idempotencyKey_1 = v25.idempotencyKey;
        if l_idempotencyKey_1 == nil or l_idempotencyKey_1 == "" then
            l_idempotencyKey_1 = l_HttpService_0:GenerateGUID(false);
        end;
        return {
            id = v25.id, 
            infoType = Enum.InfoType.Bundle, 
            requestType = v15.Bundle, 
            isRobloxPurchase = true, 
            idempotencyKey = l_idempotencyKey_1, 
            purchaseAuthToken = v25.purchaseAuthToken or "", 
            collectibleItemId = v25.collectibleItemId or "", 
            collectibleItemInstanceId = v25.collectibleItemInstanceId or "", 
            collectibleProductId = v25.collectibleProductId or "", 
            expectedPrice = v25.expectedPrice or 0
        };
    end, 
    [v8.name] = function(_, _) --[[ Line: 78 ]]
        -- upvalues: v15 (copy)
        return {
            requestType = v15.Premium
        };
    end, 
    [v9.name] = function(_, v30) --[[ Line: 83 ]]
        -- upvalues: v15 (copy)
        return {
            id = v30.id, 
            requestType = v15.Subscription
        };
    end, 
    [v10.name] = function(_, v32) --[[ Line: 89 ]]
        -- upvalues: v15 (copy)
        return {
            requestType = v15.AvatarCreationFee, 
            humanoidModel = v32.humanoidModel, 
            id = v32.guid
        };
    end, 
    [v11.name] = function(_, v34) --[[ Line: 96 ]]
        -- upvalues: v15 (copy)
        return {
            requestType = v15.Experience, 
            universeId = v34.universeId
        };
    end, 
    [v12.name] = function(_, v36) --[[ Line: 102 ]]
        -- upvalues: v15 (copy)
        return {
            requestType = v15.Look, 
            lookId = v36.lookId
        };
    end, 
    [v13.name] = function(_, v38) --[[ Line: 108 ]]
        -- upvalues: v15 (copy)
        return {
            requestType = v15.DeveloperSubscription, 
            subscriptionId = v38.subscriptionId, 
            expectedPrice = v38.expectedPrice
        };
    end, 
    [v14.name] = function(_, _) --[[ Line: 115 ]]
        -- upvalues: v16 (copy)
        return v16;
    end
}));