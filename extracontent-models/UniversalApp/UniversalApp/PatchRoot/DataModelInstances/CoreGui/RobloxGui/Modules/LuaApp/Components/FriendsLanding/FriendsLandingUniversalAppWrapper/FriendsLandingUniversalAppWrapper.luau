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
local l_FFlagGuacStickyShortcutBarEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagGuacStickyShortcutBarEnabled;
local v36 = if l_FFlagGuacStickyShortcutBarEnabled_0 then require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy else nil;
local v37 = v2.PureComponent:extend("FriendsLandingUniversalAppWrapper");
v37.defaultProps = {
    wideMode = false
};
v37.init = function(v38) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_RobloxEventReceiver_0 (copy), l_llama_0 (copy), v30 (copy), l_EnumScreens_0 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), l_Contexts_0 (copy), v10 (copy), v29 (copy), v14 (copy), v20 (copy), v2 (copy), l_EntryPoint_0 (copy), l_Logger_0 (copy)
    v38.robloxEventReceiver = l_RobloxEventReceiver_0.new(v38.props.notificationService);
    v38.navigateDownToFriendRequests = function() --[[ Line: 66 ]]
        -- upvalues: v38 (copy)
        v38.props.navigateDownToFriendRequests();
    end;
    v38.viewUserProfile = function(v39, v40) --[[ Line: 70 ]]
        -- upvalues: l_llama_0 (ref), v30 (ref), v38 (copy)
        if v40 then
            local v41 = v40.profilePeekViewProps or {};
            local v42 = v40.contextualMenuProps or {};
            local v43 = l_llama_0.Dictionary.join(v42, {
                user = if v42.user then v30(v42.user) else {}
            });
            v38.props.navigateToUserInfo(v39, {
                contextualMenuProps = v43, 
                profilePeekViewProps = l_llama_0.Dictionary.join(v41, {
                    resetPeekView = false, 
                    source = v40.source
                }), 
                entryPoint = v40.entryPoint, 
                openJoinable = v40.openJoinable, 
                userInGame = v40.userInGame
            });
        end;
    end;
    v38.navigateToLuaAppPages = {
        [l_EnumScreens_0.FriendFinder] = v38.navigateDownToFriendRequests, 
        [l_EnumScreens_0.ViewUserProfile] = v38.viewUserProfile, 
        [l_EnumScreens_0.LearnMore] = if (not not v38.props.contactImporterAndPYMKEnabled or l_FFlagContactImporterIXPCleanup_0) and v38.props.isContactImporterPolicyEnabled then v38.props.openLearnMoreLink else nil, 
        [l_EnumScreens_0.ProfileQRCode] = function() --[[ Line: 99 ]]
            -- upvalues: v38 (copy), l_Contexts_0 (ref)
            v38.props.navigateTo3DQRCodePage({
                source = l_Contexts_0.AddFriends
            });
        end, 
        [l_EnumScreens_0.SearchPage] = function() --[[ Line: 104 ]]
            -- upvalues: v38 (copy), v10 (ref), v29 (ref)
            v38.props.navigation.navigate(v10.SearchPage, {
                defaultSearchType = v29.SearchTypes.Players
            });
        end, 
        [l_EnumScreens_0.AmpWizardContainer] = v38.props.openAmpWizardContainer
    };
    v38.luaAppPages = {
        playerSearchPage = v14
    };
    v38.getLoadingTimeInfo = function() --[[ Line: 117 ]]
        -- upvalues: v38 (copy)
        return v38.props.navigateToFriendsLandingEventStart;
    end;
    v38.renderFriendsLanding = v38.props.renderFriendsLanding or v20(function(_, v45, v46, v47, _, v49) --[[ Line: 123 ]]
        -- upvalues: v2 (ref), l_EntryPoint_0 (ref), l_Logger_0 (ref), v38 (copy), l_FFlagContactImporterIXPCleanup_0 (ref)
        return v2.createElement(l_EntryPoint_0, {
            navigation = v49, 
            navigateToLuaAppPages = v45, 
            isLuaProfilePageEnabled = true, 
            wideMode = v46, 
            luaAppPages = v47, 
            logger = l_Logger_0, 
            debug_willUnmount = v38.props.debug_entryPointWillUnmount, 
            luaAddFriendsPageEnabled = v38.props.luaAddFriendsPageEnabled, 
            robloxEventReceiver = v38.robloxEventReceiver, 
            getLoadingTimeInfo = v38.getLoadingTimeInfo, 
            contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v38.props.contactImporterAndPYMKEnabled and v38.props.isContactImporterPolicyEnabled, 
            contactImporterExperimentVariant = if l_FFlagContactImporterIXPCleanup_0 then nil else v38.props.contactImporterExperimentVariant, 
            diagService = v38.props.roactAnalytics.Diag, 
            eventIngestService = v38.props.eventIngestService, 
            openProfilePeekView = v38.props.openProfilePeekView, 
            openPlayerContextualMenu = v38.props.openPlayerContextualMenu, 
            passedNavParams = v38.props.passedNavParams
        });
    end);
