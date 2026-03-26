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
local l_CompositionTags_0 = require(l_CorePackages_0.Workspace.Packages.AppComposition).CompositionTags;
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccessBlockAtAppContainerLevel;
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagInjectAnalyticsService);
local l_FFlagLuaAppHomeVngAppUpsell_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell;
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local l_GetFFlagEnableReminderOfNormsABTest_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReminderOfNormsABTest;
local v39 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v39.FFlagAppIaScrollAway;
local l_FFlagLuaAppsServerTriggeredModals_0 = v39.FFlagLuaAppsServerTriggeredModals;
local l_FFlagAppIaHomeSubTab_0 = v39.FFlagAppIaHomeSubTab;
local l_FFlagEnableLeftNavOnConsole_0 = v39.FFlagEnableLeftNavOnConsole;
local l_FFlagLuaAppEnableChartsPageProfileLink_0 = v39.FFlagLuaAppEnableChartsPageProfileLink;
local l_FFlagLuaAppCompositionHome_0 = v39.FFlagLuaAppCompositionHome;
local l_FFlagLuaAppAddTestIdsForArrow_0 = v39.FFlagLuaAppAddTestIdsForArrow;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = v39.FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local function v48() --[[ Line: 64 ]] --[[ Name: logFirstTileImageLoaded ]]
    -- upvalues: l_default_0 (copy)
    l_default_0:logEventOnce("home_first_tile_thumbnail_loaded");
end;
local v49 = v4.PureComponent:extend("HomePageWithFeed");
v49.validateProps = v9.strictInterface({
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
    hasTopBar = v9.boolean, 
    onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v9.optional(v9.callback) else nil
});
v49.init = function(v50) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 (copy), l_isSubjectToDesktopPolicies_0 (copy)
    if not l_GetFFlagEnableAccessBlockAtAppContainerLevel_0() and v50.props.policyEnableHomePageAgeBlock then
        v50.props.navigateToUAppBlock();
    end;
    v50.notifyPageLoaded = function() --[[ Line: 106 ]]
        -- upvalues: v50 (copy)
        v50.props.notificationService:ActionEnabled(Enum.AppShellActionType.HomePageLoaded);
    end;
    v50.onDidFocus = function() --[[ Line: 110 ]]
        -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v50 (copy)
        if l_isSubjectToDesktopPolicies_0() then
            v50.props.setThrottleFramerateEnabled(false);
        end;
    end;
    v50.onWillBlur = function() --[[ Line: 116 ]]
        -- upvalues: l_isSubjectToDesktopPolicies_0 (ref), v50 (copy)
        if l_isSubjectToDesktopPolicies_0() then
            v50.props.setThrottleFramerateEnabled(true);
        end;
    end;
end;
v49.render = function(v51) --[[ Line: 123 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v19 (copy), l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v15 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v18 (copy), v21 (copy), l_FFlagLuaAppCompositionHome_0 (copy), l_CompositionTags_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), l_Sources_0 (copy), v6 (copy), l_FFlagLuaAppHomeVngAppUpsell_0 (copy), v27 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), v28 (copy), l_GetFFlagEnableReminderOfNormsABTest_0 (copy), v29 (copy), l_FFlagLuaAppsServerTriggeredModals_0 (copy), l_CheckForSduiModal_0 (copy), l_FFlagLuaAppAddTestIdsForArrow_0 (copy), l_getTestId_0 (copy), l_combineReactTags_0 (copy), v35 (copy), l_withStyle_0 (copy)
    local function v60(_) --[[ Line: 124 ]]
        -- upvalues: v51 (copy), v4 (ref), v19 (ref), l_FFlagAppIaHomeSubTab_0 (ref), l_FlyoutSidePanelIXP_0 (ref), l_FFlagAppIaScrollAway_0 (ref), v15 (ref), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (ref), v18 (ref), v21 (ref), l_FFlagLuaAppCompositionHome_0 (ref), l_CompositionTags_0 (ref), l_FFlagLuaAppEnableChartsPageProfileLink_0 (ref), l_Sources_0 (ref), v6 (ref), l_FFlagLuaAppHomeVngAppUpsell_0 (ref), v27 (ref), l_GetFFlagEnablePushNotificationsUpsellModal_0 (ref), v28 (ref), l_GetFFlagEnableReminderOfNormsABTest_0 (ref), v29 (ref), l_FFlagLuaAppsServerTriggeredModals_0 (ref), l_CheckForSduiModal_0 (ref), l_FFlagLuaAppAddTestIdsForArrow_0 (ref), l_getTestId_0 (ref), l_combineReactTags_0 (ref), v35 (ref)
        local l_backgroundColor_0 = v51.props.backgroundColor;
        local l_backgroundTransparency_0 = v51.props.backgroundTransparency;
        local l_useGridPageLayout_0 = v51.props.useGridPageLayout;
        local v56 = v4.createElement(v19, {
            canvasTopPadding = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() and l_FFlagAppIaScrollAway_0 then if v51.props.screenProps then v51.props.screenProps.headerHeight else nil else if l_FFlagAppIaScrollAway_0 and v51.props.hasTopBar and v15.getScrollAwayEnabled() then v51.props.topBarHeight else nil, 
            onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v51.props.onTileImageLoaded else nil
        });
        local v57 = v4.createElement(v18.PageWrapper, {
            topBarSlot = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then nil else if v51.props.hasTopBar then v4.createElement(v21, {
                tag = if l_FFlagLuaAppCompositionHome_0 then l_CompositionTags_0.ContentRegion.Header else nil, 
                useGridPageLayout = l_useGridPageLayout_0, 
                profileSource = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then l_Sources_0.HomePageSelfWidget else nil, 
                sideMarginOverride = l_FFlagLuaAppCompositionHome_0 and 0 or nil
            }) else nil, 
            BackgroundColor3 = l_backgroundColor_0, 
            BackgroundTransparency = l_backgroundTransparency_0
        }, {
            HomeOmniFeed = v56
        });
        local v58 = {
            NavigationEvents = v4.createElement(v6.NavigationEvents, {
                onDidFocus = v51.onDidFocus, 
                onWillBlur = v51.onWillBlur
            }), 
            CheckForVngAppUpsell = if l_FFlagLuaAppHomeVngAppUpsell_0 then v4.createElement(v27) else nil, 
            CheckForPushNotificationsUpsell = if l_GetFFlagEnablePushNotificationsUpsellModal_0() then v4.createElement(v28) else nil, 
            CheckForReminderOfNorms = if l_GetFFlagEnableReminderOfNormsABTest_0() then v4.createElement(v29) else nil, 
            CheckForSduiModal = if l_FFlagLuaAppsServerTriggeredModals_0 then v4.createElement(l_CheckForSduiModal_0) else nil, 
            Content = v57
        };
        local v59 = if l_FFlagLuaAppAddTestIdsForArrow_0 then l_getTestId_0("page-home") else nil;
        return v4.createElement("Frame", {
            [v4.Tag] = if l_FFlagLuaAppAddTestIdsForArrow_0 then l_combineReactTags_0(v35() and "app-screen.home" or nil, v59) else v35() and "app-screen.home" or nil, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_backgroundColor_0, 
            BackgroundTransparency = l_backgroundTransparency_0, 
            BorderSizePixel = 0
        }, v58);
    end;
    return l_withStyle_0(function(v61) --[[ Line: 200 ]]
        -- upvalues: v60 (copy)
        return v60(v61);
    end);
