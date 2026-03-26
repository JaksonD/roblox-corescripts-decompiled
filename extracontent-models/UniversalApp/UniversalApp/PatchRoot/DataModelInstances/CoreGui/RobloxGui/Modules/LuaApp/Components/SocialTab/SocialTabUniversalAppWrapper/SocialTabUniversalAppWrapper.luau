local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_UniversalAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_withStyle_0 = v4.Style.withStyle;
local l_Contexts_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Contexts;
local v9 = require(l_CorePackages_0.Packages.Cryo);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v11 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v12 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v13 = require(l_script_FirstAncestor_0.LuaApp.Models.User);
local v14 = require(l_script_FirstAncestor_0.LuaApp.Util.joinGame);
local v15 = require(l_script_FirstAncestor_0.LuaApp.Config);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v17 = require(l_script_FirstAncestor_0.LuaApp.PerformanceTesting);
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local l_SetAppLoaded_0 = v11.Actions.SetAppLoaded;
local l_SquadAppChatEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.SquadsCore).SquadAppChatEventReceiver;
local v21 = require(l_script_FirstAncestor_0.LuaApp.Enum.NotificationType);
local v22 = require(l_script_FirstAncestor_0.LuaApp.Enum.RetrievalStatus);
local l_llama_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).llama;
local v24 = require(script.Parent.Parent.utils.formatUser);
local l_ChatEventReceiver_0 = v11.Components.EventReceivers.ChatEventReceiver;
local v26 = require(l_script_FirstAncestor_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v27 = require(l_script_FirstAncestor_0.Common.Signal);
local l_GetDefaultQualityLevel_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel;
local l_AndroidBackButtonConnection_0 = require(l_CorePackages_0.Workspace.Packages.SocialTab).AndroidBackButtonConnection;
local l_EnumScreens_0 = require(l_CorePackages_0.Workspace.Packages.SocialTab).EnumScreens;
local v31 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTabLoader.Container);
local l_Context_0 = require(l_script_FirstAncestor_0.LuaApp.Components.SocialTab.SocialTab).Context;
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v34 = require(l_script_FirstAncestor_0.LuaApp.Components.UserSearch.Players.PlayerSearch);
local l_OffPlatformFriendRequestsIXP_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Flags.OffPlatformFriendRequestsIXP;
local v36 = require(l_CorePackages_0.Workspace.Packages.NotificationsUpsell);
local v37 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagLuafiedReportEntryPoints_0 = v37.GetFFlagLuafiedReportEntryPoints;
local l_EntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).EntryPoint;
local v40 = require(l_script_FirstAncestor_0.LuaApp.Components.Chat.ExternalNavigationHandler.Container);
local v41 = require(l_script_FirstAncestor_0.LuaApp.Hooks.useRoactService);
local v42 = require(l_script_FirstAncestor_0.LuaApp.Services.RoactAnalytics);
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v44 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v45 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local v47 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v47.useNavBarPlacement;
local l_useIsStickyShortcutBarEnabled_0 = require(l_CorePackages_0.Workspace.Packages.AppShortcutBar).Hooks.useIsStickyShortcutBarEnabled;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_ConvertUniverseIdToString_0 = v37.ConvertUniverseIdToString;
local l_CommunityListExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.Groups).Experiments.CommunityListExperimentation;
local l_GetFFlagEnableCommunityListExperimentation_0 = v37.GetFFlagEnableCommunityListExperimentation;
local v54 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v56 = require(l_script_FirstAncestor_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v59 = game:DefineFastFlag("SocialTabShouldRequestPushPermissions", false);
local l_GetFFlagIsSquadEnabled_0 = v37.GetFFlagIsSquadEnabled;
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local v62 = game:DefineFastFlag("PushUpsellExposureLogFix", false);
local l_GetFStringPushUpsellVariantName_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringPushUpsellVariantName;
local l_FFlagSquadAppChatRTNFix_0 = v37.FFlagSquadAppChatRTNFix;
local l_FFlagShareTargetGameCleanup_0 = v37.FFlagShareTargetGameCleanup;
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v37.FFlagLuaAppEnableStickyShortcutBar;
local l_FFlagContactImporterIXPCleanup_0 = v37.FFlagContactImporterIXPCleanup;
local l_FFlagCreateConnectionsHub_0 = v37.FFlagCreateConnectionsHub;
local v69 = require(l_script_FirstAncestor_0.LuaApp.Flags.FFlagFixSocialTabBottomBarCutOff);
local l_FFlagGuacStickyShortcutBarEnabled_0 = v37.FFlagGuacStickyShortcutBarEnabled;
local v71 = v3.PureComponent:extend("SocialTabUniversalAppWrapper");
v71.defaultProps = {
    renderSocialTab = function() --[[ Line: 106 ]] --[[ Name: renderSocialTab ]]
        -- upvalues: v3 (copy), v31 (copy)
        return v3.createElement(v31);
    end, 
    renderRoactChat = function() --[[ Line: 109 ]] --[[ Name: renderRoactChat ]]
        -- upvalues: l_Context_0 (copy), v3 (copy), l_EntryPoint_0 (copy)
        return l_Context_0.with(function(v72) --[[ Line: 110 ]]
            -- upvalues: v3 (ref), l_EntryPoint_0 (ref)
            return v72.wasEverVisible and v3.createElement(l_EntryPoint_0, v72) or nil;
        end);
    end, 
    runService = l_RunService_0
};
v71.init = function(v73) --[[ Line: 118 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_AndroidBackButtonConnection_0 (copy), v21 (copy), v27 (copy), v17 (copy), l_RobloxEventReceiver_0 (copy), v40 (copy), l_Logger_0 (copy), v5 (copy), l_EnumScreens_0 (copy), l_llama_0 (copy), v12 (copy), l_GetFFlagEnableCommunityListExperimentation_0 (copy), l_CommunityListExperimentation_0 (copy), v24 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_Contexts_0 (copy), l_SearchTypes_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v34 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy), l_FFlagShareTargetGameCleanup_0 (copy), v59 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), v62 (copy), v36 (copy), l_default_1 (copy), l_default_0 (copy), l_memoize_0 (copy), l_UserInputService_0 (copy), l_EntryPoint_0 (copy), v41 (copy), v42 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v14 (copy), v44 (copy), v45 (copy), v13 (copy), l_ConvertUniverseIdToString_0 (copy), l_SetAppLoaded_0 (copy), v15 (copy), l_FFlagContactImporterIXPCleanup_0 (copy)
    v73.state = {
        wasChatEverTapped = v73.props.isVisible, 
        externalNavigationByScreen = {}
    };
    v73.chatToastRef = v3.createRef();
    v73.androidBackButtonConnection = l_AndroidBackButtonConnection_0(v73.props.guiService, v21);
    v73.androidBackButtonConnectionSocialTab = l_AndroidBackButtonConnection_0(v73.props.guiService, v21);
    v73._rnBypassActionSignal = v27.new();
    v73._rnBypassActionSignalSocialTab = v27.new();
    v73.backButtonEnabled = false;
    v73._performanceTesting = v17;
    v73._robloxEventReceiver = l_RobloxEventReceiver_0.new(v73.props.notificationService);
    v73.renderOnLoaded = function() --[[ Line: 145 ]]
        -- upvalues: v73 (copy), v3 (ref), v40 (ref)
        if not v73.state.wasChatEverTapped then
            return nil;
        else
            return v3.createFragment({
                screen = v73.props.renderSocialTab(), 
                externalNavigation = v3.createElement(v40, {
                    navigationByScreen = v73.state.externalNavigationByScreen
                })
            });
        end;
    end;
    v73.setBackButtonEnabled = function(v74) --[[ Line: 158 ]]
        -- upvalues: v73 (copy)
        v73.backButtonEnabled = v74;
    end;
    v73.setTabBarVisibleFromChat = function(v75) --[[ Line: 162 ]]
        -- upvalues: v73 (copy)
        local v76 = v73.props.shouldSystemBarUsuallyBePresent and true or v75;
        v73.props.setTabBarVisibleFromChat(v76);
    end;
    v73.setActiveConversationId = function(v77) --[[ Line: 167 ]]
        -- upvalues: l_Logger_0 (ref), v73 (copy), v3 (ref)
        l_Logger_0:debug("{} setting activeConversationId as {}", script.Name, v77);
        v73:setState({
            activeConversationId = v77 or v3.None
        });
    end;
    v73.getActiveConversationId = function() --[[ Line: 174 ]]
        -- upvalues: v73 (copy)
        return v73.state.activeConversationId;
    end;
    v73.initRoactChatNavigation = function() --[[ Line: 179 ]]
        -- upvalues: v73 (copy), v5 (ref), l_EnumScreens_0 (ref)
        v73._rnBypassActionSignalSocialTab:fire(v5.Actions.navigate({
            routeName = l_EnumScreens_0.RoactChat
        }));
    end;
    v73.updateExternalNavigationForScreen = function(v78, v79) --[[ Line: 185 ]]
        -- upvalues: v73 (copy), l_llama_0 (ref)
        v73:setState(function(v80, _) --[[ Line: 186 ]]
            -- upvalues: v78 (copy), l_llama_0 (ref), v79 (copy)
            if v78 then
                return {
                    externalNavigationByScreen = l_llama_0.Dictionary.join(v80.externalNavigationByScreen, {
                        [v79] = v78
                    })
                };
            else
                local v82 = l_llama_0.Dictionary.copy(v80.externalNavigationByScreen);
                v82[v79] = nil;
                return {
                    externalNavigationByScreen = v82
                };
            end;
        end);
    end;
    v73.navigateDownToNotifications = function(v83) --[[ Line: 203 ]]
        -- upvalues: v73 (copy)
        v83 = v83 or false;
        v73.props.navigateDownToNotifications(function() --[[ Line: 206 ]]
            -- upvalues: v83 (ref), v73 (ref)
            if v83 then
                v73.setTabBarVisibleFromChat(true);
            end;
        end);
    end;
    v73.navigateToCoHubAddConnections = function() --[[ Line: 213 ]]
        -- upvalues: v73 (copy), v12 (ref)
        v73.props.navigation.navigate(v12.CoHubAddConnections);
    end;
    v73.openProfileWebView = function(v84) --[[ Line: 217 ]]
        -- upvalues: v73 (copy)
        v73.props.navigateDownToViewUserProfile(v84, function() --[[ Line: 218 ]]
            -- upvalues: v73 (ref)
            if v73.props.wideMode then
                v73.setTabBarVisibleFromChat(v73.props.wideMode);
            end;
        end);
    end;
    v73.openProfilePeekView = function(v85, v86) --[[ Line: 225 ]]
        -- upvalues: v73 (copy)
        v73.props.openProfilePeekView(v85, {
            onClose = function() --[[ Line: 227 ]] --[[ Name: onClose ]]
                -- upvalues: v73 (ref), v86 (copy)
                if v73.state.getIsTabBarEnabled then
                    v73.setTabBarVisibleFromChat(v73.state.getIsTabBarEnabled());
                end;
                if v86 and v86.onClose then
                    v86.onClose();
                end;
            end, 
            onOpen = function() --[[ Line: 236 ]] --[[ Name: onOpen ]]
                -- upvalues: v73 (ref), v86 (copy)
                v73.setTabBarVisibleFromChat(false);
                if v86 and v86.onOpen then
                    v86.onOpen();
                end;
            end, 
            resetPeekView = true
        });
    end;
    v73.navigateDownToReportAbuse = function(v87, v88) --[[ Line: 246 ]]
        -- upvalues: v73 (copy)
        if v73.props.useLuafiedReportFlow then
            v73.props.openReportDialog(v87, v88);
            return;
        else
            v73.props.navigateDownToReportAbuse(v87, v88);
            return;
        end;
    end;
    v73.navigateDownToPrivacySettings = function() --[[ Line: 254 ]]
        -- upvalues: v73 (copy)
        v73.props.navigateDownToPrivacySettings();
    end;
    v73.navigateDownToGroups = function() --[[ Line: 258 ]]
        -- upvalues: v73 (copy), l_GetFFlagEnableCommunityListExperimentation_0 (ref), l_CommunityListExperimentation_0 (ref)
        local function v89() --[[ Line: 259 ]]
            -- upvalues: v73 (ref)
            v73.setTabBarVisibleFromChat(true);
        end;
        if l_GetFFlagEnableCommunityListExperimentation_0() then
            l_CommunityListExperimentation_0.logExposure();
        end;
        if l_GetFFlagEnableCommunityListExperimentation_0() and l_CommunityListExperimentation_0.getCommunityListEnabled() then
            v73.props.openGroupsListPage(v89);
            return;
        else
            v73.props.navigateDownToGroups(v89);
            return;
        end;
    end;
    v73.navigateDownToAddFriends = function() --[[ Line: 276 ]]
        -- upvalues: v73 (copy)
        v73.props.navigateDownToAddFriends(function() --[[ Line: 277 ]]
            -- upvalues: v73 (ref)
            v73.setTabBarVisibleFromChat(true);
        end);
    end;
    v73.navigateToHomePage = function() --[[ Line: 282 ]]
        -- upvalues: v73 (copy), v12 (ref)
        v73.props.navigation.navigate(v12.Home);
    end;
    v73.FriendFinder = function() --[[ Line: 286 ]]
        -- upvalues: v73 (copy)
        v73.props.navigateDownToFriendFinder(function() --[[ Line: 287 ]]
            -- upvalues: v73 (ref)
            v73.setTabBarVisibleFromChat(true);
        end);
    end;
    v73.AddFriendsAccountProvider = function(v90) --[[ Line: 292 ]]
        -- upvalues: v73 (copy)
        v73.props.navigateDownToAddFriendsAccountProvider(v90);
    end;
    v73.setIsTabBarEnabled = function(v91) --[[ Line: 296 ]]
        -- upvalues: v73 (copy)
        v73:setState({
            getIsTabBarEnabled = v91
        });
    end;
    v73.openUserContextualMenu = function(v92) --[[ Line: 302 ]]
        -- upvalues: l_llama_0 (ref), v73 (copy), v24 (ref)
        local l_onClose_0 = v92.onClose;
        v92 = l_llama_0.Dictionary.join(v92, {
            onCloseGameDetails = function() --[[ Line: 306 ]] --[[ Name: onCloseGameDetails ]]
                -- upvalues: v73 (ref)
                v73.setTabBarVisibleFromChat(true);
            end, 
            onClose = function() --[[ Line: 309 ]] --[[ Name: onClose ]]
                -- upvalues: l_onClose_0 (copy)
                if l_onClose_0 then
                    l_onClose_0();
                end;
            end, 
            onCloseProfileWebview = function() --[[ Line: 314 ]] --[[ Name: onCloseProfileWebview ]]
                -- upvalues: v73 (ref)
                v73.setTabBarVisibleFromChat(true);
            end, 
            user = v24(v92.user)
        });
        v73.props.openContextualMenu(v92);
    end;
    v73.navigateToUserInfo = function(v94, v95) --[[ Line: 323 ]]
        -- upvalues: v73 (copy), l_llama_0 (ref), v24 (ref)
        if not v95 then
            v73.openProfileWebView(v94);
            return;
        else
            local v96 = v95.contextualMenuProps or {};
            if v95.contextualMenuProps then
                v96 = l_llama_0.Dictionary.join(v96, {
                    onCloseGameDetails = function() --[[ Line: 332 ]] --[[ Name: onCloseGameDetails ]]
                        -- upvalues: v73 (ref)
                        v73.setTabBarVisibleFromChat(true);
                    end, 
                    onClose = function() --[[ Line: 335 ]] --[[ Name: onClose ]]
                        -- upvalues: v95 (copy)
                        if v95.contextualMenuProps.onClose then
                            v95.contextualMenuProps.onClose();
                        end;
                    end, 
                    onCloseProfileWebview = function() --[[ Line: 340 ]] --[[ Name: onCloseProfileWebview ]]
                        -- upvalues: v73 (ref)
                        v73.setTabBarVisibleFromChat(true);
                    end, 
                    user = v24(v95.contextualMenuProps.user)
                });
            end;
            local v97 = l_llama_0.Dictionary.join(v95.profilePeekViewProps or {}, {
                resetPeekView = true, 
                onClose = function() --[[ Line: 349 ]] --[[ Name: onClose ]]
                    -- upvalues: v73 (ref), v95 (copy)
                    if v73.state.getIsTabBarEnabled then
                        v73.setTabBarVisibleFromChat(v73.state.getIsTabBarEnabled());
                    end;
                    if v95.profilePeekViewProps and v95.profilePeekViewProps.onClose then
                        v95.profilePeekViewProps.onClose();
                    end;
                end, 
                onOpen = function() --[[ Line: 357 ]] --[[ Name: onOpen ]]
                    -- upvalues: v73 (ref), v95 (copy)
                    v73.setTabBarVisibleFromChat(false);
                    if v95.profilePeekViewProps and v95.profilePeekViewProps.onOpen then
                        v95.profilePeekViewProps.onOpen();
                    end;
                end, 
                source = v95.source
            });
            v73.props.navigateToUserInfo(v94, {
                contextualMenuProps = v96, 
                profilePeekViewProps = v97, 
                openJoinable = v95.openJoinable, 
                entryPoint = v95.entryPoint
            });
            return;
        end;
    end;
    v73.navigateToLuaAppPages = {
        [l_EnumScreens_0.GameDetail] = v73.props.navigateToGameDetails, 
        [l_EnumScreens_0.ViewUserProfile] = v73.navigateToUserInfo, 
        [l_EnumScreens_0.Notifications] = v73.navigateDownToNotifications, 
        [l_EnumScreens_0.LearnMore] = v73.props.openLearnMoreLink, 
        [l_EnumScreens_0.ReportAbuse] = v73.navigateDownToReportAbuse, 
        [l_EnumScreens_0.PrivacySettings] = v73.navigateDownToPrivacySettings, 
        [l_EnumScreens_0.CoHubAddConnections] = if l_FFlagCreateConnectionsHub_0 then v73.navigateToCoHubAddConnections else nil, 
        [l_EnumScreens_0.AddFriends] = v73.navigateDownToAddFriends, 
        [l_EnumScreens_0.Groups] = v73.navigateDownToGroups, 
        [l_EnumScreens_0.FriendFinder] = v73.FriendFinder, 
        [l_EnumScreens_0.AddFriendsAccountProvider] = v73.AddFriendsAccountProvider, 
        [l_EnumScreens_0.ViewUser] = v73.openUserContextualMenu, 
        [l_EnumScreens_0.VerifiedBadgeModal] = v73.props.openVerifiedBadgeModal, 
        [l_EnumScreens_0.DiscoverabilityModal] = v73.props.openDiscoverabilityModal, 
        [l_EnumScreens_0.ProfileQRCode] = function() --[[ Line: 401 ]]
            -- upvalues: v73 (copy), l_Contexts_0 (ref)
            v73.props.navigateTo3DQRCodePage({
                source = l_Contexts_0.AddFriends
            });
        end, 
        [l_EnumScreens_0.SearchPage] = function() --[[ Line: 406 ]]
            -- upvalues: v73 (copy), v12 (ref), l_SearchTypes_0 (ref)
            v73.props.navigation.navigate(v12.SearchPage, {
                defaultSearchType = l_SearchTypes_0.Players
            });
        end, 
        [l_EnumScreens_0.AmpWizardContainer] = v73.props.openAmpWizardContainer, 
        [l_EnumScreens_0.Home] = if l_GetFFlagIsSquadEnabled_0() then v73.navigateToHomePage else nil
    };
    v73.luaAppPages = {
        playerSearchPage = v34
    };
    local v98 = nil;
    v98 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 423 ]]
        -- upvalues: v98 (ref), l_GetDefaultQualityLevel_0 (ref)
        if v98 then
            v98:Disconnect();
        end;
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end);
    v73.onBackButtonPressed = function() --[[ Line: 434 ]]
        -- upvalues: v73 (copy), v5 (ref)
        if v73.props.canGoBack then
            v73.props.navigateBack();
            return;
        elseif v73.backButtonEnabled then
            v73._rnBypassActionSignal:fire(v5.Actions.back());
            return;
        else
            v73.androidBackButtonConnection.showExitDialog();
            return;
        end;
    end;
    v73.isAndroidBackButtonHandlerDisabled = function(v99) --[[ Line: 444 ]]
        -- upvalues: v12 (ref), l_FFlagShareTargetGameCleanup_0 (ref)
        local v100 = true;
        if v99 ~= v12.GameDetail then
            v100 = (if l_FFlagShareTargetGameCleanup_0 then nil else v99 == v12.ShareGameToChat) or v99 == v12.AvatarExperienceWrapperTransparent or v99 == v12.AvatarExperienceWrapper or v99 == v12.ProfilePlatform;
        end;
        return v100;
    end;
    v73._navigatingFromSocialTabEvent = nil;
    v73.setNavigatingFromSocialTabEvent = function(v101) --[[ Line: 454 ]]
        -- upvalues: v73 (copy), l_EnumScreens_0 (ref)
        v73._navigatingFromSocialTabEvent = {
            startTime = os.clock(), 
            startPage = l_EnumScreens_0.SocialTab, 
            endPage = v101
        };
    end;
    v73.getNavigatingFromSocialTabEvent = function() --[[ Line: 462 ]]
        -- upvalues: v73 (copy)
        return v73._navigatingFromSocialTabEvent;
    end;
    if v59 then
        local v102 = v73.props.shouldShowPushUpsell and v73.props.notificationsCanReceivePush;
        if l_GetFFlagEnablePushNotificationsUpsellModal_0 and v102 then
            if v73.props.pushUpsellVariant ~= nil then
                if if v62 then v73.props.pushUpsellVariant == 0 else v73.props.pushUpsellVariant > -1 then
                    local l_PushUpsellEventConfig_0 = v36.PushUpsellEventConfig;
                    local l_ModalEventConstants_0 = v36.ModalEventConstants;
                    l_default_1:logRobloxTelemetryEvent(l_PushUpsellEventConfig_0, {}, {
                        [l_ModalEventConstants_0.ActionType] = l_ModalEventConstants_0.ShouldRequest, 
                        [l_ModalEventConstants_0.EntryPoint] = v12.Chat
                    });
                end;
                if v73.props.pushUpsellVariant <= 0 then
                    local v105 = {
                        l_default_0.Permissions.POST_NOTIFICATIONS
                    };
                    l_default_0:requestPermissions(v105);
                end;
            end;
        elseif v102 then
            local v106 = {
                l_default_0.Permissions.POST_NOTIFICATIONS
            };
            l_default_0:requestPermissions(v106);
        end;
    end;
    v73.generateContext = l_memoize_0(function(v107, v108, v109, v110, v111, v112, v113, v114, v115, v116) --[[ Line: 502 ]]
        -- upvalues: v73 (copy), l_Logger_0 (ref), l_UserInputService_0 (ref), l_EntryPoint_0 (ref), v27 (ref), v41 (ref), v42 (ref), l_RoactAnalyticsCommonGameEvents_0 (ref), v14 (ref), v44 (ref), v45 (ref), v13 (ref), v12 (ref), l_ConvertUniverseIdToString_0 (ref), l_SetAppLoaded_0 (ref), v15 (ref), v17 (ref), v21 (ref), l_FFlagContactImporterIXPCleanup_0 (ref)
        return {
            wasEverVisible = v73.state.wasEverVisible, 
            localUserId = v108, 
            isVisible = v107, 
            pageType = v111, 
            parameters = v112, 
            navigationProps = v109, 
            logger = l_Logger_0, 
            navigateToLuaAppPages = v73.navigateToLuaAppPages, 
            rnBypassActionSignal = v73._rnBypassActionSignal, 
            rnBypassActionSignalSocialTab = v73._rnBypassActionSignalSocialTab, 
            getActiveConversationId = v73.getActiveConversationId, 
            setActiveConversationId = v73.setActiveConversationId, 
            setBackButtonEnabled = v73.setBackButtonEnabled, 
            setTabBarVisible = v73.setTabBarVisibleFromChat, 
            luaAppPages = v73.luaAppPages, 
            wideMode = v113, 
            notificationCount = v110, 
            robloxEventReceiver = v73._robloxEventReceiver, 
            userInputService = l_UserInputService_0, 
            roactChatEntryPoint = l_EntryPoint_0, 
            androidBackButtonConnection = v73.androidBackButtonConnectionSocialTab, 
            signal = v27, 
            androidBackButtonHandlerDisabled = v73.isAndroidBackButtonHandlerDisabled(v114), 
            setIsTabBarEnabled = v115 and v73.setIsTabBarEnabled or nil, 
            isLuaProfilePageEnabled = v115, 
            useRoactService = v41, 
            roactAnalytics = v42, 
            roactAnalyticsCommonGameEvents = l_RoactAnalyticsCommonGameEvents_0, 
            joinGame = v14, 
            openGameDetails = v44, 
            navigateDown = v45, 
            presenceType = v13.PresenceType, 
            appPage = v12, 
            convertUniverseIdToString = l_ConvertUniverseIdToString_0, 
            setNavigatingFromSocialTabEvent = v73.setNavigatingFromSocialTabEvent, 
            getNavigatingFromSocialTabEvent = v73.getNavigatingFromSocialTabEvent, 
            luaAddFriendsPageEnabled = v116, 
            setAppLoaded = l_SetAppLoaded_0, 
            fetchUnreadConversationCount = v73.props.fetchUnreadConversationCount, 
            notificationService = v73.props.notificationService, 
            config = v15, 
            toggleChatPaused = v73.props.toggleChatPaused, 
            performanceTesting = v17, 
            notificationType = v21, 
            contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v73.props.contactImporterAndPYMKEnabled and v73.props.isContactImporterPolicyEnabled or nil, 
            diagService = v73.props.roactAnalytics.Diag, 
            eventIngestService = v73.props.eventIngestService, 
            openProfilePeekView = v73.props.openProfilePeekView, 
            closeCentralOverlay = v73.props.closeCentralOverlay, 
            openLearnMoreLink = v73.props.openLearnMoreLink, 
            showToast = v73.props.showToast, 
            updateExternalNavigationForScreen = v73.updateExternalNavigationForScreen, 
            initialRouteName = v73.props.initialRouteName, 
            openPlayerContextualMenu = v73.props.openPlayerContextualMenu
        };
    end);
