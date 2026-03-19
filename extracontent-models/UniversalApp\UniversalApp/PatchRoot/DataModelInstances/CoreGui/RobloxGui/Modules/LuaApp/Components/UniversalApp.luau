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
local l_GetFFlagLuaAppPostAppInteractiveLoader_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppPostAppInteractiveLoader;
local v21 = require(l_CorePackages_0.Packages.Roact);
local v22 = require(l_CorePackages_0.Packages.Rodux);
local v23 = require(l_CorePackages_0.Packages.RoactRodux);
local v24 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local v26 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_SystemInfoProtocol_0 = require(l_CorePackages_0.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v29 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_GameProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameProtocol;
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local l_PrefetchProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PrefetchProtocol).PrefetchProtocol;
local v33 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local v35 = require(l_Modules_0.Common.Signal);
local v36 = require(l_Modules_0.Common.Analytics);
local v37 = require(l_Modules_0.LuaApp.AppReducer);
local l_useUserAgreements_0 = require(l_CorePackages_0.Workspace.Packages.UserAgreements).useUserAgreements;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v40 = require(l_Modules_0.LuaApp.Components.AppConfigurer);
local v41 = require(l_Modules_0.LuaApp.Components.AppUiModeStyleProvider);
local v42 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_ProviderContainer_0 = v42.Components.ProviderContainer;
local l_ReactProfiler_0 = v42.Profiling.ReactProfiler;
local l_ReactProfilerContext_0 = v42.Profiling.ReactProfilerContext;
local v46 = require(l_CorePackages_0.Workspace.Packages.UiShellEvents);
local v47 = require(l_Modules_0.LuaApp.Components.EventStreamUpdater);
local v48 = require(l_Modules_0.AvatarExperience.Common.Managers.PageObjectManager);
local v49 = require(l_Modules_0.LuaApp.Components.MutedErrorReporter);
local v50 = require(l_Modules_0.LuaApp.Components.MemStorageSubscriberLifecycleAdapter);
local v51 = require(l_Modules_0.LuaApp.Components.LocalPlayerManager);
local v52 = require(l_Modules_0.LuaApp.Components.ViewportManager);
local v53 = require(l_Modules_0.LuaApp.Components.FrameRateManager);
local v54 = require(l_Modules_0.LuaApp.Components.LocaleManager);
local v55 = require(l_Modules_0.LuaApp.Components.LocalStorageListener);
local v56 = require(l_Modules_0.LuaApp.LuaAppBacktraceLogger);
local v57 = require(l_Modules_0.LuaApp.Components.Session.SessionManager);
local v58 = require(l_Modules_0.LuaApp.Components.Session.UserHeartbeatsManager);
local v59 = require(l_CorePackages_0.Packages.UIBlox);
local v60 = require(l_Modules_0.LuaApp.mutedError);
local v61 = require(l_Modules_0.LuaApp.Util.createRoduxErrorReporter);
local v62 = require(l_Modules_0.LuaApp.Components.SiteAlertManager);
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
local v69 = require(l_Modules_0.LuaApp.LocalizationProvider);
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v71 = require(l_Modules_0.LuaApp.DesignTokenMappers.tokenMappers);
local v72 = require(l_Modules_0.LuaApp.Components.AppGridProvider);
local l_SelectionCursorProvider_0 = v59.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v59.App.SelectionCursor.CursorProvider;
local v75 = require(l_Modules_0.LuaApp.ThemeProvider);
local v76 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local l_ApolloProvider_0 = require(l_CorePackages_0.Packages.ApolloClient).ApolloProvider;
local v78 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local l_SquadExternalContractProvider_0 = v78.SquadExternalContractProvider.SquadExternalContractProvider;
local l_SquadLocationEnum_0 = v78.Enums.SquadLocationEnum;
local v81 = require(l_Modules_0.LuaApp.Components.UniversalAppEventReceivers);
local v82 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRFoundationOverlayProvider);
local v83 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v84 = require(l_Modules_0.LuaApp.Components.LuaAppBacktraceReporterAdaptor);
local v85 = require(l_Modules_0.LuaApp.Components.Squad.AppSquadContract);
local l_AppChatToastManagerUA_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.AppChatToastManagerUA;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v89 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v90 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v91 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
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
local v106 = require(l_Modules_0.LuaApp.Components.Session.SessionServiceWrapper);
local v107 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v108 = require(l_Modules_0.LuaApp.Http.wrapRequestWithMiddleware);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v112 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
local v113 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local l_AppUpdateServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).AppUpdateServiceWrapper;
local v115 = require(l_Modules_0.LuaApp.Components.AppUpdate.AppUpdateManager);
local v116 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local v118 = require(l_Modules_0.LuaApp.Experiment.ExperienceMenuIXPPreload);
local v119 = require(l_Modules_0.LuaApp.Experiment.WidgetStoreIXP);
local v120 = require(l_Modules_0.LuaApp.Experiment.IOSUIRefactorIXP);
local v121 = require(l_Modules_0.LuaApp.Experiment.IosAuthServiceIxpStore);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v123 = require(l_Modules_0.LuaApp.Services.CommonGameEvents);
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_createPerformFetchMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.Http).createPerformFetchMiddleware;
local l_AppStartupMessageService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupMessageService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local l_ShareTargetGamePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies;
local v133 = tonumber(settings():GetFVariable("LuaAnalyticsReleasePeriod"));
local v134 = require(l_Modules_0.LuaApp.Components.AppSound.BackgroundSoundManager);
local v135 = require(l_Modules_0.LuaApp.Components.EventReceivers.NativeShellEventReceiver);
local v136 = require(l_Modules_0.LuaApp.Thunks.RNAdapterThunk);
local v137 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v138 = require(l_Modules_0.LuaApp.Util.getHasBackgroundMusic);
local v139 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.LuaApp.Components.ContactImporter.ContactImporterManagerWrapper);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Utils.getLegacyRouteFromRoactNavigationState;
local v141 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_CorePackages_0.Workspace.Packages.QueryRefetch).QueryRefetchManager;
local l_StartupMessageContainer_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).StartupMessageContainer;
local l_SocialGraphSyncManager_0 = require(l_CorePackages_0.Workspace.Packages.SocialGraphSync).SocialGraphSyncManager;
local l_FeedbackManagerInjectionContextProvider_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider;
local l_AppInteractionFeedbackProvider_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_BugReporterEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.BugReporting).BugReporterEventReceiver;
local v148 = require(l_Modules_0.LuaApp.Util.MouseCursorHandler);
if require(l_Modules_0.LuaApp.Bootcamp.Util.EnableLuaAppBootcamp)() then
    local l_status_0, l_result_0 = pcall(require, l_Modules_0.LuaApp.Bootcamp.Util.LuaAppBootcampUtil);
    if l_status_0 then
        l_result_0.runBootcamp();
    else
        warn("Failed to require Bootcamp modules.");
    end;
