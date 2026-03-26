local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_SessionService_0 = game:GetService("SessionService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local v13 = l_game_EngineFeature_0 and game:GetService("AppUpdateService") or nil;
local l_IXPService_0 = game:GetService("IXPService");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StartupMessageService_0 = game:GetService("StartupMessageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
require(l_Modules_0.AvatarExperience.Common.Debug.LogTreeConfig);
local v20 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagLuaAppPostAppInteractiveLoader_0 = v20.GetFFlagLuaAppPostAppInteractiveLoader;
local v22 = require(l_CorePackages_0.Packages.Roact);
local v23 = require(l_CorePackages_0.Packages.Rodux);
local v24 = require(l_CorePackages_0.Packages.RoactRodux);
local v25 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local v27 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_SystemInfoProtocol_0 = require(l_CorePackages_0.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v30 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_GameProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol;
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local l_PrefetchProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PrefetchProtocol).PrefetchProtocol;
local v34 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local v36 = require(l_Modules_0.Common.Signal);
local v37 = require(l_Modules_0.Common.Analytics);
local v38 = require(l_Modules_0.LuaApp.AppReducer);
local l_useUserAgreements_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).useUserAgreements;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v41 = require(l_Modules_0.LuaApp.Components.AppConfigurer);
local v42 = require(l_Modules_0.LuaApp.Components.AppUiModeStyleProvider);
local v43 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_ProviderContainer_0 = v43.Components.ProviderContainer;
local l_ReactProfiler_0 = v43.Profiling.ReactProfiler;
local l_ReactProfilerContext_0 = v43.Profiling.ReactProfilerContext;
local v47 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents);
local v48 = require(l_Modules_0.LuaApp.Components.EventStreamUpdater);
local v49 = require(l_Modules_0.AvatarExperience.Common.Managers.PageObjectManager);
local v50 = require(l_Modules_0.LuaApp.Components.MutedErrorReporter);
local v51 = require(l_Modules_0.LuaApp.Components.MemStorageSubscriberLifecycleAdapter);
local v52 = require(l_Modules_0.LuaApp.Components.LocalPlayerManager);
local v53 = require(l_Modules_0.LuaApp.Components.ViewportManager);
local v54 = require(l_Modules_0.LuaApp.Components.FrameRateManager);
local v55 = require(l_Modules_0.LuaApp.Components.LocaleManager);
local v56 = require(l_Modules_0.LuaApp.Components.LocalStorageListener);
local v57 = require(l_Modules_0.LuaApp.LuaAppBacktraceLogger);
local v58 = require(l_Modules_0.LuaApp.Components.Session.SessionManager);
local v59 = require(l_Modules_0.LuaApp.Components.Session.UserHeartbeatsManager);
local v60 = require(l_CorePackages_0.Packages.UIBlox);
local v61 = require(l_Modules_0.LuaApp.mutedError);
local v62 = require(l_Modules_0.LuaApp.Util.createRoduxErrorReporter);
local v63 = require(l_Modules_0.LuaApp.Components.SiteAlertManager);
local l_InAppAchievementManager_0 = require(l_CorePackages_0.Workspace.Packages.Achievements).InAppAchievementManager;
local l_Provider_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local l_AppReadyHandler_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore).AppReadyHandler;
local l_RnBypassAdapter_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigationCore).RnBypassAdapter;
local l_FFlagImportVirtualCursorToUA_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagImportVirtualCursorToUA;
local l_FFlagVirtualCursorModularization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagVirtualCursorModularization;
if l_FFlagImportVirtualCursorToUA_0 then
    if l_FFlagVirtualCursorModularization_0 then
        require(l_CorePackages_0.Workspace.Packages.VirtualCursorModular);
    else
        require(l_CorePackages_0.Workspace.Packages.VirtualCursor);
    end;
