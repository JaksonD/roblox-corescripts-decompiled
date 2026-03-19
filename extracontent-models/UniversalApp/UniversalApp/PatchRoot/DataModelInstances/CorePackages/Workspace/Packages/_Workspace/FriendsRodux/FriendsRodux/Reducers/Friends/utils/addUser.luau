local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.llama);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return {
            v3
        };
    elseif not v1.List.find(v2, v3) then
        return v1.List.join(v2, {
            v3
        });
    else
        return v2;
    end;
end;