end;
local v151 = {
    FIntLuaAppBatchFetchingStatusDelayMs = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntLuaAppBatchFetchingStatusDelayMs, 
    GetFFlagInjectAnalyticsService = require(l_Modules_0.LuaApp.Flags.GetFFlagInjectAnalyticsService), 
    GetFFlagIsSquadEnabled = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled, 
    FFlagUseSessionServiceWrapper = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppUseSessionServiceWrapper), 
    FFlagLuaAppLaunchTrackThunks = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).Flags.FFlagLuaAppLaunchTrackThunks, 
    GetFFlagEnableWidgetLUAIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableWidgetLUAIXP, 
    GetFFlagEnableIOSUIRefactorLuaIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableIOSUIRefactorLuaIXP, 
    FFlagEnableLockScreenWidgetLuaIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLockScreenWidgetLuaIXP, 
    GetFFlagEnableInAppBugReporting = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableInAppBugReporting, 
    FFlagShareTargetGameCleanup = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagShareTargetGameCleanup, 
    FFlagEnableReadAloudInUA = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReadAloudInUA(), 
    FFlagLuaAppSupportFoundationOverlayInVR = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSupportFoundationOverlayInVR, 
    FFlagLuaAppUseAppHttpStore = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUseAppHttpStore, 
    GetFFlagEnableIosAuthServiceLuaIXP = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableIosAuthServiceLuaIXP
};
local v152 = nil;
local v153 = nil;
if v151.FFlagLuaAppUseAppHttpStore then
    v152 = require(l_Modules_0.LuaApp.Util.createAppHttpStoreWrapper);
    v153 = require(l_CorePackages_0.Workspace.Packages.HttpStore);
