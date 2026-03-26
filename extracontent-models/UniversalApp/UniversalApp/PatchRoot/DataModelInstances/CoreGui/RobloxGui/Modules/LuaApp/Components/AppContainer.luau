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
local l_EnteredChatFromEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Actions.EnteredChatFromEntryPoint;
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v57 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v58 = require(l_Modules_0.LuaApp.Thunks.SetNavigationLocked);
local v59 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v60 = require(l_Modules_0.LuaApp.Actions.SetPlatform);
local v61 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v63 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v64 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v65 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v66 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRAppPointer);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v68 = require(l_Modules_0.LuaApp.Components.AppNav.GetIABottomBarItems);
local l_AppToastNotificationContainer_0 = require(l_CorePackages_0.Workspace.Packages.ToastNotification).AppToastNotificationContainer;
local v70 = require(l_Modules_0.LuaApp.Components.Common.AppLoadingSplashScreen);
local v71 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModal_0 = v71.GameInviteModal;
local l_GameInviteConstants_0 = v71.GameInviteConstants;
local v74 = require(l_Modules_0.LuaApp.Components.Shell.ShellEventsContainer);
local v75 = require(l_CorePackages_0.Workspace.Packages.AppShortcutBar);
local l_AppShortcutBarContainer_0 = v75.AppShortcutBarContainer;
local l_AppShortcutBarContext_0 = v75.AppShortcutBarContext;
local v78 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useIsSpatial_0 = v78.useIsSpatial;
local l_HardwareSafeAreaInsets_0 = v78.HardwareSafeAreaInsets;
local v81 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v81.VisibilityControl;
local v83 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local v84 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local v86 = require(l_CorePackages_0.Workspace.Packages.AppMusicPlayer);
local v87 = require(l_Modules_0.LuaApp.Components.NativeCloseEventConnector);
local v88 = require(l_Modules_0.LuaApp.Thunks.CheckSystemTrayModal);
local l_FFlagEnableLeftNavOnConsole_0 = v39.FFlagEnableLeftNavOnConsole;
local v90 = if l_FFlagEnableLeftNavOnConsole_0 then require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).TenFootUiGlobalEffects else nil;
local l_SduiDiscoveryDependencyUpdater_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiDiscoveryDependencyUpdater;
local l_SduiAvatarExperienceRegister_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceServerDrivenUi).SduiAvatarExperienceRegister;
local l_SduiSharedRegister_0 = require(l_CorePackages_0.Workspace.Packages.SduiSharedContent).SduiSharedRegister;
local v94 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v95 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v96 = nil;
local v97 = nil;
if v95 then
    v96 = require(l_Modules_0.LuaApp.Components.FlyoutSidePanel.FlyoutSidePanelWrapper);
    v97 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).FlyoutScrollAwayControl;
