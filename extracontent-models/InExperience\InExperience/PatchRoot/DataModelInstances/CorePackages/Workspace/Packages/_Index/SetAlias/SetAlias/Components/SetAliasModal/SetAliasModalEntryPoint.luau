local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialLuaAnalytics);
local v3 = require(l_Parent_0.dependencies);
local l_React_0 = v3.React;
local l_useLocalUserId_0 = v3.Hooks.useLocalUserId;
local v6 = require(l_Parent_0.Analytics);
local v7 = require(l_Parent_0.Common.Constants);
local l_DefaultAnalyticsService_0 = v2.Analytics.DefaultAnalyticsService;
local v9 = require(script.Parent.SetAliasModalContainer);
return function(v10) --[[ Line: 15 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_React_0 (copy), v6 (copy), l_DefaultAnalyticsService_0 (copy), v7 (copy), v9 (copy)
    local v11 = l_useLocalUserId_0();
    return l_React_0.createElement(v6.Context.Provider, {
        value = {
            fireAnalyticsEvent = v6.setupFireAnalyticsEvents({
                analytics = l_DefaultAnalyticsService_0, 
                infoForAllEvents = {
                    uid = v11, 
                    origin = v10.navigation.getParam(v7.ORIGIN)
                }
            })
        }
    }, {
        l_React_0.createElement(v9, v10)
    });
end;