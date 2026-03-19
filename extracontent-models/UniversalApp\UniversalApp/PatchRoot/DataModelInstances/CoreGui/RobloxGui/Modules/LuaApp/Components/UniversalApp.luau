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
local l_FFlagEnableSignalsMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSignalsMiddleware;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v90 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v91 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v92 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
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
local v107 = require(l_Modules_0.LuaApp.Components.Session.SessionServiceWrapper);
local v108 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v109 = require(l_Modules_0.LuaApp.Http.wrapRequestWithMiddleware);
local l_AppUserGameSettings_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserGameSettings;
local l_AppUpdateService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUpdateService;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v113 = require(l_Modules_0.LuaApp.Context.TopBarSearchSignalContext);
local v114 = require(l_Modules_0.AvatarExperience.Common.Context.PageObjectManagerContext);
local l_AppUpdateServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppUpdate).AppUpdateServiceWrapper;
local v116 = require(l_Modules_0.LuaApp.Components.AppUpdate.AppUpdateManager);
local v117 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local v119 = require(l_Modules_0.LuaApp.Experiment.ExperienceMenuIXPPreload);
local v120 = require(l_Modules_0.LuaApp.Experiment.WidgetStoreIXP);
local v121 = require(l_Modules_0.LuaApp.Experiment.IOSUIRefactorIXP);
local v122 = require(l_Modules_0.LuaApp.Experiment.IosAuthServiceIxpStore);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v124 = require(l_Modules_0.LuaApp.Services.CommonGameEvents);
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_createPerformFetchMiddleware_0 = require(l_CorePackages_0.Workspace.Packages.Http).createPerformFetchMiddleware;
local l_AppStartupMessageService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupMessageService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ChatPolicies;
local l_AvatarPolicies_0 = require(l_CorePackages_0.Workspace.Packages.AvatarPolicies).AvatarPolicies;
local l_SharePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).SharePolicies;
local l_ShareTargetGamePolicies_0 = require(l_CorePackages_0.Workspace.Packages.SocialPolicies).ShareTargetGamePolicies;
local v134 = tonumber(settings():GetFVariable("LuaAnalyticsReleasePeriod"));
local v135 = require(l_Modules_0.LuaApp.Components.AppSound.BackgroundSoundManager);
local v136 = require(l_Modules_0.LuaApp.Components.EventReceivers.NativeShellEventReceiver);
local v137 = require(l_Modules_0.LuaApp.Thunks.RNAdapterThunk);
local v138 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
local v139 = require(l_Modules_0.LuaApp.Util.getHasBackgroundMusic);
local v140 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.LuaApp.Components.ContactImporter.ContactImporterManagerWrapper);
local l_getLegacyRouteFromRoactNavigationState_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Utils.getLegacyRouteFromRoactNavigationState;
local v142 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_CorePackages_0.Workspace.Packages.QueryRefetch).QueryRefetchManager;
local l_StartupMessageContainer_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).StartupMessageContainer;
local l_SocialGraphSyncManager_0 = require(l_CorePackages_0.Workspace.Packages.SocialGraphSync).SocialGraphSyncManager;
local l_FeedbackManagerInjectionContextProvider_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider;
local l_AppInteractionFeedbackProvider_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider;
local l_DiscoveryAppLaunchTracker_0 = require(l_CorePackages_0.Workspace.Packages.AppLaunchTracker).DiscoveryAppLaunchTracker;
local l_BugReporterEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.BugReporting).BugReporterEventReceiver;
local v149 = require(l_Modules_0.LuaApp.Util.MouseCursorHandler);
if require(l_Modules_0.LuaApp.Bootcamp.Util.EnableLuaAppBootcamp)() then
    local l_status_0, l_result_0 = pcall(require, l_Modules_0.LuaApp.Bootcamp.Util.LuaAppBootcampUtil);
    if l_status_0 then
        l_result_0.runBootcamp();
    else
        warn("Failed to require Bootcamp modules.");
    end;
