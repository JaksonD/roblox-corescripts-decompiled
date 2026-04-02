local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.InputSize);
return v2.createContext({
    hasDivider = false, 
    isInset = false, 
    size = v3.Medium, 
    testId = ""
});