end;
local v70 = require(l_Modules_0.LuaApp.LocalizationProvider);
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v72 = require(l_Modules_0.LuaApp.DesignTokenMappers.tokenMappers);
local v73 = require(l_Modules_0.LuaApp.Components.AppGridProvider);
local l_SelectionCursorProvider_0 = v60.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v60.App.SelectionCursor.CursorProvider;
local v76 = require(l_Modules_0.LuaApp.ThemeProvider);
local v77 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local v79 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local l_SquadExternalContractProvider_0 = v79.SquadExternalContractProvider.SquadExternalContractProvider;
local l_SquadLocationEnum_0 = v79.Enums.SquadLocationEnum;
local v82 = require(l_Modules_0.LuaApp.Components.UniversalAppEventReceivers);
local v83 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRFoundationOverlayProvider);
local v84 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v85 = require(l_Modules_0.LuaApp.Components.LuaAppBacktraceReporterAdaptor);
local v86 = require(l_Modules_0.LuaApp.Components.Squad.AppSquadContract);
local l_AppChatToastManagerUA_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.AppChatToastManagerUA;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_FFlagEnableSignalsMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSignalsMiddleware;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v91 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v92 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v93 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppBrowserService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppBrowserService;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppSystemInfo_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSystemInfo;
local l_AppAppLifecycleObserverService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppAppLifecycleObserverService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_AppGame_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGame;
local l_AppPermissions_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPermissions;
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_AppContentProvider_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppContentProvider;
local l_AppUserInputService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserInputService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v108 = require(l_Modules_0.LuaApp.Components.Session.SessionServiceWrapper);
local v109 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v110 = require(l_Modules_0.LuaApp.Http.wrapRequestWithMiddleware);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v114 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
local v115 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local l_AppUpdateServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).AppUpdateServiceWrapper;
local v117 = require(l_Modules_0.LuaApp.Components.AppUpdate.AppUpdateManager);
local v118 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local v120 = require(l_Modules_0.LuaApp.Experiment.ExperienceMenuIXPPreload);
local v121 = require(l_Modules_0.LuaApp.Experiment.WidgetStoreIXP);
local v122 = require(l_Modules_0.LuaApp.Experiment.AndroidWidgetStoreIXP);
local v123 = require(l_Modules_0.LuaApp.Experiment.IOSUIRefactorIXP);
local v124 = require(l_Modules_0.LuaApp.Experiment.IosAuthServiceIxpStore);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v126 = require(l_Modules_0.LuaApp.Services.CommonGameEvents);
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_createPerformFetchMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.Http).createPerformFetchMiddleware;
local l_AppStartupMessageService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupMessageService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local l_ShareTargetGamePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies;
local v136 = tonumber(settings():GetFVariable("LuaAnalyticsReleasePeriod"));
local v137 = require(l_Modules_0.LuaApp.Components.AppSound.BackgroundSoundManager);
local v138 = require(l_Modules_0.LuaApp.Components.EventReceivers.NativeShellEventReceiver);
local v139 = require(l_Modules_0.LuaApp.Thunks.RNAdapterThunk);
local v140 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v141 = require(l_Modules_0.LuaApp.Util.getHasBackgroundMusic);
local v142 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.LuaApp.Components.ContactImporter.ContactImporterManagerWrapper);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Utils.getLegacyRouteFromRoactNavigationState;
local v144 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_CorePackages_0.Workspace.Packages.QueryRefetch).QueryRefetchManager;
local l_StartupMessageContainer_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).StartupMessageContainer;
local l_SocialGraphSyncManager_0 = require(l_CorePackages_0.Workspace.Packages.SocialGraphSync).SocialGraphSyncManager;
local l_FeedbackManagerInjectionContextProvider_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider;
local l_AppInteractionFeedbackProvider_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_BugReporterEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.BugReporting).BugReporterEventReceiver;
local v151 = require(l_Modules_0.LuaApp.Util.MouseCursorHandler);
if require(l_Modules_0.LuaApp.Bootcamp.Util.EnableLuaAppBootcamp)() then
    local l_status_0, l_result_0 = pcall(require, l_Modules_0.LuaApp.Bootcamp.Util.LuaAppBootcampUtil);
    if l_status_0 then
        l_result_0.runBootcamp();
    else
        warn("Failed to require Bootcamp modules.");
    end;