end;
v37.render = function(v50) --[[ Line: 158 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagCreateConnectionsHub_0 (copy), v10 (copy), v2 (copy), v9 (copy)
    return l_withStyle_0(function(_) --[[ Line: 159 ]]
        -- upvalues: l_FFlagCreateConnectionsHub_0 (ref), v50 (copy), v10 (ref), v2 (ref), v9 (ref)
        if l_FFlagCreateConnectionsHub_0 and v50.props.navigation.state.routeName == v10.CoHubMyConnections then
            return v50.renderFriendsLanding(nil, v50.navigateToLuaAppPages, v50.props.wideMode, v50.luaAppPages, nil, v50.props.navigation);
        else
            return v2.createElement(v9, {
                BackgroundColor3 = v50.props.BackgroundColor, 
                BackgroundTransparency = v50.props.BackgroundTransparency, 
                useFullScalePage = v50.props.useFullScalePage, 
                includeStatusBar = true
            }, {
                FriendsLanding = v50.renderFriendsLanding(nil, v50.navigateToLuaAppPages, v50.props.wideMode, v50.luaAppPages, nil, v50.props.navigation)
            });
        end;
    end);
end;
v37 = v16.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer
}, function(v52, _) --[[ Line: 191 ]]
    -- upvalues: l_AppUserLayers_0 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), l_OffPlatformFriendRequestsIXP_0 (copy)
    local v54 = v52[l_AppUserLayers_0.SocialFriendsLayer] or {};
    local v55 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.getExperimentVariant(v52);
    local v56 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.experimentOrRolloutEnabled(v52);
    return {
        luaAddFriendsPageEnabled = v54.show_lua_add_friends_page == "True", 
        contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v56, 
        contactImporterExperimentVariant = if l_FFlagContactImporterIXPCleanup_0 then nil else v55
    };
end)(v37);
v37 = v3.connect(function(v57, _) --[[ Line: 209 ]]
    return {
        centralOverlayType = v57.CentralOverlay.OverlayType
    };
end, nil)(v37);
v37 = l_UniversalAppPolicy_0.connect(function(v59) --[[ Line: 215 ]]
    return {
        isContactImporterPolicyEnabled = v59.getContactImporterEnabled()
    };
end)(v37);
v37 = l_RoactServices_0.connect({
    roactAnalytics = v5, 
    eventIngestService = v6
})(v37);
return function(v60) --[[ Line: 226 ]] --[[ Name: FriendsLandingUniversalAppWrapperContainer ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useNavigation_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), v36 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), v32 (copy), l_UiMode_0 (copy), l_useNavigationProps_0 (copy), v2 (copy), v37 (ref), v15 (copy)
    local v61 = l_useDesignTokens_0();
    local v62 = l_useUiModeInfo_0();
    local v63 = l_useNavigation_0();
    local v64 = nil;
    v64 = if l_FFlagGuacStickyShortcutBarEnabled_0 then v36(function(v65) --[[ Line: 233 ]]
        return v65.getStickyShortcutBarEnabled();
    end) else if l_FFlagLuaAppEnableStickyShortcutBar_0 then v32() else nil;
    local v66 = v62.uiMode == l_UiMode_0.TenFoot;
    local v69 = l_useNavigationProps_0(function(_, v68) --[[ Line: 242 ]]
        return {
            navigateToFriendsLandingEventStart = v68.navigateToFriendsLandingEventStart
        };
    end);
    return v2.createElement(v37, v15.Dictionary.join(v60, {
        BackgroundColor = v61.LuaApps.App.Page.BackgroundColor, 
        BackgroundTransparency = v61.LuaApps.App.Page.BackgroundTransparency, 
        navigation = v63, 
        useFullScalePage = if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then v66 or v64 else v66
    }, v69));
end;