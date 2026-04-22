local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Constants);
local v12 = require(l_Modules_0.LuaApp.LuaAppEvents);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withStyle_0 = v8.Core.Style.withStyle;
local v15 = require(l_CorePackages_0.Packages.RoactNavigation);
local v16 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v16.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
local v19 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_Selectors_0 = v19.Selectors;
local l_useOverlay_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useOverlay;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v23 = require(l_Modules_0.LuaApp.Components.ToastV2);
local v24 = require(l_Modules_0.LuaApp.Components.CentralOverlay);
local v25 = require(l_Modules_0.LuaApp.Components.AppNav.AppNavContainer);
local v26 = require(l_Modules_0.LuaApp.Components.AppNav.AppSystemBar);
local v27 = require(l_Modules_0.LuaApp.Components.AppTopBannerContainer);
local l_BadgeVariant_0 = v8.App.Indicator.Enum.BadgeVariant;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v31 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v32 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsBottomBar);
local v33 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v34 = require(l_Modules_0.LuaApp.Analytics.Events.partyTabBadgeImpression);
local v35 = require(l_Modules_0.LuaApp.Analytics.Events.partyTabBadgeClick);
local v36 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v37 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v39 = require(l_Modules_0.LuaApp.AppPage);
local v40 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagLuaAppPostAppInteractiveLoader_0 = v40.GetFFlagLuaAppPostAppInteractiveLoader;
local v42 = require(l_CorePackages_0.Workspace.Packages.AppChatNetworking);
local v43 = require(l_Modules_0.LuaApp.Components.FullscreenTitleBar);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBar);
local v45 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.LuaApp.Components.UpdateRequiredPrompt);
local v46 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
local l_withIsGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).withIsGamepadInput;
local v48 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v49 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v49.VRReadyWrapper;
local l_VRConstants_0 = v49.VRConstants;
local l_VRPanelWidthIXP_0 = v49.VRPanelWidthIXP;
local v53 = require(l_Modules_0.LuaApp.Components.Analytics.RouterAnalyticsReporterForRoactNav);
local v54 = require(l_Modules_0.LuaApp.AppPageProperties);
local l_SetTabBarVisible_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local l_useGamepadBumperNavigationBindings_0 = require(l_CorePackages_0.Workspace.Packages.BumperNavigation).useGamepadBumperNavigationBindings;
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v59 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v60 = require(l_Modules_0.LuaApp.Thunks.SetNavigationLocked);
local v61 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v62 = require(l_Modules_0.LuaApp.Actions.SetPlatform);
local v63 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v65 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v66 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v67 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v68 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRAppPointer);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v70 = require(l_Modules_0.LuaApp.Components.AppNav.GetIABottomBarItems);
local l_AppToastNotificationContainer_0 = require(l_CorePackages_0.Workspace.Packages.ToastNotification).AppToastNotificationContainer;
local v72 = require(l_Modules_0.LuaApp.Components.Common.AppLoadingSplashScreen);
local v73 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModal_0 = v73.GameInviteModal;
local l_GameInviteConstants_0 = v73.GameInviteConstants;
local v76 = require(l_Modules_0.LuaApp.Components.Shell.ShellEventsContainer);
local v77 = require(l_CorePackages_0.Workspace.Packages.AppShortcutBar);
local l_AppShortcutBarContainer_0 = v77.AppShortcutBarContainer;
local l_AppShortcutBarContext_0 = v77.AppShortcutBarContext;
local v80 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useIsSpatial_0 = v80.useIsSpatial;
local l_HardwareSafeAreaInsets_0 = v80.HardwareSafeAreaInsets;
local v83 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v83.VisibilityControl;
local v85 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v86 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v87 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance);
local l_TTIPerformanceManager_0 = v87.TTIPerformanceManager;
local l_WidgetsPercievedTTIManager_0 = v87.WidgetsPercievedTTIManager;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v91 = require(l_CorePackages_0.Workspace.Packages.AppMusicPlayer);
local v92 = require(l_Modules_0.LuaApp.Components.NativeCloseEventConnector);
local v93 = require(l_Modules_0.LuaApp.Thunks.CheckSystemTrayModal);
local l_FFlagEnableLeftNavOnConsole_0 = v40.FFlagEnableLeftNavOnConsole;
local v95 = if l_FFlagEnableLeftNavOnConsole_0 then require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).TenFootUiGlobalEffects else nil;
local l_FFlagUseNavigationSelectors_0 = v40.FFlagUseNavigationSelectors;
local v97 = game:DefineFastFlag("EnableProgressLoadingAssetsAppContainer", false);
local _ = nil;
local v99 = nil;
if v97 then
    v99 = require(l_CorePackages_0.Workspace.Packages.ProgressLoading).ProgressLoadingAssetsScreenGui;
