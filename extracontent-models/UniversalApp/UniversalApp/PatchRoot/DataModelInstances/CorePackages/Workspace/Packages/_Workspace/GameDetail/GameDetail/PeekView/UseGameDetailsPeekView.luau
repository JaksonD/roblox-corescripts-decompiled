local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local l_isSubjectToDesktopPolicies_0 = require(l_Parent_0.SharedFlags).isSubjectToDesktopPolicies;
local l_Players_0 = game:GetService("Players");
return function() --[[ Line: 6 ]]
    -- upvalues: l_Players_0 (copy), l_isSubjectToDesktopPolicies_0 (copy)
    if not l_Players_0.LocalPlayer then
        return false;
    elseif l_isSubjectToDesktopPolicies_0() then
        return false;
    else
        return true;
    end;
end;