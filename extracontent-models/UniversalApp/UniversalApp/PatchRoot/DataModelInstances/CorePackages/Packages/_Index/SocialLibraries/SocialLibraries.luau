local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.UIBlox);
return {
    config = function(v2) --[[ Line: 5 ]] --[[ Name: config ]]
        -- upvalues: v1 (copy)
        if v2.UIBloxConfig then
            v1.init(v2.UIBloxConfig);
        end;
        return {
            Analytics = require(script.Analytics), 
            Components = require(script.Components), 
            Conversation = require(script.Conversation), 
            Dictionary = require(script.Dictionary), 
            User = require(script.User), 
            Utils = require(script.Utils), 
            RoactLayout = require(script.RoactLayout), 
            RoactPaginator = require(script.RoactPaginator), 
            RoduxTools = require(script.RoduxTools), 
            populate = require(script.populate), 
            TestingAnalytics = require(script.TestingAnalytics), 
            ReleaseHelpers = require(script.ReleaseHelpers), 
            Flags = require(script.Flags), 
            StoryMiddleware = require(script.StoryMiddleware), 
            Context = require(script.Context)
        };
    end
};