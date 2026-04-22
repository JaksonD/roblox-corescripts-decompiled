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
local l_Middleware_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Middleware;
local l_FFlagAppChatSignalsMessageStore_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Flags.FFlagAppChatSignalsMessageStore;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_FFlagEnableSignalsMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSignalsMiddleware;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v93 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v94 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v95 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
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
local v110 = require(l_Modules_0.LuaApp.Components.Session.SessionServiceWrapper);
local v111 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v112 = require(l_Modules_0.LuaApp.Http.wrapRequestWithMiddleware);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v116 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
local v117 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local l_AppUpdateServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).AppUpdateServiceWrapper;
local v119 = require(l_Modules_0.LuaApp.Components.AppUpdate.AppUpdateManager);
local v120 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local v122 = require(l_Modules_0.LuaApp.Experiment.ExperienceMenuIXPPreload);
local v123 = require(l_Modules_0.LuaApp.Experiment.WidgetStoreIXP);
local v124 = require(l_Modules_0.LuaApp.Experiment.AndroidWidgetStoreIXP);
local v125 = require(l_Modules_0.LuaApp.Experiment.IOSUIRefactorIXP);
local v126 = require(l_Modules_0.LuaApp.Experiment.IosAuthServiceIxpStore);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v128 = require(l_Modules_0.LuaApp.Services.CommonGameEvents);
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_createPerformFetchMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.Http).createPerformFetchMiddleware;
local l_AppStartupMessageService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupMessageService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local l_ShareTargetGamePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies;
local v138 = tonumber(settings():GetFVariable("LuaAnalyticsReleasePeriod"));
local v139 = require(l_Modules_0.LuaApp.Components.AppSound.BackgroundSoundManager);
local v140 = require(l_Modules_0.LuaApp.Components.EventReceivers.NativeShellEventReceiver);
local v141 = require(l_Modules_0.LuaApp.Thunks.RNAdapterThunk);
local v142 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v143 = require(l_Modules_0.LuaApp.Util.getHasBackgroundMusic);
local v144 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.LuaApp.Components.ContactImporter.ContactImporterManagerWrapper);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Utils.getLegacyRouteFromRoactNavigationState;
local v146 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_CorePackages_0.Workspace.Packages.QueryRefetch).QueryRefetchManager;
local l_StartupMessageContainer_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).StartupMessageContainer;
local l_SocialGraphSyncManager_0 = require(l_CorePackages_0.Workspace.Packages.SocialGraphSync).SocialGraphSyncManager;
local l_FeedbackManagerInjectionContextProvider_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider;
local l_AppInteractionFeedbackProvider_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_BugReporterEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.BugReporting).BugReporterEventReceiver;
local v153 = require(l_Modules_0.LuaApp.Util.MouseCursorHandler);
if require(l_Modules_0.LuaApp.Bootcamp.Util.EnableLuaAppBootcamp)() then
    local l_status_0, l_result_0 = pcall(require, l_Modules_0.LuaApp.Bootcamp.Util.LuaAppBootcampUtil);
    if l_status_0 then
        l_result_0.runBootcamp();
    else
        warn("Failed to require Bootcamp modules.");
    end;
end;
local v156 = {
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
local v157 = nil;
local v158 = nil;
if v156.FFlagLuaAppUseAppHttpStore then
    v157 = require(l_Modules_0.LuaApp.Util.createAppHttpStoreWrapper);
    v158 = require(l_CorePackages_0.Workspace.Packages.HttpStore);
end;
local v159 = {
    AvatarSceneInteractionProvider = require(l_Modules_0.AvatarExperience.Common.Context.SceneInteractionProvider), 
    BodyDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.BodyDataProvider), 
    AdjustmentDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.AdjustmentData.AdjustmentDataProvider), 
    AppliedDescriptionProvider = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.AppliedDescriptionProvider), 
    AvatarSaveContextProvider = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.AvatarSaveContextProvider
};
local v160 = require(l_Modules_0.LuaApp.UniversalApp.PostAppInteractiveLoader);
local v161 = require(l_Modules_0.LuaApp.Components.ApolloClient);
local v162 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v163 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v164 = require(l_Modules_0.Personalization.OmniFeed.makeOmniFeedService);
local function _(v165) --[[ Line: 258 ]] --[[ Name: createAppContainer ]]
    -- upvalues: v22 (copy), v27 (copy)
    local v166 = v22.PureComponent:extend("NavigationAppContainer");
    v166.router = v165.router;
    v166.render = function(v167) --[[ Line: 261 ]] --[[ Name: render ]]
        return v167.props.children;
    end;
    return v27.createAppContainer(v166);
