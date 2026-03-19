local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
return function(v3, v4, v5) --[[ Line: 21 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "invalid email address in UpdateUserEmail");
    local v6 = true;
    if type(v5) ~= "string" then
        v6 = v5 == nil;
    end;
    assert(v6, "invalid password in UpdateUserEmail");
    return v3(l_UrlBuilder_0.static.email.getSetEmail(), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            password = v5, 
            emailAddress = v4
        })
    });
end;