end;
local v152 = {
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
local v153 = nil;
local v154 = nil;
if v152.FFlagLuaAppUseAppHttpStore then
    v153 = require(l_Modules_0.LuaApp.Util.createAppHttpStoreWrapper);
    v154 = require(l_CorePackages_0.Workspace.Packages.HttpStore);
end;
local v155 = {
    AvatarSceneInteractionProvider = require(l_Modules_0.AvatarExperience.Common.Context.SceneInteractionProvider), 
    BodyDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.BodyDataProvider), 
    AdjustmentDataProvider = require(l_Modules_0.AvatarExperience.Common.Context.AdjustmentData.AdjustmentDataProvider), 
    AppliedDescriptionProvider = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.AppliedDescriptionProvider), 
    AvatarSaveContextProvider = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.AvatarSaveContextProvider
};
local v156 = require(l_Modules_0.LuaApp.UniversalApp.PostAppInteractiveLoader);
local v157 = require(l_Modules_0.LuaApp.Components.ApolloClient);
local v158 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v159 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.makeNavigationStateLogger);
local v160 = require(l_Modules_0.Personalization.OmniFeed.makeOmniFeedService);
local function _(v161) --[[ Line: 253 ]] --[[ Name: createAppContainer ]]
    -- upvalues: v21 (copy), v26 (copy)
    local v162 = v21.PureComponent:extend("NavigationAppContainer");
    v162.router = v161.router;
    v162.render = function(v163) --[[ Line: 256 ]] --[[ Name: render ]]
        return v163.props.children;
    end;
    return v26.createAppContainer(v162);
end;
local function v165() --[[ Line: 262 ]] --[[ Name: UserAgreementsManager ]]
    -- upvalues: l_useUserAgreements_0 (copy)
    l_useUserAgreements_0();
    return nil;