end;
local l_SduiDiscoveryDependencyUpdater_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiDiscoveryDependencyUpdater;
local l_SduiAvatarExperienceRegister_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceServerDrivenUi).SduiAvatarExperienceRegister;
local l_SduiSharedRegister_0 = require(l_CorePackages_0.Workspace.Packages.SduiSharedContent).SduiSharedRegister;
local v103 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v104 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v105 = nil;
local v106 = nil;
if v104 then
    v105 = require(l_Modules_0.LuaApp.Components.FlyoutSidePanel.FlyoutSidePanelWrapper);
    v106 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).FlyoutScrollAwayControl;
end;
local v107 = {
    GetFFlagUseUpdatedVNGAgreementsWorkflow = v40.GetFFlagUseUpdatedVNGAgreementsWorkflow, 
    GetFFlagEnableAccessBlockAtAppContainerLevel = v40.GetFFlagEnableAccessBlockAtAppContainerLevel, 
    GetFFlagLuaAppFixStudioNotchSupport = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport), 
    GetFFlagVRPanelWidthIXPEnabled = v40.GetFFlagVRPanelWidthIXPEnabled, 
    GetFFlagLuaAppEnableTopBanner = v40.GetFFlagLuaAppEnableTopBanner, 
    FFlagAppIaScrollAway = v40.FFlagAppIaScrollAway, 
    GetFFlagLuaAppPersistentMusicPlayer = v40.GetFFlagLuaAppPersistentMusicPlayer, 
    FFlagEnableSystemTrayModals = v40.FFlagEnableSystemTrayModals, 
    FFlagAppIaHomeSubTab = v40.FFlagAppIaHomeSubTab, 
    FFlagAppNavObservability = v40.FFlagAppNavObservability, 
    FFlagEnableAvatarExperienceSdui = v40.FFlagEnableAvatarExperienceSdui, 
    FFlagLuaAppUseOverlayInAppContainer = v40.FFlagLuaAppUseOverlayInAppContainer, 
    FFlagLuaAppForceVrAppPanelWidthRollout = v40.FFlagLuaAppForceVrAppPanelWidthRollout
};
local v108 = game:DefineFastFlag("LuaAppEnableToastNotifications4", false);
local v109 = game:DefineFastFlag("AXEnablePercievedTTIForAX", false);
local v110 = game:DefineFastFlag("RemoveUpdatePromptChild", false);
local v111 = game:DefineFastInt("PartyTabBadgeMaxCount", 49);
local v112 = v40.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v107.GetFFlagLuaAppFixStudioNotchSupport();
local l_FFlagFixNavigationInsetsOnHiddenTabBar_0 = v40.FFlagFixNavigationInsetsOnHiddenTabBar;
local v114 = game:DefineFastFlag("AXFixMarketplaceTTIPerceivedTracking", false);
local v115 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = v115.FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v115.FFlagAXMoveAllTabToWidgetOnly;
local l_FFlagAddGamepadBumperNavigation_0 = v40.FFlagAddGamepadBumperNavigation;
local function _() --[[ Line: 171 ]] --[[ Name: getDevicePlatform ]]
    -- upvalues: l_UserInputService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Enum.Platform.None;
    else
        return l_UserInputService_0:GetPlatform();
    end;