end;
local function v169() --[[ Line: 267 ]] --[[ Name: UserAgreementsManager ]]
    -- upvalues: l_useUserAgreements_0 (copy)
    l_useUserAgreements_0();
    return nil;
end;
local v170 = if v20.FFlagUseSignalsRoduxStore then require(l_CorePackages_0.Workspace.Packages.SignalsRodux).createStore else v23.Store.new;
local v171 = v22.Component:extend("UniversalApp");
v171.defaultProps = {
    httpService = l_HttpService_0, 
    rbxAnalyticsService = if v156.GetFFlagInjectAnalyticsService() then l_RbxAnalyticsService_0 else nil, 
    ixpService = if v156.GetFFlagInjectAnalyticsService() then l_IXPService_0 else nil
};
v171.init = function(v172) --[[ Line: 288 ]] --[[ Name: init ]]
    -- upvalues: v30 (copy), v49 (copy), l_AvatarEditorService_0 (copy), v156 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v23 (copy), v36 (copy), v141 (copy), l_createPerformFetchMiddleware_0 (copy), l_FFlagAppChatSignalsMessageStore_0 (copy), l_Middleware_0 (copy), l_FFlagEnableSignalsMiddleware_0 (copy), l_CorePackages_0 (copy), l_Modules_0 (copy), v62 (copy), v61 (copy), v170 (copy), v38 (copy), v162 (copy), v22 (copy), v27 (copy), v37 (copy), l_SystemInfoProtocol_0 (copy), l_LinkingProtocol_0 (copy), l_GameProtocol_0 (copy), l_PermissionsProtocol_0 (copy), l_PrefetchProtocol_0 (copy), l_ExternalContentSharingProtocol_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v84 (copy), l_NotificationService_0 (copy), l_GuiService_0 (copy), v157 (ref), l_requestInternalWrapper_0 (copy), v110 (copy), l_SessionService_0 (copy), l_StartupMessageService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), l_game_EngineFeature_0 (copy), l_AppUpdateServiceWrapper_0 (copy), v13 (copy), v128 (copy), v25 (copy), l_getLegacyRouteFromRoactNavigationState_0 (copy), v57 (copy), v112 (copy), l_InAppAchievementManager_0 (copy), v43 (copy), v47 (copy), v164 (copy)
    v30.default:logEventOnce("universal_app_init_begin");
    v172._pageObjectManager = v49.new();
    local v173 = {
        avatarEditorService = l_AvatarEditorService_0, 
        pageObjectManager = v172._pageObjectManager
    };
    local v174 = {
        if v156.FFlagLuaAppLaunchTrackThunks and l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then l_DiscoveryAppLaunchTracker_0.default.roduxTracker:makeThunkMiddleware(v173) else v23.makeThunkMiddleware(v173)
    };
    v172._rnBypassActionSignal = v36.new();
    table.insert(v174, (v141.middleware(function(...) --[[ Line: 307 ]]
        -- upvalues: v172 (copy)
        v172._rnBypassActionSignal:fire(...);
    end)));
    table.insert(v174, l_createPerformFetchMiddleware_0(v156.FIntLuaAppBatchFetchingStatusDelayMs / 1000));
    if l_FFlagAppChatSignalsMessageStore_0 then
        table.insert(v174, l_Middleware_0.SignalsMessageIngestionMiddleware);
    end;
    if l_FFlagEnableSignalsMiddleware_0 then
        local v175 = require(l_CorePackages_0.Workspace.Packages.SignalsMiddleware);
        local v176 = require(l_Modules_0.LuaApp.AppSignalsActionHandlers);
        table.insert(v174, v175.createSignalsMiddleware(v176));
    end;
    local v177 = v62(v61);
    local v178 = if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then _G.__RODUX_STORE_DEV_TOOLS__ or l_DiscoveryAppLaunchTracker_0.default.roduxTracker else _G.__RODUX_STORE_DEV_TOOLS__;
    v172._store = v170(v38, nil, v174, v177, v178);
    local l_v162_0 = v162;
    local v180 = v22.PureComponent:extend("NavigationAppContainer");
    v180.router = l_v162_0.router;
    v180.render = function(v181) --[[ Line: 261 ]] --[[ Name: render ]]
        return v181.props.children;
    end;
    v172._appContainer = v27.createAppContainer(v180);
    v172._analytics = if v156.GetFFlagInjectAnalyticsService() then v37.new(v172.props.rbxAnalyticsService) else v37.new();
    v172._systemInfo = l_SystemInfoProtocol_0.default;
    v172._linking = l_LinkingProtocol_0.default;
    v172._logging = v30.default;
    v172._game = l_GameProtocol_0.default;
    v172._permissions = l_PermissionsProtocol_0.default;
    v172._prefetch = l_PrefetchProtocol_0.default;
    v172._externalContentSharing = l_ExternalContentSharingProtocol_0.default;
    v172._localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v172._robloxEventReceiver = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v84.new(l_NotificationService_0);
    v172._guiService = l_GuiService_0;
    if v156.FFlagLuaAppUseAppHttpStore then
        v172._appHttpStore = v157(v172._store, l_requestInternalWrapper_0(v172.props.httpService), v172._guiService);
    end;
    v172._sessionService = if v156.FFlagUseSessionServiceWrapper then v110 else l_SessionService_0;
    v172._startupMessage = l_StartupMessageService_0;
    v172._eventIngest = l_EventIngest_0.new(l_EventIngestService_0);
    v172._appUpdate = l_game_EngineFeature_0 and l_AppUpdateServiceWrapper_0.new(v13) or nil;
    v172._commonGameEvents = v128.get(l_SessionService_0, v172._analytics, v172._eventIngest);
    v172._appStartupSequence = require(l_CorePackages_0.Workspace.Packages.AppStartup).AppStartupSequence.default;
    v172._focusNavigationService = v25.FocusNavigationService.new(v25.EngineInterface.CoreGui);
    pcall(function() --[[ Line: 362 ]]
        -- upvalues: v172 (copy)
        v172._appLifecycleObserverService = game:GetService("AppLifecycleObserverService");
    end);
    v172.routeSignal = v36.new();
    v172._updateRoute = function(v182) --[[ Line: 374 ]]
        -- upvalues: l_getLegacyRouteFromRoactNavigationState_0 (ref), v172 (copy)
        local v183 = l_getLegacyRouteFromRoactNavigationState_0(v182);
        v172.routeSignal:fire(v183);
    end;
    v172._connectRouteSignal = function(v184) --[[ Line: 381 ]]
        -- upvalues: v172 (copy)
        return v172.routeSignal:connect(v184);
    end;
    v57:connectToStore(v172._store);
    v172._appRequestService = v112(l_requestInternalWrapper_0(v172.props.httpService), v172._store, v172._guiService);
    v172._achievementManager = l_InAppAchievementManager_0.new(v172._store);
    v172._profilerContext = v43.Profiling.createReactProfilerContext();
    v47.createAppLaunchReactProfilerLogger(v172._profilerContext, "home_page_interactive");
    v164();
    if v156.FFlagEnableReadAloudInUA then
        require(l_CorePackages_0.Workspace.Packages.ReadAloud).ConnectReadAloudToSettings();
    end;
    v30.default:logEventOnce("universal_app_init_end");
