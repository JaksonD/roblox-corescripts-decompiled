local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_script_FirstAncestor_0.Common.LoginV2RequestTypes);
getInitializeLoginUrl = function() --[[ Line: 9 ]] --[[ Name: getInitializeLoginUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/identity/initialize-login", l_Url_0.AUTH_URL);
end;
return function(v5, v6) --[[ Line: 13 ]]
    -- upvalues: l_HttpService_0 (copy)
    local v7 = l_HttpService_0:JSONEncode(v6);
    return v5(getInitializeLoginUrl(), "POST", {
        postBody = v7
    });
end;