end;
local v166 = v21.Component:extend("UniversalApp");
v166.defaultProps = {
    httpService = l_HttpService_0, 
    rbxAnalyticsService = if v152.GetFFlagInjectAnalyticsService() then l_RbxAnalyticsService_0 else nil, 
    ixpService = if v152.GetFFlagInjectAnalyticsService() then l_IXPService_0 else nil
};
v166.init = function(v167) --[[ Line: 279 ]] --[[ Name: init ]]
    -- upvalues: v29 (copy), v48 (copy), l_AvatarEditorService_0 (copy), v152 (copy), l_DiscoveryAppLaunchTracker_0 (copy), v22 (copy), v35 (copy), v137 (copy), l_createPerformFetchMiddleware_0 (copy), l_FFlagEnableSignalsMiddleware_0 (copy), l_CorePackages_0 (copy), l_Modules_0 (copy), v61 (copy), v60 (copy), v37 (copy), v158 (copy), v21 (copy), v26 (copy), v36 (copy), l_SystemInfoProtocol_0 (copy), l_LinkingProtocol_0 (copy), l_GameProtocol_0 (copy), l_PermissionsProtocol_0 (copy), l_PrefetchProtocol_0 (copy), l_ExternalContentSharingProtocol_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v83 (copy), l_NotificationService_0 (copy), l_GuiService_0 (copy), v153 (ref), l_requestInternalWrapper_0 (copy), v107 (copy), l_SessionService_0 (copy), l_StartupMessageService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), l_game_EngineFeature_0 (copy), l_AppUpdateServiceWrapper_0 (copy), v13 (copy), v124 (copy), v24 (copy), l_getLegacyRouteFromRoactNavigationState_0 (copy), v56 (copy), v109 (copy), l_InAppAchievementManager_0 (copy), v42 (copy), v46 (copy), v160 (copy)
    v29.default:logEventOnce("universal_app_init_begin");
    v167._pageObjectManager = v48.new();
    local v168 = {
        avatarEditorService = l_AvatarEditorService_0, 
        pageObjectManager = v167._pageObjectManager
    };
    local v169 = {
        if v152.FFlagLuaAppLaunchTrackThunks and l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then l_DiscoveryAppLaunchTracker_0.default.roduxTracker:makeThunkMiddleware(v168) else v22.makeThunkMiddleware(v168)
    };
    v167._rnBypassActionSignal = v35.new();
    table.insert(v169, (v137.middleware(function(...) --[[ Line: 298 ]]
        -- upvalues: v167 (copy)
        v167._rnBypassActionSignal:fire(...);
    end)));
    table.insert(v169, l_createPerformFetchMiddleware_0(v152.FIntLuaAppBatchFetchingStatusDelayMs / 1000));
    if l_FFlagEnableSignalsMiddleware_0 then
        local v170 = require(l_CorePackages_0.Workspace.Packages.SignalsMiddleware);
        local v171 = require(l_Modules_0.LuaApp.AppSignalsActionHandlers);
        table.insert(v169, v170.createSignalsMiddleware(v171));
    end;
    local v172 = v61(v60);
    local v173 = if l_DiscoveryAppLaunchTracker_0.isEnabled() and l_DiscoveryAppLaunchTracker_0.default then _G.__RODUX_STORE_DEV_TOOLS__ or l_DiscoveryAppLaunchTracker_0.default.roduxTracker else _G.__RODUX_STORE_DEV_TOOLS__;
    v167._store = v22.Store.new(v37, nil, v169, v172, v173);
    local l_v158_0 = v158;
    local v175 = v21.PureComponent:extend("NavigationAppContainer");
    v175.router = l_v158_0.router;
    v175.render = function(v176) --[[ Line: 256 ]] --[[ Name: render ]]
        return v176.props.children;
    end;
    v167._appContainer = v26.createAppContainer(v175);
    v167._analytics = if v152.GetFFlagInjectAnalyticsService() then v36.new(v167.props.rbxAnalyticsService) else v36.new();
    v167._systemInfo = l_SystemInfoProtocol_0.default;
    v167._linking = l_LinkingProtocol_0.default;
    v167._logging = v29.default;
    v167._game = l_GameProtocol_0.default;
    v167._permissions = l_PermissionsProtocol_0.default;
    v167._prefetch = l_PrefetchProtocol_0.default;
    v167._externalContentSharing = l_ExternalContentSharingProtocol_0.default;
    v167._localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    v167._robloxEventReceiver = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v83.new(l_NotificationService_0);
    v167._guiService = l_GuiService_0;
    if v152.FFlagLuaAppUseAppHttpStore then
        v167._appHttpStore = v153(v167._store, l_requestInternalWrapper_0(v167.props.httpService), v167._guiService);
    end;
    v167._sessionService = if v152.FFlagUseSessionServiceWrapper then v107 else l_SessionService_0;
    v167._startupMessage = l_StartupMessageService_0;
    v167._eventIngest = l_EventIngest_0.new(l_EventIngestService_0);
    v167._appUpdate = l_game_EngineFeature_0 and l_AppUpdateServiceWrapper_0.new(v13) or nil;
    v167._commonGameEvents = v124.get(l_SessionService_0, v167._analytics, v167._eventIngest);
    v167._appStartupSequence = require(l_CorePackages_0.Workspace.Packages.AppStartup).AppStartupSequence.default;
    v167._focusNavigationService = v24.FocusNavigationService.new(v24.EngineInterface.CoreGui);
    pcall(function() --[[ Line: 349 ]]
        -- upvalues: v167 (copy)
        v167._appLifecycleObserverService = game:GetService("AppLifecycleObserverService");
    end);
    v167.routeSignal = v35.new();
    v167._updateRoute = function(v177) --[[ Line: 361 ]]
        -- upvalues: l_getLegacyRouteFromRoactNavigationState_0 (ref), v167 (copy)
        local v178 = l_getLegacyRouteFromRoactNavigationState_0(v177);
        v167.routeSignal:fire(v178);
    end;
    v167._connectRouteSignal = function(v179) --[[ Line: 368 ]]
        -- upvalues: v167 (copy)
        return v167.routeSignal:connect(v179);
    end;
    v56:connectToStore(v167._store);
    v167._appRequestService = v109(l_requestInternalWrapper_0(v167.props.httpService), v167._store, v167._guiService);
    v167._achievementManager = l_InAppAchievementManager_0.new(v167._store);
    v167._profilerContext = v42.Profiling.createReactProfilerContext();
    v46.createAppLaunchReactProfilerLogger(v167._profilerContext, "home_page_interactive");
    v160();
    if v152.FFlagEnableReadAloudInUA then
        require(l_CorePackages_0.Workspace.Packages.ReadAloud).ConnectReadAloudToSettings();
    end;
    v29.default:logEventOnce("universal_app_init_end");
