local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Enums.CommercePurchasePromptStateEnum);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseEnded);
local v5 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseFailed);
local v6 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseStarted);
local v7 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseCheckout);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local function _() --[[ Line: 20 ]] --[[ Name: createInitialState ]]
    -- upvalues: v3 (copy)
    return {
        promptState = v3.None
    };
end;
return (v2.createReducer({
    promptState = v3.None
}, {
    [v4.name] = function(_, _) --[[ Line: 27 ]]
        -- upvalues: v3 (copy)
        return {
            promptState = v3.None
        };
    end, 
    [v5.name] = function(v12, v13) --[[ Line: 30 ]]
        -- upvalues: v3 (copy)
        local v14 = table.clone(v12);
        v14.errorCode = v13.errorCode;
        v14.promptState = v3.Error;
        return v14;
    end, 
    [v6.name] = function(v15, v16) --[[ Line: 36 ]]
        -- upvalues: v3 (copy)
        local v17 = table.clone(v15);
        v17.promptState = v3.Started;
        v17.commerceProductId = v16.commerceProductId;
        return v17;
    end, 
    [v7.name] = function(v18, v19) --[[ Line: 42 ]]
        -- upvalues: v3 (copy)
        local v20 = table.clone(v18);
        v20.promptState = v3.Checkout;
        v20.checkoutSessionId = v19.checkoutSessionId;
        return v20;
    end
}));