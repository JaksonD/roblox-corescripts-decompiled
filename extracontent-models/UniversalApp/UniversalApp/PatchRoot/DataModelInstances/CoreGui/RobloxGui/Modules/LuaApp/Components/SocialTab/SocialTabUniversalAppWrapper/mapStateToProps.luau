local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTab);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
return function(v4, _) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_FormFactor_0 (copy)
    local l_history_0 = v4.Navigation.history;
    local v7 = l_history_0[#l_history_0];
    local v8 = v7[#v7] and v7[#v7].name;
    return {
        chatLoaded = v4.ChatAppReducer.AppLoaded, 
        canGoBack = #v7 > 1, 
        retrievalStatus = v2.Requests.FetchChatSettings.getStatus(v4), 
        wideMode = v4.FormFactor == l_FormFactor_0.WIDE, 
        notificationCount = v4.NotificationBadgeCounts.TopBarNotificationIcon, 
        localUserId = v4.LocalUserId, 
        currentAppPage = v8
    };
end;