end;
local v154 = {
    AvatarSceneInteractionProvider = require(l_Modules_0.AvatarExperience.Common.Context.SceneInteractionProvider), 
    BodyDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.BodyDataProvider), 
    AdjustmentDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.AdjustmentData.AdjustmentDataProvider), 
    AppliedDescriptionProvider = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.AppliedDescriptionProvider), 
    AvatarSaveContextProvider = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.AvatarSaveContextProvider
};
local v155 = require(l_Modules_0.LuaApp.UniversalApp.PostAppInteractiveLoader);
local v156 = require(l_Modules_0.LuaApp.Components.ApolloClient);
local v157 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v158 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v159 = require(l_Modules_0.Personalization.OmniFeed.makeOmniFeedService);
local function _(v160) --[[ Line: 252 ]] --[[ Name: createAppContainer ]]
    -- upvalues: v21 (copy), v26 (copy)
    local v161 = v21.PureComponent:extend("NavigationAppContainer");
    v161.router = v160.router;
    v161.render = function(v162) --[[ Line: 255 ]] --[[ Name: render ]]
        return v162.props.children;
    end;
    return v26.createAppContainer(v161);
end;
local function v164() --[[ Line: 261 ]] --[[ Name: UserAgreementsManager ]]
    -- upvalues: l_useUserAgreements_0 (copy)
    l_useUserAgreements_0();
    return nil;
