local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_UrlBuilder_0 (copy)
    return v2(l_UrlBuilder_0.fromString("apis:auth-token-service/v1/login/create")(), "POST", {
        postBody = ""
    });
end;