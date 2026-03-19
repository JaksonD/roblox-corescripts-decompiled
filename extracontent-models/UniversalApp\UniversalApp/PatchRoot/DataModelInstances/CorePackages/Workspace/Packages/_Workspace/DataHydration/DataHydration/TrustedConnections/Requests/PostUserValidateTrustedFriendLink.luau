local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_TrustedConnections_0 = l_script_FirstAncestor_0.TrustedConnections;
local v5 = require(l_TrustedConnections_0.Networking.myHttpRequest);
return function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: l_Url_0 (copy), v5 (copy), l_HttpService_0 (copy)
    local v8 = string.format("%s/users/%s/validate-trusted-friend-link", l_Url_0.FRIEND_URL, (tostring(v6)));
    return v5(v8, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            Tokens = v7
        })
    });
end;