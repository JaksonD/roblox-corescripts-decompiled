local l_Parent_0 = script:FindFirstAncestor("SocialOnboardingButtons").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v1.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v1.Analytics.DefaultAnalyticsService;
local v4 = require(script.getEventStreamActionList);
local v5 = require(script.DiagActionList);
return {
    EventNames = require(script.EventNames), 
    getAnalytics = function(v6) --[[ Line: 14 ]] --[[ Name: getAnalytics ]]
        -- upvalues: v4 (copy), l_AnalyticsFactory_0 (copy), v5 (copy), l_DefaultAnalyticsService_0 (copy)
        local v7 = v4(v6);
        return l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v7, 
                Diag = v5
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream, 
                Diag = l_DefaultAnalyticsService_0.Diag
            }
        });
    end
};