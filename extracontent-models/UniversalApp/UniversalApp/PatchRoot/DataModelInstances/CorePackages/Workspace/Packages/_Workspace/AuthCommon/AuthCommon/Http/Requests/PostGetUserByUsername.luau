local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
local v4 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.USERS_URL, 
    path = "usernames/users"
});
return function(v5, v6, v7) --[[ Line: 40 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy)
    return v5(v4(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            usernames = {
                v6
            }, 
            excludeBannedUsers = v7 or false
        })
    });
end;