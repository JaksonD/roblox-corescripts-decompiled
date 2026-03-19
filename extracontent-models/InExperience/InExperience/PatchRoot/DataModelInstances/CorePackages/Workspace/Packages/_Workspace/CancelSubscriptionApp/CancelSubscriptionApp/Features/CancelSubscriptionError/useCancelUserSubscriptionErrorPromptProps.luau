local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionEnded);
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectErrorState);
local v8 = require(l_script_FirstAncestor_0.Enums.ErrorStateEnum);
local v9 = require(l_script_FirstAncestor_0.Store.Selectors.selectSubscriptionId);
local _ = require(script.Parent.CancelUserSubscriptionErrorPrompt);
return function() --[[ Line: 15 ]] --[[ Name: useCancelUserSubscriptionErrorPromptProps ]]
    -- upvalues: l_useSelector_0 (copy), v7 (copy), l_useDispatch_0 (copy), v9 (copy), v3 (copy), v8 (copy), l_MarketplaceService_0 (copy), v6 (copy)
    local v11 = l_useSelector_0(v7);
    local v12 = l_useDispatch_0();
    local v13 = l_useSelector_0(v9) or "";
    return {
        onDismiss = v3.useCallback(function() --[[ Line: 20 ]]
            -- upvalues: v11 (copy), v8 (ref), l_MarketplaceService_0 (ref), v13 (copy), v12 (copy), v6 (ref)
            if v11 == v8.Expiring then
                l_MarketplaceService_0:SignalUserSubscriptionStatusChanged(v13);
            end;
            v12(v6());
        end, {
            v11, 
            v12
        }), 
        errorState = v11
    };
end;