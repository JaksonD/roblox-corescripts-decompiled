local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v4, v5) --[[ Line: 33 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy)
    return v4(l_UrlBuilder_0.new({
        base = l_Url_0.USERS_URL, 
        path = ("users/%*"):format(v5)
    })(), "GET");
end;