end;
local v165 = v21.Component:extend("UniversalApp");
v165.defaultProps = {
    httpService = l_HttpService_0, 
    rbxAnalyticsService = if v151.GetFFlagInjectAnalyticsService() then l_RbxAnalyticsService_0 else nil, 
    ixpService = if v151.GetFFlagInjectAnalyticsService() then l_IXPService_0 else nil
};
v165.init = function(v166) --[[ Line: 278 ]] --[[ Name: init ]]
    -- upvalues: v29 (copy), v48 (copy), l_AvatarEditorService_0 (copy), v151 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v22 (copy), v35 (copy), v136 (copy), l_createPerformFetchMiddleware_0 (copy), v61 (copy), v60 (copy), v37 (copy), v157 (copy), v21 (copy), v26 (copy), v36 (copy), l_SystemInfoProtocol_0 (copy), l_LinkingProtocol_0 (copy), l_GameProtocol_0 (copy), l_PermissionsProtocol_0 (copy), l_PrefetchProtocol_0 (copy), l_ExternalContentSharingProtocol_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v83 (copy), l_NotificationService_0 (copy), l_GuiService_0 (copy), v152 (ref), l_requestInternalWrapper_0 (copy), v106 (copy), l_SessionService_0 (copy), l_StartupMessageService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), l_game_EngineFeature_0 (copy), l_AppUpdateServiceWrapper_0 (copy), v13 (copy), v123 (copy), l_CorePackages_0 (copy), v24 (copy), l_getLegacyRouteFromRoactNavigationState_0 (copy), v56 (copy), v108 (copy), l_InAppAchievementManager_0 (copy), v42 (copy), v46 (copy), v159 (copy)
    v29.default:logEventOnce("universal_app_init_begin");
    v166._pageObjectManager = v48.new();
    local v167 = {
        avatarEditorService = l_AvatarEditorService_0, 
        pageObjectManager = v166._pageObjectManager
    };
    local v168 = {
        if v151.FFlagLuaAppLaunchTrackThunks and l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then l_DiscoveryAppLaunchTracker_0.default.roduxTracker:makeThunkMiddleware(v167) else v22.makeThunkMiddleware(v167)
    };
    v166._rnBypassActionSignal = v35.new();
    table.insert(v168, (v136.middleware(function(...) --[[ Line: 297 ]]
        -- upvalues: v166 (copy)
        v166._rnBypassActionSignal:fire(...);
    end)));
    table.insert(v168, l_createPerformFetchMiddleware_0(v151.FIntLuaAppBatchFetchingStatusDelayMs / 1000));
    local v169 = v61(v60);
    local v170 = if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then _G.__RODUX_STORE_DEV_TOOLS__ or l_DiscoveryAppLaunchTracker_0.default.roduxTracker else _G.__RODUX_STORE_DEV_TOOLS__;
    v166._store = v22.Store.new(v37, nil, v168, v169, v170);
    local l_v157_0 = v157;
    local v172 = v21.PureComponent:extend("NavigationAppContainer");
    v172.router = l_v157_0.router;
    v172.render = function(v173) --[[ Line: 255 ]] --[[ Name: render ]]
        return v173.props.children;
    end;
    v166._appContainer = v26.createAppContainer(v172);
    v166._analytics = if v151.GetFFlagInjectAnalyticsService() then v36.new(v166.props.rbxAnalyticsService) else v36.new();
    v166._systemInfo = l_SystemInfoProtocol_0.default;
    v166._linking = l_LinkingProtocol_0.default;
    v166._logging = v29.default;
    v166._game = l_GameProtocol_0.default;
    v166._permissions = l_PermissionsProtocol_0.default;
    v166._prefetch = l_PrefetchProtocol_0.default;
    v166._externalContentSharing = l_ExternalContentSharingProtocol_0.default;
    v166._localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v166._robloxEventReceiver = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v83.new(l_NotificationService_0);
    v166._guiService = l_GuiService_0;
    if v151.FFlagLuaAppUseAppHttpStore then
        v166._appHttpStore = v152(v166._store, l_requestInternalWrapper_0(v166.props.httpService), v166._guiService);
    end;
    v166._sessionService = if v151.FFlagUseSessionServiceWrapper then v106 else l_SessionService_0;
    v166._startupMessage = l_StartupMessageService_0;
    v166._eventIngest = l_EventIngest_0.new(l_EventIngestService_0);
    v166._appUpdate = l_game_EngineFeature_0 and l_AppUpdateServiceWrapper_0.new(v13) or nil;
    v166._commonGameEvents = v123.get(l_SessionService_0, v166._analytics, v166._eventIngest);
    v166._appStartupSequence = require(l_CorePackages_0.Workspace.Packages.AppStartup).AppStartupSequence.default;
    v166._focusNavigationService = v24.FocusNavigationService.new(v24.EngineInterface.CoreGui);
    pcall(function() --[[ Line: 341 ]]
        -- upvalues: v166 (copy)
        v166._appLifecycleObserverService = game:GetService("AppLifecycleObserverService");
    end);
    v166.routeSignal = v35.new();
    v166._updateRoute = function(v174) --[[ Line: 353 ]]
        -- upvalues: l_getLegacyRouteFromRoactNavigationState_0 (ref), v166 (copy)
        local v175 = l_getLegacyRouteFromRoactNavigationState_0(v174);
        v166.routeSignal:fire(v175);
    end;
    v166._connectRouteSignal = function(v176) --[[ Line: 360 ]]
        -- upvalues: v166 (copy)
        return v166.routeSignal:connect(v176);
    end;
    v56:connectToStore(v166._store);
    v166._appRequestService = v108(l_requestInternalWrapper_0(v166.props.httpService), v166._store, v166._guiService);
    v166._achievementManager = l_InAppAchievementManager_0.new(v166._store);
    v166._profilerContext = v42.Profiling.createReactProfilerContext();
    v46.createAppLaunchReactProfilerLogger(v166._profilerContext, "home_page_interactive");
    v159();
    if v151.FFlagEnableReadAloudInUA then
        require(l_CorePackages_0.Workspace.Packages.ReadAloud).ConnectReadAloudToSettings();
    end;
    v29.default:logEventOnce("universal_app_init_end");
