local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v3, v4, v5, v6, v7) --[[ Line: 19 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    assert(type(v4) == "string", "invalid country code in set phone number");
    assert(type(v5) == "string", "invalid prefix in set phone number");
    assert(type(v6) == "string", "invalid phone number in set phone number");
    local v8 = true;
    if type(v7) ~= "string" then
        v8 = v7 == nil;
    end;
    assert(v8, "invalid password in set phone number");
    local v9 = l_UrlBuilder_0.fromString("accountinformation:phone");
    v8 = l_HttpService_0:JSONEncode({
        password = v7, 
        countryCode = v4, 
        prefix = v5, 
        phone = v6
    });
    return v3(v9(), "POST", {
        postBody = v8
    });
end;