end;
local v154 = {
    FIntLuaAppBatchFetchingStatusDelayMs = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLuaAppBatchFetchingStatusDelayMs, 
    GetFFlagInjectAnalyticsService = require(l_Modules_0.LuaApp.Flags.GetFFlagInjectAnalyticsService), 
    GetFFlagIsSquadEnabled = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled, 
    FFlagUseSessionServiceWrapper = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppUseSessionServiceWrapper), 
    FFlagLuaAppLaunchTrackThunks = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).Flags.FFlagLuaAppLaunchTrackThunks, 
    GetFFlagEnableWidgetLUAIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableWidgetLUAIXP, 
    GetFFlagEnableAndroidWidgetsLuaIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAndroidWidgetsLuaIXP, 
    GetFFlagEnableIOSUIRefactorLuaIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableIOSUIRefactorLuaIXP, 
    FFlagEnableLockScreenWidgetLuaIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLockScreenWidgetLuaIXP, 
    GetFFlagEnableInAppBugReporting = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInAppBugReporting, 
    FFlagShareTargetGameCleanup = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagShareTargetGameCleanup, 
    FFlagEnableReadAloudInUA = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReadAloudInUA(), 
    FFlagLuaAppSupportFoundationOverlayInVR = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSupportFoundationOverlayInVR, 
    FFlagLuaAppUseAppHttpStore = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUseAppHttpStore, 
    GetFFlagEnableIosAuthServiceLuaIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableIosAuthServiceLuaIXP
};
local v155 = nil;
local v156 = nil;
if v154.FFlagLuaAppUseAppHttpStore then
    v155 = require(l_Modules_0.LuaApp.Util.createAppHttpStoreWrapper);
    v156 = require(l_CorePackages_0.Workspace.Packages.HttpStore);
end;
local v157 = {
    AvatarSceneInteractionProvider = require(l_Modules_0.AvatarExperience.Common.Context.SceneInteractionProvider), 
    BodyDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.BodyDataProvider), 
    AdjustmentDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.AdjustmentData.AdjustmentDataProvider), 
    AppliedDescriptionProvider = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.AppliedDescriptionProvider), 
    AvatarSaveContextProvider = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.AvatarSaveContextProvider
};
local v158 = require(l_Modules_0.LuaApp.UniversalApp.PostAppInteractiveLoader);
local v159 = require(l_Modules_0.LuaApp.Components.ApolloClient);
local v160 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v161 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v162 = require(l_Modules_0.Personalization.OmniFeed.makeOmniFeedService);
local function _(v163) --[[ Line: 255 ]] --[[ Name: createAppContainer ]]
    -- upvalues: v22 (copy), v27 (copy)
    local v164 = v22.PureComponent:extend("NavigationAppContainer");
    v164.router = v163.router;
    v164.render = function(v165) --[[ Line: 258 ]] --[[ Name: render ]]
        return v165.props.children;
    end;
    return v27.createAppContainer(v164);
end;
local function v167() --[[ Line: 264 ]] --[[ Name: UserAgreementsManager ]]
    -- upvalues: l_useUserAgreements_0 (copy)
    l_useUserAgreements_0();
    return nil;
