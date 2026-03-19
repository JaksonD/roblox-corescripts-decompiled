local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Common.encodeUserIds);
return function(v4) --[[ Line: 8 ]] --[[ Name: encodeSquadMembers ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v6 = v2.List.map(v4 or {}, function(v5) --[[ Line: 9 ]]
        return v5.userId;
    end);
    return v3(v6);
end;