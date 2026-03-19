local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 12 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%s/users/authenticated/app-launch-info", l_Url_0.USERS_URL), "GET", {
        maxRetryCount = 0
    });
end;