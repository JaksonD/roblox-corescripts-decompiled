local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
getContinueRecoveryUrl = function() --[[ Line: 10 ]] --[[ Name: getContinueRecoveryUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%saccount-recovery-service/v1/continue-recovery", l_Url_0.APIS_URL);
end;
return function(v6, v7) --[[ Line: 14 ]]
    -- upvalues: l_HttpService_0 (copy)
    local v8 = l_HttpService_0:JSONEncode(v7);
    return v6(getContinueRecoveryUrl(), "POST", {
        postBody = v8
    });
end;