end;
v171.appendRoactServiceProviders = function(v185, v186) --[[ Line: 405 ]] --[[ Name: appendRoactServiceProviders ]]
    -- upvalues: l_RoactServices_0 (copy), v93 (copy), v94 (copy), v95 (copy), l_AppBrowserService_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_BrowserService_0 (copy), l_AppNotificationService_0 (copy), l_NotificationService_0 (copy), l_AppGuiService_0 (copy), l_AppSystemInfo_0 (copy), l_AppLinking_0 (copy), l_AppLogging_0 (copy), l_AppGame_0 (copy), l_AppPermissions_0 (copy), l_AppPrefetch_0 (copy), l_AppRunService_0 (copy), l_RunService_0 (copy), l_AppContentProvider_0 (copy), l_ContentProvider_0 (copy), l_AppUserInputService_0 (copy), l_UserInputService_0 (copy), l_AppAppLifecycleObserverService_0 (copy), l_AppSessionService_0 (copy), v111 (copy), l_AppUserGameSettings_0 (copy), l_UserGameSettings_0 (copy), l_AppUpdateService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppStartupSequenceTag_0 (copy), l_AppStartupMessageService_0 (copy)
    table.insert(v186, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [v93] = v185._analytics, 
                [v94] = v185._localization, 
                [v95] = v185._appRequestService, 
                [l_AppBrowserService_0] = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_BrowserService_0, 
                [l_AppNotificationService_0] = l_NotificationService_0, 
                [l_AppGuiService_0] = v185._guiService, 
                [l_AppSystemInfo_0] = v185._systemInfo, 
                [l_AppLinking_0] = v185._linking, 
                [l_AppLogging_0] = v185._logging, 
                [l_AppGame_0] = v185._game, 
                [l_AppPermissions_0] = v185._permissions, 
                [l_AppPrefetch_0] = v185._prefetch, 
                [l_AppRunService_0] = l_RunService_0, 
                [l_AppContentProvider_0] = l_ContentProvider_0, 
                [l_AppUserInputService_0] = l_UserInputService_0, 
                [l_AppAppLifecycleObserverService_0] = v185._appLifecycleObserverService, 
                [l_AppSessionService_0] = v185._sessionService, 
                [v111] = v185._eventIngest, 
                [l_AppUserGameSettings_0] = l_UserGameSettings_0, 
                [l_AppUpdateService_0] = v185._appUpdate, 
                [l_RoactAnalyticsCommonGameEvents_0] = v185._commonGameEvents, 
                [l_AppStartupSequenceTag_0] = v185._appStartupSequence, 
                [l_AppStartupMessageService_0] = v185._startupMessage
            }
        }
    });
