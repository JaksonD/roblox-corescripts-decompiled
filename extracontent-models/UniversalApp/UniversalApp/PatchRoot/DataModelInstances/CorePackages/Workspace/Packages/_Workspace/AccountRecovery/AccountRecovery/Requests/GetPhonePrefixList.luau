local l_Parent_0 = script:FindFirstAncestor("AccountRecovery").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
getRequestRecoveryUrl = function() --[[ Line: 7 ]] --[[ Name: getRequestRecoveryUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%sphone-number-api/v1/phone-prefix-list", l_Url_0.APIS_URL);
end;
return function(v3) --[[ Line: 11 ]]
    return v3(getRequestRecoveryUrl(), "GET");
end;