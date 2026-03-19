local l_Parent_0 = script:FindFirstAncestor("AccountRecovery").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
getCurrentTwoStepMethodUrl = function(v3) --[[ Line: 7 ]] --[[ Name: getCurrentTwoStepMethodUrl ]]
    -- upvalues: l_Url_0 (copy)
    return string.format("%saccount-recovery-service/v1/get-current-two-step-method?recoverySessionId=%s", l_Url_0.APIS_URL, v3);
end;
return function(v4, v5) --[[ Line: 15 ]]
    return v4(getCurrentTwoStepMethodUrl(v5), "GET");
end;