local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.App.FeedContext);
return function() --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return {
        fireEvent = v2.useContext(v3).fireAnalyticsEvent
    };
end;