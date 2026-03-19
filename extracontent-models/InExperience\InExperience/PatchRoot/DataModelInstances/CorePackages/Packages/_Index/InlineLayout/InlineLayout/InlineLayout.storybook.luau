local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_StoryMiddleware_0 = require(l_Parent_1.MarkdownCore).StoryMiddleware;
local v3 = require(l_Parent_1.Dev.Roact);
return {
    name = "InlineLayout", 
    exclude = {
        "_Index"
    }, 
    storyRoots = {
        l_Parent_0
    }, 
    mapStory = l_StoryMiddleware_0, 
    roact = v3
};