end;
v71.render = function(v117) --[[ Line: 588 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_Context_0 (copy), v26 (copy), v69 (copy), v47 (copy), l_ChatEventReceiver_0 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), l_SquadAppChatEventReceiver_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 591 ]]
        -- upvalues: v117 (copy), v3 (ref), l_Context_0 (ref), v26 (ref), v69 (ref), v47 (ref), l_ChatEventReceiver_0 (ref), l_FFlagSquadAppChatRTNFix_0 (ref), l_SquadAppChatEventReceiver_0 (ref)
        local l_initRoactChatNavigation_0 = v117.initRoactChatNavigation;
        return v3.createElement(l_Context_0.Provider, {
            value = v117.generateContext(v117.props.isVisible, v117.props.localUserId, v117.props.navigationProps, v117.props.notificationCount, v117.props.pageType, v117.props.parameters, v117.props.wideMode, v117.props.currentAppPage, true, v117.props.luaAddFriendsPageEnabled)
        }, {
            SocialTab = v3.createElement(v26, {
                BorderSizePixel = 0, 
                BackgroundColor3 = v117.props.BackgroundColor, 
                BackgroundTransparency = v117.props.BackgroundTransparency, 
                useFullScalePage = v117.props.useFullScalePage, 
                includeStatusBar = true, 
                includeBottomBar = (not not v69 or v117.props.wideMode) and v117.props.navBarPlacement == v47.Placement.Bottom
            }, {
                ChatEventReceiver = v3.createElement(l_ChatEventReceiver_0, {
                    robloxEventReceiver = v117._robloxEventReceiver, 
                    rnBypassActionSignal = v117._rnBypassActionSignal, 
                    initRoactChatNavigation = l_initRoactChatNavigation_0, 
                    activeConversationId = v117.state.activeConversationId
                }), 
                SocialTab = v117.renderOnLoaded(), 
                SquadAppChatEventReceiver = if l_FFlagSquadAppChatRTNFix_0 then v3.createElement(l_SquadAppChatEventReceiver_0) else nil
            })
        });
    end);
