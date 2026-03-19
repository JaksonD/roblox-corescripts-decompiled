local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 7 ]] --[[ Name: ReactivateAccount ]]
    -- upvalues: l_Url_0 (copy)
    return v2(l_Url_0.APIS_URL .. "account-deletion-api/v1/reactivate", "POST");
end;