end;
local v168 = if v20.FFlagUseSignalsRoduxStore then require(l_CorePackages_0.Workspace.Packages.SignalsRodux).createStore else v23.Store.new;
local v169 = v22.Component:extend("UniversalApp");
v169.defaultProps = {
    httpService = l_HttpService_0, 
    rbxAnalyticsService = if v154.GetFFlagInjectAnalyticsService() then l_RbxAnalyticsService_0 else nil, 
    ixpService = if v154.GetFFlagInjectAnalyticsService() then l_IXPService_0 else nil
};
v169.init = function(v170) --[[ Line: 285 ]] --[[ Name: init ]]
    -- upvalues: v30 (copy), v49 (copy), l_AvatarEditorService_0 (copy), v154 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v23 (copy), v36 (copy), v139 (copy), l_createPerformFetchMiddleware_0 (copy), l_FFlagEnableSignalsMiddleware_0 (copy), l_CorePackages_0 (copy), l_Modules_0 (copy), v62 (copy), v61 (copy), v168 (copy), v38 (copy), v160 (copy), v22 (copy), v27 (copy), v37 (copy), l_SystemInfoProtocol_0 (copy), l_LinkingProtocol_0 (copy), l_GameProtocol_0 (copy), l_PermissionsProtocol_0 (copy), l_PrefetchProtocol_0 (copy), l_ExternalContentSharingProtocol_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v84 (copy), l_NotificationService_0 (copy), l_GuiService_0 (copy), v155 (ref), l_requestInternalWrapper_0 (copy), v108 (copy), l_SessionService_0 (copy), l_StartupMessageService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), l_game_EngineFeature_0 (copy), l_AppUpdateServiceWrapper_0 (copy), v13 (copy), v126 (copy), v25 (copy), l_getLegacyRouteFromRoactNavigationState_0 (copy), v57 (copy), v110 (copy), l_InAppAchievementManager_0 (copy), v43 (copy), v47 (copy), v162 (copy)
    v30.default:logEventOnce("universal_app_init_begin");
    v170._pageObjectManager = v49.new();
    local v171 = {
        avatarEditorService = l_AvatarEditorService_0, 
        pageObjectManager = v170._pageObjectManager
    };
    local v172 = {
        if v154.FFlagLuaAppLaunchTrackThunks and l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then l_DiscoveryAppLaunchTracker_0.default.roduxTracker:makeThunkMiddleware(v171) else v23.makeThunkMiddleware(v171)
    };
    v170._rnBypassActionSignal = v36.new();
    table.insert(v172, (v139.middleware(function(...) --[[ Line: 304 ]]
        -- upvalues: v170 (copy)
        v170._rnBypassActionSignal:fire(...);
    end)));
    table.insert(v172, l_createPerformFetchMiddleware_0(v154.FIntLuaAppBatchFetchingStatusDelayMs / 1000));
    if l_FFlagEnableSignalsMiddleware_0 then
        local v173 = require(l_CorePackages_0.Workspace.Packages.SignalsMiddleware);
        local v174 = require(l_Modules_0.LuaApp.AppSignalsActionHandlers);
        table.insert(v172, v173.createSignalsMiddleware(v174));
    end;
    local v175 = v62(v61);
    local v176 = if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then _G.__RODUX_STORE_DEV_TOOLS__ or l_DiscoveryAppLaunchTracker_0.default.roduxTracker else _G.__RODUX_STORE_DEV_TOOLS__;
    v170._store = v168(v38, nil, v172, v175, v176);
    local l_v160_0 = v160;
    local v178 = v22.PureComponent:extend("NavigationAppContainer");
    v178.router = l_v160_0.router;
    v178.render = function(v179) --[[ Line: 258 ]] --[[ Name: render ]]
        return v179.props.children;
    end;
    v170._appContainer = v27.createAppContainer(v178);
    v170._analytics = if v154.GetFFlagInjectAnalyticsService() then v37.new(v170.props.rbxAnalyticsService) else v37.new();
    v170._systemInfo = l_SystemInfoProtocol_0.default;
    v170._linking = l_LinkingProtocol_0.default;
    v170._logging = v30.default;
    v170._game = l_GameProtocol_0.default;
    v170._permissions = l_PermissionsProtocol_0.default;
    v170._prefetch = l_PrefetchProtocol_0.default;
    v170._externalContentSharing = l_ExternalContentSharingProtocol_0.default;
    v170._localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v170._robloxEventReceiver = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v84.new(l_NotificationService_0);
    v170._guiService = l_GuiService_0;
    if v154.FFlagLuaAppUseAppHttpStore then
        v170._appHttpStore = v155(v170._store, l_requestInternalWrapper_0(v170.props.httpService), v170._guiService);
    end;
    v170._sessionService = if v154.FFlagUseSessionServiceWrapper then v108 else l_SessionService_0;
    v170._startupMessage = l_StartupMessageService_0;
    v170._eventIngest = l_EventIngest_0.new(l_EventIngestService_0);
    v170._appUpdate = l_game_EngineFeature_0 and l_AppUpdateServiceWrapper_0.new(v13) or nil;
    v170._commonGameEvents = v126.get(l_SessionService_0, v170._analytics, v170._eventIngest);
    v170._appStartupSequence = require(l_CorePackages_0.Workspace.Packages.AppStartup).AppStartupSequence.default;
    v170._focusNavigationService = v25.FocusNavigationService.new(v25.EngineInterface.CoreGui);
    pcall(function() --[[ Line: 355 ]]
        -- upvalues: v170 (copy)
        v170._appLifecycleObserverService = game:GetService("AppLifecycleObserverService");
    end);
    v170.routeSignal = v36.new();
    v170._updateRoute = function(v180) --[[ Line: 367 ]]
        -- upvalues: l_getLegacyRouteFromRoactNavigationState_0 (ref), v170 (copy)
        local v181 = l_getLegacyRouteFromRoactNavigationState_0(v180);
        v170.routeSignal:fire(v181);
    end;
    v170._connectRouteSignal = function(v182) --[[ Line: 374 ]]
        -- upvalues: v170 (copy)
        return v170.routeSignal:connect(v182);
    end;
    v57:connectToStore(v170._store);
    v170._appRequestService = v110(l_requestInternalWrapper_0(v170.props.httpService), v170._store, v170._guiService);
    v170._achievementManager = l_InAppAchievementManager_0.new(v170._store);
    v170._profilerContext = v43.Profiling.createReactProfilerContext();
    v47.createAppLaunchReactProfilerLogger(v170._profilerContext, "home_page_interactive");
    v162();
    if v154.FFlagEnableReadAloudInUA then
        require(l_CorePackages_0.Workspace.Packages.ReadAloud).ConnectReadAloudToSettings();
    end;
    v30.default:logEventOnce("universal_app_init_end");
