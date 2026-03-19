local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v2 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.APIS_URL, 
    path = "phone-number-api/v1/phone-prefix-list"
});
return function(v3) --[[ Line: 23 ]]
    -- upvalues: v2 (copy)
    return v3(v2(), "GET");
end;