local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_script_FirstAncestor_0.Analytics);
local l_DefaultAnalyticsService_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.DefaultAnalyticsService;
local v6 = require(script.Parent.EditProfileEntryPointContainer);
return function(v7) --[[ Line: 11 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v2 (copy), v4 (copy), l_DefaultAnalyticsService_0 (copy), v6 (copy)
    local v8 = l_useLocalUserId_0();
    return v2.createElement(v4.Context.Provider, {
        value = {
            fireAnalyticsEvent = v4.setupFireAnalyticsEvents({
                analytics = l_DefaultAnalyticsService_0, 
                infoForAllEvents = {
                    uid = v8
                }
            })
        }
    }, {
        v2.createElement(v6, v7)
    });
end;