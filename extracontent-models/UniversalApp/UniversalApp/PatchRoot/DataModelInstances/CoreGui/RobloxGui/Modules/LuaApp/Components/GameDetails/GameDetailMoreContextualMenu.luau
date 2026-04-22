local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_ContextualMenu_0 = v3.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v3.App.Menu.MenuDirection;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = require(l_CorePackages_0.Packages.Otter);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_CorePackages_0.Packages.ApolloClient);
local l_useQuery_0 = v9.useQuery;
local l_gql_0 = v9.gql;
local l_ExternalContentSharingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol;
local v13 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v15 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_useUserExperiment_0 = v15.useUserExperiment;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_ToastType_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Enums.ToastType;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v25 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_NavigateDown_0 = v25.Thunks.NavigateDown;
local l_Selectors_0 = v25.Selectors;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_SetCurrentToastMessage_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v33 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModalManager_0 = v33.GameInviteModalManager;
local l_GameInviteAnalyticsManager_0 = v33.GameInviteAnalyticsManager;
local l_GameInviteConstants_0 = v33.GameInviteConstants;
local v37 = require(l_CorePackages_0.Workspace.Packages.GenericAbuseReporting);
local l_AbuseVector_0 = v37.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v37.Thunks.OpenDynamicAbuseReport;
local v40 = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables);
local v41 = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation);
local v42 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux);
local l_ApiFetchGameDetails_0 = v42.GameDetails.ApiFetchGameDetails;
local l_FetchGamePlayabilityAndProductInfo_0 = v42.FetchGamePlayabilityAndProductInfo;
local l_GameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents;
local l_CopyExperienceLink_0 = l_GameDetailsEvents_0.CopyExperienceLink;
local l_Favorite_0 = l_GameDetailsEvents_0.Favorite;
local l_Follow_0 = l_GameDetailsEvents_0.Follow;
local l_OpenMore_0 = l_GameDetailsEvents_0.OpenMore;
local l_RequestRefundClick_0 = l_GameDetailsEvents_0.RequestRefundClick;
local l_ShareExperienceLink_0 = l_GameDetailsEvents_0.ShareExperienceLink;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v53 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v54 = require(l_Modules_0.LuaApp.Actions.Games.SetGameFavorite);
local v55 = require(l_Modules_0.LuaApp.Thunks.Games.GamePostFavorite);
local v56 = require(l_Modules_0.LuaApp.Actions.SetGameFollow);
local v57 = require(l_Modules_0.LuaApp.Thunks.SendGameFollow);
local v58 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v59 = require(l_Modules_0.LuaApp.Thunks.OpenReportDialog);
local v60 = require(l_Modules_0.LuaApp.Thunks.OpenReportScreen);
local v61 = require(l_Modules_0.LuaApp.Thunks.OpenRequestRefundPage);
local v62 = require(l_Modules_0.LuaApp.Constants);
local v63 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local v64 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v65 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v66 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppFixFavoriteAndFollowOptionsText);
local v67 = require(l_Modules_0.LuaApp.Flags.GetLuaAppGameDetailsMoreShareButtonEnabledV2);
local l_GetFFlagLuafiedReportEntryPoints_0 = v65.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagEnableAbuseReport10ft_0 = v65.GetFFlagEnableAbuseReport10ft;
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability;
local l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRenameFriendsToConnectionsEdp;
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local v74 = game:DefineFastFlag("EnableAbuseReportRevampExperience", false);
local l_FFlagHideCloseButtonEdp_0 = v65.FFlagHideCloseButtonEdp;
local l_FFlagAddThumbnailSelectorReport_0 = v65.FFlagAddThumbnailSelectorReport;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local v81 = game:DefineFastString("ExperienceDetailsCopyLinkExperimentVariant", "enableCopyLinkButton");
local v82 = game:DefineFastString("SocialExperienceDetailsContextualMenuLayer", "Social.ExperienceDetailsContextualMenu");
local v83 = v1.PureComponent:extend("GameDetailMoreContextualMenu");
v83.validateProps = v2.strictInterface({
    universeId = v2.string, 
    menuPosition = v2.optional(v2.UDim2), 
    onClose = v2.optional(v2.callback), 
    menuAnchorPoint = v2.optional(v2.Vector2), 
    externalContentSharingProtocol = v2.table, 
    hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v2.optional(v2.boolean) else nil, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v2.optional(v2.boolean) else nil, 
    edpServerIxpVariables = v2.optional(v2.table), 
    closeCentralOverlayThunk = v2.optional(v2.callback), 
    focusController = v2.optional(v2.table), 
    defaultChildRef = v2.optional(v2.table), 
    rootPlaceId = v2.optional(v2.string), 
    isFavorite = v2.optional(v2.boolean), 
    gameFollowings = v2.optional(v2.table), 
    currentPage = v2.string, 
    shareButtonEnabled = v2.boolean, 
    screenSize = v2.optional(v2.Vector2), 
    deviceOrientation = v2.string, 
    notificationsEnabled = v2.table, 
    refundLink = v2.optional(v2.string), 
    closeCallback = v2.callback, 
    gamePostFavorite = v2.callback, 
    setGameFavorite = v2.callback, 
    sendGameFollow = v2.callback, 
    setGameFollow = v2.callback, 
    setCurrentToastMessage = v2.callback, 
    navigateDown = v2.callback, 
    setToastMessage = v2.callback, 
    reportExperienceDialog = if l_GetFFlagLuafiedReportEntryPoints_0() then v2.callback else nil, 
    reportExperienceScreen = if l_GetFFlagEnableAbuseReport10ft_0() then v2.callback else nil, 
    setExperienceNotificationsEnabledCount = v2.callback, 
    openRequestRefundPage = v2.callback, 
    fetchGameDetail = v2.callback, 
    fetchPlayabilityAndProductInfo = v2.callback, 
    openDynamicAbuseReport = if l_FFlagEnableAbuseReportRevampFlow_0 and v74 then v2.callback else nil, 
    shouldShowShareButton = v2.boolean, 
    shouldShareToProvider = v2.boolean, 
    reportingDisabled = v2.boolean, 
    supportsWebViews = v2.boolean, 
    useLuafiedReportFlow = if not not l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v2.optional(v2.boolean) else nil, 
    inviteFriendsDisabled = v2.boolean, 
    webViewSupport = v2.boolean, 
    notificationsCanEnableExperience = v2.boolean, 
    renameFriendsToConnections = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v2.optional(v2.boolean) else nil, 
    enableNotificationsDiscoverability = if not l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() then v2.boolean else nil, 
    enableNotificationsRebrand = if not l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() then v2.boolean else nil, 
    enableCopyLink = v2.optional(v2.any), 
    shareLinkId = v2.optional(v2.string), 
    networking = v2.callback, 
    localization = v2.table, 
    eventIngest = v2.table, 
    guiService = if l_GetFFlagEnableAbuseReport10ft_0() then v2.union(v2.Instance, v2.table) else nil
});
local function v89(v84, v85, v86) --[[ Line: 188 ]] --[[ Name: generateExperienceDetailsShareLinkUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v63 (copy)
    local _ = nil;
    local v88 = nil;
    if v84 then
        v88 = tostring(DateTime.now().UnixTimestampMillis);
        return l_UrlBuilder_0.sharelinks.shortUrl({
            linkId = v84, 
            type = v63.ExperienceDetails, 
            stamp = v88
        }), v88;
    else
        return l_UrlBuilder_0.game.info.appsflyer({
            universeId = v85, 
            placeId = v86
        }), v88;
    end;
end;
v83.defaultProps = {
    externalContentSharingProtocol = l_ExternalContentSharingProtocol_0.default, 
    onClose = function() --[[ Line: 209 ]] --[[ Name: onClose ]]

    end
};
v83.init = function(v90) --[[ Line: 212 ]] --[[ Name: init ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    v90.isMounted = false;
    v90.menuItemNames = {};
    v90.getMenuPos = function() --[[ Line: 216 ]]
        -- upvalues: v90 (copy)
        if v90.props.menuPosition == nil then
            return UDim2.fromOffset(0, 0);
        else
            return v90.props.menuPosition;
        end;
    end;
    v90.getMenuSize = function() --[[ Line: 224 ]]
        return UDim2.new(0, 300, 1, 0);
    end;
    v90.getMenuAnchor = function() --[[ Line: 228 ]]
        -- upvalues: v90 (copy)
        if v90.props.menuPosition == nil or v90.props.screenSize == nil then
            return nil;
        elseif v90.props.menuAnchorPoint then
            return v90.props.menuAnchorPoint;
        else
            return Vector2.new(0, 0);
        end;
    end;
    v90.getLinkPage = function() --[[ Line: 237 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v90 (copy)
        return (l_UrlBuilder_0.game.report({
            placeId = v90.props.rootPlaceId
        }));
    end;
    v90.closeCallback = function() --[[ Line: 244 ]]
        -- upvalues: v90 (copy)
        if v90.props.onClose then
            v90.props.onClose();
        end;
        v90.props.closeCallback();
    end;
    v90.onRequestRefundPageClose = function() --[[ Line: 252 ]]
        -- upvalues: v90 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        v90.props.fetchGameDetail(v90.props.networking, v90.props.universeId, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v90.props.shouldHydrateLegacyIxp else nil);
        v90.props.fetchPlayabilityAndProductInfo(v90.props.networking, v90.props.universeId);
    end;
end;
v83.renderContextualMenuContent = function(v91, v92) --[[ Line: 270 ]] --[[ Name: renderContextualMenuContent ]]
    -- upvalues: l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy), l_Images_0 (copy), v66 (copy), l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v41 (copy), l_Favorite_0 (copy), l_ToastType_0 (copy), l_Follow_0 (copy), l_GameInviteAnalyticsManager_0 (copy), l_GameInviteModalManager_0 (copy), l_GameInviteConstants_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), v89 (copy), l_CopyExperienceLink_0 (copy), l_AppPage_0 (copy), l_ShareExperienceLink_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), v62 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v74 (copy), l_AbuseVector_0 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), l_RequestRefundClick_0 (copy)
    local v93 = {};
    v91.menuItemNames = {};
    local l_rootPlaceId_0 = v91.props.rootPlaceId;
    local l_eventIngest_0 = v91.props.eventIngest;
    local l_networking_0 = v91.props.networking;
    local l_universeId_0 = v91.props.universeId;
    local l_guiService_0 = v91.props.guiService;
    local l_notificationsCanEnableExperience_0 = v91.props.notificationsCanEnableExperience;
    local v100 = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v91.props.renameFriendsToConnections else nil;
    local v101 = l_Images_0["icons/actions/favoriteOn"];
    local v102 = l_Images_0["icons/actions/favoriteOff"];
    local v103 = v91.props.isFavorite ~= nil and (v91.props.isFavorite or false);
    local v104 = v91.props.isFavorite == nil;
    local v105 = v103 and v101 or v102;
    local l_favoriteLabel_0 = v92.favoriteLabel;
    if v66 then
        l_favoriteLabel_0 = v103 and v92.favoritedLabel or v92.favoriteLabel;
    end;
    local v107 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v91.props.enableNotificationsDiscoverability;
    if not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 or not v41.getShouldInterleaveSdui()) or not v91.props.edpServerIxpVariables or v91.props.edpServerIxpVariables.hideFavoritesInContextMenu ~= true then
        table.insert(v93, {
            icon = v105, 
            text = l_favoriteLabel_0, 
            stayOnActivated = true, 
            onActivated = function() --[[ Line: 319 ]] --[[ Name: onActivated ]]
                -- upvalues: v91 (copy), v104 (copy), l_rootPlaceId_0 (copy), l_networking_0 (copy), l_universeId_0 (copy), v103 (copy), l_Favorite_0 (ref), l_eventIngest_0 (copy)
                if not v91.isMounted or v104 or not l_rootPlaceId_0 then
                    return;
                else
                    local l_l_networking_0_0 = l_networking_0;
                    v91.props.setGameFavorite(l_universeId_0, not v103);
                    v91.props.gamePostFavorite(l_l_networking_0_0, l_universeId_0, not v103);
                    l_Favorite_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, not v103);
                    return;
                end;
            end
        });
        table.insert(v91.menuItemNames, "Favorite");
    end;
    if l_notificationsCanEnableExperience_0 and not v107 and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 or not v41.getShouldInterleaveSdui()) or not v91.props.edpServerIxpVariables or v91.props.edpServerIxpVariables.hideNotifyInContextMenu ~= true) then
        local v109 = v91.props.gameFollowings == nil;
        local v110 = v91.props.gameFollowings ~= nil and (v91.props.gameFollowings.isFollowed or false);
        local v111 = l_Images_0["icons/common/notificationOn"];
        local v112 = l_Images_0["icons/common/notificationOff"];
        local l_followLabel_0 = v92.followLabel;
        if v66 then
            l_followLabel_0 = v110 and v92.followingLabel or v92.followLabel;
        end;
        table.insert(v93, {
            text = l_followLabel_0, 
            icon = v110 and v111 or v112, 
            disabled = v109, 
            stayOnActivated = true, 
            onActivated = function() --[[ Line: 363 ]] --[[ Name: onActivated ]]
                -- upvalues: v91 (copy), v109 (copy), l_rootPlaceId_0 (copy), l_ToastType_0 (ref), l_universeId_0 (copy), l_networking_0 (copy), l_Follow_0 (ref), l_eventIngest_0 (copy)
                if not v91.isMounted or v109 or not l_rootPlaceId_0 then
                    return;
                else
                    local l_isFollowed_0 = v91.props.gameFollowings.isFollowed;
                    local l_setCurrentToastMessage_0 = v91.props.setCurrentToastMessage;
                    local v116 = v91.props.notificationsEnabled.count or 0;
                    local v117 = v91.props.notificationsEnabled.limit or 0;
                    if not l_isFollowed_0 then
                        if v117 <= v116 then
                            l_setCurrentToastMessage_0({
                                toastType = l_ToastType_0.GameFollowError, 
                                toastMessage = v91.props.enableNotificationsRebrand and "Feature.GameFollows.TooltipNotificationsLimitReached" or "Feature.GameFollows.TooltipFollowLimitReached"
                            });
                            return;
                        else
                            v91.props.setExperienceNotificationsEnabledCount(v116 + 1);
                        end;
                    else
                        v91.props.setExperienceNotificationsEnabledCount(v116 - 1);
                    end;
                    v91.props.setGameFollow(l_universeId_0, not l_isFollowed_0);
                    v91.props.sendGameFollow(l_networking_0, l_universeId_0, not l_isFollowed_0, false, v116, v117);
                    l_Follow_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, not l_isFollowed_0);
                    return;
                end;
            end
        });
        table.insert(v91.menuItemNames, "Follow");
    end;
    if not v91.props.inviteFriendsDisabled then
        table.insert(v93, {
            text = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v100 then v92.inviteConnections else v92.inviteFriends, 
            icon = l_Images_0["icons/actions/friends/friendInvite"], 
            onActivated = function() --[[ Line: 413 ]] --[[ Name: onActivated ]]
                -- upvalues: v91 (copy), l_rootPlaceId_0 (copy), l_GameInviteAnalyticsManager_0 (ref), l_universeId_0 (copy), l_GameInviteModalManager_0 (ref), l_GameInviteConstants_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
                if not v91.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    l_GameInviteAnalyticsManager_0:withButtonName(l_GameInviteAnalyticsManager_0.ButtonName.GameDetailsMoreMenu);
                    l_GameInviteAnalyticsManager_0:inputShareGameEntryPoint(l_rootPlaceId_0, l_universeId_0);
                    l_GameInviteModalManager_0:openModal({
                        trigger = l_GameInviteConstants_0.Triggers.GameDetailsMoreMenu, 
                        rootPlaceId = l_rootPlaceId_0, 
                        universeId = l_universeId_0, 
                        hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v91.props.hideCloseButton else nil
                    });
                    v91.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v91.menuItemNames, "InviteFriends");
    end;
    if v91.props.enableCopyLink then
        table.insert(v93, {
            icon = l_Images_0["icons/menu/link"], 
            onActivated = function() --[[ Line: 437 ]] --[[ Name: onActivated ]]
                -- upvalues: v91 (copy), l_rootPlaceId_0 (copy), v89 (ref), l_universeId_0 (copy), l_CopyExperienceLink_0 (ref), l_eventIngest_0 (copy), l_ToastType_0 (ref)
                if not v91.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local v118, v119 = v89(v91.props.shareLinkId, l_universeId_0, l_rootPlaceId_0);
                    v91.props.externalContentSharingProtocol:shareUrl({
                        context = "GameDetailsMoreWebURL", 
                        url = v118
                    });
                    l_CopyExperienceLink_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, {
                        stamp = v119
                    });
                    v91.props.setCurrentToastMessage({
                        toastMessage = "Feature.GameDetails.Toast.LinkCopied", 
                        toastType = l_ToastType_0.SuccessConfirmation
                    });
                    v91.closeCallback();
                    return;
                end;
            end, 
            text = v92.copyLink
        });
        table.insert(v91.menuItemNames, "CopyLink");
    end;
    if v91.props.shareButtonEnabled and v91.props.shouldShowShareButton then
        table.insert(v93, {
            text = v92.share, 
            icon = l_Images_0["icons/actions/share"], 
            onActivated = function() --[[ Line: 470 ]] --[[ Name: onActivated ]]
                -- upvalues: v91 (copy), l_rootPlaceId_0 (copy), l_AppPage_0 (ref), l_universeId_0 (copy), v89 (ref), l_ShareExperienceLink_0 (ref), l_eventIngest_0 (copy)
                if not v91.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    if v91.props.shouldShareToProvider then
                        v91.props.navigateDown({
                            name = l_AppPage_0.SdkShare, 
                            extraProps = {
                                universeId = l_universeId_0, 
                                context = "GameDetailsMoreWebURL"
                            }
                        });
                    else
                        local v120, v121 = v89(v91.props.shareLinkId, l_universeId_0, l_rootPlaceId_0);
                        l_ShareExperienceLink_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, {
                            shortShareLinkFailed = not v91.props.shareLinkId, 
                            shareToAppsflyer = true, 
                            stamp = v121, 
                            linkId = v91.props.shareLinkId
                        });
                        v91.props.externalContentSharingProtocol:shareUrl({
                            url = v120, 
                            context = "GameDetailsMoreWebURL"
                        });
                    end;
                    v91.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v91.menuItemNames, "ShareExperienceLink");
    end;
    if not v91.props.reportingDisabled then
        table.insert(v93, {
            text = v92.report, 
            icon = l_Images_0["icons/actions/feedback"], 
            onActivated = function() --[[ Line: 509 ]] --[[ Name: onActivated ]]
                -- upvalues: v91 (copy), l_rootPlaceId_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (ref), l_guiService_0 (copy), v62 (ref), l_universeId_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v74 (ref), l_AbuseVector_0 (ref), l_FFlagAddThumbnailSelectorReport_0 (ref), l_AppPage_0 (ref), v92 (copy)
                if not v91.isMounted or not l_rootPlaceId_0 then
                    return;
                elseif v91.props.useLuafiedReportFlow then
                    if l_GetFFlagEnableAbuseReport10ft_0() and l_guiService_0 and l_guiService_0:IsTenFootInterface() then
                        v91.props.reportExperienceScreen({
                            context = v62.ReportScreen.Contexts.Experience, 
                            assetId = tostring(l_rootPlaceId_0), 
                            reportAbuseVector = v62.ReportScreen.AbuseVectors.Place, 
                            platform = v62.ReportScreen.Platforms.Console
                        });
                    else
                        v91.props.reportExperienceDialog({
                            reportEntryPoint = v62.ReportDialogEntryPoints.ExperienceDetails, 
                            universeId = l_universeId_0, 
                            rootPlaceId = l_rootPlaceId_0
                        });
                    end;
                    v91.closeCallback();
                    return;
                elseif l_FFlagEnableAbuseReportRevampFlow_0 and v74 then
                    v91.props.openDynamicAbuseReport({
                        abuseVector = l_AbuseVector_0.Place, 
                        targetId = l_rootPlaceId_0, 
                        custom = if l_FFlagAddThumbnailSelectorReport_0 then {
                            universeId = l_universeId_0
                        } else nil, 
                        onClose = function() --[[ Line: 541 ]] --[[ Name: onClose ]]
                            -- upvalues: v91 (ref)
                            v91.closeCallback();
                        end
                    });
                    return;
                elseif not v91.props.supportsWebViews then
                    v91.props.setToastMessage(v62.WEBVIEWS_UNAVAILABLE_TOAST);
                    return;
                else
                    v91.props.navigateDown({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v91:getLinkPage(), 
                        extraProps = {
                            title = v92.localizedTextReport
                        }
                    });
                    v91.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v91.menuItemNames, "Report");
    end;
    if v91.props.refundLink and v91.props.webViewSupport then
        table.insert(v93, {
            text = v92.requestRefund, 
            icon = l_Images_0["icons/menu/wallet"], 
            onActivated = function() --[[ Line: 568 ]] --[[ Name: onActivated ]]
                -- upvalues: v91 (copy), l_rootPlaceId_0 (copy), l_RequestRefundClick_0 (ref)
                if not v91.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local l_eventIngest_1 = v91.props.eventIngest;
                    l_RequestRefundClick_0(l_eventIngest_1, "GameDetailMoreContextualMenu", l_rootPlaceId_0);
                    v91.props.openRequestRefundPage(v91.props.refundLink, v91.onRequestRefundPageClose);
                    v91.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v91.menuItemNames, "RequestRefund");
    end;
    return v93;
end;
v83.renderLandscapeContextualMenu = function(v123, v124) --[[ Line: 587 ]] --[[ Name: renderLandscapeContextualMenu ]]
    -- upvalues: v1 (copy), l_ContextualMenu_0 (copy), v7 (copy)
    local l_screenSize_0 = v123.props.screenSize;
    local v126 = v123:renderContextualMenuContent(v124);
    local v127 = v123.getMenuPos();
    local v128 = v123:getMenuAnchor();
    local v129 = v123.getMenuSize();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = v127, 
        Size = v129
    }, {
        ContextMenu = v1.createElement(l_ContextualMenu_0, {
            buttonProps = v126, 
            open = true, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            openPositionX = UDim.new(0, 0), 
            openPositionY = UDim.new(0, 0), 
            closeBackgroundVisible = false, 
            screenSize = l_screenSize_0, 
            onDismiss = v123.closeCallback, 
            contextMenuWidthOverride = UDim.new(1, 0), 
            anchorPointOverride = v128, 
            motorOverrideOptions = {
                motorCallback = v7.instant, 
                open = {
                    targetValue = 1
                }, 
                close = {
                    targetValue = 0
                }
            }
        })
    });
