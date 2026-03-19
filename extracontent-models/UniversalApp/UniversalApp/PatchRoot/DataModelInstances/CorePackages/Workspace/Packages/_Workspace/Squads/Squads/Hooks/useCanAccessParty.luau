local l_Parent_0 = script:FindFirstAncestor("Squads").Parent;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
return function() --[[ Line: 5 ]]
    -- upvalues: l_useAppPolicy_0 (copy)
    return l_useAppPolicy_0(function(v2) --[[ Line: 6 ]]
        return v2.getCanAccessParty();
    end);
end;