end;
v169.appendRoactServiceProviders = function(v183, v184) --[[ Line: 398 ]] --[[ Name: appendRoactServiceProviders ]]
    -- upvalues: l_RoactServices_0 (copy), v91 (copy), v92 (copy), v93 (copy), l_AppBrowserService_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_BrowserService_0 (copy), l_AppNotificationService_0 (copy), l_NotificationService_0 (copy), l_AppGuiService_0 (copy), l_AppSystemInfo_0 (copy), l_AppLinking_0 (copy), l_AppLogging_0 (copy), l_AppGame_0 (copy), l_AppPermissions_0 (copy), l_AppPrefetch_0 (copy), l_AppRunService_0 (copy), l_RunService_0 (copy), l_AppContentProvider_0 (copy), l_ContentProvider_0 (copy), l_AppUserInputService_0 (copy), l_UserInputService_0 (copy), l_AppAppLifecycleObserverService_0 (copy), l_AppSessionService_0 (copy), v109 (copy), l_AppUserGameSettings_0 (copy), l_UserGameSettings_0 (copy), l_AppUpdateService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppStartupSequenceTag_0 (copy), l_AppStartupMessageService_0 (copy)
    table.insert(v184, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [v91] = v183._analytics, 
                [v92] = v183._localization, 
                [v93] = v183._appRequestService, 
                [l_AppBrowserService_0] = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_BrowserService_0, 
                [l_AppNotificationService_0] = l_NotificationService_0, 
                [l_AppGuiService_0] = v183._guiService, 
                [l_AppSystemInfo_0] = v183._systemInfo, 
                [l_AppLinking_0] = v183._linking, 
                [l_AppLogging_0] = v183._logging, 
                [l_AppGame_0] = v183._game, 
                [l_AppPermissions_0] = v183._permissions, 
                [l_AppPrefetch_0] = v183._prefetch, 
                [l_AppRunService_0] = l_RunService_0, 
                [l_AppContentProvider_0] = l_ContentProvider_0, 
                [l_AppUserInputService_0] = l_UserInputService_0, 
                [l_AppAppLifecycleObserverService_0] = v183._appLifecycleObserverService, 
                [l_AppSessionService_0] = v183._sessionService, 
                [v109] = v183._eventIngest, 
                [l_AppUserGameSettings_0] = l_UserGameSettings_0, 
                [l_AppUpdateService_0] = v183._appUpdate, 
                [l_RoactAnalyticsCommonGameEvents_0] = v183._commonGameEvents, 
                [l_AppStartupSequenceTag_0] = v183._appStartupSequence, 
                [l_AppStartupMessageService_0] = v183._startupMessage
            }
        }
    });
