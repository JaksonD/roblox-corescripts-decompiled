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
local v11 = require(l_script_FirstAncestor_0.Actions.transitionToError);
local v12 = require(l_script_FirstAncestor_0.Enums.ErrorReason);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
initiateRobloxSubscriptionPurchaseInternal = function(v14) --[[ Line: 26 ]] --[[ Name: initiateRobloxSubscriptionPurchaseInternal ]]
    -- upvalues: v9 (copy), v10 (copy), l_getAppFeaturePolicies_0 (copy), v11 (copy), v12 (copy), v3 (copy), v4 (copy), v7 (copy), v8 (copy), v2 (copy)
    v9(v10.RobloxSubscriptionUpsellModalInitiatedCounter);
    if l_getAppFeaturePolicies_0().getDisableBlackbirdEntrypoints() then
        v11(v12.UnsupportedPlatform, "initiateRobloxSubscriptionPurchaseInternal");
        return;
    else
        local v15 = v3.get();
        v15.setPromptState(v4.SubscriptionPurchaseRequested);
        local v16 = v7(v14);
        local v17 = v8();
        v2.all({
            v16, 
            v17
        }):andThen(function(v18) --[[ Line: 44 ]]
            -- upvalues: v15 (copy), v11 (ref), v12 (ref), v4 (ref)
            local v19 = v18[1];
            local v20 = v18[2];
            v15.setPaymentSessionId(v19);
            if #v20 > 0 then
                local v21 = v20[1];
                v15.setRobloxSubscriptionProduct(v21);
                v15.setPromptState(v4.SubscriptionPurchaseUIReady);
                return;
            else
                v11(v12.AlreadySubscribed, "initiateRobloxSubscriptionPurchaseInternal");
                return;
            end;
        end, function(_) --[[ Line: 62 ]]
            -- upvalues: v11 (ref), v12 (ref)
            v11(v12.GenericError, "initiateRobloxSubscriptionPurchaseInternal");
        end);
        return;
    end;
end;
return initiateRobloxSubscriptionPurchaseInternal;