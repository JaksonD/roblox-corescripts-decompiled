local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
l_default_0:logEventOnce("home_page_require_begin");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_getTestId_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).getTestId;
local l_combineReactTags_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).combineReactTags;
local v9 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v15 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_CheckForSduiModal_0 = require(l_CorePackages_0.Workspace.Packages.ServerTriggeredModals).CheckForSduiModal;
local v17 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v18 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v19 = require(l_Modules_0.Personalization.Home.HomeOmniFeed.HomeOmniFeed);
local v20 = require(l_Modules_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local v21 = require(l_Modules_0.Personalization.PersonalizationTopBar);
local v22 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = v22.useUiModeInfo;
local v25 = require(l_Modules_0.LuaApp.AppPage);
local v26 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v27 = require(l_Modules_0.Personalization.Home.VngAppUpsell.CheckForVngAppUpsell);
local v28 = require(l_Modules_0.Personalization.Home.PushNotificationsUpsell.CheckForPushNotificationsUpsell);
local v29 = require(l_Modules_0.LuaApp.Components.Moderation.CheckForReminderOfNorms);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccessBlockAtAppContainerLevel;
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagInjectAnalyticsService);
local l_FFlagLuaAppHomeVngAppUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell;
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local l_GetFFlagEnableReminderOfNormsABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReminderOfNormsABTest;
local v37 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v37.FFlagAppIaScrollAway;
local l_FFlagLuaAppsServerTriggeredModals_0 = v37.FFlagLuaAppsServerTriggeredModals;
local l_FFlagAppIaHomeSubTab_0 = v37.FFlagAppIaHomeSubTab;
local l_FFlagEnableLeftNavOnConsole_0 = v37.FFlagEnableLeftNavOnConsole;
local l_FFlagLuaAppEnableChartsPageProfileLink_0 = v37.FFlagLuaAppEnableChartsPageProfileLink;
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_FFlagLuaAppAddTestIdsForArrow_0 = v37.FFlagLuaAppAddTestIdsForArrow;
local v45 = v4.PureComponent:extend("HomePageWithFeed");
v45.validateProps = v9.strictInterface({
    homePageDataStatus = v9.string, 
    navigateToUAppBlock = if l_GetFFlagEnableAccessBlockAtAppContainerLevel_0() then nil else v9.callback, 
    topBarHeight = if l_FFlagAppIaScrollAway_0 then v9.number else nil, 
    useGridPageLayout = v9.optional(v9.boolean), 
    policyEnableHomePageAgeBlock = v9.optional(v9.boolean), 
    setThrottleFramerateEnabled = v9.optional(v9.callback), 
    navigation = v9.table, 
    screenProps = v9.optional(v9.table), 
    notificationService = v9.any, 
    backgroundColor = v9.Color3, 
    backgroundTransparency = v9.number, 
    hasTopBar = v9.boolean
});
v45.init = function(v46) --[[ Line: 88 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 (copy), l_isSubjectToDesktopPolicies_0 (copy)
    if not l_GetFFlagEnableAccessBlockAtAppContainerLevel_0() and v46.props.policyEnableHomePageAgeBlock then
        v46.props.navigateToUAppBlock();
    end;
    v46.notifyPageLoaded = function() --[[ Line: 95 ]]
        -- upvalues: v46 (copy)
        v46.props.notificationService:ActionEnabled(Enum.AppShellActionType.HomePageLoaded);
    end;
    v46.onDidFocus = function() --[[ Line: 99 ]]
        -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v46 (copy)
        if l_isSubjectToDesktopPolicies_0() then
            v46.props.setThrottleFramerateEnabled(false);
        end;
    end;
    v46.onWillBlur = function() --[[ Line: 105 ]]
        -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v46 (copy)
        if l_isSubjectToDesktopPolicies_0() then
            v46.props.setThrottleFramerateEnabled(true);
        end;
    end;
end;
v45.render = function(v47) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v19 (copy), l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v15 (copy), v18 (copy), v21 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), l_Sources_0 (copy), v6 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), v27 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), v28 (copy), l_GetFFlagEnableReminderOfNormsABTest_0 (copy), v29 (copy), l_FFlagLuaAppsServerTriggeredModals_0 (copy), l_CheckForSduiModal_0 (copy), l_FFlagLuaAppAddTestIdsForArrow_0 (copy), l_getTestId_0 (copy), l_combineReactTags_0 (copy), v33 (copy), l_withStyle_0 (copy)
    local function v56(_) --[[ Line: 113 ]]
        -- upvalues: v47 (copy), v4 (ref), v19 (ref), l_FFlagAppIaHomeSubTab_0 (ref), l_FlyoutSidePanelIXP_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v15 (ref), v18 (ref), v21 (ref), l_FFlagLuaAppEnableChartsPageProfileLink_0 (ref), l_Sources_0 (ref), v6 (ref), l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v27 (ref), l_GetFFlagEnablePushNotificationsUpsellModal_0 (ref), v28 (ref), l_GetFFlagEnableReminderOfNormsABTest_0 (ref), v29 (ref), l_FFlagLuaAppsServerTriggeredModals_0 (ref), l_CheckForSduiModal_0 (ref), l_FFlagLuaAppAddTestIdsForArrow_0 (ref), l_getTestId_0 (ref), l_combineReactTags_0 (ref), v33 (ref)
        local l_backgroundColor_0 = v47.props.backgroundColor;
        local l_backgroundTransparency_0 = v47.props.backgroundTransparency;
        local l_useGridPageLayout_0 = v47.props.useGridPageLayout;
        local v52 = v4.createElement(v19, {
            canvasTopPadding = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() and l_FFlagAppIaScrollAway_0 then if v47.props.screenProps then v47.props.screenProps.headerHeight else nil else if l_FFlagAppIaScrollAway_0 and v47.props.hasTopBar and v15.getScrollAwayEnabled() then v47.props.topBarHeight else nil
        });
        local v53 = v4.createElement(v18.PageWrapper, {
            topBarSlot = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then nil else if v47.props.hasTopBar then v4.createElement(v21, {
                useGridPageLayout = l_useGridPageLayout_0, 
                profileSource = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then l_Sources_0.HomePageSelfWidget else nil
            }) else nil, 
            BackgroundColor3 = l_backgroundColor_0, 
            BackgroundTransparency = l_backgroundTransparency_0
        }, {
            HomeOmniFeed = v52
        });
        local v54 = {
            NavigationEvents = v4.createElement(v6.NavigationEvents, {
                onDidFocus = v47.onDidFocus, 
                onWillBlur = v47.onWillBlur
            }), 
            CheckForVngAppUpsell = if l_FFlagLuaAppHomeVngAppUpsell_0 then v4.createElement(v27) else nil, 
            CheckForPushNotificationsUpsell = if l_GetFFlagEnablePushNotificationsUpsellModal_0() then v4.createElement(v28) else nil, 
            CheckForReminderOfNorms = if l_GetFFlagEnableReminderOfNormsABTest_0() then v4.createElement(v29) else nil, 
            CheckForSduiModal = if l_FFlagLuaAppsServerTriggeredModals_0 then v4.createElement(l_CheckForSduiModal_0) else nil, 
            Content = v53
        };
        local v55 = if l_FFlagLuaAppAddTestIdsForArrow_0 then l_getTestId_0("page-home") else nil;
        return v4.createElement("Frame", {
            [v4.Tag] = if l_FFlagLuaAppAddTestIdsForArrow_0 then l_combineReactTags_0(v33() and "app-screen.home" or nil, v55) else v33() and "app-screen.home" or nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_backgroundColor_0, 
            BackgroundTransparency = l_backgroundTransparency_0, 
            BorderSizePixel = 0
        }, v54);
    end;
    return l_withStyle_0(function(v57) --[[ Line: 184 ]]
        -- upvalues: v56 (copy)
        return v56(v57);
    end);
