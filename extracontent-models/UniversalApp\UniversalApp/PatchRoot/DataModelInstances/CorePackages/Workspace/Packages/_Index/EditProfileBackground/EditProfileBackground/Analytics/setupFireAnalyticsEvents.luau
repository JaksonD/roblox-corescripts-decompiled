local l_Parent_0 = script:FindFirstAncestor("EditProfileBackground").Parent;
local l_AnalyticsFactory_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.AnalyticsFactory;
local v2 = require(script.Parent.DiagActionList);
local v3 = require(script.Parent.EventStreamActionList);
local v4 = require(script.Parent.TelemetryActionList);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: l_AnalyticsFactory_0 (copy), v3 (copy), v2 (copy), v4 (copy)
    return l_AnalyticsFactory_0.setUpAnalyticsFactory({
        eventLists = {
            EventStream = v3, 
            Diag = v2, 
            Telemetry = v4
        }, 
        analyticsImpl = v5.analytics
    })(v5).fireAnalyticsEvent;
end;