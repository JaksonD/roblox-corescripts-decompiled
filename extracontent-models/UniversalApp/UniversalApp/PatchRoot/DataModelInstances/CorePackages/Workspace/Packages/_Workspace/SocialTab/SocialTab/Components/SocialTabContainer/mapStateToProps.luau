local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.User);
local l_getDeepValue_0 = v1.SocialLibraries.Dictionary.getDeepValue;
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: l_getDeepValue_0 (copy), v2 (copy)
    local v6 = l_getDeepValue_0(v4, "SocialTab.ShowContactImporterParams") or {};
    return {
        unreadConversationCount = v4.SocialTab.UnreadConversationCount or 0, 
        numberOfNotifications = v4.NotificationBadgeCounts.TopBarNotificationIcon, 
        localUser = v2.mapToUsers(v4, v5)(v4.LocalUserId), 
        localUserId = v4.LocalUserId or nil, 
        isPhoneVerified = v6.isPhoneVerified, 
        isDiscoverabilityUnset = v6.isDiscoverabilityUnset
    };
end;