local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v4 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseEnded);
local v5 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseSucceeded);
local v6 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseFailed);
local v7 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseStarted);
local v8 = require(l_script_FirstAncestor_0.Store.Actions.BulkPurchaseRequested);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local function _() --[[ Line: 21 ]] --[[ Name: createInitialState ]]
    -- upvalues: v3 (copy)
    return {
        promptState = v3.None
    };
end;
return (v2.createReducer({
    promptState = v3.None
}, {
    [v4.name] = function(_, _) --[[ Line: 28 ]]
        -- upvalues: v3 (copy)
        return {
            promptState = v3.None
        };
    end, 
    [v5.name] = function(v13, v14) --[[ Line: 31 ]]
        local v15 = table.clone(v13);
        v15.itemStatuses = v14.itemStatuses;
        v15.promptState = v14.promptState;
        return v15;
    end, 
    [v6.name] = function(v16, v17) --[[ Line: 37 ]]
        -- upvalues: v3 (copy)
        local v18 = table.clone(v16);
        v18.errorCode = v17.errorCode;
        v18.promptState = v3.Error;
        v18.errorMetadata = v17.errorMetadata;
        return v18;
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 44 ]]
        local v21 = table.clone(v19);
        v21.itemData = v20.itemData;
        v21.options = v20.options;
        v21.orderRequest = v20.orderRequest;
        v21.balance = v20.balance;
        v21.totalCost = v20.totalCost;
        return v21;
    end, 
    [v7.name] = function(v22, v23) --[[ Line: 53 ]]
        -- upvalues: v3 (copy)
        local v24 = table.clone(v22);
        v24.promptState = v3.Request;
        v24.balance = v23.balance;
        return v24;
    end
}));