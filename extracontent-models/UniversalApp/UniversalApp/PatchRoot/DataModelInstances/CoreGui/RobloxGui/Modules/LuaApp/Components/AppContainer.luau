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
local l_useOverlay_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useOverlay;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v22 = require(l_Modules_0.LuaApp.Components.ToastV2);
local v23 = require(l_Modules_0.LuaApp.Components.CentralOverlay);
local v24 = require(l_Modules_0.LuaApp.Components.AppNav.AppNavContainer);
local v25 = require(l_Modules_0.LuaApp.Components.AppNav.AppSystemBar);
local v26 = require(l_Modules_0.LuaApp.Components.AppTopBannerContainer);
local l_BadgeVariant_0 = v8.App.Indicator.Enum.BadgeVariant;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local v30 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v31 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsBottomBar);
local v32 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v33 = require(l_Modules_0.LuaApp.Analytics.Events.partyTabBadgeImpression);
local v34 = require(l_Modules_0.LuaApp.Analytics.Events.partyTabBadgeClick);
local v35 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v36 = require(l_Modules_0.LuaApp.Enum.SystemBarVisibility);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v38 = require(l_Modules_0.LuaApp.AppPage);
local v39 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagLuaAppPostAppInteractiveLoader_0 = v39.GetFFlagLuaAppPostAppInteractiveLoader;
local v41 = require(l_CorePackages_0.Workspace.Packages.AppChatNetworking);
local v42 = require(l_Modules_0.LuaApp.Components.FullscreenTitleBar);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBar);
local v44 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.LuaApp.Components.UpdateRequiredPrompt);
local v45 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
local l_withIsGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).withIsGamepadInput;
local v47 = require(l_Modules_0.LuaApp.Navigation.RootNavigator);
local v48 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v48.VRReadyWrapper;
local l_VRConstants_0 = v48.VRConstants;
local l_VRPanelWidthIXP_0 = v48.VRPanelWidthIXP;
local v52 = require(l_Modules_0.LuaApp.Components.Analytics.RouterAnalyticsReporterForRoactNav);
local v53 = require(l_Modules_0.LuaApp.AppPageProperties);
local l_SetTabBarVisible_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local l_useGamepadBumperNavigationBindings_0 = require(l_CorePackages_0.Workspace.Packages.BumperNavigation).useGamepadBumperNavigationBindings;
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v58 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v59 = require(l_Modules_0.LuaApp.Thunks.SetNavigationLocked);
local v60 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v61 = require(l_Modules_0.LuaApp.Actions.SetPlatform);
local v62 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v64 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v65 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v66 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v67 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRAppPointer);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v69 = require(l_Modules_0.LuaApp.Components.AppNav.GetIABottomBarItems);
local l_AppToastNotificationContainer_0 = require(l_CorePackages_0.Workspace.Packages.ToastNotification).AppToastNotificationContainer;
local v71 = require(l_Modules_0.LuaApp.Components.Common.AppLoadingSplashScreen);
local v72 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModal_0 = v72.GameInviteModal;
local l_GameInviteConstants_0 = v72.GameInviteConstants;
local v75 = require(l_Modules_0.LuaApp.Components.Shell.ShellEventsContainer);
local v76 = require(l_CorePackages_0.Workspace.Packages.AppShortcutBar);
local l_AppShortcutBarContainer_0 = v76.AppShortcutBarContainer;
local l_AppShortcutBarContext_0 = v76.AppShortcutBarContext;
local v79 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useIsSpatial_0 = v79.useIsSpatial;
local l_HardwareSafeAreaInsets_0 = v79.HardwareSafeAreaInsets;
local v82 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v82.VisibilityControl;
local v84 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v85 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_TTIPerformanceManager_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceTTIPerformance).TTIPerformanceManager;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v88 = require(l_CorePackages_0.Workspace.Packages.AppMusicPlayer);
local v89 = require(l_Modules_0.LuaApp.Components.NativeCloseEventConnector);
local v90 = require(l_Modules_0.LuaApp.Thunks.CheckSystemTrayModal);
local l_FFlagEnableLeftNavOnConsole_0 = v39.FFlagEnableLeftNavOnConsole;
local v92 = if l_FFlagEnableLeftNavOnConsole_0 then require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).TenFootUiGlobalEffects else nil;
local l_SduiDiscoveryDependencyUpdater_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiDiscoveryDependencyUpdater;
local l_SduiAvatarExperienceRegister_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceServerDrivenUi).SduiAvatarExperienceRegister;
local l_SduiSharedRegister_0 = require(l_CorePackages_0.Workspace.Packages.SduiSharedContent).SduiSharedRegister;
local v96 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v97 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v98 = nil;
local v99 = nil;
if v97 then
    v98 = require(l_Modules_0.LuaApp.Components.FlyoutSidePanel.FlyoutSidePanelWrapper);
    v99 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).FlyoutScrollAwayControl;
