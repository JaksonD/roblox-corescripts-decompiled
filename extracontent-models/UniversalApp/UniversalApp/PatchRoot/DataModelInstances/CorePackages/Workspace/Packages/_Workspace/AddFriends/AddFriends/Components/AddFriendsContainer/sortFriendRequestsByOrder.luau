local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.llama);
local v2 = require(l_Parent_0.t);
return function(v3) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v1 (copy)
    assert(v2.table(v3));
    return v1.List.sort(v3, function(v4, v5) --[[ Line: 18 ]]
        return (v4.order or 9999999) < (v5.order or 9999999);
    end);
end;