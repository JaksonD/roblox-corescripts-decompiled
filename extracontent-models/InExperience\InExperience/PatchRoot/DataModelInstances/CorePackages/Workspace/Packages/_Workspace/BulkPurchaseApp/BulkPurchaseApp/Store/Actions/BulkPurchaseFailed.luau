local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
return v2.makeActionCreator("BulkPurchaseFailed", function(v4, v5) --[[ Line: 15 ]]
    return {
        errorCode = v4, 
        errorMetadata = v5
    };
end);