end;
v166.appendRoactServiceProviders = function(v180, v181) --[[ Line: 392 ]] --[[ Name: appendRoactServiceProviders ]]
    -- upvalues: l_RoactServices_0 (copy), v90 (copy), v91 (copy), v92 (copy), l_AppBrowserService_0 (copy), l_GetFFlagEnableUnifiedWebViews_0 (copy), l_BrowserService_0 (copy), l_AppNotificationService_0 (copy), l_NotificationService_0 (copy), l_AppGuiService_0 (copy), l_AppSystemInfo_0 (copy), l_AppLinking_0 (copy), l_AppLogging_0 (copy), l_AppGame_0 (copy), l_AppPermissions_0 (copy), l_AppPrefetch_0 (copy), l_AppRunService_0 (copy), l_RunService_0 (copy), l_AppContentProvider_0 (copy), l_ContentProvider_0 (copy), l_AppUserInputService_0 (copy), l_UserInputService_0 (copy), l_AppAppLifecycleObserverService_0 (copy), l_AppSessionService_0 (copy), v108 (copy), l_AppUserGameSettings_0 (copy), l_UserGameSettings_0 (copy), l_AppUpdateService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppStartupSequenceTag_0 (copy), l_AppStartupMessageService_0 (copy)
    table.insert(v181, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [v90] = v180._analytics, 
                [v91] = v180._localization, 
                [v92] = v180._appRequestService, 
                [l_AppBrowserService_0] = if l_GetFFlagEnableUnifiedWebViews_0() then nil else l_BrowserService_0, 
                [l_AppNotificationService_0] = l_NotificationService_0, 
                [l_AppGuiService_0] = v180._guiService, 
                [l_AppSystemInfo_0] = v180._systemInfo, 
                [l_AppLinking_0] = v180._linking, 
                [l_AppLogging_0] = v180._logging, 
                [l_AppGame_0] = v180._game, 
                [l_AppPermissions_0] = v180._permissions, 
                [l_AppPrefetch_0] = v180._prefetch, 
                [l_AppRunService_0] = l_RunService_0, 
                [l_AppContentProvider_0] = l_ContentProvider_0, 
                [l_AppUserInputService_0] = l_UserInputService_0, 
                [l_AppAppLifecycleObserverService_0] = v180._appLifecycleObserverService, 
                [l_AppSessionService_0] = v180._sessionService, 
                [v108] = v180._eventIngest, 
                [l_AppUserGameSettings_0] = l_UserGameSettings_0, 
                [l_AppUpdateService_0] = v180._appUpdate, 
                [l_RoactAnalyticsCommonGameEvents_0] = v180._commonGameEvents, 
                [l_AppStartupSequenceTag_0] = v180._appStartupSequence, 
                [l_AppStartupMessageService_0] = v180._startupMessage
            }
        }
    });