end;
local v100 = {
    GetFFlagUseUpdatedVNGAgreementsWorkflow = v39.GetFFlagUseUpdatedVNGAgreementsWorkflow, 
    GetFFlagEnableAccessBlockAtAppContainerLevel = v39.GetFFlagEnableAccessBlockAtAppContainerLevel, 
    GetFFlagLuaAppFixStudioNotchSupport = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport), 
    GetFFlagVRPanelWidthIXPEnabled = v39.GetFFlagVRPanelWidthIXPEnabled, 
    GetFFlagLuaAppEnableTopBanner = v39.GetFFlagLuaAppEnableTopBanner, 
    FFlagAppIaScrollAway = v39.FFlagAppIaScrollAway, 
    GetFFlagLuaAppPersistentMusicPlayer = v39.GetFFlagLuaAppPersistentMusicPlayer, 
    FFlagEnableSystemTrayModals = v39.FFlagEnableSystemTrayModals, 
    FFlagAppIaHomeSubTab = v39.FFlagAppIaHomeSubTab, 
    FFlagAppNavObservability = v39.FFlagAppNavObservability, 
    FFlagEnableAvatarExperienceSdui = v39.FFlagEnableAvatarExperienceSdui, 
    FFlagLuaAppUseOverlayInAppContainer = v39.FFlagLuaAppUseOverlayInAppContainer, 
    FFlagLuaAppForceVrAppPanelWidthRollout = v39.FFlagLuaAppForceVrAppPanelWidthRollout
};
local v101 = game:DefineFastFlag("LuaAppEnableToastNotifications4", false);
local v102 = game:DefineFastFlag("AXEnablePercievedTTIForAX", false);
local v103 = game:DefineFastFlag("RemoveUpdatePromptChild", false);
local v104 = game:DefineFastInt("PartyTabBadgeMaxCount", 49);
local v105 = v39.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v100.GetFFlagLuaAppFixStudioNotchSupport();
local l_FFlagFixNavigationInsetsOnHiddenTabBar_0 = v39.FFlagFixNavigationInsetsOnHiddenTabBar;
local v107 = game:DefineFastFlag("AXFixMarketplaceTTIPerceivedTracking", false);
local l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableMilestoneTrackingForAvatarExperience;
local l_FFlagAddGamepadBumperNavigation_0 = v39.FFlagAddGamepadBumperNavigation;
local function _() --[[ Line: 158 ]] --[[ Name: getDevicePlatform ]]
    -- upvalues: l_UserInputService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Enum.Platform.None;
    else
        return l_UserInputService_0:GetPlatform();
    end;
