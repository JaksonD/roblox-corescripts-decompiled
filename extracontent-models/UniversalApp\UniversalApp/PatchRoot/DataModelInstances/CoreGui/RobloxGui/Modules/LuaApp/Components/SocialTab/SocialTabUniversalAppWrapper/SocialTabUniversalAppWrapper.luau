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
local l_ConvertUniverseIdToString_0 = v37.ConvertUniverseIdToString;
local l_CommunityListExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.Groups).Experiments.CommunityListExperimentation;
local l_GetFFlagEnableCommunityListExperimentation_0 = v37.GetFFlagEnableCommunityListExperimentation;
local v53 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v55 = require(l_script_FirstAncestor_0.LuaApp.Common.withThrottleFramerateGivenPolicy);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v58 = game:DefineFastFlag("SocialTabShouldRequestPushPermissions", false);
local l_GetFFlagIsSquadEnabled_0 = v37.GetFFlagIsSquadEnabled;
local l_GetFFlagEnablePushNotificationsUpsellModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnablePushNotificationsUpsellModal;
local v61 = game:DefineFastFlag("PushUpsellExposureLogFix", false);
local l_GetFStringPushUpsellVariantName_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringPushUpsellVariantName;
local l_FFlagSquadAppChatRTNFix_0 = v37.FFlagSquadAppChatRTNFix;
local l_FFlagShareTargetGameCleanup_0 = v37.FFlagShareTargetGameCleanup;
local l_FFlagLuaAppEnableStickyShortcutBar_0 = v37.FFlagLuaAppEnableStickyShortcutBar;
local l_FFlagContactImporterIXPCleanup_0 = v37.FFlagContactImporterIXPCleanup;
local l_FFlagCreateConnectionsHub_0 = v37.FFlagCreateConnectionsHub;
local v68 = require(l_script_FirstAncestor_0.LuaApp.Flags.FFlagFixSocialTabBottomBarCutOff);
local v69 = v3.PureComponent:extend("SocialTabUniversalAppWrapper");
v69.defaultProps = {
    renderSocialTab = function() --[[ Line: 104 ]] --[[ Name: renderSocialTab ]]
        -- upvalues: v3 (copy), v31 (copy)
        return v3.createElement(v31);
    end, 
    renderRoactChat = function() --[[ Line: 107 ]] --[[ Name: renderRoactChat ]]
        -- upvalues: l_Context_0 (copy), v3 (copy), l_EntryPoint_0 (copy)
        return l_Context_0.with(function(v70) --[[ Line: 108 ]]
            -- upvalues: v3 (ref), l_EntryPoint_0 (ref)
            return v70.wasEverVisible and v3.createElement(l_EntryPoint_0, v70) or nil;
        end);
    end, 
    runService = l_RunService_0
};
v69.init = function(v71) --[[ Line: 116 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_AndroidBackButtonConnection_0 (copy), v21 (copy), v27 (copy), v17 (copy), l_RobloxEventReceiver_0 (copy), v40 (copy), l_Logger_0 (copy), v5 (copy), l_EnumScreens_0 (copy), l_llama_0 (copy), v12 (copy), l_GetFFlagEnableCommunityListExperimentation_0 (copy), l_CommunityListExperimentation_0 (copy), v24 (copy), l_FFlagCreateConnectionsHub_0 (copy), l_Contexts_0 (copy), l_SearchTypes_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v34 (copy), l_RunService_0 (copy), l_GetDefaultQualityLevel_0 (copy), l_FFlagShareTargetGameCleanup_0 (copy), v58 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy), v61 (copy), v36 (copy), l_default_1 (copy), l_default_0 (copy), l_memoize_0 (copy), l_UserInputService_0 (copy), l_EntryPoint_0 (copy), v41 (copy), v42 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v14 (copy), v44 (copy), v45 (copy), v13 (copy), l_ConvertUniverseIdToString_0 (copy), l_SetAppLoaded_0 (copy), v15 (copy), l_FFlagContactImporterIXPCleanup_0 (copy)
    v71.state = {
        wasChatEverTapped = v71.props.isVisible, 
        externalNavigationByScreen = {}
    };
    v71.chatToastRef = v3.createRef();
    v71.androidBackButtonConnection = l_AndroidBackButtonConnection_0(v71.props.guiService, v21);
    v71.androidBackButtonConnectionSocialTab = l_AndroidBackButtonConnection_0(v71.props.guiService, v21);
    v71._rnBypassActionSignal = v27.new();
    v71._rnBypassActionSignalSocialTab = v27.new();
    v71.backButtonEnabled = false;
    v71._performanceTesting = v17;
    v71._robloxEventReceiver = l_RobloxEventReceiver_0.new(v71.props.notificationService);
    v71.renderOnLoaded = function() --[[ Line: 143 ]]
        -- upvalues: v71 (copy), v3 (ref), v40 (ref)
        if not v71.state.wasChatEverTapped then
            return nil;
        else
            return v3.createFragment({
                screen = v71.props.renderSocialTab(), 
                externalNavigation = v3.createElement(v40, {
                    navigationByScreen = v71.state.externalNavigationByScreen
                })
            });
        end;
    end;
    v71.setBackButtonEnabled = function(v72) --[[ Line: 156 ]]
        -- upvalues: v71 (copy)
        v71.backButtonEnabled = v72;
    end;
    v71.setTabBarVisibleFromChat = function(v73) --[[ Line: 160 ]]
        -- upvalues: v71 (copy)
        local v74 = v71.props.shouldSystemBarUsuallyBePresent and true or v73;
        v71.props.setTabBarVisibleFromChat(v74);
    end;
    v71.setActiveConversationId = function(v75) --[[ Line: 165 ]]
        -- upvalues: l_Logger_0 (ref), v71 (copy), v3 (ref)
        l_Logger_0:debug("{} setting activeConversationId as {}", script.Name, v75);
        v71:setState({
            activeConversationId = v75 or v3.None
        });
    end;
    v71.getActiveConversationId = function() --[[ Line: 172 ]]
        -- upvalues: v71 (copy)
        return v71.state.activeConversationId;
    end;
    v71.initRoactChatNavigation = function() --[[ Line: 177 ]]
        -- upvalues: v71 (copy), v5 (ref), l_EnumScreens_0 (ref)
        v71._rnBypassActionSignalSocialTab:fire(v5.Actions.navigate({
            routeName = l_EnumScreens_0.RoactChat
        }));
    end;
    v71.updateExternalNavigationForScreen = function(v76, v77) --[[ Line: 183 ]]
        -- upvalues: v71 (copy), l_llama_0 (ref)
        v71:setState(function(v78, _) --[[ Line: 184 ]]
            -- upvalues: v76 (copy), l_llama_0 (ref), v77 (copy)
            if v76 then
                return {
                    externalNavigationByScreen = l_llama_0.Dictionary.join(v78.externalNavigationByScreen, {
                        [v77] = v76
                    })
                };
            else
                local v80 = l_llama_0.Dictionary.copy(v78.externalNavigationByScreen);
                v80[v77] = nil;
                return {
                    externalNavigationByScreen = v80
                };
            end;
        end);
    end;
    v71.navigateDownToNotifications = function(v81) --[[ Line: 201 ]]
        -- upvalues: v71 (copy)
        v81 = v81 or false;
        v71.props.navigateDownToNotifications(function() --[[ Line: 204 ]]
            -- upvalues: v81 (ref), v71 (ref)
            if v81 then
                v71.setTabBarVisibleFromChat(true);
            end;
        end);
    end;
    v71.navigateToCoHubAddConnections = function() --[[ Line: 211 ]]
        -- upvalues: v71 (copy), v12 (ref)
        v71.props.navigation.navigate(v12.CoHubAddConnections);
    end;
    v71.openProfileWebView = function(v82) --[[ Line: 215 ]]
        -- upvalues: v71 (copy)
        v71.props.navigateDownToViewUserProfile(v82, function() --[[ Line: 216 ]]
            -- upvalues: v71 (ref)
            if v71.props.wideMode then
                v71.setTabBarVisibleFromChat(v71.props.wideMode);
            end;
        end);
    end;
    v71.openProfilePeekView = function(v83, v84) --[[ Line: 223 ]]
        -- upvalues: v71 (copy)
        v71.props.openProfilePeekView(v83, {
            onClose = function() --[[ Line: 225 ]] --[[ Name: onClose ]]
                -- upvalues: v71 (ref), v84 (copy)
                if v71.state.getIsTabBarEnabled then
                    v71.setTabBarVisibleFromChat(v71.state.getIsTabBarEnabled());
                end;
                if v84 and v84.onClose then
                    v84.onClose();
                end;
            end, 
            onOpen = function() --[[ Line: 234 ]] --[[ Name: onOpen ]]
                -- upvalues: v71 (ref), v84 (copy)
                v71.setTabBarVisibleFromChat(false);
                if v84 and v84.onOpen then
                    v84.onOpen();
                end;
            end, 
            resetPeekView = true
        });
    end;
    v71.navigateDownToReportAbuse = function(v85, v86) --[[ Line: 244 ]]
        -- upvalues: v71 (copy)
        if v71.props.useLuafiedReportFlow then
            v71.props.openReportDialog(v85, v86);
            return;
        else
            v71.props.navigateDownToReportAbuse(v85, v86);
            return;
        end;
    end;
    v71.navigateDownToPrivacySettings = function() --[[ Line: 252 ]]
        -- upvalues: v71 (copy)
        v71.props.navigateDownToPrivacySettings();
    end;
    v71.navigateDownToGroups = function() --[[ Line: 256 ]]
        -- upvalues: v71 (copy), l_GetFFlagEnableCommunityListExperimentation_0 (ref), l_CommunityListExperimentation_0 (ref)
        local function v87() --[[ Line: 257 ]]
            -- upvalues: v71 (ref)
            v71.setTabBarVisibleFromChat(true);
        end;
        if l_GetFFlagEnableCommunityListExperimentation_0() then
            l_CommunityListExperimentation_0.logExposure();
        end;
        if l_GetFFlagEnableCommunityListExperimentation_0() and l_CommunityListExperimentation_0.getCommunityListEnabled() then
            v71.props.openGroupsListPage(v87);
            return;
        else
            v71.props.navigateDownToGroups(v87);
            return;
        end;
    end;
    v71.navigateDownToAddFriends = function() --[[ Line: 274 ]]
        -- upvalues: v71 (copy)
        v71.props.navigateDownToAddFriends(function() --[[ Line: 275 ]]
            -- upvalues: v71 (ref)
            v71.setTabBarVisibleFromChat(true);
        end);
    end;
    v71.navigateToHomePage = function() --[[ Line: 280 ]]
        -- upvalues: v71 (copy), v12 (ref)
        v71.props.navigation.navigate(v12.Home);
    end;
    v71.FriendFinder = function() --[[ Line: 284 ]]
        -- upvalues: v71 (copy)
        v71.props.navigateDownToFriendFinder(function() --[[ Line: 285 ]]
            -- upvalues: v71 (ref)
            v71.setTabBarVisibleFromChat(true);
        end);
    end;
    v71.AddFriendsAccountProvider = function(v88) --[[ Line: 290 ]]
        -- upvalues: v71 (copy)
        v71.props.navigateDownToAddFriendsAccountProvider(v88);
    end;
    v71.setIsTabBarEnabled = function(v89) --[[ Line: 294 ]]
        -- upvalues: v71 (copy)
        v71:setState({
            getIsTabBarEnabled = v89
        });
    end;
    v71.openUserContextualMenu = function(v90) --[[ Line: 300 ]]
        -- upvalues: l_llama_0 (ref), v71 (copy), v24 (ref)
        local l_onClose_0 = v90.onClose;
        v90 = l_llama_0.Dictionary.join(v90, {
            onCloseGameDetails = function() --[[ Line: 304 ]] --[[ Name: onCloseGameDetails ]]
                -- upvalues: v71 (ref)
                v71.setTabBarVisibleFromChat(true);
            end, 
            onClose = function() --[[ Line: 307 ]] --[[ Name: onClose ]]
                -- upvalues: l_onClose_0 (copy)
                if l_onClose_0 then
                    l_onClose_0();
                end;
            end, 
            onCloseProfileWebview = function() --[[ Line: 312 ]] --[[ Name: onCloseProfileWebview ]]
                -- upvalues: v71 (ref)
                v71.setTabBarVisibleFromChat(true);
            end, 
            user = v24(v90.user)
        });
        v71.props.openContextualMenu(v90);
    end;
    v71.navigateToUserInfo = function(v92, v93) --[[ Line: 321 ]]
        -- upvalues: v71 (copy), l_llama_0 (ref), v24 (ref)
        if not v93 then
            v71.openProfileWebView(v92);
            return;
        else
            local v94 = v93.contextualMenuProps or {};
            if v93.contextualMenuProps then
                v94 = l_llama_0.Dictionary.join(v94, {
                    onCloseGameDetails = function() --[[ Line: 330 ]] --[[ Name: onCloseGameDetails ]]
                        -- upvalues: v71 (ref)
                        v71.setTabBarVisibleFromChat(true);
                    end, 
                    onClose = function() --[[ Line: 333 ]] --[[ Name: onClose ]]
                        -- upvalues: v93 (copy)
                        if v93.contextualMenuProps.onClose then
                            v93.contextualMenuProps.onClose();
                        end;
                    end, 
                    onCloseProfileWebview = function() --[[ Line: 338 ]] --[[ Name: onCloseProfileWebview ]]
                        -- upvalues: v71 (ref)
                        v71.setTabBarVisibleFromChat(true);
                    end, 
                    user = v24(v93.contextualMenuProps.user)
                });
            end;
            local v95 = l_llama_0.Dictionary.join(v93.profilePeekViewProps or {}, {
                resetPeekView = true, 
                onClose = function() --[[ Line: 347 ]] --[[ Name: onClose ]]
                    -- upvalues: v71 (ref), v93 (copy)
                    if v71.state.getIsTabBarEnabled then
                        v71.setTabBarVisibleFromChat(v71.state.getIsTabBarEnabled());
                    end;
                    if v93.profilePeekViewProps and v93.profilePeekViewProps.onClose then
                        v93.profilePeekViewProps.onClose();
                    end;
                end, 
                onOpen = function() --[[ Line: 355 ]] --[[ Name: onOpen ]]
                    -- upvalues: v71 (ref), v93 (copy)
                    v71.setTabBarVisibleFromChat(false);
                    if v93.profilePeekViewProps and v93.profilePeekViewProps.onOpen then
                        v93.profilePeekViewProps.onOpen();
                    end;
                end, 
                source = v93.source
            });
            v71.props.navigateToUserInfo(v92, {
                contextualMenuProps = v94, 
                profilePeekViewProps = v95, 
                openJoinable = v93.openJoinable, 
                entryPoint = v93.entryPoint
            });
            return;
        end;
    end;
    v71.navigateToLuaAppPages = {
        [l_EnumScreens_0.GameDetail] = v71.props.navigateToGameDetails, 
        [l_EnumScreens_0.ViewUserProfile] = v71.navigateToUserInfo, 
        [l_EnumScreens_0.Notifications] = v71.navigateDownToNotifications, 
        [l_EnumScreens_0.LearnMore] = v71.props.openLearnMoreLink, 
        [l_EnumScreens_0.ReportAbuse] = v71.navigateDownToReportAbuse, 
        [l_EnumScreens_0.PrivacySettings] = v71.navigateDownToPrivacySettings, 
        [l_EnumScreens_0.CoHubAddConnections] = if l_FFlagCreateConnectionsHub_0 then v71.navigateToCoHubAddConnections else nil, 
        [l_EnumScreens_0.AddFriends] = v71.navigateDownToAddFriends, 
        [l_EnumScreens_0.Groups] = v71.navigateDownToGroups, 
        [l_EnumScreens_0.FriendFinder] = v71.FriendFinder, 
        [l_EnumScreens_0.AddFriendsAccountProvider] = v71.AddFriendsAccountProvider, 
        [l_EnumScreens_0.ViewUser] = v71.openUserContextualMenu, 
        [l_EnumScreens_0.VerifiedBadgeModal] = v71.props.openVerifiedBadgeModal, 
        [l_EnumScreens_0.DiscoverabilityModal] = v71.props.openDiscoverabilityModal, 
        [l_EnumScreens_0.ProfileQRCode] = function() --[[ Line: 399 ]]
            -- upvalues: v71 (copy), l_Contexts_0 (ref)
            v71.props.navigateTo3DQRCodePage({
                source = l_Contexts_0.AddFriends
            });
        end, 
        [l_EnumScreens_0.SearchPage] = function() --[[ Line: 404 ]]
            -- upvalues: v71 (copy), v12 (ref), l_SearchTypes_0 (ref)
            v71.props.navigation.navigate(v12.SearchPage, {
                defaultSearchType = l_SearchTypes_0.Players
            });
        end, 
        [l_EnumScreens_0.AmpWizardContainer] = v71.props.openAmpWizardContainer, 
        [l_EnumScreens_0.Home] = if l_GetFFlagIsSquadEnabled_0() then v71.navigateToHomePage else nil
    };
    v71.luaAppPages = {
        playerSearchPage = v34
    };
    local v96 = nil;
    v96 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 421 ]]
        -- upvalues: v96 (ref), l_GetDefaultQualityLevel_0 (ref)
        if v96 then
            v96:Disconnect();
        end;
        settings().Rendering.QualityLevel = l_GetDefaultQualityLevel_0();
    end);
    v71.onBackButtonPressed = function() --[[ Line: 432 ]]
        -- upvalues: v71 (copy), v5 (ref)
        if v71.props.canGoBack then
            v71.props.navigateBack();
            return;
        elseif v71.backButtonEnabled then
            v71._rnBypassActionSignal:fire(v5.Actions.back());
            return;
        else
            v71.androidBackButtonConnection.showExitDialog();
            return;
        end;
    end;
    v71.isAndroidBackButtonHandlerDisabled = function(v97) --[[ Line: 442 ]]
        -- upvalues: v12 (ref), l_FFlagShareTargetGameCleanup_0 (ref)
        local v98 = true;
        if v97 ~= v12.GameDetail then
            v98 = (if l_FFlagShareTargetGameCleanup_0 then nil else v97 == v12.ShareGameToChat) or v97 == v12.AvatarExperienceWrapperTransparent or v97 == v12.AvatarExperienceWrapper or v97 == v12.ProfilePlatform;
        end;
        return v98;
    end;
    v71._navigatingFromSocialTabEvent = nil;
    v71.setNavigatingFromSocialTabEvent = function(v99) --[[ Line: 452 ]]
        -- upvalues: v71 (copy), l_EnumScreens_0 (ref)
        v71._navigatingFromSocialTabEvent = {
            startTime = os.clock(), 
            startPage = l_EnumScreens_0.SocialTab, 
            endPage = v99
        };
    end;
    v71.getNavigatingFromSocialTabEvent = function() --[[ Line: 460 ]]
        -- upvalues: v71 (copy)
        return v71._navigatingFromSocialTabEvent;
    end;
    if v58 then
        local v100 = v71.props.shouldShowPushUpsell and v71.props.notificationsCanReceivePush;
        if l_GetFFlagEnablePushNotificationsUpsellModal_0 and v100 then
            if v71.props.pushUpsellVariant ~= nil then
                if if v61 then v71.props.pushUpsellVariant == 0 else v71.props.pushUpsellVariant > -1 then
                    local l_PushUpsellEventConfig_0 = v36.PushUpsellEventConfig;
                    local l_ModalEventConstants_0 = v36.ModalEventConstants;
                    l_default_1:logRobloxTelemetryEvent(l_PushUpsellEventConfig_0, {}, {
                        [l_ModalEventConstants_0.ActionType] = l_ModalEventConstants_0.ShouldRequest, 
                        [l_ModalEventConstants_0.EntryPoint] = v12.Chat
                    });
                end;
                if v71.props.pushUpsellVariant <= 0 then
                    local v103 = {
                        l_default_0.Permissions.POST_NOTIFICATIONS
                    };
                    l_default_0:requestPermissions(v103);
                end;
            end;
        elseif v100 then
            local v104 = {
                l_default_0.Permissions.POST_NOTIFICATIONS
            };
            l_default_0:requestPermissions(v104);
        end;
    end;
    v71.generateContext = l_memoize_0(function(v105, v106, v107, v108, v109, v110, v111, v112, v113, v114) --[[ Line: 500 ]]
        -- upvalues: v71 (copy), l_Logger_0 (ref), l_UserInputService_0 (ref), l_EntryPoint_0 (ref), v27 (ref), v41 (ref), v42 (ref), l_RoactAnalyticsCommonGameEvents_0 (ref), v14 (ref), v44 (ref), v45 (ref), v13 (ref), v12 (ref), l_ConvertUniverseIdToString_0 (ref), l_SetAppLoaded_0 (ref), v15 (ref), v17 (ref), v21 (ref), l_FFlagContactImporterIXPCleanup_0 (ref)
        return {
            wasEverVisible = v71.state.wasEverVisible, 
            localUserId = v106, 
            isVisible = v105, 
            pageType = v109, 
            parameters = v110, 
            navigationProps = v107, 
            logger = l_Logger_0, 
            navigateToLuaAppPages = v71.navigateToLuaAppPages, 
            rnBypassActionSignal = v71._rnBypassActionSignal, 
            rnBypassActionSignalSocialTab = v71._rnBypassActionSignalSocialTab, 
            getActiveConversationId = v71.getActiveConversationId, 
            setActiveConversationId = v71.setActiveConversationId, 
            setBackButtonEnabled = v71.setBackButtonEnabled, 
            setTabBarVisible = v71.setTabBarVisibleFromChat, 
            luaAppPages = v71.luaAppPages, 
            wideMode = v111, 
            notificationCount = v108, 
            robloxEventReceiver = v71._robloxEventReceiver, 
            userInputService = l_UserInputService_0, 
            roactChatEntryPoint = l_EntryPoint_0, 
            androidBackButtonConnection = v71.androidBackButtonConnectionSocialTab, 
            signal = v27, 
            androidBackButtonHandlerDisabled = v71.isAndroidBackButtonHandlerDisabled(v112), 
            setIsTabBarEnabled = v113 and v71.setIsTabBarEnabled or nil, 
            isLuaProfilePageEnabled = v113, 
            useRoactService = v41, 
            roactAnalytics = v42, 
            roactAnalyticsCommonGameEvents = l_RoactAnalyticsCommonGameEvents_0, 
            joinGame = v14, 
            openGameDetails = v44, 
            navigateDown = v45, 
            presenceType = v13.PresenceType, 
            appPage = v12, 
            convertUniverseIdToString = l_ConvertUniverseIdToString_0, 
            setNavigatingFromSocialTabEvent = v71.setNavigatingFromSocialTabEvent, 
            getNavigatingFromSocialTabEvent = v71.getNavigatingFromSocialTabEvent, 
            luaAddFriendsPageEnabled = v114, 
            setAppLoaded = l_SetAppLoaded_0, 
            fetchUnreadConversationCount = v71.props.fetchUnreadConversationCount, 
            notificationService = v71.props.notificationService, 
            config = v15, 
            toggleChatPaused = v71.props.toggleChatPaused, 
            performanceTesting = v17, 
            notificationType = v21, 
            contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v71.props.contactImporterAndPYMKEnabled and v71.props.isContactImporterPolicyEnabled or nil, 
            diagService = v71.props.roactAnalytics.Diag, 
            eventIngestService = v71.props.eventIngestService, 
            openProfilePeekView = v71.props.openProfilePeekView, 
            closeCentralOverlay = v71.props.closeCentralOverlay, 
            openLearnMoreLink = v71.props.openLearnMoreLink, 
            showToast = v71.props.showToast, 
            updateExternalNavigationForScreen = v71.updateExternalNavigationForScreen, 
            initialRouteName = v71.props.initialRouteName, 
            openPlayerContextualMenu = v71.props.openPlayerContextualMenu
        };
    end);