end;
v165.appendRoactServiceProviders = function(v177, v178) --[[ Line: 384 ]] --[[ Name: appendRoactServiceProviders ]]
    -- upvalues: l_RoactServices_0 (copy), v89 (copy), v90 (copy), v91 (copy), l_AppBrowserService_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_BrowserService_0 (copy), l_AppNotificationService_0 (copy), l_NotificationService_0 (copy), l_AppGuiService_0 (copy), l_AppSystemInfo_0 (copy), l_AppLinking_0 (copy), l_AppLogging_0 (copy), l_AppGame_0 (copy), l_AppPermissions_0 (copy), l_AppPrefetch_0 (copy), l_AppRunService_0 (copy), l_RunService_0 (copy), l_AppContentProvider_0 (copy), l_ContentProvider_0 (copy), l_AppUserInputService_0 (copy), l_UserInputService_0 (copy), l_AppAppLifecycleObserverService_0 (copy), l_AppSessionService_0 (copy), v107 (copy), l_AppUserGameSettings_0 (copy), l_UserGameSettings_0 (copy), l_AppUpdateService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppStartupSequenceTag_0 (copy), l_AppStartupMessageService_0 (copy)
    table.insert(v178, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [v89] = v177._analytics, 
                [v90] = v177._localization, 
                [v91] = v177._appRequestService, 
                [l_AppBrowserService_0] = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_BrowserService_0, 
                [l_AppNotificationService_0] = l_NotificationService_0, 
                [l_AppGuiService_0] = v177._guiService, 
                [l_AppSystemInfo_0] = v177._systemInfo, 
                [l_AppLinking_0] = v177._linking, 
                [l_AppLogging_0] = v177._logging, 
                [l_AppGame_0] = v177._game, 
                [l_AppPermissions_0] = v177._permissions, 
                [l_AppPrefetch_0] = v177._prefetch, 
                [l_AppRunService_0] = l_RunService_0, 
                [l_AppContentProvider_0] = l_ContentProvider_0, 
                [l_AppUserInputService_0] = l_UserInputService_0, 
                [l_AppAppLifecycleObserverService_0] = v177._appLifecycleObserverService, 
                [l_AppSessionService_0] = v177._sessionService, 
                [v107] = v177._eventIngest, 
                [l_AppUserGameSettings_0] = l_UserGameSettings_0, 
                [l_AppUpdateService_0] = v177._appUpdate, 
                [l_RoactAnalyticsCommonGameEvents_0] = v177._commonGameEvents, 
                [l_AppStartupSequenceTag_0] = v177._appStartupSequence, 
                [l_AppStartupMessageService_0] = v177._startupMessage
            }
        }
    });
