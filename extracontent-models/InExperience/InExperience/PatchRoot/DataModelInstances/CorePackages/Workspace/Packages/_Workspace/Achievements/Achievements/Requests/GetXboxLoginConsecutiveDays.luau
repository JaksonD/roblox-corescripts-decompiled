local l_Parent_0 = script:FindFirstAncestor("Achievements").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 18 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%sv1/xbox/get-login-consecutive-days", l_Url_0.AUTH_URL), "GET");
end;