end;
v45.didMount = function(v58) --[[ Line: 189 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy)
    v58.isMounted = true;
    if v58.props.homePageDataStatus == v17.Done then
        v58.notifyPageLoaded();
    end;
    v58.onDidFocus();
end;
v45.didUpdate = function(v59, v60) --[[ Line: 199 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 (copy), v17 (copy)
    if not l_GetFFlagEnableAccessBlockAtAppContainerLevel_0() and v59.props.policyEnableHomePageAgeBlock then
        v59.props.navigateToUAppBlock();
    end;
    local v61 = v59.props.homePageDataStatus == v17.Done;
    local v62 = v60.homePageDataStatus == v17.Done;
    if v61 and not v62 then
        v59.notifyPageLoaded();
    end;
end;
v45.willUnmount = function(v63) --[[ Line: 216 ]] --[[ Name: willUnmount ]]
    v63.isMounted = false;
end;
v45 = v5.connect(function(v64, _) --[[ Line: 220 ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy)
    return {
        homePageDataStatus = v64.Startup.HomePageDataStatus, 
        topBarHeight = if l_FFlagAppIaScrollAway_0 then v64.TopBar.topBarHeight else nil
    };
end, function(v66) --[[ Line: 225 ]]
    -- upvalues: l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 (copy), v26 (copy), v25 (copy)
    return {
        navigateToUAppBlock = if l_GetFFlagEnableAccessBlockAtAppContainerLevel_0() then nil else function() --[[ Line: 229 ]]
            -- upvalues: v66 (copy), v26 (ref), v25 (ref)
            v66(v26({
                {
                    name = v25.UAppBlock
                }
            }));
        end
    };
end)(v45);
local v67 = v6.withNavigation(v45);
v45 = l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0
})(function(v68) --[[ Line: 238 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v3 (copy), v4 (copy), v67 (copy)
    local v69 = l_useDesignTokens_0();
    local v70 = l_useUiModeInfo_0();
    local v71 = true;
    if v70.uiMode == l_UiMode_0.TenFoot then
        v71 = l_FFlagEnableLeftNavOnConsole_0;
    end;
    local v72 = v3.Dictionary.join(v68, {
        backgroundColor = v69.LuaApps.App.Page.BackgroundColor, 
        backgroundTransparency = v69.LuaApps.App.Page.BackgroundTransparency, 
        hasTopBar = v71
    });
    return v4.createElement(v67, v72);
end);
v45 = v20((l_RoactAppPolicy_0.connect(function(v73, _) --[[ Line: 257 ]]
    return {
        useGridPageLayout = v73.useGridPageLayout(), 
        policyEnableHomePageAgeBlock = v73.getEnableHomePageAgeBlock()
    };
end)(v45)));
l_default_0:logEventOnce("home_page_require_end");
return v45;