end;
local v98 = {
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
local v99 = game:DefineFastFlag("LuaAppEnableToastNotifications4", false);
local v100 = game:DefineFastFlag("AXEnablePercievedTTIForAX", false);
local v101 = game:DefineFastFlag("RemoveUpdatePromptChild", false);
local v102 = game:DefineFastInt("PartyTabBadgeMaxCount", 49);
local v103 = v39.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v98.GetFFlagLuaAppFixStudioNotchSupport();
local l_FFlagFixNavigationInsetsOnHiddenTabBar_0 = v39.FFlagFixNavigationInsetsOnHiddenTabBar;
local v105 = game:DefineFastFlag("AXFixMarketplaceTTIPerceivedTracking", false);
local function _() --[[ Line: 150 ]] --[[ Name: getDevicePlatform ]]
    -- upvalues: l_UserInputService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Enum.Platform.None;
    else
        return l_UserInputService_0:GetPlatform();
    end;
end;
local v107 = if _G.__TESTEZ_RUNNING_TEST__ then Enum.Platform.None else l_UserInputService_0:GetPlatform();
local v108 = l_GuiService_0:IsTenFootInterface() and not l_FFlagEnableLeftNavOnConsole_0;
local v109, v110 = v68();
local v111 = v6.Component:extend("AppContainer");
v111.init = function(v112) --[[ Line: 166 ]] --[[ Name: init ]]
    -- upvalues: l_Logger_0 (copy), v60 (copy), v107 (copy), v12 (copy), v98 (copy), v19 (copy), v38 (copy), v108 (copy), l_AvatarScreen_0 (copy), v100 (copy), v83 (copy), v105 (copy), l_TimeToInteractiveTracker_0 (copy), v84 (copy), l_ChatEntryPointNames_0 (copy), v34 (copy), v41 (copy), v81 (copy), v9 (copy), v11 (copy)
    v112.props.loggingProtocol:logEventOnce("app_container_init_begin");
    l_Logger_0:info("Initializing App Container");
    local l_store_0 = v112.props.store;
    local l_bottomBarAnalytics_0 = v112.props.bottomBarAnalytics;
    l_store_0:dispatch(v60(v107));
    v112.bottomBarButtonActivated = function(v115, v116) --[[ Line: 176 ]]
        -- upvalues: v112 (copy), v12 (ref), v98 (ref), v19 (ref), v38 (ref), v108 (ref), l_AvatarScreen_0 (ref), v100 (ref), l_store_0 (copy), v83 (ref), v105 (ref), l_TimeToInteractiveTracker_0 (ref), v84 (ref), l_ChatEntryPointNames_0 (ref), v34 (ref), v41 (ref), l_Logger_0 (ref), v81 (ref), l_bottomBarAnalytics_0 (copy)
        local l_currentPage_0 = v112.props.currentPage;
        local l_selectedBottomBarItemIndex_0 = v112.props.selectedBottomBarItemIndex;
        if not l_selectedBottomBarItemIndex_0 then
            return;
        else
            local l_page_0 = v112.props.bottomBarItems[l_selectedBottomBarItemIndex_0].page;
            if v115 == l_currentPage_0 then
                v12.ReloadPage:fire(v115);
            elseif v98.FFlagAppIaHomeSubTab and v115 == v19.Constants.HomeContainerName then
                if l_currentPage_0 == v38.Home then
                    v12.ReloadPage:fire(v38.Home);
                else
                    v112.props.navigateToPage(v38.Home);
                    if v116 then
                        v112.props.notificationService:ActionTaken(v116);
                    end;
                end;
            elseif v115 == v38.AvatarExperienceRoot then
                local v120 = if v108 then v38.AvatarExperienceRoot else l_AvatarScreen_0.Catalog;
                if v100 then
                    l_store_0:dispatch(v83.PercievedTrackingStarted());
                    if v105 then
                        l_TimeToInteractiveTracker_0.trackStart(v84.Counter.PREFIX .. v84.Counter.Latency.Organic.Tiles .. "_Percieved");
                        l_TimeToInteractiveTracker_0.trackStart(v84.Counter.PREFIX .. v84.Counter.Latency.Organic.Thumbnails .. "_Percieved");
                        l_TimeToInteractiveTracker_0.trackStart(v84.Counter.PREFIX .. v84.Counter.Latency.Widget.Tiles .. "_Percieved");
                        l_TimeToInteractiveTracker_0.trackStart(v84.Counter.PREFIX .. v84.Counter.Latency.Widget.Thumbnails .. "_Percieved");
                    end;
                end;
                v112.props.navigateToPage(v120);
                if v116 then
                    v112.props.notificationService:ActionTaken(v116);
                end;
            elseif v115 == v38.Chat then
                v112.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SystemBar);
                v34(v112.props.analytics.EventStream, "AppContainer", v112.props.chatBadgeCount);
                l_store_0:dispatch(v41.rodux.ClearGlobalUnreadCount.API()):catch(function(v121) --[[ Line: 228 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:error("Error in ClearGlobalUnreadCount request. Error: {}", (tostring(v121)));
                end);
                v112.props.navigateToPage(v115);
                if v116 then
                    v112.props.notificationService:ActionTaken(v116);
                end;
            else
                v112.props.navigateToPage(v115);
                if v116 then
                    v112.props.notificationService:ActionTaken(v116);
                end;
            end;
            if v98.FFlagAppNavObservability and v115 ~= l_page_0 then
                v81.AppNavTelemetry.logSwitchTabStart(l_page_0, v115);
            end;
            l_bottomBarAnalytics_0.ButtonActivated(v115, l_page_0);
            return;
        end;
    end;
    v112.getBottomBarLayoutInfo = v9(function(v122, v123, _) --[[ Line: 248 ]]
        -- upvalues: v11 (ref)
        local v125 = math.max(v122.X - v123.left - v123.right - 600, 0);
        local l_BOTTOM_BAR_SIZE_0 = v11.BOTTOM_BAR_SIZE;
        local v127 = math.max(v123.bottom - l_BOTTOM_BAR_SIZE_0, 0);
        return {
            Background = {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, -v123.left, 1, 0), 
                Size = UDim2.new(0, v122.X, 0, v123.bottom)
            }, 
            Padding = {
                PaddingLeft = UDim.new(0, v123.left + v125 / 2), 
                PaddingRight = UDim.new(0, v123.right + v125 / 2), 
                PaddingBottom = UDim.new(0, v127)
            }
        };
    end);
    v112.props.loggingProtocol:logEventOnce("app_container_init_end");
end;
v111.didMount = function(v128) --[[ Line: 272 ]] --[[ Name: didMount ]]
    -- upvalues: v58 (copy), v98 (copy)
    v128.props.store:dispatch(v58(false));
    if v98.GetFFlagEnableAccessBlockAtAppContainerLevel() and v128.props.userLoggedIn and v128.props.policyShouldBlockUAppAccess then
        v128.props.resetNavigationHistoryToBlockPage();
    end;
end;
v111.willUpdate = function(v129, v130) --[[ Line: 288 ]] --[[ Name: willUpdate ]]
    -- upvalues: v53 (copy), v36 (copy), v98 (copy), v81 (copy), l_VisibilityControl_0 (copy), v95 (copy), v97 (ref)
    local v131 = v53[v130.currentPage] or {};
    local v132 = nil;
    local l_tabBarVisibility_0 = v130.tabBarVisibility;
    if typeof(l_tabBarVisibility_0) == "function" then
        l_tabBarVisibility_0 = l_tabBarVisibility_0({
            formFactor = v130.formFactor
        });
    end;
    v132 = if l_tabBarVisibility_0 == v36.PolicyDependent then v129.props.shouldSystemBarUsuallyBePresent else l_tabBarVisibility_0 ~= v36.Hidden;
    if not v131.overridesAppRouterTabBarControl and v132 ~= v130.bottomBarVisible then
        v129.props.setTabBarVisible(v132);
    end;
    if v98.FFlagAppIaScrollAway and v81.getScrollAwayEnabled() then
        local v134 = if v131.overridesAppRouterTabBarControl then v130.bottomBarVisible else v132;
        local v135 = v131.enableScrollAway and v134;
        if v130.currentPage ~= v129.props.currentPage then
            l_VisibilityControl_0.show();
        elseif v134 and v135 ~= l_VisibilityControl_0.isEnabled() then
            l_VisibilityControl_0.show();
        end;
        if v95 then
            v97.setScrollAwayEnabled(v135);
            return;
        else
            l_VisibilityControl_0.setEnabled(v135);
        end;
    end;
end;
v111.didUpdate = function(v136, _, _) --[[ Line: 335 ]] --[[ Name: didUpdate ]]
    -- upvalues: v98 (copy), v38 (copy)
    if v136.props.userLoggedIn and v136.props.appPolicy.getVNGFormRequired() and not v98.GetFFlagUseUpdatedVNGAgreementsWorkflow() then
        v136.props.showVngForm();
    end;
    if v98.GetFFlagEnableAccessBlockAtAppContainerLevel() then
        local v139 = v136.props.policyShouldBlockUAppAccess and v136.props.userLoggedIn;
        local v140 = v136.props.currentPage == v38.UAppBlock;
        if v139 and not v140 then
            v136.props.resetNavigationHistoryToBlockPage();
        end;
    end;
end;
v111.render = function(v141) --[[ Line: 354 ]] --[[ Name: render ]]
    -- upvalues: v108 (copy), v6 (copy), v66 (copy), l_HardwareSafeAreaInsets_0 (copy), l_withStyle_0 (copy), v103 (copy), v98 (copy), v78 (copy), v38 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v24 (copy), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (copy), v47 (copy), v86 (copy), v25 (copy), v11 (copy), v52 (copy), l_AppShortcutBarContext_0 (copy), l_AppShortcutBarContainer_0 (copy), v87 (copy), v88 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v90 (copy), l_VRReadyWrapper_0 (copy), l_VRConstants_0 (copy), l_IsVRAppBuild_0 (copy), l_CoreGui_0 (copy), v22 (copy), v99 (copy), l_AppToastNotificationContainer_0 (copy), l_GameInviteModal_0 (copy), l_GameInviteConstants_0 (copy), v23 (copy), v43 (copy), v26 (copy), v95 (copy), v96 (ref), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v45 (copy), v42 (copy), v101 (copy), v44 (copy), v70 (copy), v74 (copy), l_SduiDiscoveryDependencyUpdater_0 (copy), l_SduiAvatarExperienceRegister_0 (copy), l_SduiSharedRegister_0 (copy)
    local l_screenSize_0 = v141.props.screenSize;
    local l_globalGuiInset_0 = v141.props.globalGuiInset;
    local l_bottomBarVisible_0 = v141.props.bottomBarVisible;
    local l_selectedBottomBarItemIndex_1 = v141.props.selectedBottomBarItemIndex;
    local l_bottomBarItems_0 = v141.props.bottomBarItems;
    local l_isGamepadInput_0 = v141.props.isGamepadInput;
    local v148 = v108 and l_isGamepadInput_0;
    local v149 = nil;
    local v150 = v6.createElement(v66);
    local v151 = l_HardwareSafeAreaInsets_0.deviceInsets();
    v149 = l_withStyle_0(function(v152) --[[ Line: 371 ]]
        -- upvalues: v103 (ref), v98 (ref), v6 (ref), l_globalGuiInset_0 (copy), v151 (copy), v141 (copy), v78 (ref), v38 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v24 (ref), l_FFlagFixNavigationInsetsOnHiddenTabBar_0 (ref), l_bottomBarVisible_0 (copy), v47 (ref), v86 (ref), v25 (ref), v11 (ref), l_screenSize_0 (copy), l_selectedBottomBarItemIndex_1 (copy), l_bottomBarItems_0 (copy), v52 (ref), l_AppShortcutBarContext_0 (ref), l_AppShortcutBarContainer_0 (ref), v87 (ref), v88 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), v90 (ref), l_VRReadyWrapper_0 (ref), l_VRConstants_0 (ref), l_IsVRAppBuild_0 (ref)
        local v153 = nil;
        if not v103 and v98.GetFFlagLuaAppFixStudioNotchSupport() then
            v153 = v6.createElement("UIPadding", {
                PaddingTop = if v98.GetFFlagLuaAppEnableTopBanner() then UDim.new(0, l_globalGuiInset_0.top) else nil, 
                PaddingBottom = UDim.new(0, l_globalGuiInset_0.bottom), 
                PaddingLeft = UDim.new(0, l_globalGuiInset_0.left)
            });
        end;
        local v154 = v103 and (not (v151.top <= 0 and v151.bottom <= 0 and v151.left <= 0 and v151.right <= 0) or v141.props.usePreferredInput == v78.Input.Touch) and v141.props.currentPage ~= v38.AvatarExperienceRoot;
        local v155 = {
            RNAppContainer = v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                shouldRestoreFocus = false
            }, v6.createElement(v24, if l_FFlagFixNavigationInsetsOnHiddenTabBar_0 then {
                isTabBarVisible = l_bottomBarVisible_0
            } else nil, {
                RootNavigator = v6.createElement(v47, {
                    navigation = v141.props.navigation
                })
            })), 
            MusicPlayer = if v98.GetFFlagLuaAppPersistentMusicPlayer() then v6.createElement(v86.AppMusicPlayer) else nil, 
            SystemBar = v6.createElement(v25, {
                isVisible = l_bottomBarVisible_0, 
                displayOrder = v11.DisplayOrder.SystemBar, 
                layoutInfo = v141.getBottomBarLayoutInfo(l_screenSize_0, l_globalGuiInset_0), 
                selectedIndex = l_selectedBottomBarItemIndex_1, 
                items = l_bottomBarItems_0, 
                onActivated = v141.bottomBarButtonActivated
            }), 
            Reporter = v6.createElement(v52), 
            SafePadding = v153, 
            AppShortcutBar = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ShortcutBarContext = v6.createElement(l_AppShortcutBarContext_0.Provider, {}, {
                    ShortcutBar = v6.createElement(l_AppShortcutBarContainer_0)
                })
            }), 
            NativeCloseEventConnector = if v98.FFlagEnableSystemTrayModals then v6.createElement(v87, {
                onNativeCloseEvent = v88
            }) else nil, 
            TenFootUiGlobalEffects = if l_FFlagEnableLeftNavOnConsole_0 then v6.createElement(v90) else nil, 
            DeviceInsetBackground = if v154 then v6.createElement("Frame", {
                Position = UDim2.new(0, -v151.left, 0, -v151.top), 
                Size = UDim2.new(0, l_screenSize_0.X + v151.left + v151.right, 0, l_screenSize_0.Y + v151.top + v151.bottom), 
                BackgroundColor3 = v152.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v152.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 0
            }) else nil
        };
        local v156 = nil;
        if v98.GetFFlagLuaAppFixStudioNotchSupport() then
            v156 = if v103 then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None;
        end;
        return v6.createElement(l_VRReadyWrapper_0, {
            component = "ScreenGui", 
            props = {
                Enabled = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = 1, 
                ScreenInsets = v156, 
                ClipToDeviceSafeArea = not v103 and nil
            }, 
            vrProps = {
                partSize = if not v98.FFlagLuaAppForceVrAppPanelWidthRollout and v141.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenSize.X * v141.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize, 
                offset = if not not v98.FFlagLuaAppForceVrAppPanelWidthRollout or v98.GetFFlagVRPanelWidthIXPEnabled() and v141.props.vrPanelCurvature == 0 then CFrame.new(l_VRConstants_0.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                virtualScreenSize = if not v98.FFlagLuaAppForceVrAppPanelWidthRollout and v141.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v141.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
                panelName = "MainAppScreen", 
                curvature = if not v98.FFlagLuaAppForceVrAppPanelWidthRollout and v141.props.vrPanelCurvature then v141.props.vrPanelCurvature else l_VRConstants_0.MainScreenCurvature, 
                hidden = l_IsVRAppBuild_0() and v141.props.currentPage == v38.AvatarExperienceRoot, 
                roundedCornersFrameColor = v152.Theme.BackgroundDefault.Color
            }
        }, v155);
    end);
    local v157 = v6.createElement(v6.Portal, {
        target = l_CoreGui_0
    }, {
        LuaAppScreenGui = v149
    });
    local v158 = {
        Toast = v6.createElement(v22, {
            displayOrder = v11.DisplayOrder.Toast
        }), 
        ToastNotification = if v99 then v6.createElement(l_AppToastNotificationContainer_0, {
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
        GamepadBottomBar = v148 and v6.createElement(v43, {
            displayOrder = v11.DisplayOrder.GamepadBottomBar
        }), 
        RNBypassTree = v157, 
        TopBanner = if v98.GetFFlagLuaAppEnableTopBanner() then v6.createElement(v26, {
            displayOrder = v11.DisplayOrder.TopBanner
        }) else nil, 
        FlyoutSidePanel = if v95 then v6.createElement(v96, {
            displayOrder = v11.DisplayOrder.FlyoutSidePanel
        }) else nil, 
        AvatarExperienceMountedAtStartup = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v6.createElement(v45, {
            store = v141.props.store, 
            shouldManageBackground = not l_IsVRAppBuild_0() and nil
        }), 
        FullscreenTitleBar = v6.createElement(v42, {
            displayOrder = v11.DisplayOrder.FullscreenTitleBar
        }), 
        UpdateRequiredPrompt = if not not l_GetFFlagLuaAppPostAppInteractiveLoader_0() or v101 then nil else v6.createElement(v44), 
        VRPointer = if v141.props.use3DPanels then v150 else nil, 
        AppLoadingSplashScreen = v6.createElement(v70), 
        ShellEventsContainer = v6.createElement(v74, {
            currentPage = v141.props.currentPage
        }), 
        SduiDiscoveryDependencyUpdater = v6.createElement(l_SduiDiscoveryDependencyUpdater_0), 
        SduiAvatarExperienceRegister = if v98.FFlagEnableAvatarExperienceSdui then v6.createElement(l_SduiAvatarExperienceRegister_0) else nil, 
        SduiSharedRegister = v6.createElement(l_SduiSharedRegister_0)
    };
    return v6.createElement("Folder", {}, v158);
end;
local v166 = v9(function(v159, _, v161) --[[ Line: 580 ]]
    -- upvalues: v109 (ref), v110 (ref), v68 (copy), v33 (copy), v102 (copy), l_BadgeVariant_0 (copy), v38 (copy), v5 (copy)
    local v162, v163 = v68();
    v109 = v162;
    v110 = v163;
    v162 = v159;
    v163 = nil;
    if typeof(v159) == "number" and v159 > 0 then
        if v161 and v161.EventStream then
            v33(v161.EventStream, "AppContainer", v159);
        end;
        v162 = if v102 < v159 then tostring(v102) .. "+" else tostring(v159);
        v163 = l_BadgeVariant_0.Alert;
    end;
    local l_v109_0 = v109;
    local v165 = v110[v38.Chat];
    if v165 ~= nil then
        l_v109_0 = v5.List.join(v109);
        l_v109_0[v165].badgeCount = v162;
        l_v109_0[v165].badgeVariant = v163;
    end;
    return l_v109_0;
end);
v111 = v7.connect(function(v167, v168) --[[ Line: 608 ]]
    -- upvalues: v53 (copy), v36 (copy), v110 (ref), v166 (copy), v35 (copy)
    local l_history_0 = v167.Navigation.history;
    local v170 = l_history_0[#l_history_0];
    local v171 = v167.SocialTab.UnreadConversationCount or 0;
    local v172 = nil;
    v172 = (function(v173) --[[ Line: 613 ]]
        -- upvalues: v53 (ref), v170 (copy), v36 (ref)
        for v174 = #v173, 1, -1 do
            local v175 = v53[v170[v174].name] or {};
            if v175.tabBarHidden then
                return v175.tabBarHidden;
            end;
        end;
        return v36.Visible;
    end)(v170);
    return {
        screenSize = v167.ScreenSize, 
        globalGuiInset = v167.GlobalGuiInset, 
        bottomBarVisible = v167.TabBarVisible, 
        selectedBottomBarItemIndex = v110[v170[1].name], 
        currentPage = v170[#v170].name, 
        tabBarVisibility = v172, 
        bottomBarItems = v166(v171, v168.canSeeChatTab, v168.analytics), 
        chatBadgeCount = v171, 
        userLoggedIn = v167.AuthenticationStatus.status == v35.LOGGED_IN, 
        formFactor = v167.FormFactor, 
        localUserId = v167.LocalUserId
    };
end, function(v176) --[[ Line: 640 ]]
    -- upvalues: v57 (copy), v59 (copy), v38 (copy), v98 (copy), v81 (copy), l_SetTabBarVisible_0 (copy), v64 (copy), v63 (copy), l_EnteredChatFromEntryPoint_0 (copy)
    return {
        navigateToPage = function(v177) --[[ Line: 642 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v176 (copy), v57 (ref)
            v176(v57({
                {
                    name = v177
                }
            }));
        end, 
        resetNavigationHistoryToBlockPage = function() --[[ Line: 645 ]] --[[ Name: resetNavigationHistoryToBlockPage ]]
            -- upvalues: v176 (copy), v59 (ref), v38 (ref)
            v176(v59({
                {
                    name = v38.UAppBlock
                }
            }));
        end, 
        setTabBarVisible = function(v178) --[[ Line: 648 ]] --[[ Name: setTabBarVisible ]]
            -- upvalues: v98 (ref), v81 (ref), v176 (copy), l_SetTabBarVisible_0 (ref)
            if v98.FFlagAppNavObservability then
                v81.AppNavTelemetry.logVisibilityStart(v178);
            end;
            v176(l_SetTabBarVisible_0(v178));
        end, 
        showVngForm = function() --[[ Line: 657 ]] --[[ Name: showVngForm ]]
            -- upvalues: v176 (copy), v64 (ref), v63 (ref)
            v176(v64(v63.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        enteredChatFromEntryPoint = function(v179) --[[ Line: 662 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v176 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            v176(l_EnteredChatFromEntryPoint_0(v179));
        end
    };
end)(v111);
v111 = l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0, 
    networking = v30, 
    bottomBarAnalytics = v31, 
    analytics = v32, 
    loggingProtocol = l_AppLogging_0
})(v111);
v111 = l_withIsGamepadInput_0((l_RoactAppPolicy_0.connect(function(v180) --[[ Line: 676 ]]
    -- upvalues: v98 (copy), v94 (copy)
    return {
        appPolicy = v180, 
        policyShouldBlockUAppAccess = if v98.GetFFlagEnableAccessBlockAtAppContainerLevel() then v180.getEnableUAppAccessBlock() or v180.getEnableHomePageAgeBlock() else nil, 
        shouldSystemBarUsuallyBePresent = v180.getShouldSystemBarUsuallyBePresent(), 
        canSeeChatTab = v94.getAppFeaturePolicies().getCanSeeChatTab()
    };
end)(v111)));
v111 = v15.withNavigation(v111);
v111 = v61.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer, 
    "PlatformExcellence.QualityImprovement.App"
}, function(v181, _) --[[ Line: 694 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        luaAddFriendsPageEnabled = (v181[l_AppUserLayers_0.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True"
    };
end)(v111);
if not v98.FFlagLuaAppForceVrAppPanelWidthRollout then
    v111 = v65.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature
    })(v111);
end;
return function(v183) --[[ Line: 708 ]]
    -- upvalues: v98 (copy), l_useOverlay_0 (copy), l_useIsSpatial_0 (copy), v5 (copy), v6 (copy), v111 (ref)
    if v98.FFlagLuaAppUseOverlayInAppContainer then
        l_useOverlay_0();
    end;
    local v184 = l_useIsSpatial_0();
    local v185 = v5.Dictionary.join(v183, {
        use3DPanels = v184
    });
    return v6.createElement(v111, v185);
end;