local l_Parent_0 = script.Parent.Parent;
local l_isSubjectTo10ftPolicies_0 = require(l_Parent_0.dependencies).isSubjectTo10ftPolicies;
local v2 = require(l_Parent_0.Flags.getFIntShowFriendRecommendationsLimit);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_isSubjectTo10ftPolicies_0 (copy), v2 (copy)
    if l_isSubjectTo10ftPolicies_0() then
        return true;
    else
        return v3 <= v2();
    end;
end;