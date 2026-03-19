local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Logger);
return (require(l_Parent_0.React).createContext(function() --[[ Line: 7 ]]
    -- upvalues: v2 (copy)
    v2:warning("No Style Provider found");
    return "";
end));