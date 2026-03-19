local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.BulkPurchasePartialSuccess);
local v3 = require(script.Parent.useBulkPurchasePartialSuccessProps);
return function() --[[ Line: 8 ]] --[[ Name: BulkPurchasePartialSuccessContainer ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v4 = v3();
    return v1.createElement(v2, v4);
end;