end;
local v111 = if _G.__TESTEZ_RUNNING_TEST__ then Enum.Platform.None else l_UserInputService_0:GetPlatform();
local v112 = l_GuiService_0:IsTenFootInterface() and not l_FFlagEnableLeftNavOnConsole_0;
local v113, v114 = v69();
local v115 = v6.Component:extend("AppContainer");
v115.init = function(v116) --[[ Line: 174 ]] --[[ Name: init ]]
    -- upvalues: l_Logger_0 (copy), v61 (copy), v111 (copy), v12 (copy), v100 (copy), v19 (copy), v38 (copy), v112 (copy), l_AvatarScreen_0 (copy), v102 (copy), v84 (copy), v107 (copy), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (copy), l_TTIPerformanceManager_0 (copy), l_TimeToInteractiveTracker_0 (copy), v85 (copy), l_ChatEntryPointNames_0 (copy), v34 (copy), v41 (copy), v82 (copy), v9 (copy), v11 (copy)
    v116.props.loggingProtocol:logEventOnce("app_container_init_begin");
    l_Logger_0:info("Initializing App Container");
    local l_store_0 = v116.props.store;
    local l_bottomBarAnalytics_0 = v116.props.bottomBarAnalytics;
    l_store_0:dispatch(v61(v111));
    v116.bottomBarButtonActivated = function(v119, v120) --[[ Line: 184 ]]
        -- upvalues: v116 (copy), v12 (ref), v100 (ref), v19 (ref), v38 (ref), v112 (ref), l_AvatarScreen_0 (ref), v102 (ref), l_store_0 (copy), v84 (ref), v107 (ref), l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 (ref), l_TTIPerformanceManager_0 (ref), l_TimeToInteractiveTracker_0 (ref), v85 (ref), l_ChatEntryPointNames_0 (ref), v34 (ref), v41 (ref), l_Logger_0 (ref), v82 (ref), l_bottomBarAnalytics_0 (copy)
        local l_currentPage_0 = v116.props.currentPage;
        local l_selectedBottomBarItemIndex_0 = v116.props.selectedBottomBarItemIndex;
        if not l_selectedBottomBarItemIndex_0 then
            return;
        else
            local l_page_0 = v116.props.bottomBarItems[l_selectedBottomBarItemIndex_0].page;
            if v119 == l_currentPage_0 then
                v12.ReloadPage:fire(v119);
            elseif v100.FFlagAppIaHomeSubTab and v119 == v19.Constants.HomeContainerName then
                if l_currentPage_0 == v38.Home then
                    v12.ReloadPage:fire(v38.Home);
                else
                    v116.props.navigateToPage(v38.Home);
                    if v120 then
                        v116.props.notificationService:ActionTaken(v120);
                    end;
                end;
            elseif v119 == v38.AvatarExperienceRoot then
                local v124 = if v112 then v38.AvatarExperienceRoot else l_AvatarScreen_0.Catalog;
                if v102 then
                    l_store_0:dispatch(v84.PercievedTrackingStarted());
                    if v107 then
                        if l_FFlagAXEnableMilestoneTrackingForAvatarExperience_0 then
                            l_TTIPerformanceManager_0.Surface.Marketplace.Root.startPerceivedTracking();
                        else
                            l_TimeToInteractiveTracker_0.trackStart(v85.Counter.PREFIX .. v85.Counter.Latency.Organic.Tiles .. "_Percieved");
                            l_TimeToInteractiveTracker_0.trackStart(v85.Counter.PREFIX .. v85.Counter.Latency.Organic.Thumbnails .. "_Percieved");
                            l_TimeToInteractiveTracker_0.trackStart(v85.Counter.PREFIX .. v85.Counter.Latency.Widget.Tiles .. "_Percieved");
                            l_TimeToInteractiveTracker_0.trackStart(v85.Counter.PREFIX .. v85.Counter.Latency.Widget.Thumbnails .. "_Percieved");
                        end;
                    end;
                end;
                v116.props.navigateToPage(v124);
                if v120 then
                    v116.props.notificationService:ActionTaken(v120);
                end;
            elseif v119 == v38.Chat then
                v116.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SystemBar);
                v34(v116.props.analytics.EventStream, "AppContainer", v116.props.chatBadgeCount);
                l_store_0:dispatch(v41.rodux.ClearGlobalUnreadCount.API()):catch(function(v125) --[[ Line: 243 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:error("Error in ClearGlobalUnreadCount request. Error: {}", (tostring(v125)));
                end);
                v116.props.navigateToPage(v119);
                if v120 then
                    v116.props.notificationService:ActionTaken(v120);
                end;
            else
                v116.props.navigateToPage(v119);
                if v120 then
                    v116.props.notificationService:ActionTaken(v120);
                end;
            end;
            if v100.FFlagAppNavObservability and v119 ~= l_page_0 then
                v82.AppNavTelemetry.logSwitchTabStart(l_page_0, v119);
            end;
            l_bottomBarAnalytics_0.ButtonActivated(v119, l_page_0);
            return;
        end;
    end;
    v116.getBottomBarLayoutInfo = v9(function(v126, v127, _) --[[ Line: 263 ]]
        -- upvalues: v11 (ref)
        local v129 = math.max(v126.X - v127.left - v127.right - 600, 0);
        local l_BOTTOM_BAR_SIZE_0 = v11.BOTTOM_BAR_SIZE;
        local v131 = math.max(v127.bottom - l_BOTTOM_BAR_SIZE_0, 0);
        return {
            Background = {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, -v127.left, 1, 0), 
                Size = UDim2.new(0, v126.X, 0, v127.bottom)
            }, 
            Padding = {
                PaddingLeft = UDim.new(0, v127.left + v129 / 2), 
                PaddingRight = UDim.new(0, v127.right + v129 / 2), 
                PaddingBottom = UDim.new(0, v131)
            }
        };
    end);
    v116.props.loggingProtocol:logEventOnce("app_container_init_end");
end;
v115.didMount = function(v132) --[[ Line: 287 ]] --[[ Name: didMount ]]
    -- upvalues: v59 (copy), v100 (copy)
    v132.props.store:dispatch(v59(false));
    if v100.GetFFlagEnableAccessBlockAtAppContainerLevel() and v132.props.userLoggedIn and v132.props.policyShouldBlockUAppAccess then
        v132.props.resetNavigationHistoryToBlockPage();
    end;
end;
v115.willUpdate = function(v133, v134) --[[ Line: 303 ]] --[[ Name: willUpdate ]]
    -- upvalues: v53 (copy), v36 (copy), v100 (copy), v82 (copy), l_VisibilityControl_0 (copy), v97 (copy), v99 (ref)
    local v135 = v53[v134.currentPage] or {};
    local v136 = nil;
    local l_tabBarVisibility_0 = v134.tabBarVisibility;
    if typeof(l_tabBarVisibility_0) == "function" then
        l_tabBarVisibility_0 = l_tabBarVisibility_0({
            formFactor = v134.formFactor
        });
    end;
    v136 = if l_tabBarVisibility_0 == v36.PolicyDependent then v133.props.shouldSystemBarUsuallyBePresent else l_tabBarVisibility_0 ~= v36.Hidden;
    if not v135.overridesAppRouterTabBarControl and v136 ~= v134.bottomBarVisible then
        v133.props.setTabBarVisible(v136);
    end;
    if v100.FFlagAppIaScrollAway and v82.getScrollAwayEnabled() then
        local v138 = if v135.overridesAppRouterTabBarControl then v134.bottomBarVisible else v136;
        local v139 = v135.enableScrollAway and v138;
        if v134.currentPage ~= v133.props.currentPage then
            l_VisibilityControl_0.show();
        elseif v138 and v139 ~= l_VisibilityControl_0.isEnabled() then
            l_VisibilityControl_0.show();
        end;
        if v97 then
            v99.setScrollAwayEnabled(v139);
            return;
        else
            l_VisibilityControl_0.setEnabled(v139);
        end;
    end;
end;
v115.didUpdate = function(v140, _, _) --[[ Line: 350 ]] --[[ Name: didUpdate ]]
    -- upvalues: v100 (copy), v38 (copy)
    if v140.props.userLoggedIn and v140.props.appPolicy.getVNGFormRequired() and not v100.GetFFlagUseUpdatedVNGAgreementsWorkflow() then
        v140.props.showVngForm();
    end;
    if v100.GetFFlagEnableAccessBlockAtAppContainerLevel() then
        local v143 = v140.props.policyShouldBlockUAppAccess and v140.props.userLoggedIn;
        local v144 = v140.props.currentPage == v38.UAppBlock;
        if v143 and not v144 then
            v140.props.resetNavigationHistoryToBlockPage();
        end;
    end;
end;
v115.render = function(v145) --[[ Line: 369 ]] --[[ Name: render ]]
    -- upvalues: v112 (copy), v6 (copy), v67 (copy), l_HardwareSafeAreaInsets_0 (copy), l_withStyle_0 (copy), v105 (copy), v100 (copy), v79 (copy), v38 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), v24 (copy), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (copy), v47 (copy), v88 (copy), v25 (copy), v11 (copy), v52 (copy), l_AppShortcutBarContext_0 (copy), l_AppShortcutBarContainer_0 (copy), v89 (copy), v90 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v92 (copy), l_VRReadyWrapper_0 (copy), l_VRConstants_0 (copy), l_IsVRAppBuild_0 (copy), l_CoreGui_0 (copy), v22 (copy), v101 (copy), l_AppToastNotificationContainer_0 (copy), l_GameInviteModal_0 (copy), l_GameInviteConstants_0 (copy), v23 (copy), v43 (copy), v26 (copy), v97 (copy), v98 (ref), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v45 (copy), v42 (copy), v103 (copy), v44 (copy), v71 (copy), v75 (copy), l_SduiDiscoveryDependencyUpdater_0 (copy), l_SduiAvatarExperienceRegister_0 (copy), l_SduiSharedRegister_0 (copy)
    local l_screenSize_0 = v145.props.screenSize;
    local l_globalGuiInset_0 = v145.props.globalGuiInset;
    local l_bottomBarVisible_0 = v145.props.bottomBarVisible;
    local l_selectedBottomBarItemIndex_1 = v145.props.selectedBottomBarItemIndex;
    local l_bottomBarItems_0 = v145.props.bottomBarItems;
    local l_isGamepadInput_0 = v145.props.isGamepadInput;
    local v152 = v112 and l_isGamepadInput_0;
    local v153 = nil;
    local v154 = v6.createElement(v67);
    local v155 = l_HardwareSafeAreaInsets_0.deviceInsets();
    v153 = l_withStyle_0(function(v156) --[[ Line: 386 ]]
        -- upvalues: v105 (ref), v100 (ref), v6 (ref), l_globalGuiInset_0 (copy), v155 (copy), v145 (copy), v79 (ref), v38 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_FFlagAddGamepadBumperNavigation_0 (ref), v24 (ref), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (ref), l_bottomBarVisible_0 (copy), v47 (ref), v88 (ref), v25 (ref), v11 (ref), l_screenSize_0 (copy), l_selectedBottomBarItemIndex_1 (copy), l_bottomBarItems_0 (copy), v52 (ref), l_AppShortcutBarContext_0 (ref), l_AppShortcutBarContainer_0 (ref), v89 (ref), v90 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), v92 (ref), l_VRReadyWrapper_0 (ref), l_VRConstants_0 (ref), l_IsVRAppBuild_0 (ref)
        local v157 = nil;
        if not v105 and v100.GetFFlagLuaAppFixStudioNotchSupport() then
            v157 = v6.createElement("UIPadding", {
                PaddingTop = if v100.GetFFlagLuaAppEnableTopBanner() then UDim.new(0, l_globalGuiInset_0.top) else nil, 
                PaddingBottom = UDim.new(0, l_globalGuiInset_0.bottom), 
                PaddingLeft = UDim.new(0, l_globalGuiInset_0.left)
            });
        end;
        local v158 = v105 and (not (v155.top <= 0 and v155.bottom <= 0 and v155.left <= 0 and v155.right <= 0) or v145.props.usePreferredInput == v79.Input.Touch) and v145.props.currentPage ~= v38.AvatarExperienceRoot;
        local v159 = {
            RNAppContainer = v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                shouldRestoreFocus = false, 
                customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v145.props.bumperNavigationEventMap else nil, 
                customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v145.props.bumperNavigationEventHandlerMap else nil
            }, v6.createElement(v24, if l_FFlagFixNavigationInsetsOnHiddenTabBar_0 then {
                isTabBarVisible = l_bottomBarVisible_0
            } else nil, {
                RootNavigator = v6.createElement(v47, {
                    navigation = v145.props.navigation
                })
            })), 
            MusicPlayer = if v100.GetFFlagLuaAppPersistentMusicPlayer() then v6.createElement(v88.AppMusicPlayer) else nil, 
            SystemBar = v6.createElement(v25, {
                isVisible = l_bottomBarVisible_0, 
                displayOrder = v11.DisplayOrder.SystemBar, 
                layoutInfo = v145.getBottomBarLayoutInfo(l_screenSize_0, l_globalGuiInset_0), 
                selectedIndex = l_selectedBottomBarItemIndex_1, 
                items = l_bottomBarItems_0, 
                onActivated = v145.bottomBarButtonActivated, 
                customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v145.props.bumperNavigationEventMap else nil, 
                customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v145.props.bumperNavigationEventHandlerMap else nil
            }), 
            Reporter = v6.createElement(v52), 
            SafePadding = v157, 
            AppShortcutBar = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ShortcutBarContext = v6.createElement(l_AppShortcutBarContext_0.Provider, {}, {
                    ShortcutBar = v6.createElement(l_AppShortcutBarContainer_0)
                })
            }), 
            NativeCloseEventConnector = if v100.FFlagEnableSystemTrayModals then v6.createElement(v89, {
                onNativeCloseEvent = v90
            }) else nil, 
            TenFootUiGlobalEffects = if l_FFlagEnableLeftNavOnConsole_0 then v6.createElement(v92) else nil, 
            DeviceInsetBackground = if v158 then v6.createElement("Frame", {
                Position = UDim2.new(0, -v155.left, 0, -v155.top), 
                Size = UDim2.new(0, l_screenSize_0.X + v155.left + v155.right, 0, l_screenSize_0.Y + v155.top + v155.bottom), 
                BackgroundColor3 = v156.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v156.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 0
            }) else nil
        };
        local v160 = nil;
        if v100.GetFFlagLuaAppFixStudioNotchSupport() then
            v160 = if v105 then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None;
        end;
        return v6.createElement(l_VRReadyWrapper_0, {
            component = "ScreenGui", 
            props = {
                Enabled = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = 1, 
                ScreenInsets = v160, 
                ClipToDeviceSafeArea = not v105 and nil
            }, 
            vrProps = {
                partSize = if not v100.FFlagLuaAppForceVrAppPanelWidthRollout and v145.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenSize.X * v145.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize, 
                offset = if not not v100.FFlagLuaAppForceVrAppPanelWidthRollout or v100.GetFFlagVRPanelWidthIXPEnabled() and v145.props.vrPanelCurvature == 0 then CFrame.new(l_VRConstants_0.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                virtualScreenSize = if not v100.FFlagLuaAppForceVrAppPanelWidthRollout and v145.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v145.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
                panelName = "MainAppScreen", 
                curvature = if not v100.FFlagLuaAppForceVrAppPanelWidthRollout and v145.props.vrPanelCurvature then v145.props.vrPanelCurvature else l_VRConstants_0.MainScreenCurvature, 
                hidden = l_IsVRAppBuild_0() and v145.props.currentPage == v38.AvatarExperienceRoot, 
                roundedCornersFrameColor = v156.Theme.BackgroundDefault.Color
            }
        }, v159);
    end);
    local v161 = v6.createElement(v6.Portal, {
        target = l_CoreGui_0
    }, {
        LuaAppScreenGui = v153
    });
    local v162 = {
        Toast = v6.createElement(v22, {
            displayOrder = v11.DisplayOrder.Toast
        }), 
        ToastNotification = if v101 then v6.createElement(l_AppToastNotificationContainer_0, {
            displayOrder = v11.DisplayOrder.Toast
        }) else nil, 
        GameInviteModal = v6.createElement(l_GameInviteModal_0, {
            displayOrder = v11.DisplayOrder.GameInviteModal, 
            renderLocation = l_GameInviteConstants_0.RenderLocation.UniversalApp
        }), 
        CentralOverlay = v6.createElement(v23, {
            includeStatusBar = l_bottomBarVisible_0, 
            displayOrder = v11.DisplayOrder.CentralOverlay
        }), 
        GamepadBottomBar = v152 and v6.createElement(v43, {
            displayOrder = v11.DisplayOrder.GamepadBottomBar
        }), 
        RNBypassTree = v161, 
        TopBanner = if v100.GetFFlagLuaAppEnableTopBanner() then v6.createElement(v26, {
            displayOrder = v11.DisplayOrder.TopBanner
        }) else nil, 
        FlyoutSidePanel = if v97 then v6.createElement(v98, {
            displayOrder = v11.DisplayOrder.FlyoutSidePanel
        }) else nil, 
        AvatarExperienceMountedAtStartup = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v6.createElement(v45, {
            store = v145.props.store, 
            shouldManageBackground = not l_IsVRAppBuild_0() and nil
        }), 
        FullscreenTitleBar = v6.createElement(v42, {
            displayOrder = v11.DisplayOrder.FullscreenTitleBar
        }), 
        UpdateRequiredPrompt = if not not l_GetFFlagLuaAppPostAppInteractiveLoader_0() or v103 then nil else v6.createElement(v44), 
        VRPointer = if v145.props.use3DPanels then v154 else nil, 
        AppLoadingSplashScreen = v6.createElement(v71), 
        ShellEventsContainer = v6.createElement(v75, {
            currentPage = v145.props.currentPage
        }), 
        SduiDiscoveryDependencyUpdater = v6.createElement(l_SduiDiscoveryDependencyUpdater_0), 
        SduiAvatarExperienceRegister = if v100.FFlagEnableAvatarExperienceSdui then v6.createElement(l_SduiAvatarExperienceRegister_0) else nil, 
        SduiSharedRegister = v6.createElement(l_SduiSharedRegister_0)
    };
    return v6.createElement("Folder", {}, v162);
