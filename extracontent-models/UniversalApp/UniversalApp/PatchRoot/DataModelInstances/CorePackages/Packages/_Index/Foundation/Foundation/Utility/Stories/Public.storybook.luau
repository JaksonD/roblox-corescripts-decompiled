local l_Parent_0 = script.Parent;
local l_Parent_1 = script:FindFirstAncestor("Foundation").Parent;
local v2 = require(l_Parent_0.GetStories);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.StoryMiddleware);
return {
    name = "Public", 
    group = "Foundation", 
    roact = v3, 
    storyRoots = v2(true), 
    mapStory = v4
};