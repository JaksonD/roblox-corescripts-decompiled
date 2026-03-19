local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_List_0 = require(l_Parent_0.Cryo).List;
return function(v2, v3) --[[ Line: 5 ]] --[[ Name: isUserInList ]]
    -- upvalues: l_List_0 (copy)
    return l_List_0.findWhere(v2, function(v4) --[[ Line: 6 ]]
        -- upvalues: v3 (copy)
        return v4.id == v3;
    end) ~= nil;
end;