local l_script_FirstAncestor_0 = script:FindFirstAncestor("GroupsNetworking");
local v1 = require(l_script_FirstAncestor_0.GROUPS_URL);
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    return v2.roduxNetworking.DELETE({
        Name = "RemovePrimaryGroup"
    }, function(v3) --[[ Line: 13 ]]
        -- upvalues: v1 (ref)
        return v3(v1):path("v1"):path("user"):path("groups"):path("primary");
    end);
end;