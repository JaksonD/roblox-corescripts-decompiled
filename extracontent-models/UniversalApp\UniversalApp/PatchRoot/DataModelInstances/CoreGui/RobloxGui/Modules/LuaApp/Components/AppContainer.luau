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
local v84 = require(l_CorePackages_0.Workspace.Packages.AppMusicPlayer);
local v85 = require(l_Modules_0.LuaApp.Components.NativeCloseEventConnector);
local v86 = require(l_Modules_0.LuaApp.Thunks.CheckSystemTrayModal);
local l_FFlagEnableLeftNavOnConsole_0 = v39.FFlagEnableLeftNavOnConsole;
local v88 = if l_FFlagEnableLeftNavOnConsole_0 then require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).TenFootUiGlobalEffects else nil;
local l_SduiDiscoveryDependencyUpdater_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).SduiDiscoveryDependencyUpdater;
local l_SduiAvatarExperienceRegister_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceServerDrivenUi).SduiAvatarExperienceRegister;
local l_SduiSharedRegister_0 = require(l_CorePackages_0.Workspace.Packages.SduiSharedContent).SduiSharedRegister;
local v92 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local v93 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v94 = nil;
local v95 = nil;
if v93 then
    v94 = require(l_Modules_0.LuaApp.Components.FlyoutSidePanel.FlyoutSidePanelWrapper);
    v95 = require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).FlyoutScrollAwayControl;
end;
local v96 = {
    GetFFlagUseUpdatedVNGAgreementsWorkflow = v39.GetFFlagUseUpdatedVNGAgreementsWorkflow, 
    GetFFlagEnableAccessBlockAtAppContainerLevel = v39.GetFFlagEnableAccessBlockAtAppContainerLevel, 
    GetFFlagLuaAppFixStudioNotchSupport = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport), 
    GetFFlagVRPanelWidthIXPEnabled = v39.GetFFlagVRPanelWidthIXPEnabled, 
    GetFFlagLuaAppEnableTopBanner = v39.GetFFlagLuaAppEnableTopBanner, 
    FFlagAppIaScrollAway = v39.FFlagAppIaScrollAway, 
    GetFFlagLuaAppPersistentMusicPlayer = v39.GetFFlagLuaAppPersistentMusicPlayer, 
    FFlagEnableSystemTrayModals = v39.FFlagEnableSystemTrayModals, 
    FFlagAppIaHomeSubTab = v39.FFlagAppIaHomeSubTab, 
    FFlagEnableAvatarExperienceSdui = v39.FFlagEnableAvatarExperienceSdui, 
    FFlagLuaAppUseOverlayInAppContainer = v39.FFlagLuaAppUseOverlayInAppContainer, 
    FFlagLuaAppForceVrAppPanelWidthRollout = v39.FFlagLuaAppForceVrAppPanelWidthRollout
};
local v97 = game:DefineFastFlag("LuaAppEnableToastNotifications4", false);
local v98 = game:DefineFastFlag("AXEnablePercievedTTIForAX", false);
local v99 = game:DefineFastFlag("RemoveUpdatePromptChild", false);
local v100 = game:DefineFastInt("PartyTabBadgeMaxCount", 49);
local v101 = v39.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v96.GetFFlagLuaAppFixStudioNotchSupport();
local function _() --[[ Line: 144 ]] --[[ Name: getDevicePlatform ]]
    -- upvalues: l_UserInputService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        return Enum.Platform.None;
    else
        return l_UserInputService_0:GetPlatform();
    end;
