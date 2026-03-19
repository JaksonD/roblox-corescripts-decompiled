local l_Parent_0 = script:FindFirstAncestor("LoginV2").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
getStartAuthenticationUrl = function() --[[ Line: 6 ]] --[[ Name: getStartAuthenticationUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sv1/passkey/StartAuthentication", l_Url_0.AUTH_URL);
end;
return function(v2) --[[ Line: 10 ]]
    return v2(getStartAuthenticationUrl(), "POST");
end;