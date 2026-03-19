local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_TrustedConnections_0 = l_script_FirstAncestor_0.TrustedConnections;
local v5 = require(l_TrustedConnections_0.Networking.myHttpRequest);
return function(v6, v7) --[[ Line: 10 ]]
    -- upvalues: l_Url_0 (copy), v2 (copy), v5 (copy)
    local v8 = string.format("%s/users/%s/send-trusted-friend-request", l_Url_0.FRIEND_URL, (tostring(v6)));
    if v2.FFlagProfilePlatformTrustedConnectionsMVP and v7 ~= nil then
        v8 = v8 .. ("?source=%*"):format(v7);
    end;
    return v5(v8, "POST", {
        postBody = {}
    });
end;