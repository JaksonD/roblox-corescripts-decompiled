local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v5 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v6 = require(l_script_FirstAncestor_0.Actions.finalizeRobloxSubscriptionUpsellFlow);
local v7 = require(l_script_FirstAncestor_0.Actions.transitionToError);
local v8 = require(l_script_FirstAncestor_0.Enums.ErrorReason);
local v9 = game:DefineFastInt("RobloxSubscriptionPurchasePollingTimeoutSeconds", 4);
return function() --[[ Line: 20 ]] --[[ Name: useSubscriptionPollingTimeoutGuard ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v5 (copy), v9 (copy), v7 (copy), v8 (copy), v6 (copy)
    local v10 = v4.get();
    local v11 = v3.useSignalState(v10.getPromptState);
    local v12 = v3.useSignalState(v10.getIsNativePurchase);
    v2.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v11 (copy), v5 (ref), v9 (ref), v10 (copy), v12 (copy), v7 (ref), v8 (ref), v6 (ref)
        if v11 ~= v5.SubscriptionStatusPolling then
            return;
        else
            local v13 = false;
            task.delay(v9, function() --[[ Line: 32 ]]
                -- upvalues: v13 (ref), v10 (ref), v5 (ref), v12 (ref), v7 (ref), v8 (ref), v6 (ref)
                if v13 then
                    return;
                else
                    if v10.getPromptState() == v5.SubscriptionStatusPolling then
                        if v12 then
                            v7(v8.GenericError, "useSubscriptionPollingTimeoutGuard");
                            return;
                        else
                            v6(false);
                        end;
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 49 ]]
                -- upvalues: v13 (ref)
                v13 = true;
            end;
        end;
    end, {
        v11, 
        v12
    });
end;