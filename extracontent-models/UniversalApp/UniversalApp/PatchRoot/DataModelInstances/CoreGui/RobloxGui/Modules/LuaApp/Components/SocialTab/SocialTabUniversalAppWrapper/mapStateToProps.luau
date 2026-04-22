local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v4 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTab);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
return function(v6, _) --[[ Line: 9 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v4 (copy), l_FormFactor_0 (copy)
    local v8 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v6) else v6.Navigation.history;
    local v9 = v8[#v8];
    local v10 = v9[#v9] and v9[#v9].name;
    return {
        chatLoaded = v6.ChatAppReducer.AppLoaded, 
        canGoBack = #v9 > 1, 
        retrievalStatus = v4.Requests.FetchChatSettings.getStatus(v6), 
        wideMode = v6.FormFactor == l_FormFactor_0.WIDE, 
        notificationCount = v6.NotificationBadgeCounts.TopBarNotificationIcon, 
        localUserId = v6.LocalUserId, 
        currentAppPage = v10, 
        bottomBarVisible = v6.TabBarVisible
    };
end;