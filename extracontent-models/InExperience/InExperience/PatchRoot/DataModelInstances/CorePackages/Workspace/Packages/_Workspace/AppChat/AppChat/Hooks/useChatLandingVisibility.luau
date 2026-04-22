local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppChatInExperience;
local v3 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local v4 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v5 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagHideNotificationIconForVR);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 23 ]] --[[ Name: useChatLandingVisibility ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v6 (copy), l_useSelector_0 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy)
    local v8 = v5();
    local v9 = v4();
    local v11 = v3(function(v10) --[[ Line: 27 ]]
        return v10.getChatHeaderSearch();
    end);
    local v13 = v3(function(v12) --[[ Line: 30 ]]
        return v12.getChatHeaderCreateChatGroup();
    end);
    local v15 = v3(function(v14) --[[ Line: 33 ]]
        -- upvalues: v6 (ref)
        return v14.getChatHeaderNotifications() and (not v6() or v14.getWebViewSupport());
    end);
    local v18 = l_useSelector_0(function(v16) --[[ Line: 38 ]]
        local l_NotificationBadgeCounts_0 = v16.NotificationBadgeCounts;
        return l_NotificationBadgeCounts_0 and l_NotificationBadgeCounts_0.TopBarNotificationIcon or 0;
    end);
    local v19 = v11 and not v8 and v9;
    local v20 = v13 and v9;
    local v21 = not v8 and v15;
    local v22 = v8 and l_GetFFlagEnableAppChatInExperience_0();
    return {
        topBarShowSearch = v19, 
        topBarShowCreateChatGroup = v20, 
        topBarShowNotifications = v21, 
        topBarShowSnoozeNotifications = v22, 
        showSearchRow = v8, 
        notificationCount = v18
    };
end;