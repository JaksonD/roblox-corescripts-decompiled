local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_Parent_0.EditProfileBackground);
local v5 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserInfo);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v7 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v8 = require(l_script_FirstAncestor_0.Common.Enums);
local l_DefaultAnalyticsService_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.DefaultAnalyticsService;
local l_Analytics_0 = require(l_Parent_0.EditProfileBackground).Analytics;
return function(_) --[[ Line: 17 ]] --[[ Name: EditProfileBackgroundPageWrapper ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v7 (copy), v8 (copy), v2 (copy), v5 (copy), l_Analytics_0 (copy), l_DefaultAnalyticsService_0 (copy), v4 (copy)
    local v12 = l_useDispatch_0();
    local v13 = l_useLocalUserId_0();
    local v14 = v7(v8.Components.ProfileBackground);
    local v15 = v2.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v12 (copy), v5 (ref), v13 (copy)
        v12(v5((tostring(v13))));
    end);
    local v16 = l_Analytics_0.setupFireAnalyticsEvents({
        analytics = {
            EventStream = l_DefaultAnalyticsService_0.EventStream, 
            Telemetry = l_DefaultAnalyticsService_0.Telemetry
        }, 
        infoForAllEvents = {
            uid = tostring(v13)
        }
    });
    return v2.createElement(l_Analytics_0.Context.Provider, {
        value = {
            fireAnalyticsEvent = v16
        }
    }, {
        v2.createElement(v4.EditProfileBackgroundPage, {
            onBackgroundChanged = v15, 
            profileBackgroundData = v14
        })
    });
end;