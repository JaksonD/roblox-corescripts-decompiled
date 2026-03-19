local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_TrustedConnections_0 = l_script_FirstAncestor_0.TrustedConnections;
local v5 = require(l_TrustedConnections_0.Networking.myHttpRequest);
local l_getLocalPlayerUserId_0 = require(l_script_FirstAncestor_0.DataHydrationUtils).getLocalPlayerUserId;
return function(v7) --[[ Line: 11 ]]
    -- upvalues: l_getLocalPlayerUserId_0 (copy), l_HttpService_0 (copy), l_Url_0 (copy), v5 (copy)
    local v8 = l_getLocalPlayerUserId_0();
    local v9 = l_HttpService_0:UrlEncode(table.concat(v7, ","));
    local v10 = string.format("%s/user/%s/multiget-are-trusted-friends?userids=%s", l_Url_0.FRIEND_URL, tostring(v8), v9);
    return v5(v10, "GET"):andThen(function(v11) --[[ Line: 22 ]]
        return v11 and v11.responseBody and v11.responseBody.trustedFriendsId;
    end);
end;