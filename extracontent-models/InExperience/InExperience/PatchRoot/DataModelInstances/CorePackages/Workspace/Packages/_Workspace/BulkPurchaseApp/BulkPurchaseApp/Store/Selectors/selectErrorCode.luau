local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local _ = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v3) --[[ Line: 8 ]] --[[ Name: selectErrorCode ]]
    return v3.errorCode;
end;