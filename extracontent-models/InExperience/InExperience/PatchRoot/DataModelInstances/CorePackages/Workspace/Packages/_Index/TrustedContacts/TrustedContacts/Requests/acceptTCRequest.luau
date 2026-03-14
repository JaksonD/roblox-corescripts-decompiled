local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = require(l_script_FirstAncestor_0.Networking.myHttpRequest);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_Url_0 (copy), v3 (copy)
    local v5 = string.format("%s/users/%s/accept-trusted-friend-request", l_Url_0.FRIEND_URL, (tostring(v4)));
    return v3(v5, "POST", {
        postBody = {}
    });
end;