end;
local v120 = if _G.__TESTEZ_RUNNING_TEST__ then Enum.Platform.None else l_UserInputService_0:GetPlatform();
local v121 = l_GuiService_0:IsTenFootInterface() and not l_FFlagEnableLeftNavOnConsole_0;
local v122, v123 = v70();
local v124 = v6.Component:extend("AppContainer");
v124.init = function(v125) --[[ Line: 187 ]] --[[ Name: init ]]
    -- upvalues: l_Logger_0 (copy), v62 (copy), v120 (copy), v12 (copy), v107 (copy), v19 (copy), v39 (copy), v121 (copy), l_AvatarScreen_0 (copy), v109 (copy), v85 (copy), v114 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_WidgetsPercievedTTIManager_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v86 (copy), l_ChatEntryPointNames_0 (copy), v35 (copy), v42 (copy), v83 (copy), v9 (copy), v11 (copy)
    v125.props.loggingProtocol:logEventOnce("app_container_init_begin");
    l_Logger_0:info("Initializing App Container");
    local l_store_0 = v125.props.store;
    local l_bottomBarAnalytics_0 = v125.props.bottomBarAnalytics;
    l_store_0:dispatch(v62(v120));
    v125.bottomBarButtonActivated = function(v128, v129) --[[ Line: 197 ]]
        -- upvalues: v125 (copy), v12 (ref), v107 (ref), v19 (ref), v39 (ref), v121 (ref), l_AvatarScreen_0 (ref), v109 (ref), l_store_0 (copy), v85 (ref), v114 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_FFlagAXMoveAllTabToWidgetOnly_0 (ref), l_WidgetsPercievedTTIManager_0 (ref), l_TTIPerformanceManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v86 (ref), l_ChatEntryPointNames_0 (ref), v35 (ref), v42 (ref), l_Logger_0 (ref), v83 (ref), l_bottomBarAnalytics_0 (copy)
        local l_currentPage_0 = v125.props.currentPage;
        local l_selectedBottomBarItemIndex_0 = v125.props.selectedBottomBarItemIndex;
        if not l_selectedBottomBarItemIndex_0 then
            return;
        else
            local l_page_0 = v125.props.bottomBarItems[l_selectedBottomBarItemIndex_0].page;
            if v128 == l_currentPage_0 then
                v12.ReloadPage:fire(v128);
            elseif v107.FFlagAppIaHomeSubTab and v128 == v19.Constants.HomeContainerName then
                if l_currentPage_0 == v39.Home then
                    v12.ReloadPage:fire(v39.Home);
                else
                    v125.props.navigateToPage(v39.Home);
                    if v129 then
                        v125.props.notificationService:ActionTaken(v129);
                    end;
                end;
            elseif v128 == v39.AvatarExperienceRoot then
                local v133 = if v121 then v39.AvatarExperienceRoot else l_AvatarScreen_0.Catalog;
                if v109 then
                    l_store_0:dispatch(v85.PercievedTrackingStarted());
                    if v114 then
                        if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                            if l_FFlagAXMoveAllTabToWidgetOnly_0 and l_WidgetsPercievedTTIManager_0 then
                                l_WidgetsPercievedTTIManager_0.startPerceivedTracking();
                            else
                                l_TTIPerformanceManager_0.Surface.Marketplace.Root.startPerceivedTracking();
                            end;
                        else
                            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Tiles .. "_Percieved");
                            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Organic.Thumbnails .. "_Percieved");
                            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Tiles .. "_Percieved");
                            l_TimeToInteractiveTracker_0.trackStart(v86.Counter.PREFIX .. v86.Counter.Latency.Widget.Thumbnails .. "_Percieved");
                        end;
                    end;
                end;
                v125.props.navigateToPage(v133);
                if v129 then
                    v125.props.notificationService:ActionTaken(v129);
                end;
            elseif v128 == v39.Chat then
                v125.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SystemBar);
                v35(v125.props.analytics.EventStream, "AppContainer", v125.props.chatBadgeCount);
                l_store_0:dispatch(v42.rodux.ClearGlobalUnreadCount.API()):catch(function(v134) --[[ Line: 260 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:error("Error in ClearGlobalUnreadCount request. Error: {}", (tostring(v134)));
                end);
                v125.props.navigateToPage(v128);
                if v129 then
                    v125.props.notificationService:ActionTaken(v129);
                end;
            else
                v125.props.navigateToPage(v128);
                if v129 then
                    v125.props.notificationService:ActionTaken(v129);
                end;
            end;
            if v107.FFlagAppNavObservability and v128 ~= l_page_0 then
                v83.AppNavTelemetry.logSwitchTabStart(l_page_0, v128);
            end;
            l_bottomBarAnalytics_0.ButtonActivated(v128, l_page_0);
            return;
        end;
    end;
    v125.getBottomBarLayoutInfo = v9(function(v135, v136, _) --[[ Line: 280 ]]
        -- upvalues: v11 (ref)
        local v138 = math.max(v135.X - v136.left - v136.right - 600, 0);
        local l_BOTTOM_BAR_SIZE_0 = v11.BOTTOM_BAR_SIZE;
        local v140 = math.max(v136.bottom - l_BOTTOM_BAR_SIZE_0, 0);
        return {
            Background = {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, -v136.left, 1, 0), 
                Size = UDim2.new(0, v135.X, 0, v136.bottom)
            }, 
            Padding = {
                PaddingLeft = UDim.new(0, v136.left + v138 / 2), 
                PaddingRight = UDim.new(0, v136.right + v138 / 2), 
                PaddingBottom = UDim.new(0, v140)
            }
        };
    end);
    v125.props.loggingProtocol:logEventOnce("app_container_init_end");
end;
v124.didMount = function(v141) --[[ Line: 304 ]] --[[ Name: didMount ]]
    -- upvalues: v60 (copy), v107 (copy)
    v141.props.store:dispatch(v60(false));
    if v107.GetFFlagEnableAccessBlockAtAppContainerLevel() and v141.props.userLoggedIn and v141.props.policyShouldBlockUAppAccess then
        v141.props.resetNavigationHistoryToBlockPage();
    end;
end;
v124.willUpdate = function(v142, v143) --[[ Line: 320 ]] --[[ Name: willUpdate ]]
    -- upvalues: v54 (copy), v37 (copy), v107 (copy), v83 (copy), l_VisibilityControl_0 (copy), v104 (copy), v106 (ref)
    local v144 = v54[v143.currentPage] or {};
    local v145 = nil;
    local l_tabBarVisibility_0 = v143.tabBarVisibility;
    if typeof(l_tabBarVisibility_0) == "function" then
        l_tabBarVisibility_0 = l_tabBarVisibility_0({
            formFactor = v143.formFactor
        });
    end;
    v145 = if l_tabBarVisibility_0 == v37.PolicyDependent then v142.props.shouldSystemBarUsuallyBePresent else l_tabBarVisibility_0 ~= v37.Hidden;
    if not v144.overridesAppRouterTabBarControl and v145 ~= v143.bottomBarVisible then
        v142.props.setTabBarVisible(v145);
    end;
    if v107.FFlagAppIaScrollAway and v83.getScrollAwayEnabled() then
        local v147 = if v144.overridesAppRouterTabBarControl then v143.bottomBarVisible else v145;
        local v148 = v144.enableScrollAway and v147;
        if v143.currentPage ~= v142.props.currentPage then
            l_VisibilityControl_0.show();
        elseif v147 and v148 ~= l_VisibilityControl_0.isEnabled() then
            l_VisibilityControl_0.show();
        end;
        if v104 then
            v106.setScrollAwayEnabled(v148);
            return;
        else
            l_VisibilityControl_0.setEnabled(v148);
        end;
    end;
end;
v124.didUpdate = function(v149, _, _) --[[ Line: 367 ]] --[[ Name: didUpdate ]]
    -- upvalues: v107 (copy), v39 (copy)
    if v149.props.userLoggedIn and v149.props.appPolicy.getVNGFormRequired() and not v107.GetFFlagUseUpdatedVNGAgreementsWorkflow() then
        v149.props.showVngForm();
    end;
    if v107.GetFFlagEnableAccessBlockAtAppContainerLevel() then
        local v152 = v149.props.policyShouldBlockUAppAccess and v149.props.userLoggedIn;
        local v153 = v149.props.currentPage == v39.UAppBlock;
        if v152 and not v153 then
            v149.props.resetNavigationHistoryToBlockPage();
        end;
    end;
end;
v124.render = function(v154) --[[ Line: 386 ]] --[[ Name: render ]]
    -- upvalues: v121 (copy), v6 (copy), v68 (copy), l_HardwareSafeAreaInsets_0 (copy), l_withStyle_0 (copy), v112 (copy), v107 (copy), v80 (copy), v39 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), v25 (copy), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (copy), v48 (copy), v91 (copy), v26 (copy), v11 (copy), v53 (copy), l_AppShortcutBarContext_0 (copy), l_AppShortcutBarContainer_0 (copy), v92 (copy), v93 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v95 (copy), l_VRReadyWrapper_0 (copy), l_VRConstants_0 (copy), l_IsVRAppBuild_0 (copy), l_CoreGui_0 (copy), v23 (copy), v108 (copy), l_AppToastNotificationContainer_0 (copy), l_GameInviteModal_0 (copy), l_GameInviteConstants_0 (copy), v24 (copy), v44 (copy), v27 (copy), v104 (copy), v105 (ref), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v46 (copy), v43 (copy), v110 (copy), v45 (copy), v72 (copy), v76 (copy), v97 (copy), v99 (ref), l_SduiDiscoveryDependencyUpdater_0 (copy), l_SduiAvatarExperienceRegister_0 (copy), l_SduiSharedRegister_0 (copy)
    local l_screenSize_0 = v154.props.screenSize;
    local l_globalGuiInset_0 = v154.props.globalGuiInset;
    local l_bottomBarVisible_0 = v154.props.bottomBarVisible;
    local l_selectedBottomBarItemIndex_1 = v154.props.selectedBottomBarItemIndex;
    local l_bottomBarItems_0 = v154.props.bottomBarItems;
    local l_isGamepadInput_0 = v154.props.isGamepadInput;
    local v161 = v121 and l_isGamepadInput_0;
    local v162 = nil;
    local v163 = v6.createElement(v68);
    local v164 = l_HardwareSafeAreaInsets_0.deviceInsets();
    v162 = l_withStyle_0(function(v165) --[[ Line: 403 ]]
        -- upvalues: v112 (ref), v107 (ref), v6 (ref), l_globalGuiInset_0 (copy), v164 (copy), v154 (copy), v80 (ref), v39 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_FFlagAddGamepadBumperNavigation_0 (ref), v25 (ref), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (ref), l_bottomBarVisible_0 (copy), v48 (ref), v91 (ref), v26 (ref), v11 (ref), l_screenSize_0 (copy), l_selectedBottomBarItemIndex_1 (copy), l_bottomBarItems_0 (copy), v53 (ref), l_AppShortcutBarContext_0 (ref), l_AppShortcutBarContainer_0 (ref), v92 (ref), v93 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), v95 (ref), l_VRReadyWrapper_0 (ref), l_VRConstants_0 (ref), l_IsVRAppBuild_0 (ref)
        local v166 = nil;
        if not v112 and v107.GetFFlagLuaAppFixStudioNotchSupport() then
            v166 = v6.createElement("UIPadding", {
                PaddingTop = if v107.GetFFlagLuaAppEnableTopBanner() then UDim.new(0, l_globalGuiInset_0.top) else nil, 
                PaddingBottom = UDim.new(0, l_globalGuiInset_0.bottom), 
                PaddingLeft = UDim.new(0, l_globalGuiInset_0.left)
            });
        end;
        local v167 = v112 and (not (v164.top <= 0 and v164.bottom <= 0 and v164.left <= 0 and v164.right <= 0) or v154.props.usePreferredInput == v80.Input.Touch) and v154.props.currentPage ~= v39.AvatarExperienceRoot;
        local v168 = {
            RNAppContainer = v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                shouldRestoreFocus = false, 
                customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v154.props.bumperNavigationEventMap else nil, 
                customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v154.props.bumperNavigationEventHandlerMap else nil
            }, v6.createElement(v25, if l_FFlagFixNavigationInsetsOnHiddenTabBar_0 then {
                isTabBarVisible = l_bottomBarVisible_0
            } else nil, {
                RootNavigator = v6.createElement(v48, {
                    navigation = v154.props.navigation
                })
            })), 
            MusicPlayer = if v107.GetFFlagLuaAppPersistentMusicPlayer() then v6.createElement(v91.AppMusicPlayer) else nil, 
            SystemBar = v6.createElement(v26, {
                isVisible = l_bottomBarVisible_0, 
                displayOrder = v11.DisplayOrder.SystemBar, 
                layoutInfo = v154.getBottomBarLayoutInfo(l_screenSize_0, l_globalGuiInset_0), 
                selectedIndex = l_selectedBottomBarItemIndex_1, 
                items = l_bottomBarItems_0, 
                onActivated = v154.bottomBarButtonActivated, 
                customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v154.props.bumperNavigationEventMap else nil, 
                customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v154.props.bumperNavigationEventHandlerMap else nil, 
                isBumperNavigationEnabled = if l_FFlagAddGamepadBumperNavigation_0 then v154.props.isBumperNavigationEnabled else nil
            }), 
            Reporter = v6.createElement(v53), 
            SafePadding = v166, 
            AppShortcutBar = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ShortcutBarContext = v6.createElement(l_AppShortcutBarContext_0.Provider, {}, {
                    ShortcutBar = v6.createElement(l_AppShortcutBarContainer_0)
                })
            }), 
            NativeCloseEventConnector = if v107.FFlagEnableSystemTrayModals then v6.createElement(v92, {
                onNativeCloseEvent = v93
            }) else nil, 
            TenFootUiGlobalEffects = if l_FFlagEnableLeftNavOnConsole_0 then v6.createElement(v95) else nil, 
            DeviceInsetBackground = if v167 then v6.createElement("Frame", {
                Position = UDim2.new(0, -v164.left, 0, -v164.top), 
                Size = UDim2.new(0, l_screenSize_0.X + v164.left + v164.right, 0, l_screenSize_0.Y + v164.top + v164.bottom), 
                BackgroundColor3 = v165.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v165.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 0
            }) else nil
        };
        local v169 = nil;
        if v107.GetFFlagLuaAppFixStudioNotchSupport() then
            v169 = if v112 then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None;
        end;
        return v6.createElement(l_VRReadyWrapper_0, {
            component = "ScreenGui", 
            props = {
                Enabled = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = 1, 
                ScreenInsets = v169, 
                ClipToDeviceSafeArea = not v112 and nil
            }, 
            vrProps = {
                partSize = if not v107.FFlagLuaAppForceVrAppPanelWidthRollout and v154.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenSize.X * v154.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize, 
                offset = if not not v107.FFlagLuaAppForceVrAppPanelWidthRollout or v107.GetFFlagVRPanelWidthIXPEnabled() and v154.props.vrPanelCurvature == 0 then CFrame.new(l_VRConstants_0.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                virtualScreenSize = if not v107.FFlagLuaAppForceVrAppPanelWidthRollout and v154.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v154.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
                panelName = "MainAppScreen", 
                curvature = if not v107.FFlagLuaAppForceVrAppPanelWidthRollout and v154.props.vrPanelCurvature then v154.props.vrPanelCurvature else l_VRConstants_0.MainScreenCurvature, 
                hidden = l_IsVRAppBuild_0() and v154.props.currentPage == v39.AvatarExperienceRoot, 
                roundedCornersFrameColor = v165.Theme.BackgroundDefault.Color
            }
        }, v168);
    end);
    local v170 = v6.createElement(v6.Portal, {
        target = l_CoreGui_0
    }, {
        LuaAppScreenGui = v162
    });
    local v171 = {
        Toast = v6.createElement(v23, {
            displayOrder = v11.DisplayOrder.Toast
        }), 
        ToastNotification = if v108 then v6.createElement(l_AppToastNotificationContainer_0, {
            displayOrder = v11.DisplayOrder.Toast
        }) else nil, 
        GameInviteModal = v6.createElement(l_GameInviteModal_0, {
            displayOrder = v11.DisplayOrder.GameInviteModal, 
            renderLocation = l_GameInviteConstants_0.RenderLocation.UniversalApp
        }), 
        CentralOverlay = v6.createElement(v24, {
            includeStatusBar = l_bottomBarVisible_0, 
            displayOrder = v11.DisplayOrder.CentralOverlay
        }), 
        GamepadBottomBar = v161 and v6.createElement(v44, {
            displayOrder = v11.DisplayOrder.GamepadBottomBar
        }), 
        RNBypassTree = v170, 
        TopBanner = if v107.GetFFlagLuaAppEnableTopBanner() then v6.createElement(v27, {
            displayOrder = v11.DisplayOrder.TopBanner
        }) else nil, 
        FlyoutSidePanel = if v104 then v6.createElement(v105, {
            displayOrder = v11.DisplayOrder.FlyoutSidePanel
        }) else nil, 
        AvatarExperienceMountedAtStartup = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v6.createElement(v46, {
            store = v154.props.store, 
            shouldManageBackground = not l_IsVRAppBuild_0() and nil
        }), 
        FullscreenTitleBar = v6.createElement(v43, {
            displayOrder = v11.DisplayOrder.FullscreenTitleBar
        }), 
        UpdateRequiredPrompt = if not not l_GetFFlagLuaAppPostAppInteractiveLoader_0() or v110 then nil else v6.createElement(v45), 
        VRPointer = if v154.props.use3DPanels then v163 else nil, 
        AppLoadingSplashScreen = v6.createElement(v72), 
        ShellEventsContainer = v6.createElement(v76, {
            currentPage = v154.props.currentPage
        }), 
        ProgressLoadingAssetsScreenGui = if v97 then v6.createElement(v99, {
            displayOrder = v11.DisplayOrder.ProgressLoadingAssets
        }) else nil, 
        SduiDiscoveryDependencyUpdater = v6.createElement(l_SduiDiscoveryDependencyUpdater_0), 
        SduiAvatarExperienceRegister = if v107.FFlagEnableAvatarExperienceSdui then v6.createElement(l_SduiAvatarExperienceRegister_0) else nil, 
        SduiSharedRegister = v6.createElement(l_SduiSharedRegister_0)
    };
    return v6.createElement("Folder", {}, v171);
