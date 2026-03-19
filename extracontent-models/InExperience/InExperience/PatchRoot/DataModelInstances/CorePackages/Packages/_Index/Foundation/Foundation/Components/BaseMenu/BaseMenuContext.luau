local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Enums.InputSize);
return (v2.createContext({
    onActivated = nil, 
    size = v4.Medium, 
    hasLeading = nil, 
    setHasLeading = nil, 
    hoverOpenPath = {}, 
    hoverOpenAtDepth = nil, 
    hoverCloseAtDepth = nil, 
    hoverReset = nil, 
    depth = 1
}));