local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
local v1 = require(l_Parent_0.llama);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return v1.List.removeValue(v2 or {}, v3);
end;