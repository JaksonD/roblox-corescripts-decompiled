local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.StoryMiddleware);
local v2 = require(l_Parent_0.Parent.Dev.Roact);
return {
    name = "MarkdownCore", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_Parent_0
    }, 
    mapStory = v1, 
    roact = v2
};