end;
v171.render = function(v187) --[[ Line: 439 ]] --[[ Name: render ]]
    -- upvalues: v77 (copy), l_ReactProfilerContext_0 (copy), l_ReactProfiler_0 (copy), v163 (copy), v120 (copy), v156 (copy), l_IXPService_0 (copy), v24 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_AvatarPolicies_0 (copy), l_SharePolicies_0 (copy), l_ShareTargetGamePolicies_0 (copy), v42 (copy), l_DesignTokenProvider_0 (copy), v72 (copy), v73 (copy), v76 (copy), v70 (copy), v25 (copy), l_Provider_0 (copy), v159 (copy), v116 (copy), v117 (copy), l_ApolloProvider_0 (copy), v161 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_FeedbackManagerInjectionContextProvider_0 (copy), v34 (copy), l_SquadExternalContractProvider_0 (copy), v86 (copy), l_SquadLocationEnum_0 (copy), v83 (copy), v140 (copy), v122 (copy), v123 (copy), v124 (copy), v125 (copy), v126 (copy), v22 (copy), v82 (copy), v51 (copy), v52 (copy), v53 (copy), v54 (copy), v55 (copy), v48 (copy), v138 (copy), v56 (copy), v50 (copy), v85 (copy), v58 (copy), v59 (copy), v63 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v144 (copy), v143 (copy), v139 (copy), v119 (copy), v169 (copy), v146 (copy), l_AppReadyHandler_0 (copy), l_RnBypassAdapter_0 (copy), v142 (copy), l_AppChatToastManagerUA_0 (copy), v41 (copy), l_StartupMessageContainer_0 (copy), l_BugReporterEventReceiver_0 (copy), l_SocialGraphSyncManager_0 (copy), v153 (copy), v160 (copy), l_ProviderContainer_0 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy)
    local l_appName_0 = v187.props.appName;
    local l_v77_0 = v77;
    local v190 = {};
    table.insert(v190, {
        class = l_ReactProfilerContext_0.Provider, 
        props = {
            value = v187._profilerContext
        }
    });
    table.insert(v190, {
        class = l_ReactProfiler_0, 
        props = {
            id = "UniversalApp"
        }
    });
    table.insert(v190, {
        class = v187._appContainer, 
        props = {
            onNavigationStateChange = v163("UniversalApp")
        }
    });
    table.insert(v190, {
        class = v120.Provider, 
        props = {
            value = if v156.GetFFlagInjectAnalyticsService() then v187.props.ixpService else l_IXPService_0
        }
    });
    table.insert(v190, {
        class = v24.StoreProvider, 
        props = {
            store = v187._store
        }
    });
    table.insert(v190, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0, 
                l_AvatarPolicies_0, 
                l_SharePolicies_0, 
                if v156.FFlagShareTargetGameCleanup then nil else l_ShareTargetGamePolicies_0
            }, 
            policyData = if v156.GetFFlagInjectAnalyticsService() then v187.props.policyData else nil
        }
    });
    v187:appendRoactServiceProviders(v190);
    local v191 = {
        themeName = "dark", 
        fontName = "gotham"
    };
    table.insert(v190, {
        class = v42, 
        props = {
            style = v191
        }
    });
    table.insert(v190, {
        class = l_DesignTokenProvider_0, 
        props = {
            tokenMappers = v72
        }
    });
    table.insert(v190, {
        class = v73
    });
    table.insert(v190, {
        class = v76, 
        props = {
            theme = l_v77_0, 
            themeName = "dark"
        }
    });
    table.insert(v190, {
        class = v70, 
        props = {
            localization = v187._localization
        }
    });
    table.insert(v190, {
        class = v25.FocusNavigationContext.Provider, 
        props = {
            value = v187._focusNavigationService
        }
    });
    table.insert(v190, {
        class = l_Provider_0
    });
    table.insert(v190, {
        class = v159.AvatarSceneInteractionProvider
    });
    table.insert(v190, {
        class = v159.BodyDataProvider
    });
    table.insert(v190, {
        class = v159.AdjustmentDataProvider
    });
    table.insert(v190, {
        class = v159.AppliedDescriptionProvider
    });
    table.insert(v190, {
        class = v159.AvatarSaveContextProvider
    });
    table.insert(v190, {
        class = v116.Provider
    });
    table.insert(v190, {
        class = v117.Provider, 
        props = {
            pageObjectManager = v187._pageObjectManager
        }
    });
    table.insert(v190, {
        class = l_ApolloProvider_0, 
        props = {
            client = v161
        }
    });
    table.insert(v190, {
        class = l_AppInteractionFeedbackProvider_0
    });
    table.insert(v190, {
        class = l_FeedbackManagerInjectionContextProvider_0
    });
    table.insert(v190, {
        class = v34.ResponsiveProvider
    });
    if v156.GetFFlagIsSquadEnabled() then
        table.insert(v190, {
            class = l_SquadExternalContractProvider_0, 
            props = {
                contract = v86, 
                squadLocation = l_SquadLocationEnum_0.UniversalApp
            }
        });
    end;
    if v156.FFlagLuaAppSupportFoundationOverlayInVR then
        table.insert(v190, {
            class = v83
        });
    end;
    local v192 = {};
    table.insert(v192, v140);
    table.insert(v192, v122);
    if v156.GetFFlagEnableWidgetLUAIXP() or v156.FFlagEnableLockScreenWidgetLuaIXP then
        table.insert(v192, v123);
    end;
    if v156.GetFFlagEnableAndroidWidgetsLuaIXP() then
        table.insert(v192, v124);
    end;
    if v156.GetFFlagEnableIOSUIRefactorLuaIXP() then
        table.insert(v192, v125);
    end;
    if v156.GetFFlagEnableIosAuthServiceLuaIXP() then
        table.insert(v192, v126);
    end;
    local v193 = {
        EventReceivers = v22.createElement(v82), 
        MemStorageSubscribers = next(v192) and v22.createElement(v51, {
            receiverComponents = v192
        }) or nil, 
        LocalPlayerManager = v22.createElement(v52), 
        ViewportManager = v22.createElement(v53), 
        FrameRateManager = v22.createElement(v54), 
        LocaleManager = v22.createElement(v55, {
            localization = v187._localization
        }), 
        EventStreamUpdater = v22.createElement(v48, {
            releasePeriod = v138
        }), 
        LocalStorageListener = v22.createElement(v56), 
        MutedErrorReporter = v22.createElement(v50, {
            appName = l_appName_0
        }), 
        BacktraceReporterAdaptor = v22.createElement(v85), 
        SessionManager = v22.createElement(v58, {
            connectRouteSignal = v187._connectRouteSignal
        }), 
        UserHeartbeatsManager = v22.createElement(v59), 
        SiteAlertManager = v22.createElement(v63), 
        ContactImporterManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v22.createElement(v144), 
        AppBackgroundSoundManager = if v143() then v22.createElement(v139) else nil, 
        AppUpdateManager = v22.createElement(v119), 
        UserAgreementsManager = v22.createElement(v169), 
        QueryRefetchManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v22.createElement(v146, {
            robloxEventReceiver = v187._robloxEventReceiver
        }), 
        AppReadyHandler = v22.createElement(l_AppReadyHandler_0), 
        RnBypassAdapter = v22.createElement(l_RnBypassAdapter_0, {
            rnBypassActionSignal = v187._rnBypassActionSignal, 
            ApplyRoactNavigationHistory = v142, 
            updateRoute = v187._updateRoute
        }), 
        AppChatToastManagerUA = v22.createElement(l_AppChatToastManagerUA_0), 
        AppConfigurer = v22.createElement(v41, {
            store = v187._store
        }), 
        StartupMessageContainer = v22.createElement(l_StartupMessageContainer_0), 
        BugReporterEventReceiver = if v156.GetFFlagEnableInAppBugReporting() then v22.createElement(l_BugReporterEventReceiver_0) else nil, 
        SocialGraphSyncManager = v22.createElement(l_SocialGraphSyncManager_0), 
        MouseCursorHandler = v22.createElement(v153), 
        PostAppInteractiveLoader = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then v22.createElement(v160) else nil
    };
    return v22.createElement(l_ProviderContainer_0, {
        providers = v190
    }, {
        CursorProvider = v22.createElement(l_SelectionCursorProvider_0, {}, {
            NewCursorProvider = v22.createElement(l_CursorProvider_0, {}, v193)
        })
    });
end;
v171.willUnmount = function(_) --[[ Line: 708 ]] --[[ Name: willUnmount ]]
    -- upvalues: v156 (copy), v158 (ref)
    if v156.FFlagLuaAppUseAppHttpStore then
        v158.Instance._dispose();
    end;
end;
return v171;