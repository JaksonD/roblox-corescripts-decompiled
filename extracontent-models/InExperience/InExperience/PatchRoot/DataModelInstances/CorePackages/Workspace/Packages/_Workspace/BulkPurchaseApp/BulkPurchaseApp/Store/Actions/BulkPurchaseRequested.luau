local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Store.Types);
return v2.makeActionCreator("BulkPurchaseRequested", function(v4, v5, v6, v7, v8) --[[ Line: 22 ]]
    return {
        itemData = v4, 
        balance = v6, 
        totalCost = v7, 
        orderRequest = v5, 
        options = v8
    };
end);