end;
v83.renderPortraitContextualMenu = function(v130, v131) --[[ Line: 623 ]] --[[ Name: renderPortraitContextualMenu ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v1 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local l_screenSize_1 = v130.props.screenSize;
    local v133 = v130:renderContextualMenuContent(v131);
    local v134 = v130.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v135 = l_screenSize_1 ~= nil and l_screenSize_1.X > 0 and v130.props.menuPosition.X.Offset / l_screenSize_1.X / 2 or 0;
    local v136 = v134 and 0 or v135;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(v136, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        ContextMenu = v1.createElement(l_ContextualMenu_0, {
            buttonProps = v133, 
            open = true, 
            menuDirection = l_MenuDirection_0.Up, 
            openPositionY = UDim.new(1, -76), 
            closeBackgroundVisible = false, 
            screenSize = l_screenSize_1, 
            onDismiss = v130.closeCallback
        })
    });
end;
v83.didMount = function(v137) --[[ Line: 656 ]] --[[ Name: didMount ]]
    -- upvalues: l_AppPage_0 (copy), l_OpenMore_0 (copy)
    v137.isMounted = true;
    local l_currentPage_0 = v137.props.currentPage;
    if l_currentPage_0 ~= l_AppPage_0.GameDetail and l_currentPage_0 ~= l_AppPage_0.ExperienceDetail then
        v137.closeCallback();
        return;
    else
        local l_eventIngest_2 = v137.props.eventIngest;
        local l_rootPlaceId_1 = v137.props.rootPlaceId;
        local v141 = table.concat(v137.menuItemNames, ",");
        l_OpenMore_0(l_eventIngest_2, "GameDetailMoreContextualMenu", l_rootPlaceId_1, {
            moreMenuItems = v141
        });
        return;
    end;
end;
v83.willUnmount = function(v142) --[[ Line: 674 ]] --[[ Name: willUnmount ]]
    v142.isMounted = false;
end;
v83.render = function(v143) --[[ Line: 678 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy), l_DeviceOrientationMode_0 (copy)
    return l_withLocalization_0({
        favoriteLabel = "Feature.Favorites.Label.Favorite", 
        favoritedLabel = "Feature.Favorites.Label.Favorited", 
        followLabel = v143.props.enableNotificationsRebrand and "Feature.GameFollows.LabelNotifications" or "Feature.GameDetails.Label.Follow", 
        followingLabel = "Feature.Friends.Label.Following", 
        inviteFriends = "Feature.GameDetails.Action.InviteFriends", 
        inviteConnections = l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and "CommonUI.Features.Label.InviteConnections" or nil, 
        copyLink = "Feature.GameDetails.Action.CopyLink", 
        share = "Feature.SocialShare.Action.Share", 
        report = "Feature.GameDetails.Action.Report", 
        requestRefund = "Feature.GameDetails.Action.Refund"
    })(function(v144) --[[ Line: 694 ]]
        -- upvalues: v143 (copy), l_DeviceOrientationMode_0 (ref)
        if v143.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
            return v143:renderPortraitContextualMenu(v144);
        else
            return v143:renderLandscapeContextualMenu(v144);
        end;
    end);
end;
v83 = v13.connect(function(v145, v146) --[[ Line: 707 ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameInfosReducer_0 (copy), v65 (copy), l_Selectors_0 (copy), v67 (copy)
    local v147 = nil;
    v147 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v146.shouldHydrateLegacyIxp then v145.GameDetailsV2 and v145.GameDetailsV2[v146.universeId] or nil else v145.GameDetails[v146.universeId];
    local v148 = v145.Personalization[l_GameInfosReducer_0.key][v146.universeId];
    return {
        rootPlaceId = v147 and v147.rootPlaceId or v148 and v148.placeId, 
        isFavorite = v145.GameFavorites[v146.universeId], 
        gameFollowings = v145.GameFollowings[v146.universeId], 
        currentPage = if v65.FFlagUseNavigationSelectors then l_Selectors_0.selectCurrentRoactNavigationRoute(v145).routeName else v145.Navigation.currentRoute.routeName, 
        shareButtonEnabled = v67(v145.LocalUserId), 
        screenSize = v145.ScreenSize, 
        deviceOrientation = v145.DeviceOrientation, 
        notificationsEnabled = v145.ExperienceNotificationsEnabled or {}, 
        refundLink = if v147 then v147.refundLink else nil
    };
end, function(v149) --[[ Line: 733 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), v55 (copy), v54 (copy), v57 (copy), v56 (copy), l_SetCurrentToastMessage_0 (copy), l_NavigateDown_0 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), v59 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), v60 (copy), v58 (copy), v61 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v64 (copy), l_ApiFetchGameDetails_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v74 (copy), l_OpenDynamicAbuseReport_0 (copy)
    return {
        closeCallback = function() --[[ Line: 735 ]] --[[ Name: closeCallback ]]
            -- upvalues: v149 (copy), l_CloseCentralOverlay_0 (ref)
            v149(l_CloseCentralOverlay_0());
        end, 
        gamePostFavorite = function(v150, v151, v152) --[[ Line: 738 ]] --[[ Name: gamePostFavorite ]]
            -- upvalues: v149 (copy), v55 (ref)
            return v149(v55(v150, v151, v152));
        end, 
        setGameFavorite = function(v153, v154) --[[ Line: 741 ]] --[[ Name: setGameFavorite ]]
            -- upvalues: v149 (copy), v54 (ref)
            return v149(v54(v153, v154));
        end, 
        sendGameFollow = function(v155, v156, v157, v158, v159, v160) --[[ Line: 744 ]] --[[ Name: sendGameFollow ]]
            -- upvalues: v149 (copy), v57 (ref)
            return v149(v57(v155, v156, v157, v158, v159, v160));
        end, 
        setGameFollow = function(v161, v162) --[[ Line: 763 ]] --[[ Name: setGameFollow ]]
            -- upvalues: v149 (copy), v56 (ref)
            return v149(v56(v161, v162));
        end, 
        setCurrentToastMessage = function(v163) --[[ Line: 766 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v149 (copy), l_SetCurrentToastMessage_0 (ref)
            return v149(l_SetCurrentToastMessage_0(v163));
        end, 
        navigateDown = function(v164) --[[ Line: 769 ]] --[[ Name: navigateDown ]]
            -- upvalues: v149 (copy), l_NavigateDown_0 (ref)
            return v149(l_NavigateDown_0(v164));
        end, 
        setToastMessage = function(v165) --[[ Line: 772 ]] --[[ Name: setToastMessage ]]
            -- upvalues: v149 (copy), l_SetCurrentToastMessage_0 (ref)
            return v149(l_SetCurrentToastMessage_0(v165));
        end, 
        reportExperienceDialog = l_GetFFlagLuafiedReportEntryPoints_0() and function(v166) --[[ Line: 776 ]]
            -- upvalues: v149 (copy), v59 (ref)
            return v149(v59(v166));
        end or nil, 
        reportExperienceScreen = l_GetFFlagEnableAbuseReport10ft_0() and function(v167) --[[ Line: 781 ]]
            -- upvalues: v149 (copy), v60 (ref)
            return v149(v60(v167));
        end or nil, 
        setExperienceNotificationsEnabledCount = function(v168) --[[ Line: 785 ]] --[[ Name: setExperienceNotificationsEnabledCount ]]
            -- upvalues: v149 (copy), v58 (ref)
            return v149(v58(v168));
        end, 
        openRequestRefundPage = function(v169, v170) --[[ Line: 788 ]] --[[ Name: openRequestRefundPage ]]
            -- upvalues: v149 (copy), v61 (ref)
            return v149(v61(v169, v170));
        end, 
        fetchGameDetail = function(v171, v172, v173) --[[ Line: 791 ]] --[[ Name: fetchGameDetail ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v149 (copy), v64 (ref), l_ApiFetchGameDetails_0 (ref)
            if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v173 then
                return v149(v64.Fetch(v171, v172, v173, nil));
            else
                return v149(l_ApiFetchGameDetails_0.Fetch(v171, {
                    v172
                }));
            end;
        end, 
        fetchPlayabilityAndProductInfo = function(v174, v175) --[[ Line: 803 ]] --[[ Name: fetchPlayabilityAndProductInfo ]]
            -- upvalues: v149 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref)
            return v149(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v174, v175));
        end, 
        openDynamicAbuseReport = l_FFlagEnableAbuseReportRevampFlow_0 and v74 and function(v176) --[[ Line: 807 ]]
            -- upvalues: v149 (copy), l_OpenDynamicAbuseReport_0 (ref)
            return v149(l_OpenDynamicAbuseReport_0(v176));
        end or nil
    };
end)(v83);
v83 = l_RoactAppPolicy_0.connect(function(v177, _) --[[ Line: 814 ]]
    -- upvalues: l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    return {
        shouldShowShareButton = v177.shouldShowGameDetailsShareButton(), 
        shouldShareToProvider = v177.shouldShareToAccountProvider(), 
        reportingDisabled = v177.getGameReportingDisabled(), 
        supportsWebViews = v177.getWebViewSupport(), 
        useLuafiedReportFlow = if not not l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v177.getUseLuafiedReportFlow() else nil, 
        inviteFriendsDisabled = v177.getInviteFriendsDisabled(), 
        webViewSupport = v177.getWebViewSupport(), 
        notificationsCanEnableExperience = v177.getNotificationsCanReceiveExperience(), 
        renameFriendsToConnections = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v177.getRenameFriendsToConnections() else nil
    };
end)(v83);
if not l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() then
    v83 = v15.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageLayer
    }, function(v179, _) --[[ Line: 835 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_GetNotificationsExperienceDetailsVariant_0 (copy)
        local v181 = (v179[l_AppUserLayers_0.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1;
        return {
            enableNotificationsDiscoverability = v181 == 2, 
            enableNotificationsRebrand = v181 > 0
        };
    end)(v83);
end;
local v182 = l_gql_0("\t\tquery ExperienceDetailsLink($universeId: String!) {\n\t\t\texperienceDetailsLinkByUniverseId(universeId: $universeId) {\n\t\t\t\tlinkId\n\t\t\t}\n\t\t}\n\t");
local l_v83_0 = v83;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    localization = v53, 
    eventIngest = l_AppEventIngestService_0, 
    guiService = if l_GetFFlagEnableAbuseReport10ft_0() then l_AppGuiService_0 else nil
})(function(v184) --[[ Line: 855 ]]
    -- upvalues: l_useQuery_0 (copy), v182 (copy), l_useUserExperiment_0 (copy), v82 (copy), v81 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v40 (copy), v8 (copy), v41 (copy), v1 (copy), l_v83_0 (copy)
    local v185 = nil;
    local v186 = nil;
    local v187 = l_useQuery_0(v182, {
        variables = {
            universeId = v184.universeId
        }
    });
    if v187.data and v187.data.experienceDetailsLinkByUniverseId then
        v186 = v187.data.experienceDetailsLinkByUniverseId.linkId;
    end;
    v185 = l_useUserExperiment_0({
        v82
    }, function(v188) --[[ Line: 870 ]]
        -- upvalues: v82 (ref), v81 (ref)
        return (v188[v82] or {})[v81];
    end, true);
    local v189 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v189 = v40();
    end;
    local v190 = v8.Dictionary.join(v184, {
        enableCopyLink = v185, 
        shareLinkId = v186, 
        edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v41.getShouldInterleaveSdui() then v189 else nil
    });
    return v1.createElement(l_v83_0, v190);
end);