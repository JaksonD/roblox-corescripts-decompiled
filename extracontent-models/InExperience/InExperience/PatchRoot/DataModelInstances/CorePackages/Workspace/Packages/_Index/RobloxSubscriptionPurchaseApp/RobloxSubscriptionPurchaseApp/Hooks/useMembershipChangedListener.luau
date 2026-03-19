local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v5 = require(l_script_FirstAncestor_0.Actions.finalizeRobloxSubscriptionUpsellFlow);
local v6 = require(l_script_FirstAncestor_0.Enums.PromptState);
return function() --[[ Line: 17 ]] --[[ Name: useMembershipChangedListener ]]
    -- upvalues: v4 (copy), v3 (copy), l_Players_0 (copy), v6 (copy), v5 (copy)
    local v7 = v4.get();
    v3.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: l_Players_0 (ref), v7 (copy), v6 (ref), v5 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 then
            return nil;
        else
            local v10 = l_Players_0.PlayerMembershipChanged:Connect(function(v9) --[[ Line: 26 ]]
                -- upvalues: l_LocalPlayer_0 (copy), v7 (ref), v6 (ref), v5 (ref)
                if v9 ~= l_LocalPlayer_0 then
                    return;
                else
                    if v7.getPromptState() == v6.SubscriptionStatusPolling then
                        v5(true);
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 38 ]]
                -- upvalues: v10 (copy)
                if v10 then
                    v10:Disconnect();
                end;
            end;
        end;
    end, {});
end;