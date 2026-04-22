local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserRelationshipModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
return {
    name = "UserRelationshipModals", 
    storyRoots = {
        l_script_FirstAncestor_0.Stories
    }, 
    roact = v2, 
    reactRoblox = v3
};