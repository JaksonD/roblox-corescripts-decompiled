local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 19 ]] --[[ Name: GetCommutationEligibility ]]
    -- upvalues: l_Url_0 (copy)
    return v2(l_Url_0.APIS_URL .. "moderation-appeal-service/v2/consequence-commutation-eligibility", "GET");
end;