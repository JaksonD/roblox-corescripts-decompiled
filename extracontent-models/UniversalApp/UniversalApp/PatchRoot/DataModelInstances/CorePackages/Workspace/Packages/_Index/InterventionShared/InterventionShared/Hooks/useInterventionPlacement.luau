local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Contexts.InterventionPlacement);
local v3 = require(l_Parent_0.React);
return function() --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3.useContext(v2);
end;