local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.Http);
return function(v2) --[[ Line: 5 ]] --[[ Name: getAccounts ]]
    -- upvalues: v1 (copy)
    return v2(("%s/users/authenticated/app-launch-info"):format(v1.Url.USERS_URL), "GET");
end;