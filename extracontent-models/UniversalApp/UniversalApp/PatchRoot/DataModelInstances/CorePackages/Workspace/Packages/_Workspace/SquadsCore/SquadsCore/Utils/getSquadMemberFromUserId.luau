local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.RoduxSquads);
return function(v3, v4) --[[ Line: 18 ]] --[[ Name: getSquadMemberFromUserId ]]
    -- upvalues: v1 (copy)
    if v3 and v3.members then
        local v6 = v1.List.findWhere(v3.members, function(v5) --[[ Line: 20 ]]
            -- upvalues: v4 (copy)
            return v5.userId == v4;
        end);
        if v6 then
            return v3.members[v6];
        end;
    end;
    return nil;
end;