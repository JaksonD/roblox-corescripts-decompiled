local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%sv1/account-creation/metadata", l_Url_0.AUTH_URL), "GET", {
        maxRetryCount = 0
    });
end;