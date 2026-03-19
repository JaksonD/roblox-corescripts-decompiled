local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v3, v4) --[[ Line: 10 ]]
    -- upvalues: l_HttpService_0 (copy), l_Url_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 11 ]]
        -- upvalues: l_HttpService_0 (ref), v4 (copy)
        return l_HttpService_0:JSONEncode(v4);
    end);
    if not l_status_0 then
        warn("Failed to encode v1 report body");
    end;
    return v3(l_Url_0.APIS_URL .. "abuse-reporting/v1/abuse-report", "POST", {
        postBody = l_result_0
    });
end;