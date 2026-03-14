local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionEnded);
local v7 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionSucceeded);
local v8 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionFailed);
local v9 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionRequested);
local v10 = require(l_script_FirstAncestor_0.Enums.ErrorStateEnum);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local v12 = require(l_script_FirstAncestor_0.Store.Selectors.selectExpirationDate);
local v13 = require(l_script_FirstAncestor_0.Store.Selectors.selectSubscriptionId);
local _ = require(script.Parent.CancelUserSubscriptionRequestPrompt);
return function() --[[ Line: 23 ]] --[[ Name: useCancelUserSubscriptionRequestPromptProps ]]
    -- upvalues: l_useSelector_0 (copy), v12 (copy), v13 (copy), l_useDispatch_0 (copy), v3 (copy), v6 (copy), v9 (copy), l_MarketplaceService_0 (copy), v7 (copy), v8 (copy), v10 (copy)
    local v15 = l_useSelector_0(v12) or "";
    local v16 = l_useSelector_0(v13) or "";
    local v17 = l_useDispatch_0();
    local v18 = v3.useCallback(function() --[[ Line: 28 ]]
        -- upvalues: v17 (copy), v6 (ref)
        v17(v6());
    end, {
        v17
    });
    local v21 = v3.useCallback(function() --[[ Line: 32 ]]
        -- upvalues: v17 (copy), v9 (ref), l_MarketplaceService_0 (ref), v16 (copy), v7 (ref), v8 (ref), v10 (ref)
        v17(v9());
        local l_status_0, _ = pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v16 (ref)
            return l_MarketplaceService_0:PerformCancelSubscription(v16);
        end);
        if l_status_0 then
            v17(v7(v16));
            return;
        else
            v17(v8(v10.ErrorCancelling, v16));
            return;
        end;
    end, {
        v17
    });
    return {
        onCancel = v18, 
        onConfirm = v21, 
        expirationDate = v15, 
        subscriptionId = v16
    };
end;