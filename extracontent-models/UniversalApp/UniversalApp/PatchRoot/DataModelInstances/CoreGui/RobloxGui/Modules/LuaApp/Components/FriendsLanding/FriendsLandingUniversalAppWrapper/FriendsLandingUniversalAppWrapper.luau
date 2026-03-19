local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Common.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalytics);
local v6 = require(l_script_FirstAncestor_0.LuaApp.Services.AppEventIngestService);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_Contexts_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v9 = require(l_script_FirstAncestor_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v10 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v11 = require(l_CorePackages_0.Workspace.Packages.FriendsLanding);
local l_EntryPoint_0 = v11.EntryPoint;
local l_EnumScreens_0 = v11.EnumScreens;
local v14 = require(l_script_FirstAncestor_0.LuaApp.Components.UserSearch.Players.PlayerSearch);
local v15 = require(l_CorePackages_0.Packages.Cryo);
local v16 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local v20 = require(l_script_FirstAncestor_0.Common.memoize);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local l_llama_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).llama;
local l_OffPlatformFriendRequestsIXP_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Flags.OffPlatformFriendRequestsIXP;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v29 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v30 = require(script.Parent.Parent.utils.formatUser);
local l_FFlagLuaAppEnableStickyShortcutBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableStickyShortcutBar;
local v32 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then require(l_CorePackages_0.Workspace.Packages.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled else nil;
local l_FFlagCreateConnectionsHub_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCreateConnectionsHub;
local l_FFlagContactImporterIXPCleanup_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagContactImporterIXPCleanup;
local v35 = v2.PureComponent:extend("FriendsLandingUniversalAppWrapper");
v35.defaultProps = {
    wideMode = false
};
v35.init = function(v36) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: l_RobloxEventReceiver_0 (copy), l_llama_0 (copy), v30 (copy), l_EnumScreens_0 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), l_Contexts_0 (copy), v10 (copy), v29 (copy), v14 (copy), v20 (copy), v2 (copy), l_EntryPoint_0 (copy), l_Logger_0 (copy)
    v36.robloxEventReceiver = l_RobloxEventReceiver_0.new(v36.props.notificationService);
    v36.navigateDownToFriendRequests = function() --[[ Line: 61 ]]
        -- upvalues: v36 (copy)
        v36.props.navigateDownToFriendRequests();
    end;
    v36.viewUserProfile = function(v37, v38) --[[ Line: 65 ]]
        -- upvalues: l_llama_0 (ref), v30 (ref), v36 (copy)
        if v38 then
            local v39 = v38.profilePeekViewProps or {};
            local v40 = v38.contextualMenuProps or {};
            local v41 = l_llama_0.Dictionary.join(v40, {
                user = if v40.user then v30(v40.user) else {}
            });
            v36.props.navigateToUserInfo(v37, {
                contextualMenuProps = v41, 
                profilePeekViewProps = l_llama_0.Dictionary.join(v39, {
                    resetPeekView = false, 
                    source = v38.source
                }), 
                entryPoint = v38.entryPoint, 
                openJoinable = v38.openJoinable, 
                userInGame = v38.userInGame
            });
        end;
    end;
    v36.navigateToLuaAppPages = {
        [l_EnumScreens_0.FriendFinder] = v36.navigateDownToFriendRequests, 
        [l_EnumScreens_0.ViewUserProfile] = v36.viewUserProfile, 
        [l_EnumScreens_0.LearnMore] = if (not not v36.props.contactImporterAndPYMKEnabled or l_FFlagContactImporterIXPCleanup_0) and v36.props.isContactImporterPolicyEnabled then v36.props.openLearnMoreLink else nil, 
        [l_EnumScreens_0.ProfileQRCode] = function() --[[ Line: 94 ]]
            -- upvalues: v36 (copy), l_Contexts_0 (ref)
            v36.props.navigateTo3DQRCodePage({
                source = l_Contexts_0.AddFriends
            });
        end, 
        [l_EnumScreens_0.SearchPage] = function() --[[ Line: 99 ]]
            -- upvalues: v36 (copy), v10 (ref), v29 (ref)
            v36.props.navigation.navigate(v10.SearchPage, {
                defaultSearchType = v29.SearchTypes.Players
            });
        end, 
        [l_EnumScreens_0.AmpWizardContainer] = v36.props.openAmpWizardContainer
    };
    v36.luaAppPages = {
        playerSearchPage = v14
    };
    v36.getLoadingTimeInfo = function() --[[ Line: 112 ]]
        -- upvalues: v36 (copy)
        return v36.props.navigateToFriendsLandingEventStart;
    end;
    v36.renderFriendsLanding = v36.props.renderFriendsLanding or v20(function(_, v43, v44, v45, _, v47) --[[ Line: 118 ]]
        -- upvalues: v2 (ref), l_EntryPoint_0 (ref), l_Logger_0 (ref), v36 (copy), l_FFlagContactImporterIXPCleanup_0 (ref)
        return v2.createElement(l_EntryPoint_0, {
            navigation = v47, 
            navigateToLuaAppPages = v43, 
            isLuaProfilePageEnabled = true, 
            wideMode = v44, 
            luaAppPages = v45, 
            logger = l_Logger_0, 
            debug_willUnmount = v36.props.debug_entryPointWillUnmount, 
            luaAddFriendsPageEnabled = v36.props.luaAddFriendsPageEnabled, 
            robloxEventReceiver = v36.robloxEventReceiver, 
            getLoadingTimeInfo = v36.getLoadingTimeInfo, 
            contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v36.props.contactImporterAndPYMKEnabled and v36.props.isContactImporterPolicyEnabled, 
            contactImporterExperimentVariant = if l_FFlagContactImporterIXPCleanup_0 then nil else v36.props.contactImporterExperimentVariant, 
            diagService = v36.props.roactAnalytics.Diag, 
            eventIngestService = v36.props.eventIngestService, 
            openProfilePeekView = v36.props.openProfilePeekView, 
            openPlayerContextualMenu = v36.props.openPlayerContextualMenu, 
            passedNavParams = v36.props.passedNavParams
        });
    end);
