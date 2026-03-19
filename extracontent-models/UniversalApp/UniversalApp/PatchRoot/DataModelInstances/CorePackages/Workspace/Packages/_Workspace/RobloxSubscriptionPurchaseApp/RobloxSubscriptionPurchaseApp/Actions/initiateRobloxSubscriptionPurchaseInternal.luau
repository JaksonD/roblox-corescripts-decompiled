local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v4 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.types);
local _ = require(l_script_FirstAncestor_0.Models.GetRobloxSubscriptionProductsModel);
local v7 = require(l_script_FirstAncestor_0.Network.createPaymentSession);
local v8 = require(l_script_FirstAncestor_0.Network.getRobloxSubscriptionProducts);
local v9 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local v10 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
initiateRobloxSubscriptionPurchaseInternal = function(v11) --[[ Line: 19 ]] --[[ Name: initiateRobloxSubscriptionPurchaseInternal ]]
    -- upvalues: v9 (copy), v10 (copy), v3 (copy), v4 (copy), v7 (copy), v8 (copy), v2 (copy)
    v9(v10.RobloxSubscriptionUpsellModalInitiatedCounter);
    local v12 = v3.get();
    v12.setPromptState(v4.SubscriptionPurchaseRequested);
    local v13 = v7(v11);
    local v14 = v8();
    v2.all({
        v13, 
        v14
    }):andThen(function(v15) --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v4 (ref)
        local v16 = v15[1];
        local v17 = v15[2];
        v12.setPaymentSessionId(v16);
        if #v17 > 0 then
            local v18 = v17[1];
            v12.setRobloxSubscriptionProduct(v18);
        else
            error("No Roblox subscription products found");
        end;
        v12.setPromptState(v4.SubscriptionPurchaseUIReady);
    end, function(_) --[[ Line: 45 ]]

    end);
end;
return initiateRobloxSubscriptionPurchaseInternal;