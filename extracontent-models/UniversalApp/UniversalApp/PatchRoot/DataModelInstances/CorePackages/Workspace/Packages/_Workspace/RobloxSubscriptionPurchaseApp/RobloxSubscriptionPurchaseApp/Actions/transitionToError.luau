local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local v1 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v2 = require(l_script_FirstAncestor_0.Enums.PromptState);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorReason);
local v4 = require(l_script_FirstAncestor_0.Utils.logRobloxSubscriptionUpsellCounter);
local v5 = require(l_script_FirstAncestor_0.Events.RobloxSubscriptionUpsellTelemetry);
local v6 = require(l_script_FirstAncestor_0.Utils.RobloxSubscriptionLogger);
transitionToError = function(v7, v8) --[[ Line: 14 ]] --[[ Name: transitionToError ]]
    -- upvalues: v1 (copy), v2 (copy), v6 (copy), v4 (copy), v5 (copy)
    local v9 = v1.get();
    v9.setErrorReason(v7);
    v9.setPromptState(v2.Error);
    v6.debug({
        message = "Transitioning to error state", 
        errorReason = tostring(v7), 
        originalContext = v8 or "Unknown"
    });
    v4(v5.RobloxSubscriptionPurchaseErrorShownCounter);
end;
return transitionToError;