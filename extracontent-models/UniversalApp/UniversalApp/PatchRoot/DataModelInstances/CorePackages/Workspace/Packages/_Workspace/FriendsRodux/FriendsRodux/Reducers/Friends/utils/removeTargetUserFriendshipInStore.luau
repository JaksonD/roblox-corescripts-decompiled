local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.llama);
local v2 = require(script.Parent.removeUser);
return function(v3, v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = tostring(v4.additionalData.currentUserId);
    local v6 = tostring(v4.namedIds.users);
    local v7 = v1.Dictionary.join(v3, {
        [v5] = v2(v3[v5], v6), 
        [v6] = v2(v3[v6], v5)
    });
    v7[v6] = nil;
    return v7;
end;