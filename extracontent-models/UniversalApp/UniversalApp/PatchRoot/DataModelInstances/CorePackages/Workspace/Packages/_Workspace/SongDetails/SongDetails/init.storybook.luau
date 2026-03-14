local l_script_FirstAncestor_0 = script:FindFirstAncestor("SongDetails");
local v1 = require(l_script_FirstAncestor_0.Parent.Dev.Roact);
return {
    name = l_script_FirstAncestor_0.Name, 
    storyRoots = {
        script.Parent
    }, 
    roact = v1
};