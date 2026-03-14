local l_Parent_0 = script:FindFirstAncestor("PromptAssignments").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2) --[[ Line: 17 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%saccount-security-service/v1/prompt-assignments?shouldReturnMetadata=true", l_Url_0.APIS_URL), "GET");
end;