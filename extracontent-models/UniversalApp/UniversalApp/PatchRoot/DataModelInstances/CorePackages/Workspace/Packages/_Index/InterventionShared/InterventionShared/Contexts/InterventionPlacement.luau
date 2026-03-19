local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.Constants);
return (require(l_Parent_0.React).createContext(v2.InterventionPlacementType.Unknown));