local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(script.Parent.SocialTabUniversalAppWrapper);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppUserInputService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppUserInputService;
local v7 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalyticsAppStageLoaded);
local v8 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalytics);
local v9 = require(l_script_FirstAncestor_0.LuaApp.Services.AppEventIngestService);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useEarlyIsFocused_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useEarlyIsFocused;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v16 = require(l_CorePackages_0.Packages.Roact);
local v17 = require(l_CorePackages_0.Packages.Cryo);
local v18 = require(l_CorePackages_0.Packages.RoactRodux);
local l_compose_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose;
local v20 = require(script.Parent.mapStateToProps);
local v21 = require(script.Parent.mapDispatchToProps);
return (l_compose_0(v18.connect(v20, v21), l_RoactServices_0.connect({
    analytics = v7, 
    guiService = l_AppGuiService_0, 
    notificationService = l_AppNotificationService_0, 
    userInputService = l_AppUserInputService_0, 
    roactAnalytics = v8, 
    eventIngestService = v9
}))(function(v22) --[[ Line: 33 ]] --[[ Name: Container ]]
    -- upvalues: l_useNavigation_0 (copy), l_useEarlyIsFocused_0 (copy), l_useNavigationProps_0 (copy), l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy), v16 (copy), v2 (copy), v17 (copy)
    local v23 = l_useNavigation_0();
    local v24 = l_useEarlyIsFocused_0();
    local v26 = l_useNavigationProps_0(function(v25) --[[ Line: 36 ]]
        if v25 then
            return {
                conversationId = v25
            };
        else
            return nil;
        end;
    end);
    local v27 = {
        isVisible = v24, 
        parameters = v26, 
        pageType = v23.state.routeName
    };
    local v28 = l_useDesignTokens_0();
    local v29 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    v27.BackgroundColor = v28.LuaApps.App.Page.BackgroundColor;
    v27.BackgroundTransparency = v28.LuaApps.App.Page.BackgroundTransparency;
    v27.useFullScalePage = v29;
    return v16.createElement(v2, v17.Dictionary.join(v22, v27));
end));