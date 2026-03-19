local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v5 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v6 = require(l_script_FirstAncestor_0.Actions.completeRobloxSubscriptionUpsellFlow);
return function() --[[ Line: 13 ]] --[[ Name: useNativePurchaseFinishedListener ]]
    -- upvalues: v4 (copy), v3 (copy), l_MarketplaceService_0 (copy), v5 (copy), v6 (copy)
    local v7 = v4.get();
    v3.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v7 (copy), v5 (ref), v6 (ref)
        local v10 = l_MarketplaceService_0.NativePurchaseFinishedWithLocalPlayer:Connect(function(_, v9) --[[ Line: 18 ]]
            -- upvalues: v7 (ref), v5 (ref), v6 (ref)
            if v7.getPromptState() == v5.SubscriptionPurchaseInProgress then
                if v9 then
                    v7.setDidTryPurchasing(true);
                    v6();
                    return;
                else
                    v7.setPromptState(v5.SubscriptionPurchaseUIReady);
                end;
            end;
        end);
        return function() --[[ Line: 32 ]]
            -- upvalues: v10 (copy)
            if v10 then
                v10:Disconnect();
            end;
        end;
    end, {});
end;