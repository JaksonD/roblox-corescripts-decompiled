local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ACCOUNT_SETTINGS_URL);
return function(v2) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.GET({
        Name = "GetBlockedUsers"
    }, function(v3, v4) --[[ Line: 15 ]]
        -- upvalues: v1 (ref)
        return v3(v1, {
            currentUserId = v4 and v4.currentUserId or nil
        }):path("v1"):path("users"):path("get-detailed-blocked-users");
    end);
end;