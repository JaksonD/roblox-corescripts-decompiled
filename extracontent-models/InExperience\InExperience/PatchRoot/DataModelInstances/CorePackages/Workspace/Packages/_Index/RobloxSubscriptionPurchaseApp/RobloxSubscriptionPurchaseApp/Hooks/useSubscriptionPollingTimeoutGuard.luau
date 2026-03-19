local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v5 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v6 = require(l_script_FirstAncestor_0.Actions.finalizeRobloxSubscriptionUpsellFlow);
local v7 = game:DefineFastInt("RobloxSubscriptionPurchasePollingTimeoutSeconds", 4);
return function() --[[ Line: 17 ]] --[[ Name: useSubscriptionPollingTimeoutGuard ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v5 (copy), v7 (copy), v6 (copy)
    local v8 = v4.get();
    local v9 = v3.useSignalState(v8.getPromptState);
    v2.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v9 (copy), v5 (ref), v7 (ref), v8 (copy), v6 (ref)
        if v9 ~= v5.SubscriptionStatusPolling then
            return;
        else
            local v10 = false;
            task.delay(v7, function() --[[ Line: 29 ]]
                -- upvalues: v10 (ref), v8 (ref), v5 (ref), v6 (ref)
                if v10 then
                    return;
                else
                    if v8.getPromptState() == v5.SubscriptionStatusPolling then
                        v6(false);
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 39 ]]
                -- upvalues: v10 (ref)
                v10 = true;
            end;
        end;
    end, {
        v9
    });
end;