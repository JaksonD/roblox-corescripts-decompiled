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
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_SetCurrentToastMessage_0 = require(l_CorePackages_0.Workspace.Packages.ToastRodux).Actions.SetCurrentToastMessage;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v31 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModalManager_0 = v31.GameInviteModalManager;
local l_GameInviteAnalyticsManager_0 = v31.GameInviteAnalyticsManager;
local l_GameInviteConstants_0 = v31.GameInviteConstants;
local v35 = require(l_CorePackages_0.Workspace.Packages.GenericAbuseReporting);
local l_AbuseVector_0 = v35.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v35.Thunks.OpenDynamicAbuseReport;
local v38 = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables);
local v39 = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation);
local v40 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux);
local l_ApiFetchGameDetails_0 = v40.GameDetails.ApiFetchGameDetails;
local l_FetchGamePlayabilityAndProductInfo_0 = v40.FetchGamePlayabilityAndProductInfo;
local l_GameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents;
local l_CopyExperienceLink_0 = l_GameDetailsEvents_0.CopyExperienceLink;
local l_Favorite_0 = l_GameDetailsEvents_0.Favorite;
local l_Follow_0 = l_GameDetailsEvents_0.Follow;
local l_OpenMore_0 = l_GameDetailsEvents_0.OpenMore;
local l_RequestRefundClick_0 = l_GameDetailsEvents_0.RequestRefundClick;
local l_ShareExperienceLink_0 = l_GameDetailsEvents_0.ShareExperienceLink;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v51 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v52 = require(l_Modules_0.LuaApp.Actions.Games.SetGameFavorite);
local v53 = require(l_Modules_0.LuaApp.Thunks.Games.GamePostFavorite);
local v54 = require(l_Modules_0.LuaApp.Actions.SetGameFollow);
local v55 = require(l_Modules_0.LuaApp.Thunks.SendGameFollow);
local v56 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v57 = require(l_Modules_0.LuaApp.Thunks.OpenReportDialog);
local v58 = require(l_Modules_0.LuaApp.Thunks.OpenReportScreen);
local v59 = require(l_Modules_0.LuaApp.Thunks.OpenRequestRefundPage);
local v60 = require(l_Modules_0.LuaApp.Constants);
local v61 = require(l_Modules_0.LuaApp.DeepLinks.ShareLinks.ShareLinkTypes);
local v62 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v63 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v64 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppFixFavoriteAndFollowOptionsText);
local v65 = require(l_Modules_0.LuaApp.Flags.GetLuaAppGameDetailsMoreShareButtonEnabledV2);
local l_GetFFlagLuafiedReportEntryPoints_0 = v63.GetFFlagLuafiedReportEntryPoints;
local l_GetFFlagEnableAbuseReport10ft_0 = v63.GetFFlagEnableAbuseReport10ft;
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability;
local l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppRenameFriendsToConnectionsEdp;
local l_FFlagEnableAbuseReportRevampFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAbuseReportRevampFlow;
local v72 = game:DefineFastFlag("EnableAbuseReportRevampExperience", false);
local l_FFlagHideCloseButtonEdp_0 = v63.FFlagHideCloseButtonEdp;
local l_FFlagAddThumbnailSelectorReport_0 = v63.FFlagAddThumbnailSelectorReport;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local v79 = game:DefineFastString("ExperienceDetailsCopyLinkExperimentVariant", "enableCopyLinkButton");
local v80 = game:DefineFastString("SocialExperienceDetailsContextualMenuLayer", "Social.ExperienceDetailsContextualMenu");
local v81 = v1.PureComponent:extend("GameDetailMoreContextualMenu");
v81.validateProps = v2.strictInterface({
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
    openDynamicAbuseReport = if l_FFlagEnableAbuseReportRevampFlow_0 and v72 then v2.callback else nil, 
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
local function v87(v82, v83, v84) --[[ Line: 186 ]] --[[ Name: generateExperienceDetailsShareLinkUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v61 (copy)
    local _ = nil;
    local v86 = nil;
    if v82 then
        v86 = tostring(DateTime.now().UnixTimestampMillis);
        return l_UrlBuilder_0.sharelinks.shortUrl({
            linkId = v82, 
            type = v61.ExperienceDetails, 
            stamp = v86
        }), v86;
    else
        return l_UrlBuilder_0.game.info.appsflyer({
            universeId = v83, 
            placeId = v84
        }), v86;
    end;
end;
v81.defaultProps = {
    externalContentSharingProtocol = l_ExternalContentSharingProtocol_0.default, 
    onClose = function() --[[ Line: 207 ]] --[[ Name: onClose ]]

    end
};
v81.init = function(v88) --[[ Line: 210 ]] --[[ Name: init ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    v88.isMounted = false;
    v88.menuItemNames = {};
    v88.getMenuPos = function() --[[ Line: 214 ]]
        -- upvalues: v88 (copy)
        if v88.props.menuPosition == nil then
            return UDim2.fromOffset(0, 0);
        else
            return v88.props.menuPosition;
        end;
    end;
    v88.getMenuSize = function() --[[ Line: 222 ]]
        return UDim2.new(0, 300, 1, 0);
    end;
    v88.getMenuAnchor = function() --[[ Line: 226 ]]
        -- upvalues: v88 (copy)
        if v88.props.menuPosition == nil or v88.props.screenSize == nil then
            return nil;
        elseif v88.props.menuAnchorPoint then
            return v88.props.menuAnchorPoint;
        else
            return Vector2.new(0, 0);
        end;
    end;
    v88.getLinkPage = function() --[[ Line: 235 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v88 (copy)
        return (l_UrlBuilder_0.game.report({
            placeId = v88.props.rootPlaceId
        }));
    end;
    v88.closeCallback = function() --[[ Line: 242 ]]
        -- upvalues: v88 (copy)
        if v88.props.onClose then
            v88.props.onClose();
        end;
        v88.props.closeCallback();
    end;
    v88.onRequestRefundPageClose = function() --[[ Line: 250 ]]
        -- upvalues: v88 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        v88.props.fetchGameDetail(v88.props.networking, v88.props.universeId, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v88.props.shouldHydrateLegacyIxp else nil);
        v88.props.fetchPlayabilityAndProductInfo(v88.props.networking, v88.props.universeId);
    end;
end;
v81.renderContextualMenuContent = function(v89, v90) --[[ Line: 268 ]] --[[ Name: renderContextualMenuContent ]]
    -- upvalues: l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy), l_Images_0 (copy), v64 (copy), l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v39 (copy), l_Favorite_0 (copy), l_ToastType_0 (copy), l_Follow_0 (copy), l_GameInviteAnalyticsManager_0 (copy), l_GameInviteModalManager_0 (copy), l_GameInviteConstants_0 (copy), l_FFlagHideCloseButtonEdp_0 (copy), v87 (copy), l_CopyExperienceLink_0 (copy), l_AppPage_0 (copy), l_ShareExperienceLink_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), v60 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v72 (copy), l_AbuseVector_0 (copy), l_FFlagAddThumbnailSelectorReport_0 (copy), l_RequestRefundClick_0 (copy)
    local v91 = {};
    v89.menuItemNames = {};
    local l_rootPlaceId_0 = v89.props.rootPlaceId;
    local l_eventIngest_0 = v89.props.eventIngest;
    local l_networking_0 = v89.props.networking;
    local l_universeId_0 = v89.props.universeId;
    local l_guiService_0 = v89.props.guiService;
    local l_notificationsCanEnableExperience_0 = v89.props.notificationsCanEnableExperience;
    local v98 = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v89.props.renameFriendsToConnections else nil;
    local v99 = l_Images_0["icons/actions/favoriteOn"];
    local v100 = l_Images_0["icons/actions/favoriteOff"];
    local v101 = v89.props.isFavorite ~= nil and (v89.props.isFavorite or false);
    local v102 = v89.props.isFavorite == nil;
    local v103 = v101 and v99 or v100;
    local l_favoriteLabel_0 = v90.favoriteLabel;
    if v64 then
        l_favoriteLabel_0 = v101 and v90.favoritedLabel or v90.favoriteLabel;
    end;
    local v105 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v89.props.enableNotificationsDiscoverability;
    if not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 or not v39.getShouldInterleaveSdui()) or not v89.props.edpServerIxpVariables or v89.props.edpServerIxpVariables.hideFavoritesInContextMenu ~= true then
        table.insert(v91, {
            icon = v103, 
            text = l_favoriteLabel_0, 
            stayOnActivated = true, 
            onActivated = function() --[[ Line: 317 ]] --[[ Name: onActivated ]]
                -- upvalues: v89 (copy), v102 (copy), l_rootPlaceId_0 (copy), l_networking_0 (copy), l_universeId_0 (copy), v101 (copy), l_Favorite_0 (ref), l_eventIngest_0 (copy)
                if not v89.isMounted or v102 or not l_rootPlaceId_0 then
                    return;
                else
                    local l_l_networking_0_0 = l_networking_0;
                    v89.props.setGameFavorite(l_universeId_0, not v101);
                    v89.props.gamePostFavorite(l_l_networking_0_0, l_universeId_0, not v101);
                    l_Favorite_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, not v101);
                    return;
                end;
            end
        });
        table.insert(v89.menuItemNames, "Favorite");
    end;
    if l_notificationsCanEnableExperience_0 and not v105 and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 and (not l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 or not v39.getShouldInterleaveSdui()) or not v89.props.edpServerIxpVariables or v89.props.edpServerIxpVariables.hideNotifyInContextMenu ~= true) then
        local v107 = v89.props.gameFollowings == nil;
        local v108 = v89.props.gameFollowings ~= nil and (v89.props.gameFollowings.isFollowed or false);
        local v109 = l_Images_0["icons/common/notificationOn"];
        local v110 = l_Images_0["icons/common/notificationOff"];
        local l_followLabel_0 = v90.followLabel;
        if v64 then
            l_followLabel_0 = v108 and v90.followingLabel or v90.followLabel;
        end;
        table.insert(v91, {
            text = l_followLabel_0, 
            icon = v108 and v109 or v110, 
            disabled = v107, 
            stayOnActivated = true, 
            onActivated = function() --[[ Line: 361 ]] --[[ Name: onActivated ]]
                -- upvalues: v89 (copy), v107 (copy), l_rootPlaceId_0 (copy), l_ToastType_0 (ref), l_universeId_0 (copy), l_networking_0 (copy), l_Follow_0 (ref), l_eventIngest_0 (copy)
                if not v89.isMounted or v107 or not l_rootPlaceId_0 then
                    return;
                else
                    local l_isFollowed_0 = v89.props.gameFollowings.isFollowed;
                    local l_setCurrentToastMessage_0 = v89.props.setCurrentToastMessage;
                    local v114 = v89.props.notificationsEnabled.count or 0;
                    local v115 = v89.props.notificationsEnabled.limit or 0;
                    if not l_isFollowed_0 then
                        if v115 <= v114 then
                            l_setCurrentToastMessage_0({
                                toastType = l_ToastType_0.GameFollowError, 
                                toastMessage = v89.props.enableNotificationsRebrand and "Feature.GameFollows.TooltipNotificationsLimitReached" or "Feature.GameFollows.TooltipFollowLimitReached"
                            });
                            return;
                        else
                            v89.props.setExperienceNotificationsEnabledCount(v114 + 1);
                        end;
                    else
                        v89.props.setExperienceNotificationsEnabledCount(v114 - 1);
                    end;
                    v89.props.setGameFollow(l_universeId_0, not l_isFollowed_0);
                    v89.props.sendGameFollow(l_networking_0, l_universeId_0, not l_isFollowed_0, false, v114, v115);
                    l_Follow_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, not l_isFollowed_0);
                    return;
                end;
            end
        });
        table.insert(v89.menuItemNames, "Follow");
    end;
    if not v89.props.inviteFriendsDisabled then
        table.insert(v91, {
            text = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and v98 then v90.inviteConnections else v90.inviteFriends, 
            icon = l_Images_0["icons/actions/friends/friendInvite"], 
            onActivated = function() --[[ Line: 411 ]] --[[ Name: onActivated ]]
                -- upvalues: v89 (copy), l_rootPlaceId_0 (copy), l_GameInviteAnalyticsManager_0 (ref), l_universeId_0 (copy), l_GameInviteModalManager_0 (ref), l_GameInviteConstants_0 (ref), l_FFlagHideCloseButtonEdp_0 (ref)
                if not v89.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    l_GameInviteAnalyticsManager_0:withButtonName(l_GameInviteAnalyticsManager_0.ButtonName.GameDetailsMoreMenu);
                    l_GameInviteAnalyticsManager_0:inputShareGameEntryPoint(l_rootPlaceId_0, l_universeId_0);
                    l_GameInviteModalManager_0:openModal({
                        trigger = l_GameInviteConstants_0.Triggers.GameDetailsMoreMenu, 
                        rootPlaceId = l_rootPlaceId_0, 
                        universeId = l_universeId_0, 
                        hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v89.props.hideCloseButton else nil
                    });
                    v89.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v89.menuItemNames, "InviteFriends");
    end;
    if v89.props.enableCopyLink then
        table.insert(v91, {
            icon = l_Images_0["icons/menu/link"], 
            onActivated = function() --[[ Line: 435 ]] --[[ Name: onActivated ]]
                -- upvalues: v89 (copy), l_rootPlaceId_0 (copy), v87 (ref), l_universeId_0 (copy), l_CopyExperienceLink_0 (ref), l_eventIngest_0 (copy), l_ToastType_0 (ref)
                if not v89.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local v116, v117 = v87(v89.props.shareLinkId, l_universeId_0, l_rootPlaceId_0);
                    v89.props.externalContentSharingProtocol:shareUrl({
                        context = "GameDetailsMoreWebURL", 
                        url = v116
                    });
                    l_CopyExperienceLink_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, {
                        stamp = v117
                    });
                    v89.props.setCurrentToastMessage({
                        toastMessage = "Feature.GameDetails.Toast.LinkCopied", 
                        toastType = l_ToastType_0.SuccessConfirmation
                    });
                    v89.closeCallback();
                    return;
                end;
            end, 
            text = v90.copyLink
        });
        table.insert(v89.menuItemNames, "CopyLink");
    end;
    if v89.props.shareButtonEnabled and v89.props.shouldShowShareButton then
        table.insert(v91, {
            text = v90.share, 
            icon = l_Images_0["icons/actions/share"], 
            onActivated = function() --[[ Line: 468 ]] --[[ Name: onActivated ]]
                -- upvalues: v89 (copy), l_rootPlaceId_0 (copy), l_AppPage_0 (ref), l_universeId_0 (copy), v87 (ref), l_ShareExperienceLink_0 (ref), l_eventIngest_0 (copy)
                if not v89.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    if v89.props.shouldShareToProvider then
                        v89.props.navigateDown({
                            name = l_AppPage_0.SdkShare, 
                            extraProps = {
                                universeId = l_universeId_0, 
                                context = "GameDetailsMoreWebURL"
                            }
                        });
                    else
                        local v118, v119 = v87(v89.props.shareLinkId, l_universeId_0, l_rootPlaceId_0);
                        l_ShareExperienceLink_0(l_eventIngest_0, "GameDetailMoreContextualMenu", l_rootPlaceId_0, {
                            shortShareLinkFailed = not v89.props.shareLinkId, 
                            shareToAppsflyer = true, 
                            stamp = v119, 
                            linkId = v89.props.shareLinkId
                        });
                        v89.props.externalContentSharingProtocol:shareUrl({
                            url = v118, 
                            context = "GameDetailsMoreWebURL"
                        });
                    end;
                    v89.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v89.menuItemNames, "ShareExperienceLink");
    end;
    if not v89.props.reportingDisabled then
        table.insert(v91, {
            text = v90.report, 
            icon = l_Images_0["icons/actions/feedback"], 
            onActivated = function() --[[ Line: 507 ]] --[[ Name: onActivated ]]
                -- upvalues: v89 (copy), l_rootPlaceId_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (ref), l_guiService_0 (copy), v60 (ref), l_universeId_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v72 (ref), l_AbuseVector_0 (ref), l_FFlagAddThumbnailSelectorReport_0 (ref), l_AppPage_0 (ref), v90 (copy)
                if not v89.isMounted or not l_rootPlaceId_0 then
                    return;
                elseif v89.props.useLuafiedReportFlow then
                    if l_GetFFlagEnableAbuseReport10ft_0() and l_guiService_0 and l_guiService_0:IsTenFootInterface() then
                        v89.props.reportExperienceScreen({
                            context = v60.ReportScreen.Contexts.Experience, 
                            assetId = tostring(l_rootPlaceId_0), 
                            reportAbuseVector = v60.ReportScreen.AbuseVectors.Place, 
                            platform = v60.ReportScreen.Platforms.Console
                        });
                    else
                        v89.props.reportExperienceDialog({
                            reportEntryPoint = v60.ReportDialogEntryPoints.ExperienceDetails, 
                            universeId = l_universeId_0, 
                            rootPlaceId = l_rootPlaceId_0
                        });
                    end;
                    v89.closeCallback();
                    return;
                elseif l_FFlagEnableAbuseReportRevampFlow_0 and v72 then
                    v89.props.openDynamicAbuseReport({
                        abuseVector = l_AbuseVector_0.Place, 
                        targetId = l_rootPlaceId_0, 
                        custom = if l_FFlagAddThumbnailSelectorReport_0 then {
                            universeId = l_universeId_0
                        } else nil, 
                        onClose = function() --[[ Line: 539 ]] --[[ Name: onClose ]]
                            -- upvalues: v89 (ref)
                            v89.closeCallback();
                        end
                    });
                    return;
                elseif not v89.props.supportsWebViews then
                    v89.props.setToastMessage(v60.WEBVIEWS_UNAVAILABLE_TOAST);
                    return;
                else
                    v89.props.navigateDown({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = v89:getLinkPage(), 
                        extraProps = {
                            title = v90.localizedTextReport
                        }
                    });
                    v89.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v89.menuItemNames, "Report");
    end;
    if v89.props.refundLink and v89.props.webViewSupport then
        table.insert(v91, {
            text = v90.requestRefund, 
            icon = l_Images_0["icons/menu/wallet"], 
            onActivated = function() --[[ Line: 566 ]] --[[ Name: onActivated ]]
                -- upvalues: v89 (copy), l_rootPlaceId_0 (copy), l_RequestRefundClick_0 (ref)
                if not v89.isMounted or not l_rootPlaceId_0 then
                    return;
                else
                    local l_eventIngest_1 = v89.props.eventIngest;
                    l_RequestRefundClick_0(l_eventIngest_1, "GameDetailMoreContextualMenu", l_rootPlaceId_0);
                    v89.props.openRequestRefundPage(v89.props.refundLink, v89.onRequestRefundPageClose);
                    v89.closeCallback();
                    return;
                end;
            end
        });
        table.insert(v89.menuItemNames, "RequestRefund");
    end;
    return v91;
end;
v81.renderLandscapeContextualMenu = function(v121, v122) --[[ Line: 585 ]] --[[ Name: renderLandscapeContextualMenu ]]
    -- upvalues: v1 (copy), l_ContextualMenu_0 (copy), v7 (copy)
    local l_screenSize_0 = v121.props.screenSize;
    local v124 = v121:renderContextualMenuContent(v122);
    local v125 = v121.getMenuPos();
    local v126 = v121:getMenuAnchor();
    local v127 = v121.getMenuSize();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = v125, 
        Size = v127
    }, {
        ContextMenu = v1.createElement(l_ContextualMenu_0, {
            buttonProps = v124, 
            open = true, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            openPositionX = UDim.new(0, 0), 
            openPositionY = UDim.new(0, 0), 
            closeBackgroundVisible = false, 
            screenSize = l_screenSize_0, 
            onDismiss = v121.closeCallback, 
            contextMenuWidthOverride = UDim.new(1, 0), 
            anchorPointOverride = v126, 
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
v81.renderPortraitContextualMenu = function(v128, v129) --[[ Line: 621 ]] --[[ Name: renderPortraitContextualMenu ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v1 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local l_screenSize_1 = v128.props.screenSize;
    local v131 = v128:renderContextualMenuContent(v129);
    local v132 = v128.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local v133 = l_screenSize_1 ~= nil and l_screenSize_1.X > 0 and v128.props.menuPosition.X.Offset / l_screenSize_1.X / 2 or 0;
    local v134 = v132 and 0 or v133;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.new(v134, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        ContextMenu = v1.createElement(l_ContextualMenu_0, {
            buttonProps = v131, 
            open = true, 
            menuDirection = l_MenuDirection_0.Up, 
            openPositionY = UDim.new(1, -76), 
            closeBackgroundVisible = false, 
            screenSize = l_screenSize_1, 
            onDismiss = v128.closeCallback
        })
    });
end;
v81.didMount = function(v135) --[[ Line: 654 ]] --[[ Name: didMount ]]
    -- upvalues: l_AppPage_0 (copy), l_OpenMore_0 (copy)
    v135.isMounted = true;
    local l_currentPage_0 = v135.props.currentPage;
    if l_currentPage_0 ~= l_AppPage_0.GameDetail and l_currentPage_0 ~= l_AppPage_0.ExperienceDetail then
        v135.closeCallback();
        return;
    else
        local l_eventIngest_2 = v135.props.eventIngest;
        local l_rootPlaceId_1 = v135.props.rootPlaceId;
        local v139 = table.concat(v135.menuItemNames, ",");
        l_OpenMore_0(l_eventIngest_2, "GameDetailMoreContextualMenu", l_rootPlaceId_1, {
            moreMenuItems = v139
        });
        return;
    end;
end;
v81.willUnmount = function(v140) --[[ Line: 672 ]] --[[ Name: willUnmount ]]
    v140.isMounted = false;
end;
v81.render = function(v141) --[[ Line: 676 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy), l_DeviceOrientationMode_0 (copy)
    return l_withLocalization_0({
        favoriteLabel = "Feature.Favorites.Label.Favorite", 
        favoritedLabel = "Feature.Favorites.Label.Favorited", 
        followLabel = v141.props.enableNotificationsRebrand and "Feature.GameFollows.LabelNotifications" or "Feature.GameDetails.Label.Follow", 
        followingLabel = "Feature.Friends.Label.Following", 
        inviteFriends = "Feature.GameDetails.Action.InviteFriends", 
        inviteConnections = l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 and "CommonUI.Features.Label.InviteConnections" or nil, 
        copyLink = "Feature.GameDetails.Action.CopyLink", 
        share = "Feature.SocialShare.Action.Share", 
        report = "Feature.GameDetails.Action.Report", 
        requestRefund = "Feature.GameDetails.Action.Refund"
    })(function(v142) --[[ Line: 692 ]]
        -- upvalues: v141 (copy), l_DeviceOrientationMode_0 (ref)
        if v141.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
            return v141:renderPortraitContextualMenu(v142);
        else
            return v141:renderLandscapeContextualMenu(v142);
        end;
    end);
end;
v81 = v13.connect(function(v143, v144) --[[ Line: 705 ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameInfosReducer_0 (copy), v65 (copy)
    local v145 = nil;
    v145 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v144.shouldHydrateLegacyIxp then v143.GameDetailsV2 and v143.GameDetailsV2[v144.universeId] or nil else v143.GameDetails[v144.universeId];
    local v146 = v143.Personalization[l_GameInfosReducer_0.key][v144.universeId];
    return {
        rootPlaceId = v145 and v145.rootPlaceId or v146 and v146.placeId, 
        isFavorite = v143.GameFavorites[v144.universeId], 
        gameFollowings = v143.GameFollowings[v144.universeId], 
        currentPage = v143.Navigation.currentRoute.routeName, 
        shareButtonEnabled = v65(v143.LocalUserId), 
        screenSize = v143.ScreenSize, 
        deviceOrientation = v143.DeviceOrientation, 
        notificationsEnabled = v143.ExperienceNotificationsEnabled or {}, 
        refundLink = if v145 then v145.refundLink else nil
    };
end, function(v147) --[[ Line: 729 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), v53 (copy), v52 (copy), v55 (copy), v54 (copy), l_SetCurrentToastMessage_0 (copy), l_NavigateDown_0 (copy), l_GetFFlagLuafiedReportEntryPoints_0 (copy), v57 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), v58 (copy), v56 (copy), v59 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v62 (copy), l_ApiFetchGameDetails_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v72 (copy), l_OpenDynamicAbuseReport_0 (copy)
    return {
        closeCallback = function() --[[ Line: 731 ]] --[[ Name: closeCallback ]]
            -- upvalues: v147 (copy), l_CloseCentralOverlay_0 (ref)
            v147(l_CloseCentralOverlay_0());
        end, 
        gamePostFavorite = function(v148, v149, v150) --[[ Line: 734 ]] --[[ Name: gamePostFavorite ]]
            -- upvalues: v147 (copy), v53 (ref)
            return v147(v53(v148, v149, v150));
        end, 
        setGameFavorite = function(v151, v152) --[[ Line: 737 ]] --[[ Name: setGameFavorite ]]
            -- upvalues: v147 (copy), v52 (ref)
            return v147(v52(v151, v152));
        end, 
        sendGameFollow = function(v153, v154, v155, v156, v157, v158) --[[ Line: 740 ]] --[[ Name: sendGameFollow ]]
            -- upvalues: v147 (copy), v55 (ref)
            return v147(v55(v153, v154, v155, v156, v157, v158));
        end, 
        setGameFollow = function(v159, v160) --[[ Line: 759 ]] --[[ Name: setGameFollow ]]
            -- upvalues: v147 (copy), v54 (ref)
            return v147(v54(v159, v160));
        end, 
        setCurrentToastMessage = function(v161) --[[ Line: 762 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v147 (copy), l_SetCurrentToastMessage_0 (ref)
            return v147(l_SetCurrentToastMessage_0(v161));
        end, 
        navigateDown = function(v162) --[[ Line: 765 ]] --[[ Name: navigateDown ]]
            -- upvalues: v147 (copy), l_NavigateDown_0 (ref)
            return v147(l_NavigateDown_0(v162));
        end, 
        setToastMessage = function(v163) --[[ Line: 768 ]] --[[ Name: setToastMessage ]]
            -- upvalues: v147 (copy), l_SetCurrentToastMessage_0 (ref)
            return v147(l_SetCurrentToastMessage_0(v163));
        end, 
        reportExperienceDialog = l_GetFFlagLuafiedReportEntryPoints_0() and function(v164) --[[ Line: 772 ]]
            -- upvalues: v147 (copy), v57 (ref)
            return v147(v57(v164));
        end or nil, 
        reportExperienceScreen = l_GetFFlagEnableAbuseReport10ft_0() and function(v165) --[[ Line: 777 ]]
            -- upvalues: v147 (copy), v58 (ref)
            return v147(v58(v165));
        end or nil, 
        setExperienceNotificationsEnabledCount = function(v166) --[[ Line: 781 ]] --[[ Name: setExperienceNotificationsEnabledCount ]]
            -- upvalues: v147 (copy), v56 (ref)
            return v147(v56(v166));
        end, 
        openRequestRefundPage = function(v167, v168) --[[ Line: 784 ]] --[[ Name: openRequestRefundPage ]]
            -- upvalues: v147 (copy), v59 (ref)
            return v147(v59(v167, v168));
        end, 
        fetchGameDetail = function(v169, v170, v171) --[[ Line: 787 ]] --[[ Name: fetchGameDetail ]]
            -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v147 (copy), v62 (ref), l_ApiFetchGameDetails_0 (ref)
            if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v171 then
                return v147(v62.Fetch(v169, v170, v171, nil));
            else
                return v147(l_ApiFetchGameDetails_0.Fetch(v169, {
                    v170
                }));
            end;
        end, 
        fetchPlayabilityAndProductInfo = function(v172, v173) --[[ Line: 799 ]] --[[ Name: fetchPlayabilityAndProductInfo ]]
            -- upvalues: v147 (copy), l_FetchGamePlayabilityAndProductInfo_0 (ref)
            return v147(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v172, v173));
        end, 
        openDynamicAbuseReport = l_FFlagEnableAbuseReportRevampFlow_0 and v72 and function(v174) --[[ Line: 803 ]]
            -- upvalues: v147 (copy), l_OpenDynamicAbuseReport_0 (ref)
            return v147(l_OpenDynamicAbuseReport_0(v174));
        end or nil
    };
end)(v81);
v81 = l_RoactAppPolicy_0.connect(function(v175, _) --[[ Line: 810 ]]
    -- upvalues: l_GetFFlagLuafiedReportEntryPoints_0 (copy), l_GetFFlagEnableAbuseReport10ft_0 (copy), l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 (copy)
    return {
        shouldShowShareButton = v175.shouldShowGameDetailsShareButton(), 
        shouldShareToProvider = v175.shouldShareToAccountProvider(), 
        reportingDisabled = v175.getGameReportingDisabled(), 
        supportsWebViews = v175.getWebViewSupport(), 
        useLuafiedReportFlow = if not not l_GetFFlagLuafiedReportEntryPoints_0() or l_GetFFlagEnableAbuseReport10ft_0() then v175.getUseLuafiedReportFlow() else nil, 
        inviteFriendsDisabled = v175.getInviteFriendsDisabled(), 
        webViewSupport = v175.getWebViewSupport(), 
        notificationsCanEnableExperience = v175.getNotificationsCanReceiveExperience(), 
        renameFriendsToConnections = if l_FFlagLuaAppRenameFriendsToConnectionsEdp_0 then v175.getRenameFriendsToConnections() else nil
    };
end)(v81);
if not l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() then
    v81 = v15.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageLayer
    }, function(v177, _) --[[ Line: 831 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_GetNotificationsExperienceDetailsVariant_0 (copy)
        local v179 = (v177[l_AppUserLayers_0.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1;
        return {
            enableNotificationsDiscoverability = v179 == 2, 
            enableNotificationsRebrand = v179 > 0
        };
    end)(v81);
end;
local v180 = l_gql_0("\t\tquery ExperienceDetailsLink($universeId: String!) {\n\t\t\texperienceDetailsLinkByUniverseId(universeId: $universeId) {\n\t\t\t\tlinkId\n\t\t\t}\n\t\t}\n\t");
local l_v81_0 = v81;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    localization = v51, 
    eventIngest = l_AppEventIngestService_0, 
    guiService = if l_GetFFlagEnableAbuseReport10ft_0() then l_AppGuiService_0 else nil
})(function(v182) --[[ Line: 851 ]]
    -- upvalues: l_useQuery_0 (copy), v180 (copy), l_useUserExperiment_0 (copy), v80 (copy), v79 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v38 (copy), v8 (copy), v39 (copy), v1 (copy), l_v81_0 (copy)
    local v183 = nil;
    local v184 = nil;
    local v185 = l_useQuery_0(v180, {
        variables = {
            universeId = v182.universeId
        }
    });
    if v185.data and v185.data.experienceDetailsLinkByUniverseId then
        v184 = v185.data.experienceDetailsLinkByUniverseId.linkId;
    end;
    v183 = l_useUserExperiment_0({
        v80
    }, function(v186) --[[ Line: 866 ]]
        -- upvalues: v80 (ref), v79 (ref)
        return (v186[v80] or {})[v79];
    end, true);
    local v187 = nil;
    if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
        v187 = v38();
    end;
    local v188 = v8.Dictionary.join(v182, {
        enableCopyLink = v183, 
        shareLinkId = v184, 
        edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v39.getShouldInterleaveSdui() then v187 else nil
    });
    return v1.createElement(l_v81_0, v188);
end);