end;
v71.didMount = function(v120) --[[ Line: 633 ]] --[[ Name: didMount ]]
    -- upvalues: l_Logger_0 (copy)
    l_Logger_0:info("Initializing SocialTabUniversalAppWrapper");
    if v120.props.isVisible and v120.props.toggleChatPaused ~= nil then
        v120.props.toggleChatPaused(false);
    end;
end;
v71.didUpdate = function(v121, v122, _) --[[ Line: 643 ]] --[[ Name: didUpdate ]]
    -- upvalues: v15 (copy)
    if v122.isVisible ~= v121.props.isVisible then
        v121.androidBackButtonConnection.disconnect();
        if not v122.isVisible then
            v121._performanceTesting:Initialize();
            v121.props.setThrottleFramerateEnabled(v15.General.PerformanceTestingMode == Enum.VirtualInputMode.None);
            v121.props.toggleChatPaused(false);
            return;
        else
            v121._performanceTesting:Stop();
            v121.props.setThrottleFramerateEnabled(false);
            v121.props.toggleChatPaused(true);
        end;
    end;
end;
v71.getDerivedStateFromProps = function(v124, v125) --[[ Line: 659 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v22 (copy)
    local v126 = nil;
    local v127 = nil;
    local v128 = nil;
    if v124.isVisible then
        v126 = true;
    end;
    if v124.retrievalStatus == v22.Done then
        v127 = true;
    end;
    if v125.wasChatEverTapped == false and v124.isVisible == true then
        v128 = true;
    end;
    return {
        wasChatEverTapped = v128, 
        wasEverVisible = v126, 
        wasEverDoneRetrieving = v127
    };
end;
v71.willUnmount = function(v129) --[[ Line: 683 ]] --[[ Name: willUnmount ]]
    v129.androidBackButtonConnection.disconnect();
end;
v71 = v56((l_UniversalAppPolicy_0.connect(function(v130) --[[ Line: 688 ]]
    -- upvalues: l_GetFFlagLuafiedReportEntryPoints_0 (copy)
    return {
        isContactImporterPolicyEnabled = v130.getContactImporterEnabled(), 
        shouldSystemBarUsuallyBePresent = v130.getShouldSystemBarUsuallyBePresent(), 
        useLuafiedReportFlow = if l_GetFFlagLuafiedReportEntryPoints_0() then v130.getUseLuafiedReportFlow() else nil, 
        shouldShowPushUpsell = v130.getPushNotificationsUpsell(), 
        notificationsCanReceivePush = v130.getNotificationsCanReceivePush()
    };
end)(v71)));
v71 = v54.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer, 
    l_AppUserLayers_0.PushNotificationPrompt
}, function(v131, _) --[[ Line: 703 ]]
    -- upvalues: l_AppUserLayers_0 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), l_OffPlatformFriendRequestsIXP_0 (copy), l_GetFStringPushUpsellVariantName_0 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy)
    local v133 = v131[l_AppUserLayers_0.SocialFriendsLayer] or {};
    local v134 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.getExperimentVariant(v131);
    local v135 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.experimentOrRolloutEnabled(v131);
    local v136 = v131[l_AppUserLayers_0.PushNotificationPrompt] or {};
    local v137 = l_GetFStringPushUpsellVariantName_0();
    return {
        luaAddFriendsPageEnabled = v133.show_lua_add_friends_page == "True", 
        contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v135, 
        contactImporterExperimentVariant = if l_FFlagContactImporterIXPCleanup_0 then nil else v134, 
        pushUpsellVariant = if l_GetFFlagEnablePushNotificationsUpsellModal_0() then v136[v137] or -1 else nil
    };
end)(v71);
return function(v138) --[[ Line: 725 ]] --[[ Name: SocialTabUniversalAppWrapperContainer ]]
    -- upvalues: l_useNavBarPlacement_0 (copy), l_FFlagGuacStickyShortcutBarEnabled_0 (copy), l_useAppPolicy_0 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_useIsStickyShortcutBarEnabled_0 (copy), v3 (copy), v71 (ref), v9 (copy)
    local v139 = l_useNavBarPlacement_0();
    local v140 = nil;
    v140 = if l_FFlagGuacStickyShortcutBarEnabled_0 then l_useAppPolicy_0(function(v141) --[[ Line: 730 ]]
        return v141.getStickyShortcutBarEnabled();
    end) else if l_FFlagLuaAppEnableStickyShortcutBar_0 then l_useIsStickyShortcutBarEnabled_0() else nil;
    return v3.createElement(v71, v9.Dictionary.join(v138, {
        navBarPlacement = v139, 
        useFullScalePage = if not not l_FFlagLuaAppEnableStickyShortcutBar_0 or l_FFlagGuacStickyShortcutBarEnabled_0 then v140 else nil
    }));
end;