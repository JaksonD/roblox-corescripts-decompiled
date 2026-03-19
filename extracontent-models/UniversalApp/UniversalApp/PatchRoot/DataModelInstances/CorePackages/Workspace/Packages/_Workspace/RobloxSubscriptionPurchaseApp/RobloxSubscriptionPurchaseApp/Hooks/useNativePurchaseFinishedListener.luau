local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v5 = require(l_script_FirstAncestor_0.Actions.completeRobloxSubscriptionUpsellFlow);
local v6 = require(l_script_FirstAncestor_0.Enums.PromptState);
return function() --[[ Line: 13 ]] --[[ Name: useNativePurchaseFinishedListener ]]
    -- upvalues: v4 (copy), v2 (copy), l_MarketplaceService_0 (copy), v6 (copy), v5 (copy)
    local v7 = v4.get();
    local v8 = v7.getPromptState();
    v2.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v8 (copy), v6 (ref), v7 (copy), v5 (ref)
        local v11 = l_MarketplaceService_0.NativePurchaseFinishedWithLocalPlayer:Connect(function(_, v10) --[[ Line: 19 ]]
            -- upvalues: v8 (ref), v6 (ref), v7 (ref), v5 (ref)
            if v8 == v6.SubscriptionPurchaseInProgress then
                if v10 then
                    v7.setDidTryPurchasing(true);
                    v5();
                    return;
                else
                    v7.setPromptState(v6.SubscriptionPurchaseUIReady);
                end;
            end;
        end);
        return function() --[[ Line: 33 ]]
            -- upvalues: v11 (copy)
            if v11 then
                v11:Disconnect();
            end;
        end;
    end, {});
end;