end;
v69.render = function(v115) --[[ Line: 586 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_Context_0 (copy), v26 (copy), v68 (copy), v47 (copy), l_ChatEventReceiver_0 (copy), l_FFlagSquadAppChatRTNFix_0 (copy), l_SquadAppChatEventReceiver_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 589 ]]
        -- upvalues: v115 (copy), v3 (ref), l_Context_0 (ref), v26 (ref), v68 (ref), v47 (ref), l_ChatEventReceiver_0 (ref), l_FFlagSquadAppChatRTNFix_0 (ref), l_SquadAppChatEventReceiver_0 (ref)
        local l_initRoactChatNavigation_0 = v115.initRoactChatNavigation;
        return v3.createElement(l_Context_0.Provider, {
            value = v115.generateContext(v115.props.isVisible, v115.props.localUserId, v115.props.navigationProps, v115.props.notificationCount, v115.props.pageType, v115.props.parameters, v115.props.wideMode, v115.props.currentAppPage, true, v115.props.luaAddFriendsPageEnabled)
        }, {
            SocialTab = v3.createElement(v26, {
                BorderSizePixel = 0, 
                BackgroundColor3 = v115.props.BackgroundColor, 
                BackgroundTransparency = v115.props.BackgroundTransparency, 
                useFullScalePage = v115.props.useFullScalePage, 
                includeStatusBar = true, 
                includeBottomBar = (not not v68 or v115.props.wideMode) and v115.props.navBarPlacement == v47.Placement.Bottom
            }, {
                ChatEventReceiver = v3.createElement(l_ChatEventReceiver_0, {
                    robloxEventReceiver = v115._robloxEventReceiver, 
                    rnBypassActionSignal = v115._rnBypassActionSignal, 
                    initRoactChatNavigation = l_initRoactChatNavigation_0, 
                    activeConversationId = v115.state.activeConversationId
                }), 
                SocialTab = v115.renderOnLoaded(), 
                SquadAppChatEventReceiver = if l_FFlagSquadAppChatRTNFix_0 then v3.createElement(l_SquadAppChatEventReceiver_0) else nil
            })
        });
    end);
