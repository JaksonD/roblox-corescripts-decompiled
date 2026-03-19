local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 16 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%sv2/metadata", l_Url_0.AUTH_URL), "GET");
end;