end;
local v179 = v9(function(v172, _, v174) --[[ Line: 630 ]]
    -- upvalues: v122 (ref), v123 (ref), v70 (copy), v34 (copy), v111 (copy), l_BadgeVariant_0 (copy), v39 (copy), v5 (copy)
    local v175, v176 = v70();
    v122 = v175;
    v123 = v176;
    v175 = v172;
    v176 = nil;
    if typeof(v172) == "number" and v172 > 0 then
        if v174 and v174.EventStream then
            v34(v174.EventStream, "AppContainer", v172);
        end;
        v175 = if v111 < v172 then tostring(v111) .. "+" else tostring(v172);
        v176 = l_BadgeVariant_0.Alert;
    end;
    local l_v122_0 = v122;
    local v178 = v123[v39.Chat];
    if v178 ~= nil then
        l_v122_0 = v5.List.join(v122);
        l_v122_0[v178].badgeCount = v175;
        l_v122_0[v178].badgeVariant = v176;
    end;
    return l_v122_0;
end);
v124 = v7.connect(function(v180, v181) --[[ Line: 658 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v54 (copy), v37 (copy), v123 (ref), v179 (copy), v36 (copy)
    local v182 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v180) else v180.Navigation.history;
    local v183 = v182[#v182];
    local v184 = v180.SocialTab.UnreadConversationCount or 0;
    local v185 = nil;
    v185 = (function(v186) --[[ Line: 665 ]]
        -- upvalues: v54 (ref), v183 (copy), v37 (ref)
        for v187 = #v186, 1, -1 do
            local v188 = v54[v183[v187].name] or {};
            if v188.tabBarHidden then
                return v188.tabBarHidden;
            end;
        end;
        return v37.Visible;
    end)(v183);
    return {
        screenSize = v180.ScreenSize, 
        globalGuiInset = v180.GlobalGuiInset, 
        bottomBarVisible = v180.TabBarVisible, 
        selectedBottomBarItemIndex = v123[v183[1].name], 
        currentPage = v183[#v183].name, 
        tabBarVisibility = v185, 
        bottomBarItems = v179(v184, v181.canSeeChatTab, v181.analytics), 
        chatBadgeCount = v184, 
        userLoggedIn = v180.AuthenticationStatus.status == v36.LOGGED_IN, 
        formFactor = v180.FormFactor, 
        localUserId = v180.LocalUserId
    };
end, function(v189) --[[ Line: 692 ]]
    -- upvalues: v59 (copy), v61 (copy), v39 (copy), v107 (copy), v83 (copy), l_SetTabBarVisible_0 (copy), v66 (copy), v65 (copy), l_EnteredChatFromEntryPoint_0 (copy)
    return {
        navigateToPage = function(v190) --[[ Line: 694 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v189 (copy), v59 (ref)
            v189(v59({
                {
                    name = v190
                }
            }));
        end, 
        resetNavigationHistoryToBlockPage = function() --[[ Line: 697 ]] --[[ Name: resetNavigationHistoryToBlockPage ]]
            -- upvalues: v189 (copy), v61 (ref), v39 (ref)
            v189(v61({
                {
                    name = v39.UAppBlock
                }
            }));
        end, 
        setTabBarVisible = function(v191) --[[ Line: 700 ]] --[[ Name: setTabBarVisible ]]
            -- upvalues: v107 (ref), v83 (ref), v189 (copy), l_SetTabBarVisible_0 (ref)
            if v107.FFlagAppNavObservability then
                v83.AppNavTelemetry.logVisibilityStart(v191);
            end;
            v189(l_SetTabBarVisible_0(v191));
        end, 
        showVngForm = function() --[[ Line: 709 ]] --[[ Name: showVngForm ]]
            -- upvalues: v189 (copy), v66 (ref), v65 (ref)
            v189(v66(v65.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        enteredChatFromEntryPoint = function(v192) --[[ Line: 714 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v189 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            v189(l_EnteredChatFromEntryPoint_0(v192));
        end
    };
end)(v124);
v124 = l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0, 
    networking = v31, 
    bottomBarAnalytics = v32, 
    analytics = v33, 
    loggingProtocol = l_AppLogging_0
})(v124);
v124 = l_withIsGamepadInput_0((l_RoactAppPolicy_0.connect(function(v193) --[[ Line: 728 ]]
    -- upvalues: v107 (copy), v103 (copy)
    return {
        appPolicy = v193, 
        policyShouldBlockUAppAccess = if v107.GetFFlagEnableAccessBlockAtAppContainerLevel() then v193.getEnableUAppAccessBlock() or v193.getEnableHomePageAgeBlock() else nil, 
        shouldSystemBarUsuallyBePresent = v193.getShouldSystemBarUsuallyBePresent(), 
        canSeeChatTab = v103.getAppFeaturePolicies().getCanSeeChatTab()
    };
end)(v124)));
v124 = v15.withNavigation(v124);
v124 = v63.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer, 
    "PlatformExcellence.QualityImprovement.App"
}, function(v194, _) --[[ Line: 746 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        luaAddFriendsPageEnabled = (v194[l_AppUserLayers_0.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True"
    };
end)(v124);
if not v107.FFlagLuaAppForceVrAppPanelWidthRollout then
    v124 = v67.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature
    })(v124);
end;
return function(v196) --[[ Line: 760 ]]
    -- upvalues: v107 (copy), l_useOverlay_0 (copy), l_useIsSpatial_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), l_useGamepadBumperNavigationBindings_0 (copy), v122 (ref), v5 (copy), v6 (copy), v124 (ref)
    if v107.FFlagLuaAppUseOverlayInAppContainer then
        l_useOverlay_0();
    end;
    local v197 = l_useIsSpatial_0();
    local v198 = nil;
    local v199 = nil;
    local v200 = nil;
    if l_FFlagAddGamepadBumperNavigation_0 then
        local v201 = l_useGamepadBumperNavigationBindings_0(v122);
        v198 = v201.eventMap;
        v199 = v201.eventHandlerMap;
        v200 = v201.isBumperNavigationEnabled;
    end;
    local v202 = v5.Dictionary.join(v196, {
        use3DPanels = v197, 
        bumperNavigationEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v198 else {}, 
        bumperNavigationEventHandlerMap = if l_FFlagAddGamepadBumperNavigation_0 then v199 else {}, 
        isBumperNavigationEnabled = if l_FFlagAddGamepadBumperNavigation_0 then v200 else nil
    });
    return v6.createElement(v124, v202);
end;