local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v2) --[[ Line: 7 ]] --[[ Name: selectErrorMetadata ]]
    return v2.errorMetadata;
end;