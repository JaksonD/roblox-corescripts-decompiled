local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v5 = require(l_script_FirstAncestor_0.Analytics);
local l_DefaultAnalyticsService_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.DefaultAnalyticsService;
local v7 = require(script.Parent.EditUsernameWrapper);
return function(v8) --[[ Line: 13 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v4 (copy), v2 (copy), v5 (copy), l_DefaultAnalyticsService_0 (copy), v7 (copy)
    local v9 = l_useLocalUserId_0();
    if v4.useIsExperimentEnabled() then
        return v2.createElement(v5.Context.Provider, {
            value = {
                fireAnalyticsEvent = v5.setupFireAnalyticsEvents({
                    analytics = l_DefaultAnalyticsService_0, 
                    infoForAllEvents = {
                        uid = v9
                    }
                })
            }
        }, {
            v2.createElement(v7, v8)
        });
    else
        return v2.createElement(v7, v8);
    end;
end;