end;
v35.render = function(v48) --[[ Line: 153 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), v10 (copy), v2 (copy), v9 (copy)
    return l_withStyle_0(function(_) --[[ Line: 154 ]]
        -- upvalues: l_FFlagCreateConnectionsHub_0 (ref), v48 (copy), v10 (ref), v2 (ref), v9 (ref)
        if l_FFlagCreateConnectionsHub_0 and v48.props.navigation.state.routeName == v10.CoHubMyConnections then
            return v48.renderFriendsLanding(nil, v48.navigateToLuaAppPages, v48.props.wideMode, v48.luaAppPages, nil, v48.props.navigation);
        else
            return v2.createElement(v9, {
                BackgroundColor3 = v48.props.BackgroundColor, 
                BackgroundTransparency = v48.props.BackgroundTransparency, 
                useFullScalePage = v48.props.useFullScalePage, 
                includeStatusBar = true
            }, {
                FriendsLanding = v48.renderFriendsLanding(nil, v48.navigateToLuaAppPages, v48.props.wideMode, v48.luaAppPages, nil, v48.props.navigation)
            });
        end;
    end);
end;
v35 = v16.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer
}, function(v50, _) --[[ Line: 186 ]]
    -- upvalues: l_AppUserLayers_0 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), l_OffPlatformFriendRequestsIXP_0 (copy)
    local v52 = v50[l_AppUserLayers_0.SocialFriendsLayer] or {};
    local v53 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.getExperimentVariant(v50);
    local v54 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.experimentOrRolloutEnabled(v50);
    return {
        luaAddFriendsPageEnabled = v52.show_lua_add_friends_page == "True", 
        contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v54, 
        contactImporterExperimentVariant = if l_FFlagContactImporterIXPCleanup_0 then nil else v53
    };
end)(v35);
v35 = v3.connect(function(v55, _) --[[ Line: 204 ]]
    return {
        centralOverlayType = v55.CentralOverlay.OverlayType
    };
end, nil)(v35);
v35 = l_UniversalAppPolicy_0.connect(function(v57) --[[ Line: 210 ]]
    return {
        isContactImporterPolicyEnabled = v57.getContactImporterEnabled()
    };
end)(v35);
v35 = l_RoactServices_0.connect({
    roactAnalytics = v5, 
    eventIngestService = v6
})(v35);
return function(v58) --[[ Line: 221 ]] --[[ Name: FriendsLandingUniversalAppWrapperContainer ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useNavigation_0 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), v32 (copy), l_UiMode_0 (copy), l_useNavigationProps_0 (copy), v2 (copy), v35 (ref), v15 (copy)
    local v59 = l_useDesignTokens_0();
    local v60 = l_useUiModeInfo_0();
    local v61 = l_useNavigation_0();
    local v62 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v32() else nil;
    local v63 = v60.uiMode == l_UiMode_0.TenFoot;
    local v66 = l_useNavigationProps_0(function(_, v65) --[[ Line: 231 ]]
        return {
            navigateToFriendsLandingEventStart = v65.navigateToFriendsLandingEventStart
        };
    end);
    return v2.createElement(v35, v15.Dictionary.join(v58, {
        BackgroundColor = v59.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v59.LuaApps.App.Page.BackgroundTransparency, 
        navigation = v61, 
        useFullScalePage = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v63 or v62 else v63
    }, v66));
end;