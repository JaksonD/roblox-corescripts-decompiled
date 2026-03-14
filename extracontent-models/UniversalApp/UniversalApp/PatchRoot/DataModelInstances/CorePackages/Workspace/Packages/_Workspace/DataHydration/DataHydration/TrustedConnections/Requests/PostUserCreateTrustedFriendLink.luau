local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_TrustedConnections_0 = l_script_FirstAncestor_0.TrustedConnections;
local v4 = require(l_TrustedConnections_0.Networking.myHttpRequest);
return function(v5, _) --[[ Line: 9 ]]
    -- upvalues: l_Url_0 (copy), v4 (copy)
    local v7 = string.format("%s/users/%s/create-trusted-friend-link", l_Url_0.FRIEND_URL, (tostring(v5)));
    return v4(v7, "POST", {
        postBody = {}
    });
end;