end;
v69.didMount = function(v118) --[[ Line: 631 ]] --[[ Name: didMount ]]
    -- upvalues: l_Logger_0 (copy)
    l_Logger_0:info("Initializing SocialTabUniversalAppWrapper");
    if v118.props.isVisible and v118.props.toggleChatPaused ~= nil then
        v118.props.toggleChatPaused(false);
    end;
end;
v69.didUpdate = function(v119, v120, _) --[[ Line: 641 ]] --[[ Name: didUpdate ]]
    -- upvalues: v15 (copy)
    if v120.isVisible ~= v119.props.isVisible then
        v119.androidBackButtonConnection.disconnect();
        if not v120.isVisible then
            v119._performanceTesting:Initialize();
            v119.props.setThrottleFramerateEnabled(v15.General.PerformanceTestingMode == Enum.VirtualInputMode.None);
            v119.props.toggleChatPaused(false);
            return;
        else
            v119._performanceTesting:Stop();
            v119.props.setThrottleFramerateEnabled(false);
            v119.props.toggleChatPaused(true);
        end;
    end;
end;
v69.getDerivedStateFromProps = function(v122, v123) --[[ Line: 657 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v22 (copy)
    local v124 = nil;
    local v125 = nil;
    local v126 = nil;
    if v122.isVisible then
        v124 = true;
    end;
    if v122.retrievalStatus == v22.Done then
        v125 = true;
    end;
    if v123.wasChatEverTapped == false and v122.isVisible == true then
        v126 = true;
    end;
    return {
        wasChatEverTapped = v126, 
        wasEverVisible = v124, 
        wasEverDoneRetrieving = v125
    };
end;
v69.willUnmount = function(v127) --[[ Line: 681 ]] --[[ Name: willUnmount ]]
    v127.androidBackButtonConnection.disconnect();
end;
v69 = v55((l_UniversalAppPolicy_0.connect(function(v128) --[[ Line: 686 ]]
    -- upvalues: l_GetFFlagLuafiedReportEntryPoints_0 (copy)
    return {
        isContactImporterPolicyEnabled = v128.getContactImporterEnabled(), 
        shouldSystemBarUsuallyBePresent = v128.getShouldSystemBarUsuallyBePresent(), 
        useLuafiedReportFlow = if l_GetFFlagLuafiedReportEntryPoints_0() then v128.getUseLuafiedReportFlow() else nil, 
        shouldShowPushUpsell = v128.getPushNotificationsUpsell(), 
        notificationsCanReceivePush = v128.getNotificationsCanReceivePush()
    };
end)(v69)));
v69 = v53.connectUserLayer({
    l_AppUserLayers_0.SocialFriendsLayer, 
    l_AppUserLayers_0.PushNotificationPrompt
}, function(v129, _) --[[ Line: 701 ]]
    -- upvalues: l_AppUserLayers_0 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), l_OffPlatformFriendRequestsIXP_0 (copy), l_GetFStringPushUpsellVariantName_0 (copy), l_GetFFlagEnablePushNotificationsUpsellModal_0 (copy)
    local v131 = v129[l_AppUserLayers_0.SocialFriendsLayer] or {};
    local v132 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.getExperimentVariant(v129);
    local v133 = if l_FFlagContactImporterIXPCleanup_0 then nil else l_OffPlatformFriendRequestsIXP_0.experimentOrRolloutEnabled(v129);
    local v134 = v129[l_AppUserLayers_0.PushNotificationPrompt] or {};
    local v135 = l_GetFStringPushUpsellVariantName_0();
    return {
        luaAddFriendsPageEnabled = v131.show_lua_add_friends_page == "True", 
        contactImporterAndPYMKEnabled = if l_FFlagContactImporterIXPCleanup_0 then nil else v133, 
        contactImporterExperimentVariant = if l_FFlagContactImporterIXPCleanup_0 then nil else v132, 
        pushUpsellVariant = if l_GetFFlagEnablePushNotificationsUpsellModal_0() then v134[v135] or -1 else nil
    };
end)(v69);
return function(v136) --[[ Line: 723 ]] --[[ Name: SocialTabUniversalAppWrapperContainer ]]
    -- upvalues: l_useNavBarPlacement_0 (copy), l_FFlagLuaAppEnableStickyShortcutBar_0 (copy), l_useIsStickyShortcutBarEnabled_0 (copy), v3 (copy), v69 (ref), v9 (copy)
    local v137 = l_useNavBarPlacement_0();
    local v138 = if l_FFlagLuaAppEnableStickyShortcutBar_0 then l_useIsStickyShortcutBarEnabled_0() else nil;
    return v3.createElement(v69, v9.Dictionary.join(v136, {
        navBarPlacement = v137, 
        useFullScalePage = if l_FFlagLuaAppEnableStickyShortcutBar_0 then v138 else nil
    }));
end;