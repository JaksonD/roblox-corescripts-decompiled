local l_Parent_0 = script:FindFirstAncestor("SquadsCore").Parent;
local v1 = require(l_Parent_0.RegExp)("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$");
return function(v2) --[[ Line: 9 ]] --[[ Name: validateSquadId ]]
    -- upvalues: v1 (copy)
    if v2 and v2 ~= "" and v1:exec(v2) then
        return true;
    else
        return false;
    end;
end;