end;
v165.render = function(v179) --[[ Line: 418 ]] --[[ Name: render ]]
    -- upvalues: v76 (copy), l_ReactProfilerContext_0 (copy), l_ReactProfiler_0 (copy), v158 (copy), v116 (copy), v151 (copy), l_IXPService_0 (copy), v23 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_AvatarPolicies_0 (copy), l_SharePolicies_0 (copy), l_ShareTargetGamePolicies_0 (copy), v41 (copy), l_DesignTokenProvider_0 (copy), v71 (copy), v72 (copy), v75 (copy), v69 (copy), v24 (copy), l_Provider_0 (copy), v154 (copy), v112 (copy), v113 (copy), l_ApolloProvider_0 (copy), v156 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_FeedbackManagerInjectionContextProvider_0 (copy), v33 (copy), l_SquadExternalContractProvider_0 (copy), v85 (copy), l_SquadLocationEnum_0 (copy), v82 (copy), v135 (copy), v118 (copy), v119 (copy), v120 (copy), v121 (copy), v21 (copy), v81 (copy), v50 (copy), v51 (copy), v52 (copy), v53 (copy), v54 (copy), v47 (copy), v133 (copy), v55 (copy), v49 (copy), v84 (copy), v57 (copy), v58 (copy), v62 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v139 (copy), v138 (copy), v134 (copy), v115 (copy), v164 (copy), v141 (copy), l_AppReadyHandler_0 (copy), l_RnBypassAdapter_0 (copy), v137 (copy), l_AppChatToastManagerUA_0 (copy), v40 (copy), l_StartupMessageContainer_0 (copy), l_BugReporterEventReceiver_0 (copy), l_SocialGraphSyncManager_0 (copy), v148 (copy), v155 (copy), l_ProviderContainer_0 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy)
    local l_appName_0 = v179.props.appName;
    local l_v76_0 = v76;
    local v182 = {};
    table.insert(v182, {
        class = l_ReactProfilerContext_0.Provider, 
        props = {
            value = v179._profilerContext
        }
    });
    table.insert(v182, {
        class = l_ReactProfiler_0, 
        props = {
            id = "UniversalApp"
        }
    });
    table.insert(v182, {
        class = v179._appContainer, 
        props = {
            onNavigationStateChange = v158("UniversalApp")
        }
    });
    table.insert(v182, {
        class = v116.Provider, 
        props = {
            value = if v151.GetFFlagInjectAnalyticsService() then v179.props.ixpService else l_IXPService_0
        }
    });
    table.insert(v182, {
        class = v23.StoreProvider, 
        props = {
            store = v179._store
        }
    });
    table.insert(v182, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0, 
                l_AvatarPolicies_0, 
                l_SharePolicies_0, 
                if v151.FFlagShareTargetGameCleanup then nil else l_ShareTargetGamePolicies_0
            }, 
            policyData = if v151.GetFFlagInjectAnalyticsService() then v179.props.policyData else nil
        }
    });
    v179:appendRoactServiceProviders(v182);
    local v183 = {
        themeName = "dark", 
        fontName = "gotham"
    };
    table.insert(v182, {
        class = v41, 
        props = {
            style = v183
        }
    });
    table.insert(v182, {
        class = l_DesignTokenProvider_0, 
        props = {
            tokenMappers = v71
        }
    });
    table.insert(v182, {
        class = v72
    });
    table.insert(v182, {
        class = v75, 
        props = {
            theme = l_v76_0, 
            themeName = "dark"
        }
    });
    table.insert(v182, {
        class = v69, 
        props = {
            localization = v179._localization
        }
    });
    table.insert(v182, {
        class = v24.FocusNavigationContext.Provider, 
        props = {
            value = v179._focusNavigationService
        }
    });
    table.insert(v182, {
        class = l_Provider_0
    });
    table.insert(v182, {
        class = v154.AvatarSceneInteractionProvider
    });
    table.insert(v182, {
        class = v154.BodyDataProvider
    });
    table.insert(v182, {
        class = v154.AdjustmentDataProvider
    });
    table.insert(v182, {
        class = v154.AppliedDescriptionProvider
    });
    table.insert(v182, {
        class = v154.AvatarSaveContextProvider
    });
    table.insert(v182, {
        class = v112.Provider
    });
    table.insert(v182, {
        class = v113.Provider, 
        props = {
            pageObjectManager = v179._pageObjectManager
        }
    });
    table.insert(v182, {
        class = l_ApolloProvider_0, 
        props = {
            client = v156
        }
    });
    table.insert(v182, {
        class = l_AppInteractionFeedbackProvider_0
    });
    table.insert(v182, {
        class = l_FeedbackManagerInjectionContextProvider_0
    });
    table.insert(v182, {
        class = v33.ResponsiveProvider
    });
    if v151.GetFFlagIsSquadEnabled() then
        table.insert(v182, {
            class = l_SquadExternalContractProvider_0, 
            props = {
                contract = v85, 
                squadLocation = l_SquadLocationEnum_0.UniversalApp
            }
        });
    end;
    if v151.FFlagLuaAppSupportFoundationOverlayInVR then
        table.insert(v182, {
            class = v82
        });
    end;
    local v184 = {};
    table.insert(v184, v135);
    table.insert(v184, v118);
    if v151.GetFFlagEnableWidgetLUAIXP() or v151.FFlagEnableLockScreenWidgetLuaIXP then
        table.insert(v184, v119);
    end;
    if v151.GetFFlagEnableIOSUIRefactorLuaIXP() then
        table.insert(v184, v120);
    end;
    if v151.GetFFlagEnableIosAuthServiceLuaIXP() then
        table.insert(v184, v121);
    end;
    local v185 = {
        EventReceivers = v21.createElement(v81), 
        MemStorageSubscribers = next(v184) and v21.createElement(v50, {
            receiverComponents = v184
        }) or nil, 
        LocalPlayerManager = v21.createElement(v51), 
        ViewportManager = v21.createElement(v52), 
        FrameRateManager = v21.createElement(v53), 
        LocaleManager = v21.createElement(v54, {
            localization = v179._localization
        }), 
        EventStreamUpdater = v21.createElement(v47, {
            releasePeriod = v133
        }), 
        LocalStorageListener = v21.createElement(v55), 
        MutedErrorReporter = v21.createElement(v49, {
            appName = l_appName_0
        }), 
        BacktraceReporterAdaptor = v21.createElement(v84), 
        SessionManager = v21.createElement(v57, {
            connectRouteSignal = v179._connectRouteSignal
        }), 
        UserHeartbeatsManager = v21.createElement(v58), 
        SiteAlertManager = v21.createElement(v62), 
        ContactImporterManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v21.createElement(v139), 
        AppBackgroundSoundManager = if v138() then v21.createElement(v134) else nil, 
        AppUpdateManager = v21.createElement(v115), 
        UserAgreementsManager = v21.createElement(v164), 
        QueryRefetchManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v21.createElement(v141, {
            robloxEventReceiver = v179._robloxEventReceiver
        }), 
        AppReadyHandler = v21.createElement(l_AppReadyHandler_0), 
        RnBypassAdapter = v21.createElement(l_RnBypassAdapter_0, {
            rnBypassActionSignal = v179._rnBypassActionSignal, 
            ApplyRoactNavigationHistory = v137, 
            updateRoute = v179._updateRoute
        }), 
        AppChatToastManagerUA = v21.createElement(l_AppChatToastManagerUA_0), 
        AppConfigurer = v21.createElement(v40, {
            store = v179._store
        }), 
        StartupMessageContainer = v21.createElement(l_StartupMessageContainer_0), 
        BugReporterEventReceiver = if v151.GetFFlagEnableInAppBugReporting() then v21.createElement(l_BugReporterEventReceiver_0) else nil, 
        SocialGraphSyncManager = v21.createElement(l_SocialGraphSyncManager_0), 
        MouseCursorHandler = v21.createElement(v148), 
        PostAppInteractiveLoader = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then v21.createElement(v155) else nil
    };
    return v21.createElement(l_ProviderContainer_0, {
        providers = v182
    }, {
        CursorProvider = v21.createElement(l_SelectionCursorProvider_0, {}, {
            NewCursorProvider = v21.createElement(l_CursorProvider_0, {}, v185)
        })
    });
end;
v165.willUnmount = function(_) --[[ Line: 683 ]] --[[ Name: willUnmount ]]
    -- upvalues: v151 (copy), v153 (ref)
    if v151.FFlagLuaAppUseAppHttpStore then
        v153.Instance._dispose();
    end;
end;
return v165;