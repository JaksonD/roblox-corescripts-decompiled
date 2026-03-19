local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_List_0 (copy)
    return l_List_0.sort(v2);
end;