end;
v49.didMount = function(v62) --[[ Line: 205 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy)
    v62.isMounted = true;
    if v62.props.homePageDataStatus == v17.Done then
        v62.notifyPageLoaded();
    end;
    v62.onDidFocus();
end;
v49.didUpdate = function(v63, v64) --[[ Line: 215 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 (copy), v17 (copy)
    if not l_GetFFlagEnableAccessBlockAtAppContainerLevel_0() and v63.props.policyEnableHomePageAgeBlock then
        v63.props.navigateToUAppBlock();
    end;
    local v65 = v63.props.homePageDataStatus == v17.Done;
    local v66 = v64.homePageDataStatus == v17.Done;
    if v65 and not v66 then
        v63.notifyPageLoaded();
    end;
end;
v49.willUnmount = function(v67) --[[ Line: 232 ]] --[[ Name: willUnmount ]]
    v67.isMounted = false;
end;
v49 = v5.connect(function(v68, _) --[[ Line: 236 ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy)
    return {
        homePageDataStatus = v68.Startup.HomePageDataStatus, 
        topBarHeight = if l_FFlagAppIaScrollAway_0 then v68.TopBar.topBarHeight else nil
    };
end, function(v70) --[[ Line: 241 ]]
    -- upvalues: l_GetFFlagEnableAccessBlockAtAppContainerLevel_0 (copy), v26 (copy), v25 (copy)
    return {
        navigateToUAppBlock = if l_GetFFlagEnableAccessBlockAtAppContainerLevel_0() then nil else function() --[[ Line: 245 ]]
            -- upvalues: v70 (copy), v26 (ref), v25 (ref)
            v70(v26({
                {
                    name = v25.UAppBlock
                }
            }));
        end
    };
end)(v49);
local v71 = v6.withNavigation(v49);
v49 = l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0
})(function(v72) --[[ Line: 254 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), v3 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), v48 (copy), v4 (copy), v71 (copy)
    local v73 = l_useDesignTokens_0();
    local v74 = l_useUiModeInfo_0();
    local v75 = true;
    if v74.uiMode == l_UiMode_0.TenFoot then
        v75 = l_FFlagEnableLeftNavOnConsole_0;
    end;
    local v76 = v3.Dictionary.join(v72, {
        backgroundColor = v73.LuaApps.App.Page.BackgroundColor, 
        backgroundTransparency = v73.LuaApps.App.Page.BackgroundTransparency, 
        hasTopBar = v75, 
        onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v48 else nil
    });
    return v4.createElement(v71, v76);
end);
v49 = v20((l_RoactAppPolicy_0.connect(function(v77, _) --[[ Line: 276 ]]
    return {
        useGridPageLayout = v77.useGridPageLayout(), 
        policyEnableHomePageAgeBlock = v77.getEnableHomePageAgeBlock()
    };
end)(v49)));
l_default_0:logEventOnce("home_page_require_end");
return v49;