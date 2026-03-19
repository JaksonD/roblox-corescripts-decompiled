local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v6 = v1.List.findWhere(v2.userProfiles, function(v4, _) --[[ Line: 6 ]]
        -- upvalues: v3 (copy)
        return v4.id == tostring(v3);
    end);
    return v2.userProfiles[v6] or {};
end;