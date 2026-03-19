local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancelSubscriptionApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Enums.CancelUserSubscriptionAsyncPromptStateEnum);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionEnded);
local v5 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionSucceeded);
local v6 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionFailed);
local v7 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionStarted);
local v8 = require(l_script_FirstAncestor_0.Store.Actions.CancelSubscriptionRequested);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local function _() --[[ Line: 22 ]] --[[ Name: createInitialState ]]
    -- upvalues: v3 (copy)
    return {
        promptState = v3.None
    };
end;
return (v2.createReducer({
    promptState = v3.None
}, {
    [v4.name] = function(_, _) --[[ Line: 29 ]]
        -- upvalues: v3 (copy)
        return {
            promptState = v3.None
        };
    end, 
    [v5.name] = function(v13, v14) --[[ Line: 35 ]]
        -- upvalues: v3 (copy)
        local v15 = table.clone(v13);
        v15.subscriptionId = v14.subscriptionId;
        v15.promptState = v3.Success;
        return v15;
    end, 
    [v6.name] = function(v16, v17) --[[ Line: 44 ]]
        -- upvalues: v3 (copy)
        local v18 = table.clone(v16);
        v18.errorState = v17.errorState;
        v18.subscriptionId = v17.subscriptionId;
        v18.promptState = v3.Error;
        return v18;
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 54 ]]
        -- upvalues: v3 (copy)
        local v21 = table.clone(v19);
        v21.subscriptionId = v20.subscriptionId;
        v21.promptState = v3.Pending;
        return v21;
    end, 
    [v7.name] = function(v22, v23) --[[ Line: 63 ]]
        -- upvalues: v3 (copy)
        local v24 = table.clone(v22);
        v24.promptState = v3.Request;
        v24.subscriptionId = v23.subscriptionId;
        v24.expirationDate = v23.expirationDate;
        return v24;
    end
}));