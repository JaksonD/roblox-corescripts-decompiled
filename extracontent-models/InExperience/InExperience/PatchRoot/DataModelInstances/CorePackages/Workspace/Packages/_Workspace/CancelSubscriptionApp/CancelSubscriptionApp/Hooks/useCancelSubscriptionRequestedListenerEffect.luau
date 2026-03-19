local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_script_FirstAncestor_0.Store.Thunks.InitiateCancelUserSubscriptionFlow);
local l_useNetwork_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useNetwork;
local v7 = require(l_script_FirstAncestor_0.Enums.CancelUserSubscriptionAsyncPromptStateEnum);
return function(v8) --[[ Line: 11 ]] --[[ Name: useCancelSubscriptionRequestedListenerEffect ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNetwork_0 (copy), v3 (copy), l_MarketplaceService_0 (copy), v7 (copy), v5 (copy)
    local v9 = l_useDispatch_0();
    local v10 = l_useNetwork_0();
    v3.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v9 (copy), v10 (copy), l_MarketplaceService_0 (ref), v8 (copy), v7 (ref), v5 (ref)
        local v11 = nil;
        if v9 and v10 then
            v11 = l_MarketplaceService_0.PromptCancelSubscriptionRequested:Connect(function(v12) --[[ Line: 18 ]]
                -- upvalues: v8 (ref), v7 (ref), v9 (ref), v5 (ref), v10 (ref)
                if v8 == v7.None then
                    v9(v5(v10, v12));
                end;
            end);
        end;
        return function() --[[ Line: 25 ]]
            -- upvalues: v11 (ref)
            if v11 then
                v11:Disconnect();
                v11 = nil;
            end;
        end;
    end, {
        v9, 
        v10, 
        v8
    });
end;