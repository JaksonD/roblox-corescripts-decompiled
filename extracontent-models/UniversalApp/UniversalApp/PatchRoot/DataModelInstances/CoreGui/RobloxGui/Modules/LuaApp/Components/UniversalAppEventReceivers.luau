local l_CorePackages_0 = game:GetService("CorePackages");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Modules_1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableAppRatingPromptLua_0 = v5.FFlagEnableAppRatingPromptLua;
local l_FFlagEnableAndroidAppRatingPromptLua_0 = v5.FFlagEnableAndroidAppRatingPromptLua;
local l_FFlagEnableUserAccessServiceIntegration_0 = v5.FFlagEnableUserAccessServiceIntegration;
local l_FFlagEnableMagicLogin_0 = v5.FFlagEnableMagicLogin;
local l_GetFFlagIsSquadEnabled_0 = v5.GetFFlagIsSquadEnabled;
local l_FFlagEnableAuthDeepLinkReceiver_0 = v5.FFlagEnableAuthDeepLinkReceiver;
local l_FFlagTCStreamNotifEventReceiver_0 = v5.FFlagTCStreamNotifEventReceiver;
local l_FFlagEnableRobloxSubscriptionEventListener_0 = v5.FFlagEnableRobloxSubscriptionEventListener;
local v14 = require(l_Modules_0.LuaApp.Components.OnPlatformSurveys.IsCsatSurveyInterceptEnabled);
local v15 = require(l_Modules_0.Luobu.Flags.FFlagLuobuCJVMorePageShowTencentNotice);
local l_GetFFlagLuaAppChallengeDialogEventReceiverEnabled_0 = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogEventReceiverEnabled;
local v17 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppReturnFromGame);
local v18 = require(l_Modules_0.Luobu.Flags.FFlagLuobuShowTencentNoticePopup);
local l_GetFFlagEnableParentalControlsScreentimeEnforcement_0 = require(l_CorePackages_0.Workspace.Packages.ScreenTime).GetFFlagEnableParentalControlsScreentimeEnforcement;
local l_MagicLoginApprovePopupEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.LoginV2).Thunks.MagicLoginApprovePopupEventReceiver;
local v21 = require(l_Modules_0.LuaApp.Components.EventReceivers.SystemThemeFeature).GetSystemThemeEnabled();
local v22 = v21 and require(l_Modules_0.LuaApp.Components.EventReceivers.DeviceLevelThemeChangeEventReceiver) or nil;
local v23 = require(l_Modules_0.LuaApp.Components.EventReceivers.BadgeEventReceiver);
local v24 = require(l_Modules_0.LuaApp.Components.EventReceivers.RobuxEventReceiver);
local v25 = require(l_Modules_0.LuaApp.Components.EventReceivers.FriendshipEventReceiver);
local v26 = require(l_Modules_0.LuaApp.Components.EventReceivers.TrustedConnectionEventReceiver);
local v27 = require(l_Modules_0.LuaApp.Components.EventReceivers.NavigationEventReceiver);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EventReceivers.EventReceiver);
local v29 = require(l_Modules_0.LuaApp.Components.EventReceivers.UniversalAppRobloxHybridEventReceiver);
local v30 = require(l_Modules_0.LuaApp.Components.EventReceivers.ThemeChangeEventReceiver);
local v31 = require(l_Modules_0.LuaApp.Components.EventReceivers.DeepLinkEventReceiver);
local v32 = require(l_Modules_0.LuaApp.Components.EventReceivers.MarketplaceServiceEventReciever);
local v33 = require(l_Modules_0.LuaApp.Components.EventReceivers.FullscreenEventReceiver);
local v34 = require(l_Modules_0.LuaApp.Components.EventReceivers.DisplayNameEventReceiver);
local v35 = require(l_Modules_0.LuaApp.Components.EventReceivers.FriendRequestsEventReceiver);
local v36 = require(l_Modules_0.LuaApp.Components.EventReceivers.ScreenTimeEventReceiver);
local v37 = require(l_Modules_0.LuaApp.Components.EventReceivers.ModerationEventReceiverV2);
local v38 = require(l_Modules_0.LuaApp.Components.EventReceivers.PresenceEventReceiver);
local v39 = require(l_Modules_0.LuaApp.Components.EventReceivers.ReturnFromGameReceiver);
local l_OnGameLeaveReceiver_0 = l_Modules_1.LuaApp.Components.EventReceivers.OnGameLeaveReceiver;
local l_AppSquadEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.Squads).AppSquadEventReceiver;
local l_PersistentEventReceivers_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Components.EventReceivers.PersistentEventReceivers;
local l_ChallengeDialogEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.ChallengeDialog).ChallengeDialogEventReceiver;
local v44 = require(l_Modules_0.LuaApp.Components.EventReceivers.PurchaseProcessedEventReceiver);
local v45 = require(l_Modules_0.LuaApp.Components.EventReceivers.LocaleRestrictionEventReceiver);
local v46 = require(l_Modules_0.LuaApp.Components.EventReceivers.ParentalControlsScreentimeEventReceiver);
local v47 = require(l_Modules_0.LuaApp.Components.OnPlatformSurveys.CsatSurveyInterceptEventReceiver);
local v48 = (not not l_FFlagEnableAppRatingPromptLua_0 or l_FFlagEnableAndroidAppRatingPromptLua_0) and require(l_CorePackages_0.Workspace.Packages.AppRatingPrompt).AppRatingPromptEventReceiver or nil;
local l_InAppInterventionEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.InAppIntervention).InAppInterventionEventReceiver;
local v50 = require(l_Modules_0.Luobu.Components.EventReceivers.TencentNoticeEventReceiver);
local v51 = require(l_Modules_0.LuaApp.Experiment.PerfInsights);
local v52 = require(l_Modules_0.LuaApp.Components.EventReceivers.AccountLockEventReceiver);
local v53 = require(l_Modules_0.LuaApp.Components.EventReceivers.RobloxSubscriptionEventReceiver);
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v55 = require(l_Modules_0.LuaApp.Components.EventReceiverLifecycleAdapter);
local v56 = require(l_Modules_0.LuaApp.Components.Authentication.AuthDeeplinkEventReceiverMonoWrapper);
return function() --[[ Line: 83 ]]
    -- upvalues: v4 (copy), l_RobloxEventReceiver_0 (copy), l_NotificationService_0 (copy), v52 (copy), l_PersistentEventReceivers_0 (copy), l_FFlagEnableAppRatingPromptLua_0 (copy), l_FFlagEnableAndroidAppRatingPromptLua_0 (copy), v48 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_AppSquadEventReceiver_0 (copy), v28 (copy), v23 (copy), l_GetFFlagLuaAppChallengeDialogEventReceiverEnabled_0 (copy), l_ChallengeDialogEventReceiver_0 (copy), v14 (copy), v47 (copy), l_FFlagEnableAuthDeepLinkReceiver_0 (copy), v56 (copy), v31 (copy), v21 (copy), v22 (copy), v34 (copy), v35 (copy), v25 (copy), v33 (copy), l_InAppInterventionEventReceiver_0 (copy), l_FFlagEnableUserAccessServiceIntegration_0 (copy), v45 (copy), v32 (copy), v37 (copy), v27 (copy), l_OnGameLeaveReceiver_0 (copy), l_GetFFlagEnableParentalControlsScreentimeEnforcement_0 (copy), v46 (copy), v51 (copy), v38 (copy), v44 (copy), v17 (copy), v39 (copy), v24 (copy), v36 (copy), v15 (copy), v18 (copy), v50 (copy), v30 (copy), v29 (copy), l_FFlagEnableMagicLogin_0 (copy), l_MagicLoginApprovePopupEventReceiver_0 (copy), l_FFlagTCStreamNotifEventReceiver_0 (copy), v26 (copy), l_FFlagEnableRobloxSubscriptionEventListener_0 (copy), v53 (copy), v55 (copy)
    local v57 = v4.useMemo(function() --[[ Line: 84 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), l_NotificationService_0 (ref)
        return l_RobloxEventReceiver_0.new(l_NotificationService_0);
    end, {});
    local v58 = v4.useMemo(function() --[[ Line: 88 ]]
        -- upvalues: v52 (ref), l_PersistentEventReceivers_0 (ref), l_FFlagEnableAppRatingPromptLua_0 (ref), l_FFlagEnableAndroidAppRatingPromptLua_0 (ref), v48 (ref), l_GetFFlagIsSquadEnabled_0 (ref), l_AppSquadEventReceiver_0 (ref), v28 (ref), v23 (ref), l_GetFFlagLuaAppChallengeDialogEventReceiverEnabled_0 (ref), l_ChallengeDialogEventReceiver_0 (ref), v14 (ref), v47 (ref), l_FFlagEnableAuthDeepLinkReceiver_0 (ref), v56 (ref), v31 (ref), v21 (ref), v22 (ref), v34 (ref), v35 (ref), v25 (ref), v33 (ref), l_InAppInterventionEventReceiver_0 (ref), l_FFlagEnableUserAccessServiceIntegration_0 (ref), v45 (ref), v32 (ref), v37 (ref), v27 (ref), l_OnGameLeaveReceiver_0 (ref), l_GetFFlagEnableParentalControlsScreentimeEnforcement_0 (ref), v46 (ref), v51 (ref), v38 (ref), v44 (ref), v17 (ref), v39 (ref), v24 (ref), v36 (ref), v15 (ref), v18 (ref), v50 (ref), v30 (ref), v29 (ref), l_FFlagEnableMagicLogin_0 (ref), l_MagicLoginApprovePopupEventReceiver_0 (ref), l_FFlagTCStreamNotifEventReceiver_0 (ref), v26 (ref), l_FFlagEnableRobloxSubscriptionEventListener_0 (ref), v53 (ref)
        return {
            v52, 
            l_PersistentEventReceivers_0, 
            if not not l_FFlagEnableAppRatingPromptLua_0 or l_FFlagEnableAndroidAppRatingPromptLua_0 then v48 else nil, 
            if l_GetFFlagIsSquadEnabled_0() then l_AppSquadEventReceiver_0 else nil, 
            v28, 
            v23, 
            if l_GetFFlagLuaAppChallengeDialogEventReceiverEnabled_0() then l_ChallengeDialogEventReceiver_0 else nil, 
            if v14() then v47 else nil, 
            if l_FFlagEnableAuthDeepLinkReceiver_0 then v56 else nil, 
            v31, 
            if v21 then v22 else nil, 
            v34, 
            v35, 
            v25, 
            v33, 
            l_InAppInterventionEventReceiver_0, 
            if l_FFlagEnableUserAccessServiceIntegration_0 then v45 else nil, 
            v32, 
            v37, 
            v27, 
            l_OnGameLeaveReceiver_0, 
            if l_GetFFlagEnableParentalControlsScreentimeEnforcement_0() then v46 else nil, 
            v51, 
            v38, 
            v44, 
            if v17() then v39 else nil, 
            v24, 
            v36, 
            if not not v15 or v18 then v50 else nil, 
            v30, 
            v29, 
            if l_FFlagEnableMagicLogin_0 then l_MagicLoginApprovePopupEventReceiver_0 else nil, 
            if l_FFlagTCStreamNotifEventReceiver_0 then v26 else nil, 
            if l_FFlagEnableRobloxSubscriptionEventListener_0 then v53 else nil
        };
    end, {});
    return v4.createElement(v55, {
        RobloxEventReceiver = v57, 
        receiverComponents = v58
    });
end;