local l_script_FirstAncestor_0 = script:FindFirstAncestor("GroupsNetworking");
local v1 = require(l_script_FirstAncestor_0.GROUPS_URL);
return function(v2) --[[ Line: 15 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.DELETE({
        Name = "CancelJoinGroupRequest"
    }, function(v3, v4) --[[ Line: 18 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("v1"):path("groups"):id(v4.groupId):path("join-requests"):path("users"):id(v4.userId);
    end);
end;