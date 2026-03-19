local l_Parent_0 = script:FindFirstAncestor("Achievements").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 18 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%svoting-api/user/get-vote-count?targetType=Place", l_Url_0.APIS_URL), "GET");
end;