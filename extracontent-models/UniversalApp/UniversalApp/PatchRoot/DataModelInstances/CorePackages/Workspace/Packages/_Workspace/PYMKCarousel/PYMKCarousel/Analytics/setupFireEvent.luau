local l_Parent_0 = script.Parent.Parent;
local l_SocialLuaAnalytics_0 = require(l_Parent_0.dependencies).SocialLuaAnalytics;
local v2 = require(script.Parent.DiagActionList);
local v3 = require(script.Parent.EventStreamActionList);
return l_SocialLuaAnalytics_0.Analytics.FireEvent.createFireEvent({
    EventStream = v3, 
    Diag = v2
});