local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Responsive.BreakpointConfig);
local v3 = require(l_script_FirstAncestor_0.Utility.Responsive.GridConfig);
return require(l_Parent_0.React).createContext({
    config = {
        breakpoint = v2, 
        grid = v3
    }
});