end;
local v103 = if _G.__TESTEZ_RUNNING_TEST__ then Enum.Platform.None else l_UserInputService_0:GetPlatform();
local v104 = l_GuiService_0:IsTenFootInterface() and not l_FFlagEnableLeftNavOnConsole_0;
local v105, v106 = v68();
local v107 = v6.Component:extend("AppContainer");
v107.init = function(v108) --[[ Line: 160 ]] --[[ Name: init ]]
    -- upvalues: l_Logger_0 (copy), v60 (copy), v103 (copy), v12 (copy), v96 (copy), v19 (copy), v38 (copy), v104 (copy), l_AvatarScreen_0 (copy), v98 (copy), v83 (copy), l_ChatEntryPointNames_0 (copy), v34 (copy), v41 (copy), v9 (copy), v11 (copy)
    v108.props.loggingProtocol:logEventOnce("app_container_init_begin");
    l_Logger_0:info("Initializing App Container");
    local l_store_0 = v108.props.store;
    local l_bottomBarAnalytics_0 = v108.props.bottomBarAnalytics;
    l_store_0:dispatch(v60(v103));
    v108.bottomBarButtonActivated = function(v111, v112) --[[ Line: 170 ]]
        -- upvalues: v108 (copy), v12 (ref), v96 (ref), v19 (ref), v38 (ref), v104 (ref), l_AvatarScreen_0 (ref), v98 (ref), l_store_0 (copy), v83 (ref), l_ChatEntryPointNames_0 (ref), v34 (ref), v41 (ref), l_Logger_0 (ref), l_bottomBarAnalytics_0 (copy)
        local l_currentPage_0 = v108.props.currentPage;
        local l_selectedBottomBarItemIndex_0 = v108.props.selectedBottomBarItemIndex;
        if not l_selectedBottomBarItemIndex_0 then
            return;
        else
            local l_page_0 = v108.props.bottomBarItems[l_selectedBottomBarItemIndex_0].page;
            if v111 == l_currentPage_0 then
                v12.ReloadPage:fire(v111);
            elseif v96.FFlagAppIaHomeSubTab and v111 == v19.Constants.HomeContainerName then
                if l_currentPage_0 == v38.Home then
                    v12.ReloadPage:fire(v38.Home);
                else
                    v108.props.navigateToPage(v38.Home);
                    if v112 then
                        v108.props.notificationService:ActionTaken(v112);
                    end;
                end;
            elseif v111 == v38.AvatarExperienceRoot then
                local v116 = if v104 then v38.AvatarExperienceRoot else l_AvatarScreen_0.Catalog;
                if v98 then
                    l_store_0:dispatch(v83.PercievedTrackingStarted());
                end;
                v108.props.navigateToPage(v116);
                if v112 then
                    v108.props.notificationService:ActionTaken(v112);
                end;
            elseif v111 == v38.Chat then
                v108.props.enteredChatFromEntryPoint(l_ChatEntryPointNames_0.SystemBar);
                v34(v108.props.analytics.EventStream, "AppContainer", v108.props.chatBadgeCount);
                l_store_0:dispatch(v41.rodux.ClearGlobalUnreadCount.API()):catch(function(v117) --[[ Line: 208 ]]
                    -- upvalues: l_Logger_0 (ref)
                    l_Logger_0:error("Error in ClearGlobalUnreadCount request. Error: {}", (tostring(v117)));
                end);
                v108.props.navigateToPage(v111);
                if v112 then
                    v108.props.notificationService:ActionTaken(v112);
                end;
            else
                v108.props.navigateToPage(v111);
                if v112 then
                    v108.props.notificationService:ActionTaken(v112);
                end;
            end;
            l_bottomBarAnalytics_0.ButtonActivated(v111, l_page_0);
            return;
        end;
    end;
    v108.getBottomBarLayoutInfo = v9(function(v118, v119, _) --[[ Line: 225 ]]
        -- upvalues: v11 (ref)
        local v121 = math.max(v118.X - v119.left - v119.right - 600, 0);
        local l_BOTTOM_BAR_SIZE_0 = v11.BOTTOM_BAR_SIZE;
        local v123 = math.max(v119.bottom - l_BOTTOM_BAR_SIZE_0, 0);
        return {
            Background = {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, -v119.left, 1, 0), 
                Size = UDim2.new(0, v118.X, 0, v119.bottom)
            }, 
            Padding = {
                PaddingLeft = UDim.new(0, v119.left + v121 / 2), 
                PaddingRight = UDim.new(0, v119.right + v121 / 2), 
                PaddingBottom = UDim.new(0, v123)
            }
        };
    end);
    v108.props.loggingProtocol:logEventOnce("app_container_init_end");
end;
v107.didMount = function(v124) --[[ Line: 249 ]] --[[ Name: didMount ]]
    -- upvalues: v58 (copy), v96 (copy)
    v124.props.store:dispatch(v58(false));
    if v96.GetFFlagEnableAccessBlockAtAppContainerLevel() and v124.props.userLoggedIn and v124.props.policyShouldBlockUAppAccess then
        v124.props.resetNavigationHistoryToBlockPage();
    end;
