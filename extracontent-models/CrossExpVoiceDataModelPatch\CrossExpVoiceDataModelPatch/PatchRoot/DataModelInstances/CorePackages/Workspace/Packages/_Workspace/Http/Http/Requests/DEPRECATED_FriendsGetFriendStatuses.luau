local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Http");
local v2 = require(l_script_FirstAncestor_0.Url);
return function(v3, v4) --[[ Line: 39 ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    local v5 = table.concat(v4, ",");
    local v6 = tostring(l_Players_0.LocalPlayer.UserId);
    return v3(string.format("%s/users/%s/friends/statuses?userIds=%s", v2.FRIEND_URL, v6, v5), "GET");
end;