end;
local v170 = v9(function(v163, _, v165) --[[ Line: 605 ]]
    -- upvalues: v113 (ref), v114 (ref), v69 (copy), v33 (copy), v104 (copy), l_BadgeVariant_0 (copy), v38 (copy), v5 (copy)
    local v166, v167 = v69();
    v113 = v166;
    v114 = v167;
    v166 = v163;
    v167 = nil;
    if typeof(v163) == "number" and v163 > 0 then
        if v165 and v165.EventStream then
            v33(v165.EventStream, "AppContainer", v163);
        end;
        v166 = if v104 < v163 then tostring(v104) .. "+" else tostring(v163);
        v167 = l_BadgeVariant_0.Alert;
    end;
    local l_v113_0 = v113;
    local v169 = v114[v38.Chat];
    if v169 ~= nil then
        l_v113_0 = v5.List.join(v113);
        l_v113_0[v169].badgeCount = v166;
        l_v113_0[v169].badgeVariant = v167;
    end;
    return l_v113_0;
end);
v115 = v7.connect(function(v171, v172) --[[ Line: 633 ]]
    -- upvalues: v53 (copy), v36 (copy), v114 (ref), v170 (copy), v35 (copy)
    local l_history_0 = v171.Navigation.history;
    local v174 = l_history_0[#l_history_0];
    local v175 = v171.SocialTab.UnreadConversationCount or 0;
    local v176 = nil;
    v176 = (function(v177) --[[ Line: 638 ]]
        -- upvalues: v53 (ref), v174 (copy), v36 (ref)
        for v178 = #v177, 1, -1 do
            local v179 = v53[v174[v178].name] or {};
            if v179.tabBarHidden then
                return v179.tabBarHidden;
            end;
        end;
        return v36.Visible;
    end)(v174);
    return {
        screenSize = v171.ScreenSize, 
        globalGuiInset = v171.GlobalGuiInset, 
        bottomBarVisible = v171.TabBarVisible, 
        selectedBottomBarItemIndex = v114[v174[1].name], 
        currentPage = v174[#v174].name, 
        tabBarVisibility = v176, 
        bottomBarItems = v170(v175, v172.canSeeChatTab, v172.analytics), 
        chatBadgeCount = v175, 
        userLoggedIn = v171.AuthenticationStatus.status == v35.LOGGED_IN, 
        formFactor = v171.FormFactor, 
        localUserId = v171.LocalUserId
    };
end, function(v180) --[[ Line: 665 ]]
    -- upvalues: v58 (copy), v60 (copy), v38 (copy), v100 (copy), v82 (copy), l_SetTabBarVisible_0 (copy), v65 (copy), v64 (copy), l_EnteredChatFromEntryPoint_0 (copy)
    return {
        navigateToPage = function(v181) --[[ Line: 667 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v180 (copy), v58 (ref)
            v180(v58({
                {
                    name = v181
                }
            }));
        end, 
        resetNavigationHistoryToBlockPage = function() --[[ Line: 670 ]] --[[ Name: resetNavigationHistoryToBlockPage ]]
            -- upvalues: v180 (copy), v60 (ref), v38 (ref)
            v180(v60({
                {
                    name = v38.UAppBlock
                }
            }));
        end, 
        setTabBarVisible = function(v182) --[[ Line: 673 ]] --[[ Name: setTabBarVisible ]]
            -- upvalues: v100 (ref), v82 (ref), v180 (copy), l_SetTabBarVisible_0 (ref)
            if v100.FFlagAppNavObservability then
                v82.AppNavTelemetry.logVisibilityStart(v182);
            end;
            v180(l_SetTabBarVisible_0(v182));
        end, 
        showVngForm = function() --[[ Line: 682 ]] --[[ Name: showVngForm ]]
            -- upvalues: v180 (copy), v65 (ref), v64 (ref)
            v180(v65(v64.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        enteredChatFromEntryPoint = function(v183) --[[ Line: 687 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v180 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            v180(l_EnteredChatFromEntryPoint_0(v183));
        end
    };
end)(v115);
v115 = l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0, 
    networking = v30, 
    bottomBarAnalytics = v31, 
    analytics = v32, 
    loggingProtocol = l_AppLogging_0
})(v115);
v115 = l_withIsGamepadInput_0((l_RoactAppPolicy_0.connect(function(v184) --[[ Line: 701 ]]
    -- upvalues: v100 (copy), v96 (copy)
    return {
        appPolicy = v184, 
        policyShouldBlockUAppAccess = if v100.GetFFlagEnableAccessBlockAtAppContainerLevel() then v184.getEnableUAppAccessBlock() or v184.getEnableHomePageAgeBlock() else nil, 
        shouldSystemBarUsuallyBePresent = v184.getShouldSystemBarUsuallyBePresent(), 
        canSeeChatTab = v96.getAppFeaturePolicies().getCanSeeChatTab()
    };
end)(v115)));
v115 = v15.withNavigation(v115);
v115 = v62.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer, 
    "PlatformExcellence.QualityImprovement.App"
}, function(v185, _) --[[ Line: 719 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        luaAddFriendsPageEnabled = (v185[l_AppUserLayers_0.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True"
    };
end)(v115);
if not v100.FFlagLuaAppForceVrAppPanelWidthRollout then
    v115 = v66.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature
    })(v115);
end;
return function(v187) --[[ Line: 733 ]]
    -- upvalues: v100 (copy), l_useOverlay_0 (copy), l_useIsSpatial_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), l_useGamepadBumperNavigationBindings_0 (copy), v113 (ref), v5 (copy), v6 (copy), v115 (ref)
    if v100.FFlagLuaAppUseOverlayInAppContainer then
        l_useOverlay_0();
    end;
    local v188 = l_useIsSpatial_0();
    local v189 = nil;
    local v190 = nil;
    if l_FFlagAddGamepadBumperNavigation_0 then
        local v191 = l_useGamepadBumperNavigationBindings_0(v113);
        v189 = v191.eventMap;
        v190 = v191.eventHandlerMap;
    end;
    local v192 = v5.Dictionary.join(v187, {
        use3DPanels = v188, 
        bumperNavigationEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v189 else {}, 
        bumperNavigationEventHandlerMap = if l_FFlagAddGamepadBumperNavigation_0 then v190 else {}
    });
    return v6.createElement(v115, v192);
end;