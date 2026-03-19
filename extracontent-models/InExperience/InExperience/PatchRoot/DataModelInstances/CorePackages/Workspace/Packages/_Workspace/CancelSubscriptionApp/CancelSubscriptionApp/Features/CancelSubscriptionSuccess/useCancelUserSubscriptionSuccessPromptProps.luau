local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Selectors.selectSubscriptionId);
local v7 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionEnded);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local _ = require(script.Parent.CancelUserSubscriptionSuccessPrompt);
return function() --[[ Line: 19 ]] --[[ Name: useCancelUserSubscriptionSuccessPromptProps ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v6 (copy), v2 (copy), l_MarketplaceService_0 (copy), v7 (copy)
    local v10 = l_useDispatch_0();
    local v11 = l_useSelector_0(v6) or "";
    return {
        onDismissed = v2.useCallback(function() --[[ Line: 23 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v11 (copy), v10 (copy), v7 (ref)
            l_MarketplaceService_0:SignalUserSubscriptionStatusChanged(v11);
            v10(v7());
        end, {
            v10
        })
    };
end;