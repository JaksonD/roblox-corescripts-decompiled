local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v4 = require(l_script_FirstAncestor_0.Enums.UsernameValidationContext);
return function(v5, v6, v7, v8) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    if not v8 then
        v8 = v4.Unknown;
    end;
    assert(type(v6) == "string", "invalid username");
    assert(type(v7) == "string", "invalid birthday");
    local v9 = l_UrlBuilder_0.fromString("auth:v2/usernames/validate");
    local v10 = l_HttpService_0:JSONEncode({
        username = v6, 
        birthday = v7, 
        context = v8
    });
    return v5(v9(), "POST", {
        postBody = v10
    });
end;