end;
v107.willUpdate = function(v125, v126) --[[ Line: 265 ]] --[[ Name: willUpdate ]]
    -- upvalues: v53 (copy), v36 (copy), v96 (copy), v81 (copy), l_VisibilityControl_0 (copy), v93 (copy), v95 (ref)
    local v127 = v53[v126.currentPage] or {};
    local v128 = nil;
    local l_tabBarVisibility_0 = v126.tabBarVisibility;
    if typeof(l_tabBarVisibility_0) == "function" then
        l_tabBarVisibility_0 = l_tabBarVisibility_0({
            formFactor = v126.formFactor
        });
    end;
    v128 = if l_tabBarVisibility_0 == v36.PolicyDependent then v125.props.shouldSystemBarUsuallyBePresent else l_tabBarVisibility_0 ~= v36.Hidden;
    if not v127.overridesAppRouterTabBarControl and v128 ~= v126.bottomBarVisible then
        v125.props.setTabBarVisible(v128);
    end;
    if v96.FFlagAppIaScrollAway and v81.getScrollAwayEnabled() then
        local v130 = if v127.overridesAppRouterTabBarControl then v126.bottomBarVisible else v128;
        local v131 = v127.enableScrollAway and v130;
        if v126.currentPage ~= v125.props.currentPage then
            l_VisibilityControl_0.show();
        elseif v130 and v131 ~= l_VisibilityControl_0.isEnabled() then
            l_VisibilityControl_0.show();
        end;
        if v93 then
            v95.setScrollAwayEnabled(v131);
            return;
        else
            l_VisibilityControl_0.setEnabled(v131);
        end;
    end;
end;
v107.didUpdate = function(v132, _, _) --[[ Line: 312 ]] --[[ Name: didUpdate ]]
    -- upvalues: v96 (copy), v38 (copy)
    if v132.props.userLoggedIn and v132.props.appPolicy.getVNGFormRequired() and not v96.GetFFlagUseUpdatedVNGAgreementsWorkflow() then
        v132.props.showVngForm();
    end;
    if v96.GetFFlagEnableAccessBlockAtAppContainerLevel() then
        local v135 = v132.props.policyShouldBlockUAppAccess and v132.props.userLoggedIn;
        local v136 = v132.props.currentPage == v38.UAppBlock;
        if v135 and not v136 then
            v132.props.resetNavigationHistoryToBlockPage();
        end;
    end;