end;
v169.render = function(v185) --[[ Line: 432 ]] --[[ Name: render ]]
    -- upvalues: v77 (copy), l_ReactProfilerContext_0 (copy), l_ReactProfiler_0 (copy), v161 (copy), v118 (copy), v154 (copy), l_IXPService_0 (copy), v24 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_AvatarPolicies_0 (copy), l_SharePolicies_0 (copy), l_ShareTargetGamePolicies_0 (copy), v42 (copy), l_DesignTokenProvider_0 (copy), v72 (copy), v73 (copy), v76 (copy), v70 (copy), v25 (copy), l_Provider_0 (copy), v157 (copy), v114 (copy), v115 (copy), l_ApolloProvider_0 (copy), v159 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_FeedbackManagerInjectionContextProvider_0 (copy), v34 (copy), l_SquadExternalContractProvider_0 (copy), v86 (copy), l_SquadLocationEnum_0 (copy), v83 (copy), v138 (copy), v120 (copy), v121 (copy), v122 (copy), v123 (copy), v124 (copy), v22 (copy), v82 (copy), v51 (copy), v52 (copy), v53 (copy), v54 (copy), v55 (copy), v48 (copy), v136 (copy), v56 (copy), v50 (copy), v85 (copy), v58 (copy), v59 (copy), v63 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v142 (copy), v141 (copy), v137 (copy), v117 (copy), v167 (copy), v144 (copy), l_AppReadyHandler_0 (copy), l_RnBypassAdapter_0 (copy), v140 (copy), l_AppChatToastManagerUA_0 (copy), v41 (copy), l_StartupMessageContainer_0 (copy), l_BugReporterEventReceiver_0 (copy), l_SocialGraphSyncManager_0 (copy), v151 (copy), v158 (copy), l_ProviderContainer_0 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy)
    local l_appName_0 = v185.props.appName;
    local l_v77_0 = v77;
    local v188 = {};
    table.insert(v188, {
        class = l_ReactProfilerContext_0.Provider, 
        props = {
            value = v185._profilerContext
        }
    });
    table.insert(v188, {
        class = l_ReactProfiler_0, 
        props = {
            id = "UniversalApp"
        }
    });
    table.insert(v188, {
        class = v185._appContainer, 
        props = {
            onNavigationStateChange = v161("UniversalApp")
        }
    });
    table.insert(v188, {
        class = v118.Provider, 
        props = {
            value = if v154.GetFFlagInjectAnalyticsService() then v185.props.ixpService else l_IXPService_0
        }
    });
    table.insert(v188, {
        class = v24.StoreProvider, 
        props = {
            store = v185._store
        }
    });
    table.insert(v188, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0, 
                l_AvatarPolicies_0, 
                l_SharePolicies_0, 
                if v154.FFlagShareTargetGameCleanup then nil else l_ShareTargetGamePolicies_0
            }, 
            policyData = if v154.GetFFlagInjectAnalyticsService() then v185.props.policyData else nil
        }
    });
    v185:appendRoactServiceProviders(v188);
    local v189 = {
        themeName = "dark", 
        fontName = "gotham"
    };
    table.insert(v188, {
        class = v42, 
        props = {
            style = v189
        }
    });
    table.insert(v188, {
        class = l_DesignTokenProvider_0, 
        props = {
            tokenMappers = v72
        }
    });
    table.insert(v188, {
        class = v73
    });
    table.insert(v188, {
        class = v76, 
        props = {
            theme = l_v77_0, 
            themeName = "dark"
        }
    });
    table.insert(v188, {
        class = v70, 
        props = {
            localization = v185._localization
        }
    });
    table.insert(v188, {
        class = v25.FocusNavigationContext.Provider, 
        props = {
            value = v185._focusNavigationService
        }
    });
    table.insert(v188, {
        class = l_Provider_0
    });
    table.insert(v188, {
        class = v157.AvatarSceneInteractionProvider
    });
    table.insert(v188, {
        class = v157.BodyDataProvider
    });
    table.insert(v188, {
        class = v157.AdjustmentDataProvider
    });
    table.insert(v188, {
        class = v157.AppliedDescriptionProvider
    });
    table.insert(v188, {
        class = v157.AvatarSaveContextProvider
    });
    table.insert(v188, {
        class = v114.Provider
    });
    table.insert(v188, {
        class = v115.Provider, 
        props = {
            pageObjectManager = v185._pageObjectManager
        }
    });
    table.insert(v188, {
        class = l_ApolloProvider_0, 
        props = {
            client = v159
        }
    });
    table.insert(v188, {
        class = l_AppInteractionFeedbackProvider_0
    });
    table.insert(v188, {
        class = l_FeedbackManagerInjectionContextProvider_0
    });
    table.insert(v188, {
        class = v34.ResponsiveProvider
    });
    if v154.GetFFlagIsSquadEnabled() then
        table.insert(v188, {
            class = l_SquadExternalContractProvider_0, 
            props = {
                contract = v86, 
                squadLocation = l_SquadLocationEnum_0.UniversalApp
            }
        });
    end;
    if v154.FFlagLuaAppSupportFoundationOverlayInVR then
        table.insert(v188, {
            class = v83
        });
    end;
    local v190 = {};
    table.insert(v190, v138);
    table.insert(v190, v120);
    if v154.GetFFlagEnableWidgetLUAIXP() or v154.FFlagEnableLockScreenWidgetLuaIXP then
        table.insert(v190, v121);
    end;
    if v154.GetFFlagEnableAndroidWidgetsLuaIXP() then
        table.insert(v190, v122);
    end;
    if v154.GetFFlagEnableIOSUIRefactorLuaIXP() then
        table.insert(v190, v123);
    end;
    if v154.GetFFlagEnableIosAuthServiceLuaIXP() then
        table.insert(v190, v124);
    end;
    local v191 = {
        EventReceivers = v22.createElement(v82), 
        MemStorageSubscribers = next(v190) and v22.createElement(v51, {
            receiverComponents = v190
        }) or nil, 
        LocalPlayerManager = v22.createElement(v52), 
        ViewportManager = v22.createElement(v53), 
        FrameRateManager = v22.createElement(v54), 
        LocaleManager = v22.createElement(v55, {
            localization = v185._localization
        }), 
        EventStreamUpdater = v22.createElement(v48, {
            releasePeriod = v136
        }), 
        LocalStorageListener = v22.createElement(v56), 
        MutedErrorReporter = v22.createElement(v50, {
            appName = l_appName_0
        }), 
        BacktraceReporterAdaptor = v22.createElement(v85), 
        SessionManager = v22.createElement(v58, {
            connectRouteSignal = v185._connectRouteSignal
        }), 
        UserHeartbeatsManager = v22.createElement(v59), 
        SiteAlertManager = v22.createElement(v63), 
        ContactImporterManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v22.createElement(v142), 
        AppBackgroundSoundManager = if v141() then v22.createElement(v137) else nil, 
        AppUpdateManager = v22.createElement(v117), 
        UserAgreementsManager = v22.createElement(v167), 
        QueryRefetchManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v22.createElement(v144, {
            robloxEventReceiver = v185._robloxEventReceiver
        }), 
        AppReadyHandler = v22.createElement(l_AppReadyHandler_0), 
        RnBypassAdapter = v22.createElement(l_RnBypassAdapter_0, {
            rnBypassActionSignal = v185._rnBypassActionSignal, 
            ApplyRoactNavigationHistory = v140, 
            updateRoute = v185._updateRoute
        }), 
        AppChatToastManagerUA = v22.createElement(l_AppChatToastManagerUA_0), 
        AppConfigurer = v22.createElement(v41, {
            store = v185._store
        }), 
        StartupMessageContainer = v22.createElement(l_StartupMessageContainer_0), 
        BugReporterEventReceiver = if v154.GetFFlagEnableInAppBugReporting() then v22.createElement(l_BugReporterEventReceiver_0) else nil, 
        SocialGraphSyncManager = v22.createElement(l_SocialGraphSyncManager_0), 
        MouseCursorHandler = v22.createElement(v151), 
        PostAppInteractiveLoader = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then v22.createElement(v158) else nil
    };
    return v22.createElement(l_ProviderContainer_0, {
        providers = v188
    }, {
        CursorProvider = v22.createElement(l_SelectionCursorProvider_0, {}, {
            NewCursorProvider = v22.createElement(l_CursorProvider_0, {}, v191)
        })
    });
end;
v169.willUnmount = function(_) --[[ Line: 701 ]] --[[ Name: willUnmount ]]
    -- upvalues: v154 (copy), v156 (ref)
    if v154.FFlagLuaAppUseAppHttpStore then
        v156.Instance._dispose();
    end;
end;
return v169;