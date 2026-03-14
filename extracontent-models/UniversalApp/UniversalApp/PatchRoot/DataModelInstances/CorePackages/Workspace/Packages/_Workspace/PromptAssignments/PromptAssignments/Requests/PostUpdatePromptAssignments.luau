local l_script_FirstAncestor_0 = script:FindFirstAncestor("PromptAssignments");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v4, v5, v6) --[[ Line: 14 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy)
    return v4(string.format("%saccount-security-service/v1/prompt-assignments", l_Url_0.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            promptType = v5, 
            action = v6
        })
    });
end;