end;
v166.render = function(v182) --[[ Line: 426 ]] --[[ Name: render ]]
    -- upvalues: v76 (copy), l_ReactProfilerContext_0 (copy), l_ReactProfiler_0 (copy), v159 (copy), v117 (copy), v152 (copy), l_IXPService_0 (copy), v23 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_AvatarPolicies_0 (copy), l_SharePolicies_0 (copy), l_ShareTargetGamePolicies_0 (copy), v41 (copy), l_DesignTokenProvider_0 (copy), v71 (copy), v72 (copy), v75 (copy), v69 (copy), v24 (copy), l_Provider_0 (copy), v155 (copy), v113 (copy), v114 (copy), l_ApolloProvider_0 (copy), v157 (copy), l_AppInteractionFeedbackProvider_0 (copy), l_FeedbackManagerInjectionContextProvider_0 (copy), v33 (copy), l_SquadExternalContractProvider_0 (copy), v85 (copy), l_SquadLocationEnum_0 (copy), v82 (copy), v136 (copy), v119 (copy), v120 (copy), v121 (copy), v122 (copy), v21 (copy), v81 (copy), v50 (copy), v51 (copy), v52 (copy), v53 (copy), v54 (copy), v47 (copy), v134 (copy), v55 (copy), v49 (copy), v84 (copy), v57 (copy), v58 (copy), v62 (copy), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v140 (copy), v139 (copy), v135 (copy), v116 (copy), v165 (copy), v142 (copy), l_AppReadyHandler_0 (copy), l_RnBypassAdapter_0 (copy), v138 (copy), l_AppChatToastManagerUA_0 (copy), v40 (copy), l_StartupMessageContainer_0 (copy), l_BugReporterEventReceiver_0 (copy), l_SocialGraphSyncManager_0 (copy), v149 (copy), v156 (copy), l_ProviderContainer_0 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy)
    local l_appName_0 = v182.props.appName;
    local l_v76_0 = v76;
    local v185 = {};
    table.insert(v185, {
        class = l_ReactProfilerContext_0.Provider, 
        props = {
            value = v182._profilerContext
        }
    });
    table.insert(v185, {
        class = l_ReactProfiler_0, 
        props = {
            id = "UniversalApp"
        }
    });
    table.insert(v185, {
        class = v182._appContainer, 
        props = {
            onNavigationStateChange = v159("UniversalApp")
        }
    });
    table.insert(v185, {
        class = v117.Provider, 
        props = {
            value = if v152.GetFFlagInjectAnalyticsService() then v182.props.ixpService else l_IXPService_0
        }
    });
    table.insert(v185, {
        class = v23.StoreProvider, 
        props = {
            store = v182._store
        }
    });
    table.insert(v185, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0, 
                l_ChatPolicies_0, 
                l_AvatarPolicies_0, 
                l_SharePolicies_0, 
                if v152.FFlagShareTargetGameCleanup then nil else l_ShareTargetGamePolicies_0
            }, 
            policyData = if v152.GetFFlagInjectAnalyticsService() then v182.props.policyData else nil
        }
    });
    v182:appendRoactServiceProviders(v185);
    local v186 = {
        themeName = "dark", 
        fontName = "gotham"
    };
    table.insert(v185, {
        class = v41, 
        props = {
            style = v186
        }
    });
    table.insert(v185, {
        class = l_DesignTokenProvider_0, 
        props = {
            tokenMappers = v71
        }
    });
    table.insert(v185, {
        class = v72
    });
    table.insert(v185, {
        class = v75, 
        props = {
            theme = l_v76_0, 
            themeName = "dark"
        }
    });
    table.insert(v185, {
        class = v69, 
        props = {
            localization = v182._localization
        }
    });
    table.insert(v185, {
        class = v24.FocusNavigationContext.Provider, 
        props = {
            value = v182._focusNavigationService
        }
    });
    table.insert(v185, {
        class = l_Provider_0
    });
    table.insert(v185, {
        class = v155.AvatarSceneInteractionProvider
    });
    table.insert(v185, {
        class = v155.BodyDataProvider
    });
    table.insert(v185, {
        class = v155.AdjustmentDataProvider
    });
    table.insert(v185, {
        class = v155.AppliedDescriptionProvider
    });
    table.insert(v185, {
        class = v155.AvatarSaveContextProvider
    });
    table.insert(v185, {
        class = v113.Provider
    });
    table.insert(v185, {
        class = v114.Provider, 
        props = {
            pageObjectManager = v182._pageObjectManager
        }
    });
    table.insert(v185, {
        class = l_ApolloProvider_0, 
        props = {
            client = v157
        }
    });
    table.insert(v185, {
        class = l_AppInteractionFeedbackProvider_0
    });
    table.insert(v185, {
        class = l_FeedbackManagerInjectionContextProvider_0
    });
    table.insert(v185, {
        class = v33.ResponsiveProvider
    });
    if v152.GetFFlagIsSquadEnabled() then
        table.insert(v185, {
            class = l_SquadExternalContractProvider_0, 
            props = {
                contract = v85, 
                squadLocation = l_SquadLocationEnum_0.UniversalApp
            }
        });
    end;
    if v152.FFlagLuaAppSupportFoundationOverlayInVR then
        table.insert(v185, {
            class = v82
        });
    end;
    local v187 = {};
    table.insert(v187, v136);
    table.insert(v187, v119);
    if v152.GetFFlagEnableWidgetLUAIXP() or v152.FFlagEnableLockScreenWidgetLuaIXP then
        table.insert(v187, v120);
    end;
    if v152.GetFFlagEnableIOSUIRefactorLuaIXP() then
        table.insert(v187, v121);
    end;
    if v152.GetFFlagEnableIosAuthServiceLuaIXP() then
        table.insert(v187, v122);
    end;
    local v188 = {
        EventReceivers = v21.createElement(v81), 
        MemStorageSubscribers = next(v187) and v21.createElement(v50, {
            receiverComponents = v187
        }) or nil, 
        LocalPlayerManager = v21.createElement(v51), 
        ViewportManager = v21.createElement(v52), 
        FrameRateManager = v21.createElement(v53), 
        LocaleManager = v21.createElement(v54, {
            localization = v182._localization
        }), 
        EventStreamUpdater = v21.createElement(v47, {
            releasePeriod = v134
        }), 
        LocalStorageListener = v21.createElement(v55), 
        MutedErrorReporter = v21.createElement(v49, {
            appName = l_appName_0
        }), 
        BacktraceReporterAdaptor = v21.createElement(v84), 
        SessionManager = v21.createElement(v57, {
            connectRouteSignal = v182._connectRouteSignal
        }), 
        UserHeartbeatsManager = v21.createElement(v58), 
        SiteAlertManager = v21.createElement(v62), 
        ContactImporterManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v21.createElement(v140), 
        AppBackgroundSoundManager = if v139() then v21.createElement(v135) else nil, 
        AppUpdateManager = v21.createElement(v116), 
        UserAgreementsManager = v21.createElement(v165), 
        QueryRefetchManager = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v21.createElement(v142, {
            robloxEventReceiver = v182._robloxEventReceiver
        }), 
        AppReadyHandler = v21.createElement(l_AppReadyHandler_0), 
        RnBypassAdapter = v21.createElement(l_RnBypassAdapter_0, {
            rnBypassActionSignal = v182._rnBypassActionSignal, 
            ApplyRoactNavigationHistory = v138, 
            updateRoute = v182._updateRoute
        }), 
        AppChatToastManagerUA = v21.createElement(l_AppChatToastManagerUA_0), 
        AppConfigurer = v21.createElement(v40, {
            store = v182._store
        }), 
        StartupMessageContainer = v21.createElement(l_StartupMessageContainer_0), 
        BugReporterEventReceiver = if v152.GetFFlagEnableInAppBugReporting() then v21.createElement(l_BugReporterEventReceiver_0) else nil, 
        SocialGraphSyncManager = v21.createElement(l_SocialGraphSyncManager_0), 
        MouseCursorHandler = v21.createElement(v149), 
        PostAppInteractiveLoader = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then v21.createElement(v156) else nil
    };
    return v21.createElement(l_ProviderContainer_0, {
        providers = v185
    }, {
        CursorProvider = v21.createElement(l_SelectionCursorProvider_0, {}, {
            NewCursorProvider = v21.createElement(l_CursorProvider_0, {}, v188)
        })
    });
end;
v166.willUnmount = function(_) --[[ Line: 691 ]] --[[ Name: willUnmount ]]
    -- upvalues: v152 (copy), v154 (ref)
    if v152.FFlagLuaAppUseAppHttpStore then
        v154.Instance._dispose();
    end;
end;
return v166;