local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v4 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.types);
local v6 = require(l_script_FirstAncestor_0.Network.createPaymentSession);
local v7 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local v8 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
initiateRobloxSubscriptionPurchaseInternal = function(v9) --[[ Line: 17 ]] --[[ Name: initiateRobloxSubscriptionPurchaseInternal ]]
    -- upvalues: v7 (copy), v8 (copy), v3 (copy), v4 (copy), v6 (copy), v2 (copy)
    v7(v8.RobloxSubscriptionUpsellModalInitiatedCounter);
    local v10 = v3.get();
    v10.setPromptState(v4.SubscriptionPurchaseRequested);
    local v11 = v6(v9);
    local v12 = v2.resolve(true);
    v2.all({
        v11, 
        v12
    }):andThen(function(v13) --[[ Line: 28 ]]
        -- upvalues: v10 (copy), v4 (ref)
        local v14 = v13[1];
        local v15 = v13[2];
        v10.setPaymentSessionId(v14);
        v10.setPromptState(v4.SubscriptionPurchaseUIReady);
        v10.setRobloxSubscriptionProduct({
            productId = "8429606799668938154"
        });
        print("fetchRobloxSubscriptionProducts success", v15);
    end, function(v16) --[[ Line: 37 ]]
        print("fetchRobloxSubscriptionProducts error", v16);
    end);
end;
return initiateRobloxSubscriptionPurchaseInternal;