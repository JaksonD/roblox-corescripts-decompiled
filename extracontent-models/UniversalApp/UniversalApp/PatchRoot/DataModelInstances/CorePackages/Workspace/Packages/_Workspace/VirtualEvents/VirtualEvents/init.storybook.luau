local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.RoactCompat);
return {
    name = l_script_FirstAncestor_0.Name, 
    roact = v1, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};