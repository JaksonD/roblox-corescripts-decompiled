local l_script_FirstAncestor_0 = script:FindFirstAncestor("GroupsNetworking");
local v1 = require(l_script_FirstAncestor_0.GROUPS_URL);
return function(v2) --[[ Line: 14 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.POST({
        Name = "MakePrimaryGroup"
    }, function(v3, v4) --[[ Line: 17 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("v1"):path("user"):path("groups"):path("primary"):body({
            groupId = v4.groupId
        });
    end);
end;