local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    v1.List.map(v2, function(v4) --[[ Line: 8 ]]
        -- upvalues: v1 (ref), v3 (copy)
        v1.List.map(v4.otherParticipants, function(v5) --[[ Line: 9 ]]
            -- upvalues: v3 (ref)
            v3[v5] = true;
        end);
    end);
    return v1.Dictionary.keys(v3);
end;