end;
v107.render = function(v137) --[[ Line: 331 ]] --[[ Name: render ]]
    -- upvalues: v104 (copy), v6 (copy), v66 (copy), l_HardwareSafeAreaInsets_0 (copy), l_withStyle_0 (copy), v101 (copy), v96 (copy), v78 (copy), v38 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v24 (copy), v47 (copy), v84 (copy), v25 (copy), v11 (copy), v52 (copy), l_AppShortcutBarContext_0 (copy), l_AppShortcutBarContainer_0 (copy), v85 (copy), v86 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v88 (copy), l_VRReadyWrapper_0 (copy), l_VRConstants_0 (copy), l_IsVRAppBuild_0 (copy), l_CoreGui_0 (copy), v22 (copy), v97 (copy), l_AppToastNotificationContainer_0 (copy), l_GameInviteModal_0 (copy), l_GameInviteConstants_0 (copy), v23 (copy), v43 (copy), v26 (copy), v93 (copy), v94 (ref), l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), v45 (copy), v42 (copy), v99 (copy), v44 (copy), v70 (copy), v74 (copy), l_SduiDiscoveryDependencyUpdater_0 (copy), l_SduiAvatarExperienceRegister_0 (copy), l_SduiSharedRegister_0 (copy)
    local l_screenSize_0 = v137.props.screenSize;
    local l_globalGuiInset_0 = v137.props.globalGuiInset;
    local l_bottomBarVisible_0 = v137.props.bottomBarVisible;
    local l_selectedBottomBarItemIndex_1 = v137.props.selectedBottomBarItemIndex;
    local l_bottomBarItems_0 = v137.props.bottomBarItems;
    local l_isGamepadInput_0 = v137.props.isGamepadInput;
    local v144 = v104 and l_isGamepadInput_0;
    local v145 = nil;
    local v146 = v6.createElement(v66);
    local v147 = l_HardwareSafeAreaInsets_0.deviceInsets();
    v145 = l_withStyle_0(function(v148) --[[ Line: 348 ]]
        -- upvalues: v101 (ref), v96 (ref), v6 (ref), l_globalGuiInset_0 (copy), v147 (copy), v137 (copy), v78 (ref), v38 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v24 (ref), v47 (ref), v84 (ref), v25 (ref), l_bottomBarVisible_0 (copy), v11 (ref), l_screenSize_0 (copy), l_selectedBottomBarItemIndex_1 (copy), l_bottomBarItems_0 (copy), v52 (ref), l_AppShortcutBarContext_0 (ref), l_AppShortcutBarContainer_0 (ref), v85 (ref), v86 (ref), l_FFlagEnableLeftNavOnConsole_0 (ref), v88 (ref), l_VRReadyWrapper_0 (ref), l_VRConstants_0 (ref), l_IsVRAppBuild_0 (ref)
        local v149 = nil;
        if not v101 and v96.GetFFlagLuaAppFixStudioNotchSupport() then
            v149 = v6.createElement("UIPadding", {
                PaddingTop = if v96.GetFFlagLuaAppEnableTopBanner() then UDim.new(0, l_globalGuiInset_0.top) else nil, 
                PaddingBottom = UDim.new(0, l_globalGuiInset_0.bottom), 
                PaddingLeft = UDim.new(0, l_globalGuiInset_0.left)
            });
        end;
        local v150 = v101 and (not (v147.top <= 0 and v147.bottom <= 0 and v147.left <= 0 and v147.right <= 0) or v137.props.usePreferredInput == v78.Input.Touch) and v137.props.currentPage ~= v38.AvatarExperienceRoot;
        local v151 = {
            RNAppContainer = v6.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.RouterView, 
                shouldRestoreFocus = false
            }, v6.createElement(v24, nil, {
                RootNavigator = v6.createElement(v47, {
                    navigation = v137.props.navigation
                })
            })), 
            MusicPlayer = if v96.GetFFlagLuaAppPersistentMusicPlayer() then v6.createElement(v84.AppMusicPlayer) else nil, 
            SystemBar = v6.createElement(v25, {
                isVisible = l_bottomBarVisible_0, 
                displayOrder = v11.DisplayOrder.SystemBar, 
                layoutInfo = v137.getBottomBarLayoutInfo(l_screenSize_0, l_globalGuiInset_0), 
                selectedIndex = l_selectedBottomBarItemIndex_1, 
                items = l_bottomBarItems_0, 
                onActivated = v137.bottomBarButtonActivated
            }), 
            Reporter = v6.createElement(v52), 
            SafePadding = v149, 
            AppShortcutBar = v6.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                ShortcutBarContext = v6.createElement(l_AppShortcutBarContext_0.Provider, {}, {
                    ShortcutBar = v6.createElement(l_AppShortcutBarContainer_0)
                })
            }), 
            NativeCloseEventConnector = if v96.FFlagEnableSystemTrayModals then v6.createElement(v85, {
                onNativeCloseEvent = v86
            }) else nil, 
            TenFootUiGlobalEffects = if l_FFlagEnableLeftNavOnConsole_0 then v6.createElement(v88) else nil, 
            DeviceInsetBackground = if v150 then v6.createElement("Frame", {
                Position = UDim2.new(0, -v147.left, 0, -v147.top), 
                Size = UDim2.new(0, l_screenSize_0.X + v147.left + v147.right, 0, l_screenSize_0.Y + v147.top + v147.bottom), 
                BackgroundColor3 = v148.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v148.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                ZIndex = 0
            }) else nil
        };
        local v152 = nil;
        if v96.GetFFlagLuaAppFixStudioNotchSupport() then
            v152 = if v101 then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None;
        end;
        return v6.createElement(l_VRReadyWrapper_0, {
            component = "ScreenGui", 
            props = {
                Enabled = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = 1, 
                ScreenInsets = v152, 
                ClipToDeviceSafeArea = not v101 and nil
            }, 
            vrProps = {
                partSize = if not v96.FFlagLuaAppForceVrAppPanelWidthRollout and v137.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenSize.X * v137.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize, 
                offset = if not not v96.FFlagLuaAppForceVrAppPanelWidthRollout or v96.GetFFlagVRPanelWidthIXPEnabled() and v137.props.vrPanelCurvature == 0 then CFrame.new(l_VRConstants_0.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                virtualScreenSize = if not v96.FFlagLuaAppForceVrAppPanelWidthRollout and v137.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v137.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
                panelName = "MainAppScreen", 
                curvature = if not v96.FFlagLuaAppForceVrAppPanelWidthRollout and v137.props.vrPanelCurvature then v137.props.vrPanelCurvature else l_VRConstants_0.MainScreenCurvature, 
                hidden = l_IsVRAppBuild_0() and v137.props.currentPage == v38.AvatarExperienceRoot, 
                roundedCornersFrameColor = v148.Theme.BackgroundDefault.Color
            }
        }, v151);
    end);
    local v153 = v6.createElement(v6.Portal, {
        target = l_CoreGui_0
    }, {
        LuaAppScreenGui = v145
    });
    local v154 = {
        Toast = v6.createElement(v22, {
            displayOrder = v11.DisplayOrder.Toast
        }), 
        ToastNotification = if v97 then v6.createElement(l_AppToastNotificationContainer_0, {
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
        GamepadBottomBar = v144 and v6.createElement(v43, {
            displayOrder = v11.DisplayOrder.GamepadBottomBar
        }), 
        RNBypassTree = v153, 
        TopBanner = if v96.GetFFlagLuaAppEnableTopBanner() then v6.createElement(v26, {
            displayOrder = v11.DisplayOrder.TopBanner
        }) else nil, 
        FlyoutSidePanel = if v93 then v6.createElement(v94, {
            displayOrder = v11.DisplayOrder.FlyoutSidePanel
        }) else nil, 
        AvatarExperienceMountedAtStartup = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then nil else v6.createElement(v45, {
            store = v137.props.store, 
            shouldManageBackground = not l_IsVRAppBuild_0() and nil
        }), 
        FullscreenTitleBar = v6.createElement(v42, {
            displayOrder = v11.DisplayOrder.FullscreenTitleBar
        }), 
        UpdateRequiredPrompt = if not not l_GetFFlagLuaAppPostAppInteractiveLoader_0() or v99 then nil else v6.createElement(v44), 
        VRPointer = if v137.props.use3DPanels then v146 else nil, 
        AppLoadingSplashScreen = v6.createElement(v70), 
        ShellEventsContainer = v6.createElement(v74, {
            currentPage = v137.props.currentPage
        }), 
        SduiDiscoveryDependencyUpdater = v6.createElement(l_SduiDiscoveryDependencyUpdater_0), 
        SduiAvatarExperienceRegister = if v96.FFlagEnableAvatarExperienceSdui then v6.createElement(l_SduiAvatarExperienceRegister_0) else nil, 
        SduiSharedRegister = v6.createElement(l_SduiSharedRegister_0)
    };
    return v6.createElement("Folder", {}, v154);
end;
local v162 = v9(function(v155, _, v157) --[[ Line: 549 ]]
    -- upvalues: v105 (ref), v106 (ref), v68 (copy), v33 (copy), v100 (copy), l_BadgeVariant_0 (copy), v38 (copy), v5 (copy)
    local v158, v159 = v68();
    v105 = v158;
    v106 = v159;
    v158 = v155;
    v159 = nil;
    if typeof(v155) == "number" and v155 > 0 then
        if v157 and v157.EventStream then
            v33(v157.EventStream, "AppContainer", v155);
        end;
        v158 = if v100 < v155 then tostring(v100) .. "+" else tostring(v155);
        v159 = l_BadgeVariant_0.Alert;
    end;
    local l_v105_0 = v105;
    local v161 = v106[v38.Chat];
    if v161 ~= nil then
        l_v105_0 = v5.List.join(v105);
        l_v105_0[v161].badgeCount = v158;
        l_v105_0[v161].badgeVariant = v159;
    end;
    return l_v105_0;
end);
v107 = v7.connect(function(v163, v164) --[[ Line: 577 ]]
    -- upvalues: v53 (copy), v36 (copy), v106 (ref), v162 (copy), v35 (copy)
    local l_history_0 = v163.Navigation.history;
    local v166 = l_history_0[#l_history_0];
    local v167 = v163.SocialTab.UnreadConversationCount or 0;
    local v168 = nil;
    v168 = (function(v169) --[[ Line: 582 ]]
        -- upvalues: v53 (ref), v166 (copy), v36 (ref)
        for v170 = #v169, 1, -1 do
            local v171 = v53[v166[v170].name] or {};
            if v171.tabBarHidden then
                return v171.tabBarHidden;
            end;
        end;
        return v36.Visible;
    end)(v166);
    return {
        screenSize = v163.ScreenSize, 
        globalGuiInset = v163.GlobalGuiInset, 
        bottomBarVisible = v163.TabBarVisible, 
        selectedBottomBarItemIndex = v106[v166[1].name], 
        currentPage = v166[#v166].name, 
        tabBarVisibility = v168, 
        bottomBarItems = v162(v167, v164.canSeeChatTab, v164.analytics), 
        chatBadgeCount = v167, 
        userLoggedIn = v163.AuthenticationStatus.status == v35.LOGGED_IN, 
        formFactor = v163.FormFactor, 
        localUserId = v163.LocalUserId
    };
end, function(v172) --[[ Line: 609 ]]
    -- upvalues: v57 (copy), v59 (copy), v38 (copy), l_SetTabBarVisible_0 (copy), v64 (copy), v63 (copy), l_EnteredChatFromEntryPoint_0 (copy)
    return {
        navigateToPage = function(v173) --[[ Line: 611 ]] --[[ Name: navigateToPage ]]
            -- upvalues: v172 (copy), v57 (ref)
            v172(v57({
                {
                    name = v173
                }
            }));
        end, 
        resetNavigationHistoryToBlockPage = function() --[[ Line: 614 ]] --[[ Name: resetNavigationHistoryToBlockPage ]]
            -- upvalues: v172 (copy), v59 (ref), v38 (ref)
            v172(v59({
                {
                    name = v38.UAppBlock
                }
            }));
        end, 
        setTabBarVisible = function(v174) --[[ Line: 617 ]] --[[ Name: setTabBarVisible ]]
            -- upvalues: v172 (copy), l_SetTabBarVisible_0 (ref)
            v172(l_SetTabBarVisible_0(v174));
        end, 
        showVngForm = function() --[[ Line: 623 ]] --[[ Name: showVngForm ]]
            -- upvalues: v172 (copy), v64 (ref), v63 (ref)
            v172(v64(v63.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end, 
        enteredChatFromEntryPoint = function(v175) --[[ Line: 628 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v172 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            v172(l_EnteredChatFromEntryPoint_0(v175));
        end
    };
end)(v107);
v107 = l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0, 
    networking = v30, 
    bottomBarAnalytics = v31, 
    analytics = v32, 
    loggingProtocol = l_AppLogging_0
})(v107);
v107 = l_withIsGamepadInput_0((l_RoactAppPolicy_0.connect(function(v176) --[[ Line: 642 ]]
    -- upvalues: v96 (copy), v92 (copy)
    return {
        appPolicy = v176, 
        policyShouldBlockUAppAccess = if v96.GetFFlagEnableAccessBlockAtAppContainerLevel() then v176.getEnableUAppAccessBlock() or v176.getEnableHomePageAgeBlock() else nil, 
        shouldSystemBarUsuallyBePresent = v176.getShouldSystemBarUsuallyBePresent(), 
        canSeeChatTab = v92.getAppFeaturePolicies().getCanSeeChatTab()
    };
end)(v107)));
v107 = v15.withNavigation(v107);
v107 = v61.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer, 
    "PlatformExcellence.QualityImprovement.App"
}, function(v177, _) --[[ Line: 660 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        luaAddFriendsPageEnabled = (v177[l_AppUserLayers_0.SocialFriendsLayer] or {}).show_lua_add_friends_page == "True"
    };
end)(v107);
if not v96.FFlagLuaAppForceVrAppPanelWidthRollout then
    v107 = v65.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature
    })(v107);
end;
return function(v179) --[[ Line: 674 ]]
    -- upvalues: v96 (copy), l_useOverlay_0 (copy), l_useIsSpatial_0 (copy), v5 (copy), v6 (copy), v107 (ref)
    if v96.FFlagLuaAppUseOverlayInAppContainer then
        l_useOverlay_0();
    end;
    local v180 = l_useIsSpatial_0();
    local v181 = v5.Dictionary.join(v179, {
        use3DPanels = v180
    });
    return v6.createElement(v107, v181);
end;