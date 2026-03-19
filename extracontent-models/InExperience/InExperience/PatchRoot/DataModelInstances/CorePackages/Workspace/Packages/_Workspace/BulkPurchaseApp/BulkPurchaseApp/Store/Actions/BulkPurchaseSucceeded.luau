local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
return v2.makeActionCreator("BulkPurchaseSucceeded", function(v4, v5) --[[ Line: 15 ]]
    return {
        promptState = v4, 
        itemStatuses = v5
    };
end);