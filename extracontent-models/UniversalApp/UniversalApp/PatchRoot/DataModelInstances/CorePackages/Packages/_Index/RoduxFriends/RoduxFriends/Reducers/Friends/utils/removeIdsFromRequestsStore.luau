local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
local v1 = require(l_Parent_0.llama);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local v4 = {};
    for _, v6 in pairs(v3) do
        v4[v6] = v1.None;
    end;
    return v1.Dictionary.join(v2, v4);
end;