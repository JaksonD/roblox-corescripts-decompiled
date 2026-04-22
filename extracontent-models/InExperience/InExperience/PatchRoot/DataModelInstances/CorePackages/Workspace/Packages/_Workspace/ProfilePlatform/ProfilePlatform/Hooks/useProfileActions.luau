local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_Parent_0.AppChat);
local v8 = require(l_Parent_0.SocialCommon);
local v9 = require(l_Parent_0.Navigation);
local v10 = require(l_Parent_0.SetAlias);
local v11 = require(l_Parent_0.SocialExperienceJoin);
local v12 = require(l_Parent_0.RobloxAppEnums);
local v13 = require(l_Parent_0.SharedFlags);
local v14 = require(l_Parent_0.Http);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local l_Images_0 = v4.App.ImageSet.Images;
local l_HttpService_0 = game:GetService("HttpService");
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v21 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local l_useNavigation_0 = v9.useNavigation;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v26 = require(l_Parent_0.NavigationRodux);
local l_Url_0 = v14.Url;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_IconName_0 = v5.Enums.IconName;
local l_NavigateDown_0 = v26.Thunks.NavigateDown;
local l_AppPage_0 = v12.AppPage;
local l_useJoinUserInExperience_0 = v11.useJoinUserInExperience;
local v35 = require(l_Parent_0.SocialStopwatch);
local v36 = require(l_script_FirstAncestor_0.Networking.NetworkingFriends);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v38 = require(l_Parent_0.ProfileShareLinks);
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v41 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v42 = require(l_script_FirstAncestor_0.Hooks.getAvailableCommunityComponents);
local v43 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local v44 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatform);
local v45 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v46 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserInfo);
local v47 = require(l_script_FirstAncestor_0.Hooks.useAboutSections);
local v48 = require(l_script_FirstAncestor_0.Networking.GroupsNetworking);
local v49 = require(l_script_FirstAncestor_0.Networking.myUserBlockingNetworking);
local v50 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v51 = require(l_script_FirstAncestor_0.Utils.getPlatformFriendsService);
local v52 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v53 = require(l_script_FirstAncestor_0.Common.Enums);
local l_dependencyArray_0 = v6.Hooks.dependencyArray;
local l_ContextualInfoTypes_0 = v8.Enums.ContextualInfoTypes;
local l_useProfileShareLink_0 = v38.Hooks.useProfileShareLink;
local l_useShortUrl_0 = v38.Hooks.useShortUrl;
local l_useGetOrGenerateLinkUrl_0 = v38.Hooks.useGetOrGenerateLinkUrl;
local l_useEffectOnce_0 = v6.Hooks.useEffectOnce;
local l_ProfileSharePolicyEnum_0 = v38.Enums.ProfileSharePolicyEnum;
local v61 = require(l_Parent_0.DataHydration);
local l_FFlagEnableAbuseReportRevampFlow_0 = v13.FFlagEnableAbuseReportRevampFlow;
local v63 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local v65 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformRefreshOnWebviewClose);
local v66 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local l_FFlagProfilePlatformAddTC_0 = v13.FFlagProfilePlatformAddTC;
local v68 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage);
local l_FFlagEnablePlatformProfileContextualMenuOption_0 = require(l_Parent_0.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagTCUnifyNavigationEntry_0 = v13.FFlagTCUnifyNavigationEntry;
local l_FFlagProfilePlatformNewProfileHeader_0 = v13.FFlagProfilePlatformNewProfileHeader;
local l_FFlagConnectionsToFriendsRename_0 = v13.FFlagConnectionsToFriendsRename;
local v74 = require(l_script_FirstAncestor_0.Flags.FFlagPendingIncomingTrustedConnection);
local l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0 = v13.FFlagProfilePlatformPassPresenceToJoinUserInExperience;
local v76 = require(l_script_FirstAncestor_0.Flags.FFlagEnableAbuseReportRevampProfileAndGroup);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = v13.FFlagProfilePlatformEnableCurrencyTransfer;
local v78 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local v79 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditLook);
local l_FFlagLegacyProfileTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagLegacyProfileTCIndicator;
local v81 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformCTAsRefactor);
local v82 = require(l_script_FirstAncestor_0.Components.CTARow.ProfileActions);
local v83 = require(l_Parent_0.GenericAbuseReporting);
local l_AbuseVector_0 = v83.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v83.Thunks.OpenDynamicAbuseReport;
local l_ChatEntryPointNames_0 = v8.Enums.ChatEntryPointNames;
local l_EnteredChatFromEntryPoint_0 = v7.Actions.EnteredChatFromEntryPoint;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_0.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_Enums_0 = require(l_Parent_0.CurrencyTransfers).Enums;
local l_TransferDirection_0 = l_Enums_0.TransferDirection;
local l_TransferOrigination_0 = l_Enums_0.TransferOrigination;
local v93 = require(l_script_FirstAncestor_0.Common.Constants);
local v94 = require(l_script_FirstAncestor_0.Rodux.Presence);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_USER_BLOCKING_ERRORS_0 = v93.USER_BLOCKING_ERRORS;
local l_USER_FRIENDING_ERRORS_0 = v93.USER_FRIENDING_ERRORS;
local l_STATUS_CODES_0 = v93.STATUS_CODES;
local v99 = ("%*share/g/%%s"):format(l_Url_0.BASE_URL);
local v100 = tostring(DateTime.now().UnixTimestampMillis);
local function _(v101) --[[ Line: 125 ]] --[[ Name: areFollowActionsSupportedForProfileType ]]
    -- upvalues: v53 (copy)
    return v101 == v53.ProfileTypes.Community;
end;
local v103 = if l_FFlagLegacyProfileTCIndicator_0 then v61.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v104) --[[ Line: 135 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v21 (copy), v50 (copy), l_useShortUrl_0 (copy), l_useGetOrGenerateLinkUrl_0 (copy), l_useEffectOnce_0 (copy), v3 (copy), v100 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v41 (copy), l_useLocalization_0 (copy), v53 (copy), l_FFlagProfilePlatformAddTC_0 (copy), v78 (copy), v79 (copy), v63 (copy), v66 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagEnablePlatformProfileContextualMenuOption_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0 (copy), l_useSelector_0 (copy), v94 (copy), v47 (copy), l_useJoinUserInExperience_0 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_useProfileShareLink_0 (copy), l_Contexts_0 (copy), l_ProfileSharePolicyEnum_0 (copy), l_USER_FRIENDING_ERRORS_0 (copy), l_STATUS_CODES_0 (copy), l_HttpService_0 (copy), l_SetCurrentToastMessage_0 (copy), v81 (copy), v82 (copy), l_ButtonVariant_0 (copy), v52 (copy), v36 (copy), l_Images_0 (copy), v45 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_ButtonType_0 (copy), l_ContextualInfoTypes_0 (copy), v44 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_ChatEntryPointNames_0 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy), v35 (copy), v10 (copy), l_IconName_0 (copy), v5 (copy), v46 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), l_default_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v76 (copy), l_AbuseVector_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_CloseCentralOverlay_0 (copy), l_Url_0 (copy), v49 (copy), l_USER_BLOCKING_ERRORS_0 (copy), v68 (copy), v99 (copy), v48 (copy), v43 (copy), v42 (copy), l_UrlBuilder_0 (copy), v65 (copy), l_UrlBase_0 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v103 (copy), l_FFlagTCUnifyNavigationEntry_0 (copy), l_Sources_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v74 (copy), v51 (copy), l_TransferDirection_0 (copy), l_TransferOrigination_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v105 = l_useLocalUserId_0();
    local v106 = l_useDispatch_0();
    local v107 = l_useNavigation_0();
    local v108 = v21();
    local v109 = v108.navigateTo and v108.navigateTo.navigateToTransfer or nil;
    local v110 = v50();
    local v111 = l_useShortUrl_0();
    local v112 = l_useGetOrGenerateLinkUrl_0();
    local v113 = v111 ~= nil;
    l_useEffectOnce_0(v112, not v113);
    local v114 = v3.useMemo(function() --[[ Line: 149 ]]
        -- upvalues: v111 (copy), v100 (ref)
        return string.format("%s&source=ProfileShare&stamp=%s", v111 or "", v100);
    end, {
        v111
    });
    local v115 = if l_FFlagConnectionsToFriendsRename_0 then v41.AcceptFriend else v41.AcceptConnection;
    local v116 = if l_FFlagConnectionsToFriendsRename_0 then v41.AddFriend else v41.AddConnection;
    local v117 = l_useLocalization_0({
        [v53.ProfileActions.AcceptFriendRequest] = v115, 
        [v53.ProfileActions.AcceptOffNetworkFriendRequest] = v115, 
        [v53.ProfileActions.AddFriend] = v116, 
        [v53.ProfileActions.AddFriendFromContacts] = v116, 
        [v53.ProfileActions.AddFriendFromContactsSent] = v41.PendingRequest, 
        [v53.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v41.AddTrustedConnection else nil, 
        [v53.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v41.AcceptTrustedConnection else nil, 
        [v53.ProfileActions.Block] = v41.Block, 
        [v53.ProfileActions.CannotAddFriend] = v116, 
        [v53.ProfileActions.Chat] = v41.Chat, 
        [v53.ProfileActions.EditAlias] = v41.CustomizeName, 
        [v53.ProfileActions.EditAppearance] = if v78 then v41.EditAppearance else nil, 
        [v53.ProfileActions.EditEmotes] = if v78 then v41.EditEmotes else nil, 
        [v53.ProfileActions.SwitchAvatar] = if v78 then v41.SwitchAvatar else nil, 
        [v53.ProfileActions.EditAvatar] = v41.EditAvatar, 
        [v53.ProfileActions.EditLook] = if v79 then v41.EditLook else nil, 
        [v53.ProfileActions.EditProfile] = v41.EditProfile, 
        [v53.ProfileActions.IgnoreFriendRequest] = if l_FFlagConnectionsToFriendsRename_0 then v41.IgnoreFriendRequest else v41.IgnoreConnectionRequest, 
        [v53.ProfileActions.JoinExperience] = v41.Join, 
        [v53.ProfileActions.PendingFriendRequest] = v41.PendingRequest, 
        [v53.ProfileActions.QrCode] = v41.ToQRCode, 
        [v53.ProfileActions.Report] = v41.Report, 
        [v53.ProfileActions.ShareProfile] = v41.ShareProfile, 
        [v53.ProfileActions.Unblock] = v41.Unblock, 
        [v53.ProfileActions.Unfriend] = if l_FFlagConnectionsToFriendsRename_0 then v41.Unfriend else v41.RemoveConnection, 
        [v53.ProfileActions.CopyLink] = if v63 then v41.CopyLink else nil, 
        [v53.ProfileActions.JoinCommunity] = if v63 then v41.JoinCommunity else nil, 
        [v53.ProfileActions.CancelJoinCommunityRequest] = if v63 then v41.CancelJoinCommunityRequest else nil, 
        [v53.ProfileActions.ViewCommunity] = if v63 then v41.ViewCommunity else nil, 
        [v53.ProfileActions.ViewFullProfile] = if v66 then v41.ViewFullProfile else nil, 
        [v53.ProfileActions.LeaveCommunity] = if v63 then v41.LeaveCommunity else nil, 
        [v53.ProfileActions.MakePrimaryCommunity] = if v63 then v41.MakePrimaryCommunity else nil, 
        [v53.ProfileActions.RemovePrimaryCommunity] = if v63 then v41.RemovePrimaryCommunity else nil, 
        [v53.ProfileActions.Follow] = if v66 then v41.Follow else nil, 
        [v53.ProfileActions.Unfollow] = if v66 then v41.Unfollow else nil, 
        [v53.ProfileActions.RemoveTrustedConnection] = v41.RemoveTrustedConnection, 
        [v53.ProfileActions.ViewAbout] = if l_FFlagProfilePlatformNewProfileHeader_0 then v41.AboutThisProfile else nil, 
        [v53.ProfileActions.ViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v41.ViewPlatformProfile else nil, 
        [v53.ProfileActions.CurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v41.CurrencyTransfer else nil, 
        friendAcceptedToast = if l_FFlagConnectionsToFriendsRename_0 then v41.FriendAdded else v41.ConnectionAdded, 
        friendRemovedToast = if l_FFlagConnectionsToFriendsRename_0 then v41.FriendRemoved else v41.ConnectionRemoved, 
        trustedConnectionRemovedToast = v41.TrustedConnectionRemoved, 
        friendRequestSentToast = if l_FFlagConnectionsToFriendsRename_0 then v41.FriendRequestSent else v41.ConnectionRequestSent, 
        friendRequestIgnoredToast = v41.RequestIgnored, 
        userBlockedToast = v41.UserBlocked, 
        blockLimitReachedToast = v41.BlockLimitReached, 
        blocktargetAlreadyBlockedToast = v41.BlockTargetAlreadyBlocked, 
        blockedOnPlatformToast = v41.UnblockTargetBlockedOnPlatform, 
        unblockTargetNotBlockedToast = v41.UnblockTargetNotBlocked, 
        unblockTargetParentManagedToast = v41.UnblockTargetParentManaged, 
        somethingIsWrongToast = v41.SomethingIsWrong, 
        alreadyFriendError = v41.AlreadyFriendError, 
        defaultFriendingError = v41.DefaultFriendingError, 
        invalidNicknameError = v41.InvalidNicknameError, 
        invalidTargetUserError = v41.InvalidTargetUserError, 
        maxFriendsError = v41.MaxFriendsError, 
        unauthorizedError = v41.UnauthorizedError, 
        userBannedError = v41.UserBannedError, 
        userBlockedError = v41.UserBlockedError, 
        userNotPassedCaptchaError = v41.UserNotPassedCaptchaError, 
        tooManyRequestsError = v41.TooManyRequestsError
    });
    local v118 = v3.useCallback(function() --[[ Line: 270 ]]
        -- upvalues: v108 (copy)
        v108.navigateTo.previousView(true);
    end, {
        v108.navigateTo.previousView
    });
    local l_profileId_0 = v108.profileId;
    local v120 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v108.profilePlatformId else nil;
    local l_profileType_0 = v108.profileType;
    local v123 = if l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0 then l_useSelector_0(function(v122) --[[ Line: 280 ]]
        -- upvalues: v94 (ref), l_profileId_0 (copy)
        return v94.Selectors.getUserPresenceByUserId(v122, l_profileId_0) or {
            userPresenceType = v94.Enums.PresenceType.Offline, 
            lastLocation = ""
        };
    end) else nil;
    local v124 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        v124 = v47().aboutSections;
    end;
    local v125 = l_useJoinUserInExperience_0(l_profileId_0, {
        isHomePageCarousel = v108.sourceInfo.source == v53.Sources.HomepageFriendsCarousel, 
        homepageCarouselAbsolutePosition = v108.sourceInfo.homepageCarouselAbsolutePosition, 
        openGameDetailsPeekViewClosed = v118, 
        presence = if l_FFlagProfilePlatformPassPresenceToJoinUserInExperience_0 then v123 else nil
    });
    local l_qRCodePage_0 = v108.navigateTo.qRCodePage;
    local l_editUsername_0 = v108.navigateTo.editUsername;
    local v128 = if v78 then v108.navigateTo.editEmotes else nil;
    local v129 = if v78 then v108.navigateTo.switchAvatar else nil;
    local l_editAvatar_0 = v108.navigateTo.editAvatar;
    local v131 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v132 = l_useProfileShareLink_0({
        context = l_Contexts_0.ProfileCard
    });
    local v133 = v132.policy == l_ProfileSharePolicyEnum_0.Disabled;
    local v134 = {
        [l_USER_FRIENDING_ERRORS_0.INVALID_TARGET_USER_ERROR] = v117.invalidTargetUserError, 
        [l_USER_FRIENDING_ERRORS_0.ALREADY_FRIEND_ERROR] = v117.alreadyFriendError, 
        [l_USER_FRIENDING_ERRORS_0.MAX_FRIENDS_ERROR] = v117.maxFriendsError, 
        [l_USER_FRIENDING_ERRORS_0.INVALID_NICKNAME_ERROR] = v117.invalidNicknameError
    };
    local v135 = {
        [l_USER_FRIENDING_ERRORS_0.UNAUTHORIZED_ERROR] = v117.unauthorizedError
    };
    local v136 = {
        [l_USER_FRIENDING_ERRORS_0.USER_BANNED_ERROR] = v117.userBannedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_BLOCKED_ERROR] = v117.userBlockedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_NOT_PASSED_CAPTCHA_ERROR] = v117.userNotPassedCaptchaError
    };
    local v137 = {
        [l_USER_FRIENDING_ERRORS_0.TOO_MANY_REQUESTS_ERROR] = v117.tooManyRequestsError
    };
    local function _(v138, v139, v140) --[[ Line: 338 ]] --[[ Name: getErrorToastMessage ]]
        -- upvalues: v53 (ref), l_STATUS_CODES_0 (ref), v134 (copy), v135 (copy), v136 (copy), v137 (copy)
        if v138 == v53.ProfileActions.AddFriend or v138 == v53.ProfileActions.AddFriendFromContacts then
            if v139 == l_STATUS_CODES_0.BAD_REQUEST then
                return v134[v140];
            elseif v139 == l_STATUS_CODES_0.UNAUTHORIZED then
                return v135[v140];
            elseif v139 == l_STATUS_CODES_0.FORBIDDEN then
                return v136[v140];
            elseif v139 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then
                return v137[v140];
            end;
        end;
        return nil;
    end;
    local function v148(v142, v143) --[[ Line: 353 ]] --[[ Name: setErrorToast ]]
        -- upvalues: l_HttpService_0 (ref), v53 (ref), l_STATUS_CODES_0 (ref), v134 (copy), v135 (copy), v136 (copy), v137 (copy), v117 (copy), v106 (copy), l_SetCurrentToastMessage_0 (ref)
        if v143 ~= nil then
            local l_StatusCode_0 = v143.StatusCode;
            local v145 = if v143.Body then l_HttpService_0:JSONDecode(v143.Body) else nil;
            local v146 = if v145 and v145.errors and v145.errors[1] and v145.errors[1].code then v145.errors[1].code else nil;
            local v147 = (if not (v142 ~= v53.ProfileActions.AddFriend) or v142 == v53.ProfileActions.AddFriendFromContacts then if l_StatusCode_0 == l_STATUS_CODES_0.BAD_REQUEST then v134[v146] else if l_StatusCode_0 == l_STATUS_CODES_0.UNAUTHORIZED then v135[v146] else if l_StatusCode_0 == l_STATUS_CODES_0.FORBIDDEN then v136[v146] else if l_StatusCode_0 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then v137[v146] else nil else nil) or v117.defaultFriendingError;
            v106(l_SetCurrentToastMessage_0({
                toastMessage = v147, 
                isLocalized = true
            }));
            return;
        else
            v106(l_SetCurrentToastMessage_0({
                toastMessage = v117.defaultFriendingError, 
                isLocalized = true
            }));
            return;
        end;
    end;
    local v149 = if v81 then {
        localized = v117, 
        analytics = v110, 
        buttonSurface = v104, 
        profileWrapperContext = v108, 
        navigateTo = v108.navigateTo, 
        dispatch = v106, 
        profileId = l_profileId_0, 
        localUserId = v105, 
        navigation = v107, 
        profileType = l_profileType_0, 
        experienceUtilities = v125, 
        friendRequestNicknamesEnabled = v131, 
        profileShareLink = v132, 
        PROFILE_SHARE_LINK_URL = v114, 
        aboutSections = if l_FFlagProfilePlatformNewProfileHeader_0 then v124 else nil
    } else nil;
    return (v3.useMemo(function() --[[ Line: 397 ]]
        -- upvalues: v81 (ref), v82 (ref), v149 (copy), v53 (ref), v117 (copy), l_ButtonVariant_0 (ref), v110 (copy), v52 (ref), v104 (copy), v108 (copy), v106 (copy), v36 (ref), l_profileId_0 (copy), v105 (copy), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v45 (ref), l_FriendRequestNicknamesIXP_0 (ref), v131 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v148 (copy), l_ButtonType_0 (ref), l_ContextualInfoTypes_0 (ref), v44 (ref), l_profileType_0 (copy), v107 (copy), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref), v35 (ref), v10 (ref), v78 (ref), l_IconName_0 (ref), l_editAvatar_0 (copy), v79 (ref), v128 (copy), v129 (copy), v5 (ref), l_editUsername_0 (copy), v46 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref), v125 (copy), l_qRCodePage_0 (copy), v133 (copy), l_default_0 (ref), l_Contexts_0 (ref), v114 (copy), v41 (ref), v132 (copy), v63 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v76 (ref), l_AbuseVector_0 (ref), l_OpenDynamicAbuseReport_0 (ref), l_CloseCentralOverlay_0 (ref), l_Url_0 (ref), v49 (ref), l_USER_BLOCKING_ERRORS_0 (ref), v68 (ref), v99 (ref), v48 (ref), v43 (ref), v42 (ref), l_UrlBuilder_0 (ref), v65 (ref), v66 (ref), l_UrlBase_0 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v103 (ref), l_FFlagProfilePlatformAddTC_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), l_Sources_0 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), v74 (ref), l_FFlagProfilePlatformNewProfileHeader_0 (ref), v124 (ref), l_FFlagEnablePlatformProfileContextualMenuOption_0 (ref), v51 (ref), v120 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v109 (copy), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
        if v81 then
            local v150 = {};
            for v151, v152 in v82 do
                local v153 = v152(v149);
                if v153 ~= nil then
                    v150[v151] = v153;
                end;
            end;
            return v150;
        else
            return {
                [v53.ProfileActions.AcceptFriendRequest] = {
                    text = v117[v53.ProfileActions.AcceptFriendRequest], 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 423 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v108 (ref), v53 (ref), v106 (ref), v36 (ref), l_profileId_0 (ref), v105 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonAcceptFriendRequest, {
                            buttonSurface = v104, 
                            absolutePosition = v108.sourceInfo.homepageCarouselAbsolutePosition, 
                            isHomePageCarousel = v108.sourceInfo.source == v53.Sources.HomepageFriendsCarousel, 
                            isRecommendation = v108.sourceInfo.isRecommendation, 
                            source = v108.sourceInfo.source, 
                            contextualInfoType = v108.sourceInfo.contextualInfoType, 
                            recommendationContextType = v108.sourceInfo.recommendationContextType, 
                            recommendationRank = v108.sourceInfo.recommendationRank, 
                            recommendationSessionId = v108.sourceInfo.recommendationSessionId
                        });
                        return v106(v36.AcceptFriendRequestFromUserId.API({
                            targetUserId = l_profileId_0, 
                            currentUserId = v105
                        })):andThen(function() --[[ Line: 439 ]]
                            -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), l_profileId_0 (ref)
                            v106(l_SetCurrentToastMessage_0({
                                toastMessage = v117.friendAcceptedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                                isLocalized = true
                            }));
                            return v106(v45(l_profileId_0));
                        end);
                    end
                }, 
                [v53.ProfileActions.AcceptOffNetworkFriendRequest] = {
                    text = v117[v53.ProfileActions.AcceptOffNetworkFriendRequest], 
                    onActivated = function() --[[ Line: 451 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v108 (ref), v106 (ref), v36 (ref), l_profileId_0 (ref), v105 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonAddFriendFromContacts, {
                            shareLinkId = v108.sourceInfo.shareLinkId
                        });
                        return v106(v36.AcceptFriendRequestWithToken.API({
                            targetUserId = l_profileId_0, 
                            currentUserId = v105, 
                            friendingToken = v108.offNetworkFriendRequestToken
                        })):andThen(function() --[[ Line: 459 ]]
                            -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), l_profileId_0 (ref)
                            v106(l_SetCurrentToastMessage_0({
                                toastMessage = v117.friendAcceptedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                                isLocalized = true
                            }));
                            return v106(v45(l_profileId_0));
                        end);
                    end
                }, 
                [v53.ProfileActions.AddFriend] = {
                    text = v117[v53.ProfileActions.AddFriend], 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 472 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v108 (ref), v53 (ref), l_FriendRequestNicknamesIXP_0 (ref), v131 (ref), v106 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v36 (ref), v105 (ref), v45 (ref), v148 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonAddFriend, {
                            buttonSurface = v104, 
                            absolutePosition = v108.sourceInfo.homepageCarouselAbsolutePosition, 
                            isHomePageCarousel = v108.sourceInfo.source == v53.Sources.HomepageFriendsCarousel, 
                            isRecommendation = v108.sourceInfo.isRecommendation, 
                            source = v108.sourceInfo.source, 
                            contextualInfoType = v108.sourceInfo.contextualInfoType, 
                            recommendationContextType = v108.sourceInfo.recommendationContextType, 
                            recommendationRank = v108.sourceInfo.recommendationRank, 
                            recommendationSessionId = v108.sourceInfo.recommendationSessionId
                        });
                        if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v131 then
                            return v106(l_NavigateDown_0({
                                name = l_AppPage_0.SetNicknameModal, 
                                extraProps = {
                                    friendRequestParams = {
                                        targetUserId = l_profileId_0, 
                                        source = v108.sourceInfo.friendshipOriginSourceType
                                    }
                                }
                            }));
                        else
                            v106(l_SetCurrentToastMessage_0({
                                toastMessage = v117.friendRequestSentToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                                isLocalized = true
                            }));
                            return v106(v36.RequestFriendshipFromUserId.API({
                                targetUserId = l_profileId_0, 
                                currentUserId = v105, 
                                friendshipOriginSourceType = v108.sourceInfo.friendshipOriginSourceType
                            })):andThen(function() --[[ Line: 509 ]]
                                -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                                return v106(v45(l_profileId_0));
                            end):catch(function(v154) --[[ Line: 512 ]]
                                -- upvalues: v148 (ref), v53 (ref)
                                v148(v53.ProfileActions.AddFriend, v154);
                            end);
                        end;
                    end
                }, 
                [v53.ProfileActions.AddFriendFromContacts] = {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    text = v117[v53.ProfileActions.AddFriendFromContacts], 
                    onActivated = function() --[[ Line: 522 ]] --[[ Name: onActivated ]]
                        -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v36 (ref), v105 (ref), l_profileId_0 (ref), l_ContextualInfoTypes_0 (ref), v44 (ref), l_profileType_0 (ref), v53 (ref), v148 (ref)
                        v106(l_SetCurrentToastMessage_0({
                            toastMessage = v117.friendRequestSentToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v106(v36.RequestFriendshipFromContactId.API({
                            currentUserId = v105, 
                            contactId = l_profileId_0, 
                            contextType = l_ContextualInfoTypes_0.Contacts
                        })):andThen(function() --[[ Line: 533 ]]
                            -- upvalues: v106 (ref), v44 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v53 (ref)
                            return v106(v44({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = {
                                    v53.Components.ContactProfileHeader, 
                                    v53.Components.Actions, 
                                    v53.Components.ContactDescription
                                }
                            }));
                        end):catch(function(v155) --[[ Line: 544 ]]
                            -- upvalues: v148 (ref), v53 (ref)
                            v148(v53.ProfileActions.AddFriendFromContacts, v155);
                        end);
                    end
                }, 
                [v53.ProfileActions.AddFriendFromContactsSent] = {
                    buttonType = l_ButtonType_0.Secondary, 
                    variant = l_ButtonVariant_0.Subtle, 
                    text = v117[v53.ProfileActions.AddFriendFromContactsSent], 
                    onActivated = function() --[[ Line: 553 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true
                }, 
                [v53.ProfileActions.Block] = {
                    text = v117[v53.ProfileActions.Block], 
                    onActivated = function() --[[ Line: 558 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v107 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonBlock, {
                            buttonSurface = v104
                        });
                        v107.push(l_AppPage_0.BlockingModal, {
                            navProps = {
                                userId = l_profileId_0, 
                                onBlockSuccess = function() --[[ Line: 565 ]] --[[ Name: onBlockSuccess ]]
                                    -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), l_profileId_0 (ref)
                                    v106(l_SetCurrentToastMessage_0({
                                        toastMessage = v117.userBlockedToast, 
                                        toastIcon = l_Images_0["icons/actions/block"], 
                                        isLocalized = true
                                    }));
                                    v106(v45(l_profileId_0));
                                end
                            }
                        });
                    end
                }, 
                [v53.ProfileActions.CannotAddFriend] = {
                    text = v117[v53.ProfileActions.CannotAddFriend], 
                    onActivated = function() --[[ Line: 580 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true
                }, 
                [v53.ProfileActions.Chat] = {
                    text = v117[v53.ProfileActions.Chat], 
                    variant = l_ButtonVariant_0.Standard, 
                    onActivated = function() --[[ Line: 586 ]] --[[ Name: onActivated ]]
                        -- upvalues: v104 (ref), v53 (ref), v110 (ref), v52 (ref), v106 (ref), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_profileId_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
                        if v104 == v53.ButtonSurface.ContextualMenu then
                            v110.fireAnalyticsEvent(v52.ContextualMenuButtonChat, {
                                buttonSurface = v104
                            });
                        else
                            v110.fireAnalyticsEvent(v52.CTAButtonChat, {
                                buttonSurface = v104
                            });
                        end;
                        v106(l_EnteredChatFromEntryPoint_0(l_ChatEntryPointNames_0.ProfilePeekView));
                        l_GuiService_0:BroadcastNotification(l_profileId_0, l_l_GuiService_0_NotificationTypeList_0.LAUNCH_CONVERSATION);
                    end
                }, 
                [v53.ProfileActions.EditAlias] = {
                    text = v117[v53.ProfileActions.EditAlias], 
                    onActivated = function() --[[ Line: 603 ]] --[[ Name: onActivated ]]
                        -- upvalues: v35 (ref), v110 (ref), v52 (ref), v104 (ref), v107 (ref), v53 (ref), l_profileId_0 (ref), v10 (ref)
                        v35.Stopwatch.start(v35.Events.CustomizeNameOpened);
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonSetAlias, {
                            buttonSurface = v104
                        });
                        v107.navigate(v53.Screens.SetAliasModal, {
                            profileUserId = l_profileId_0, 
                            origin = v10.Analytics.EntryPoints.ContextualMenu
                        });
                    end
                }, 
                [v53.ProfileActions.EditAppearance] = if v78 then {
                    text = v117[v53.ProfileActions.EditAppearance], 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = function() --[[ Line: 618 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonEditAppearance, {
                            buttonSurface = v104
                        });
                    end
                } else nil, 
                [v53.ProfileActions.EditAvatar] = {
                    text = v117[v53.ProfileActions.EditAvatar], 
                    icon = if v78 then l_IconName_0.Person else nil, 
                    onActivated = function() --[[ Line: 628 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v78 (ref), v52 (ref), v104 (ref), l_editAvatar_0 (ref)
                        v110.fireAnalyticsEvent(if v78 then v52.EditAppearanceMenuEditAvatar else v52.CTAButtonEditAvatar, {
                            buttonSurface = v104
                        });
                        l_editAvatar_0();
                    end
                }, 
                [v53.ProfileActions.EditLook] = if v79 then {
                    text = v117[v53.ProfileActions.EditLook], 
                    icon = l_IconName_0.Person, 
                    onActivated = function() --[[ Line: 644 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), l_editAvatar_0 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonEditLook, {
                            buttonSurface = v104
                        });
                        l_editAvatar_0();
                    end
                } else nil, 
                [v53.ProfileActions.EditEmotes] = if v78 then {
                    text = v117[v53.ProfileActions.EditEmotes], 
                    icon = l_IconName_0.SquareFaceWavingHand, 
                    onActivated = function() --[[ Line: 656 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v128 (ref)
                        v110.fireAnalyticsEvent(v52.EditAppearanceMenuEditEmote, {
                            buttonSurface = v104
                        });
                        v128();
                    end
                } else nil, 
                [v53.ProfileActions.SwitchAvatar] = if v78 then {
                    text = v117[v53.ProfileActions.SwitchAvatar], 
                    icon = l_IconName_0.PersonStandingArrowReverse, 
                    onActivated = function() --[[ Line: 668 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v129 (ref)
                        v110.fireAnalyticsEvent(v52.EditAppearanceMenuSwitchAvatar, {
                            buttonSurface = v104
                        });
                        v129();
                    end
                } else nil, 
                [v53.ProfileActions.EditProfile] = {
                    component = v5.Button, 
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    variant = l_ButtonVariant_0.Standard, 
                    text = v117[v53.ProfileActions.EditProfile], 
                    onActivated = function() --[[ Line: 681 ]] --[[ Name: onActivated ]]
                        -- upvalues: v35 (ref), v110 (ref), v52 (ref), v104 (ref), v107 (ref), v53 (ref), l_editUsername_0 (ref), v106 (ref), v46 (ref), l_profileId_0 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref)
                        v35.Stopwatch.start(v35.Events.EditProfileOpened);
                        v110.fireAnalyticsEvent(v52.CTAButtonOpenEditProfilePage, {
                            buttonSurface = v104
                        });
                        v107.navigate(v53.Screens.EditProfilePage, {
                            profileScreens = v53.Screens, 
                            navigateToEditUsername = function(v156) --[[ Line: 688 ]] --[[ Name: navigateToEditUsername ]]
                                -- upvalues: l_editUsername_0 (ref), v106 (ref), v46 (ref), l_profileId_0 (ref)
                                l_editUsername_0({
                                    showToast = v156, 
                                    onUsernameChanged = function() --[[ Line: 691 ]] --[[ Name: onUsernameChanged ]]
                                        -- upvalues: v106 (ref), v46 (ref), l_profileId_0 (ref)
                                        v106(v46(l_profileId_0));
                                    end
                                });
                            end, 
                            onIdentityChange = function() --[[ Line: 696 ]] --[[ Name: onIdentityChange ]]
                                -- upvalues: v106 (ref), v46 (ref), l_profileId_0 (ref)
                                v106(v46(l_profileId_0));
                            end, 
                            onToggleInExperienceMode = l_FFlagMoveInExperienceModeToEditProfile_0 and function() --[[ Line: 700 ]]
                                -- upvalues: v106 (ref), v46 (ref), l_profileId_0 (ref), v110 (ref), v52 (ref)
                                v106(v46(l_profileId_0));
                                v110.fireAnalyticsEvent(v52.ToggleInExperienceModeButton, {});
                            end or nil
                        });
                    end
                }, 
                [v53.ProfileActions.IgnoreFriendRequest] = {
                    text = v117[v53.ProfileActions.IgnoreFriendRequest], 
                    onActivated = function() --[[ Line: 710 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v36 (ref), l_profileId_0 (ref), v105 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonIgnoreFriendRequest, {
                            buttonSurface = v104
                        });
                        return v106(v36.DeclineFriendRequestFromUserId.API({
                            targetUserId = l_profileId_0, 
                            currentUserId = v105
                        })):andThen(function() --[[ Line: 717 ]]
                            -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), l_profileId_0 (ref)
                            v106(l_SetCurrentToastMessage_0({
                                toastMessage = v117.friendRequestIgnoredToast, 
                                toastIcon = l_Images_0["icons/actions/reject"], 
                                isLocalized = true
                            }));
                            return v106(v45(l_profileId_0));
                        end);
                    end
                }, 
                [v53.ProfileActions.JoinExperience] = {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    isLoading = v125.isLoading, 
                    isDisabled = not v125.isInExperience, 
                    text = v117[v53.ProfileActions.JoinExperience], 
                    onActivated = function() --[[ Line: 734 ]] --[[ Name: onActivated ]]
                        -- upvalues: v125 (ref)
                        v125.joinExperience();
                    end
                }, 
                [v53.ProfileActions.PendingFriendRequest] = {
                    buttonType = l_ButtonType_0.Secondary, 
                    variant = l_ButtonVariant_0.Subtle, 
                    text = v117[v53.ProfileActions.PendingFriendRequest], 
                    onActivated = function() --[[ Line: 743 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true
                }, 
                [v53.ProfileActions.QrCode] = {
                    text = v117[v53.ProfileActions.QrCode], 
                    icon = l_IconName_0.SquaresGridQr, 
                    onActivated = function() --[[ Line: 749 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), l_qRCodePage_0 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonShareProfileQRCode, {
                            buttonSurface = v104
                        });
                        l_qRCodePage_0();
                    end
                }, 
                [v53.ProfileActions.ShareProfile] = {
                    component = v5.Button, 
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    variant = l_ButtonVariant_0.Standard, 
                    text = v117[v53.ProfileActions.ShareProfile], 
                    onActivated = function() --[[ Line: 761 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v133 (ref), l_default_0 (ref), l_Contexts_0 (ref), v114 (ref), l_profileId_0 (ref), v106 (ref), l_SetCurrentToastMessage_0 (ref), v41 (ref), v132 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonShareProfile, {
                            buttonSurface = v104
                        });
                        if v133 then
                            l_default_0:setClipboardText({
                                context = l_Contexts_0.ProfileCard, 
                                text = string.format("%s/%s", v114, l_profileId_0)
                            });
                            v106(l_SetCurrentToastMessage_0({
                                toastMessage = v41.LinkCopied
                            }));
                            return;
                        else
                            v132.onActivated();
                            return;
                        end;
                    end
                }, 
                [v53.ProfileActions.Report] = {
                    text = v117[v53.ProfileActions.Report], 
                    onActivated = function() --[[ Line: 780 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v63 (ref), l_profileType_0 (ref), v53 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v76 (ref), l_AbuseVector_0 (ref), v106 (ref), l_OpenDynamicAbuseReport_0 (ref), l_profileId_0 (ref), l_CloseCentralOverlay_0 (ref), v45 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v41 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonReport, {
                            buttonSurface = v104
                        });
                        local v157 = nil;
                        if v63 then
                            if l_profileType_0 == v53.ProfileTypes.User then
                                v157 = "userprofile";
                            elseif l_profileType_0 == v53.ProfileTypes.Community then
                                v157 = "group";
                            end;
                        end;
                        if l_FFlagEnableAbuseReportRevampFlow_0 and v76 then
                            local l_UserProfile_0 = l_AbuseVector_0.UserProfile;
                            if v63 and l_profileType_0 == v53.ProfileTypes.Community then
                                l_UserProfile_0 = l_AbuseVector_0.Group;
                            end;
                            v106(l_OpenDynamicAbuseReport_0({
                                abuseVector = l_UserProfile_0, 
                                targetId = l_profileId_0, 
                                onClose = function() --[[ Line: 803 ]] --[[ Name: onClose ]]
                                    -- upvalues: v106 (ref), l_CloseCentralOverlay_0 (ref), v45 (ref), l_profileId_0 (ref)
                                    v106(l_CloseCentralOverlay_0());
                                    v106(v45(l_profileId_0));
                                end
                            }));
                            return;
                        else
                            v106(l_NavigateDown_0({
                                name = l_AppPage_0.GenericWebPage, 
                                detail = if v63 then ("%*abusereport/%*?id=%*"):format(l_Url_0.BASE_URL, v157, l_profileId_0) else string.format("%sabusereport/userprofile?id=%s", l_Url_0.BASE_URL, l_profileId_0), 
                                extraProps = {
                                    titleKey = v41.Report
                                }
                            }));
                            return;
                        end;
                    end
                }, 
                [v53.ProfileActions.Unblock] = {
                    text = v117[v53.ProfileActions.Unblock], 
                    onActivated = function() --[[ Line: 827 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v49 (ref), l_profileId_0 (ref), v105 (ref), v45 (ref), l_USER_BLOCKING_ERRORS_0 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), v68 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonUnblock, {
                            buttonSurface = v104
                        });
                        return v106(v49.UnblockUserById.API({
                            userId = l_profileId_0, 
                            currentUserId = v105
                        })):andThen(function() --[[ Line: 835 ]]
                            -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                            return v106(v45(l_profileId_0));
                        end):catch(function(v159) --[[ Line: 838 ]]
                            -- upvalues: l_USER_BLOCKING_ERRORS_0 (ref), v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), v68 (ref)
                            if v159 ~= nil and tonumber(v159.Body) == l_USER_BLOCKING_ERRORS_0.PARENT_BLOCKED_TARGET_USER_ERROR then
                                v106(l_SetCurrentToastMessage_0({
                                    toastMessage = v117.unblockTargetParentManagedToast, 
                                    isLocalized = true
                                }));
                                return;
                            elseif v159 ~= nil and tonumber(v159.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
                                v106(l_SetCurrentToastMessage_0({
                                    toastMessage = v117.unblockTargetNotBlockedToast, 
                                    isLocalized = true
                                }));
                                return;
                            elseif v68 and v159 ~= nil and tonumber(v159.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
                                v106(l_SetCurrentToastMessage_0({
                                    toastMessage = v117.blockedOnPlatformToast, 
                                    isLocalized = true
                                }));
                                return;
                            else
                                v106(l_SetCurrentToastMessage_0({
                                    toastMessage = v117.somethingIsWrongToast, 
                                    isLocalized = true
                                }));
                                return;
                            end;
                        end);
                    end
                }, 
                [v53.ProfileActions.Unfriend] = {
                    text = v117[v53.ProfileActions.Unfriend], 
                    onActivated = function() --[[ Line: 882 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v36 (ref), l_profileId_0 (ref), v105 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonUnfriend, {
                            buttonSurface = v104
                        });
                        return v106(v36.UnfriendTargetUserId.API({
                            targetUserId = l_profileId_0, 
                            currentUserId = v105
                        })):andThen(function() --[[ Line: 889 ]]
                            -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), l_profileId_0 (ref)
                            v106(l_SetCurrentToastMessage_0({
                                toastMessage = v117.friendRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                isLocalized = true
                            }));
                            return v106(v45(l_profileId_0));
                        end);
                    end
                }, 
                [v53.ProfileActions.CopyLink] = if v63 then {
                    text = v117[v53.ProfileActions.CopyLink], 
                    onActivated = function() --[[ Line: 902 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), l_default_0 (ref), l_Contexts_0 (ref), v99 (ref), l_profileId_0 (ref), v106 (ref), l_SetCurrentToastMessage_0 (ref), v41 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonCopyLink, {
                            buttonSurface = v104
                        });
                        l_default_0:setClipboardText({
                            context = l_Contexts_0.ProfileCard, 
                            text = string.format(v99, l_profileId_0)
                        });
                        v106(l_SetCurrentToastMessage_0({
                            toastMessage = v41.LinkCopied
                        }));
                    end
                } else nil, 
                [v53.ProfileActions.JoinCommunity] = if v63 then {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    text = v117[v53.ProfileActions.JoinCommunity], 
                    onActivated = function() --[[ Line: 922 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v48 (ref), l_profileId_0 (ref), v43 (ref), l_profileType_0 (ref), v42 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonJoinCommunity, {
                            buttonSurface = v104
                        });
                        return v106(v48.JoinGroup.API({
                            groupId = l_profileId_0
                        })):andThen(function() --[[ Line: 929 ]]
                            -- upvalues: v106 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v42 (ref)
                            v106(v43.API({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = v42(), 
                                includeComponentOrdering = true
                            }));
                        end);
                    end
                } else nil, 
                [v53.ProfileActions.CancelJoinCommunityRequest] = if v63 then {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    variant = l_ButtonVariant_0.Standard, 
                    text = v117[v53.ProfileActions.CancelJoinCommunityRequest], 
                    onActivated = function() --[[ Line: 945 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v48 (ref), l_profileId_0 (ref), v105 (ref), v44 (ref), l_profileType_0 (ref), v53 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonCancelJoinCommunityRequest, {
                            buttonSurface = v104
                        });
                        return v106(v48.CancelJoinGroupRequest.API({
                            groupId = l_profileId_0, 
                            userId = v105
                        })):andThen(function() --[[ Line: 953 ]]
                            -- upvalues: v106 (ref), v44 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v53 (ref)
                            v106(v44({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = {
                                    v53.Components.Actions
                                }
                            }));
                        end);
                    end
                } else nil, 
                [v53.ProfileActions.ViewCommunity] = if v63 then {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    variant = l_ButtonVariant_0.SubEmphasis, 
                    text = v117[v53.ProfileActions.ViewCommunity], 
                    onActivated = function() --[[ Line: 970 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_profileId_0 (ref), v41 (ref), v65 (ref), v43 (ref), l_profileType_0 (ref), v42 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonViewCommunity, {
                            buttonSurface = v104
                        });
                        v106(l_NavigateDown_0({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = l_UrlBuilder_0.user.group({
                                groupId = l_profileId_0
                            }), 
                            extraProps = {
                                titleKey = v41.Community, 
                                onClose = function() --[[ Line: 980 ]] --[[ Name: onClose ]]
                                    -- upvalues: v65 (ref), v106 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v42 (ref)
                                    if v65 then
                                        v106(v43.API({
                                            profileType = l_profileType_0, 
                                            profileId = l_profileId_0, 
                                            components = v42(), 
                                            includeComponentOrdering = true
                                        }));
                                    end;
                                end
                            }
                        }));
                    end
                } else nil, 
                [v53.ProfileActions.ViewFullProfile] = if v66 then {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    variant = l_ButtonVariant_0.SubEmphasis, 
                    text = v117[v53.ProfileActions.ViewFullProfile], 
                    onActivated = function() --[[ Line: 1000 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref), l_profileId_0 (ref), v41 (ref), v65 (ref), v43 (ref), l_profileType_0 (ref), v42 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonViewFullProfile, {
                            buttonSurface = v104
                        });
                        v106(l_NavigateDown_0({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = l_UrlBuilder_0.new({
                                base = l_UrlBase_0.WWW, 
                                path = ("profiles/%*"):format(l_profileId_0)
                            })(), 
                            extraProps = {
                                titleKey = v41.Profile, 
                                onClose = function() --[[ Line: 1013 ]] --[[ Name: onClose ]]
                                    -- upvalues: v65 (ref), v106 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v42 (ref)
                                    if v65 then
                                        v106(v43.API({
                                            profileType = l_profileType_0, 
                                            profileId = l_profileId_0, 
                                            components = v42(), 
                                            includeComponentOrdering = true
                                        }));
                                    end;
                                end
                            }
                        }));
                    end
                } else nil, 
                [v53.ProfileActions.LeaveCommunity] = if v63 then {
                    text = v117[v53.ProfileActions.LeaveCommunity], 
                    onActivated = function() --[[ Line: 1031 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v48 (ref), l_profileId_0 (ref), v105 (ref), v43 (ref), l_profileType_0 (ref), v42 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonLeaveCommunity, {
                            buttonSurface = v104
                        });
                        return v106(v48.LeaveGroup.API({
                            groupId = l_profileId_0, 
                            userId = v105
                        })):andThen(function() --[[ Line: 1039 ]]
                            -- upvalues: v106 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v42 (ref)
                            v106(v43.API({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = v42(), 
                                includeComponentOrdering = true
                            }));
                        end);
                    end
                } else nil, 
                [v53.ProfileActions.MakePrimaryCommunity] = if v63 then {
                    text = v117[v53.ProfileActions.MakePrimaryCommunity], 
                    onActivated = function() --[[ Line: 1053 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v48 (ref), l_profileId_0 (ref), v44 (ref), l_profileType_0 (ref), v53 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonMakePrimaryCommunity, {
                            buttonSurface = v104
                        });
                        return v106(v48.MakePrimaryGroup.API({
                            groupId = l_profileId_0
                        })):andThen(function() --[[ Line: 1060 ]]
                            -- upvalues: v106 (ref), v44 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v53 (ref)
                            v106(v44({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = {
                                    v53.Components.Actions
                                }
                            }));
                        end);
                    end
                } else nil, 
                [v53.ProfileActions.RemovePrimaryCommunity] = if v63 then {
                    text = v117[v53.ProfileActions.RemovePrimaryCommunity], 
                    onActivated = function() --[[ Line: 1075 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v48 (ref), v44 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v53 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonRemovePrimaryCommunity, {
                            buttonSurface = v104
                        });
                        return v106(v48.RemovePrimaryGroup.API()):andThen(function() --[[ Line: 1080 ]]
                            -- upvalues: v106 (ref), v44 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v53 (ref)
                            v106(v44({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = {
                                    v53.Components.Actions
                                }
                            }));
                        end);
                    end
                } else nil, 
                [v53.ProfileActions.Follow] = if v66 and l_profileType_0 == v53.ProfileTypes.Community then {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    variant = l_ButtonVariant_0.Standard, 
                    text = v117[v53.ProfileActions.Follow], 
                    onActivated = function() --[[ Line: 1098 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v48 (ref), l_profileId_0 (ref), v43 (ref), l_profileType_0 (ref), v42 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonFollow, {
                            buttonSurface = v104
                        });
                        return v106(v48.JoinGroup.API({
                            groupId = l_profileId_0
                        })):andThen(function() --[[ Line: 1104 ]]
                            -- upvalues: v106 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v42 (ref)
                            v106(v43.API({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = v42(), 
                                includeComponentOrdering = true
                            }));
                        end);
                    end
                } else nil, 
                [v53.ProfileActions.Unfollow] = if v66 and l_profileType_0 == v53.ProfileTypes.Community then {
                    text = v117[v53.ProfileActions.Unfollow], 
                    onActivated = function() --[[ Line: 1119 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), v48 (ref), l_profileId_0 (ref), v105 (ref), v43 (ref), l_profileType_0 (ref), v42 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonUnfollow, {
                            buttonSurface = v104
                        });
                        return v106(v48.LeaveGroup.API({
                            groupId = l_profileId_0, 
                            userId = v105
                        })):andThen(function() --[[ Line: 1127 ]]
                            -- upvalues: v106 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v42 (ref)
                            v106(v43.API({
                                profileType = l_profileType_0, 
                                profileId = l_profileId_0, 
                                components = v42(), 
                                includeComponentOrdering = true
                            }));
                        end);
                    end
                } else nil, 
                [v53.ProfileActions.RemoveTrustedConnection] = {
                    text = v117[v53.ProfileActions.RemoveTrustedConnection], 
                    onActivated = function() --[[ Line: 1140 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v103 (ref), l_profileId_0 (ref), v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), v36 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonRemoveTrustedConnection, {
                            buttonSurface = v104
                        });
                        if l_FFlagLegacyProfileTCIndicator_0 then
                            return v103.removeTrustedConnectionRequest(l_profileId_0):andThen(function() --[[ Line: 1145 ]]
                                -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), l_profileId_0 (ref)
                                v106(l_SetCurrentToastMessage_0({
                                    toastMessage = v117.trustedConnectionRemovedToast, 
                                    toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                    isLocalized = true
                                }));
                                return v106(v45(l_profileId_0));
                            end);
                        else
                            return v106(v36.RemoveTC.API(l_profileId_0)):andThen(function() --[[ Line: 1154 ]]
                                -- upvalues: v106 (ref), l_SetCurrentToastMessage_0 (ref), v117 (ref), l_Images_0 (ref), v45 (ref), l_profileId_0 (ref)
                                v106(l_SetCurrentToastMessage_0({
                                    toastMessage = v117.trustedConnectionRemovedToast, 
                                    toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                    isLocalized = true
                                }));
                                return v106(v45(l_profileId_0));
                            end);
                        end;
                    end
                }, 
                [v53.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                    text = v117[v53.ProfileActions.AddTrustedConnection], 
                    onActivated = function() --[[ Line: 1168 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v107 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_Sources_0 (ref), v106 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonAddTrustedConnection, {
                            buttonSurface = v104
                        });
                        if l_FFlagTCUnifyNavigationEntry_0 then
                            v107.push(l_AppPage_0.TrustedContactsModal, {
                                props = {
                                    userId = l_profileId_0, 
                                    source = l_Sources_0.ProfilePlatform, 
                                    onRequestSent = function() --[[ Line: 1177 ]] --[[ Name: onRequestSent ]]
                                        -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                                        return v106(v45(l_profileId_0));
                                    end
                                }
                            });
                            return;
                        else
                            v107.push(l_AppPage_0.TrustedContactsModal, {
                                userId = l_profileId_0, 
                                source = l_Sources_0.ProfilePlatform, 
                                onRequestSent = function() --[[ Line: 1186 ]] --[[ Name: onRequestSent ]]
                                    -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                                    return v106(v45(l_profileId_0));
                                end
                            });
                            return;
                        end;
                    end
                } else nil, 
                [v53.ProfileActions.AddTrustedConnectionViaLink] = if l_FFlagTCShareLinkSenderUI_0 then {
                    text = v117[v53.ProfileActions.AddTrustedConnection], 
                    onActivated = function() --[[ Line: 1197 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), l_Sources_0 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v107 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v106 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonAddTrustedConnection, {
                            buttonSurface = v104, 
                            modalVariantOverride = l_Sources_0.ShareLinkSender
                        });
                        if l_FFlagTCUnifyNavigationEntry_0 then
                            v107.push(l_AppPage_0.TrustedContactsModal, {
                                props = {
                                    userId = l_profileId_0, 
                                    source = l_Sources_0.ProfilePlatform, 
                                    modalVariantOverride = l_Sources_0.ShareLinkSender, 
                                    onRequestSent = function() --[[ Line: 1208 ]] --[[ Name: onRequestSent ]]
                                        -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                                        return v106(v45(l_profileId_0));
                                    end
                                }
                            });
                            return;
                        else
                            v107.push(l_AppPage_0.TrustedContactsModal, {
                                userId = l_profileId_0, 
                                source = l_Sources_0.ProfilePlatform, 
                                modalVariantOverride = l_Sources_0.ShareLinkSender, 
                                onRequestSent = function() --[[ Line: 1218 ]] --[[ Name: onRequestSent ]]
                                    -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                                    return v106(v45(l_profileId_0));
                                end
                            });
                            return;
                        end;
                    end
                } else nil, 
                [v53.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                    text = v117[v53.ProfileActions.AddIncomingTrustedConnection], 
                    onActivated = function() --[[ Line: 1229 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), l_FFlagTCUnifyNavigationEntry_0 (ref), v107 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v106 (ref), v45 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonAddIncomingTrustedConnection, {
                            buttonSurface = v104
                        });
                        if l_FFlagTCUnifyNavigationEntry_0 then
                            v107.push(l_AppPage_0.TrustedContactsModal, {
                                props = {
                                    userId = l_profileId_0, 
                                    onRequestAccepted = function() --[[ Line: 1240 ]] --[[ Name: onRequestAccepted ]]
                                        -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                                        return v106(v45(l_profileId_0));
                                    end
                                }
                            });
                            return;
                        else
                            v107.push(l_AppPage_0.TrustedContactsModal, {
                                userId = l_profileId_0, 
                                onRequestAccepted = function() --[[ Line: 1248 ]] --[[ Name: onRequestAccepted ]]
                                    -- upvalues: v106 (ref), v45 (ref), l_profileId_0 (ref)
                                    return v106(v45(l_profileId_0));
                                end
                            });
                            return;
                        end;
                    end
                } else nil, 
                [v53.ProfileActions.PendingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                    text = v117[v53.ProfileActions.AddTrustedConnection], 
                    isDisabled = true, 
                    onActivated = function() --[[ Line: 1260 ]] --[[ Name: onActivated ]]

                    end
                } else nil, 
                [v53.ProfileActions.PendingIncomingTrustedConnection] = if v74 then {
                    text = v117[v53.ProfileActions.AddIncomingTrustedConnection], 
                    isDisabled = true, 
                    onActivated = function() --[[ Line: 1267 ]] --[[ Name: onActivated ]]

                    end
                } else nil, 
                [v53.ProfileActions.ViewAbout] = if l_FFlagProfilePlatformNewProfileHeader_0 then {
                    text = v117[v53.ProfileActions.ViewAbout], 
                    onActivated = function() --[[ Line: 1273 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v106 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v124 (ref)
                        v110.fireAnalyticsEvent(v52.CTAButtonViewFullProfile, {
                            buttonSurface = v104
                        });
                        v106(l_NavigateDown_0({
                            name = l_AppPage_0.AboutDetailsSheet, 
                            extraProps = {
                                sections = v124
                            }
                        }));
                    end
                } else nil, 
                [v53.ProfileActions.ViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then {
                    text = v117[v53.ProfileActions.ViewPlatformProfile], 
                    onActivated = function() --[[ Line: 1290 ]] --[[ Name: onActivated ]]
                        -- upvalues: v110 (ref), v52 (ref), v104 (ref), v51 (ref), v120 (ref)
                        v110.fireAnalyticsEvent(v52.ContextualMenuButtonViewPlatformProfile, {
                            buttonSurface = v104
                        });
                        v51:ShowProfile(v120);
                    end
                } else nil, 
                [v53.ProfileActions.CurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
                    text = v117[v53.ProfileActions.CurrencyTransfer], 
                    onActivated = function() --[[ Line: 1301 ]] --[[ Name: onActivated ]]
                        -- upvalues: v104 (ref), v53 (ref), v110 (ref), v52 (ref), v109 (ref), l_profileId_0 (ref), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
                        if v104 == v53.ButtonSurface.ContextualMenu then
                            v110.fireAnalyticsEvent(v52.ContextualMenuButtonCurrencyTransfer, {
                                buttonSurface = v104
                            });
                        else
                            v110.fireAnalyticsEvent(v52.CTAButtonCurrencyTransfer, {
                                buttonSurface = v104
                            });
                        end;
                        if v109 then
                            v109({
                                recipientUserId = l_profileId_0, 
                                direction = l_TransferDirection_0.Send, 
                                transferOrigination = l_TransferOrigination_0.Profile
                            });
                        end;
                    end
                } else nil
            };
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v106, 
        l_profileId_0, 
        v108, 
        if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v109 else nil, 
        l_qRCodePage_0, 
        v117, 
        v105, 
        v107, 
        l_editUsername_0, 
        v125.joinExperience, 
        v125.isLoading, 
        v110, 
        v131, 
        v104, 
        if l_FFlagProfilePlatformNewProfileHeader_0 then v124 else nil, 
        l_profileType_0, 
        l_editAvatar_0, 
        if v78 then v128 else nil, 
        if v78 then v129 else nil, 
        if v81 then v114 else nil, 
        if v81 then v125.isInExperience else nil, 
        if v81 then v149 else nil
    } else l_dependencyArray_0(v106, l_profileId_0, v108, if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v109 else nil, l_qRCodePage_0, v117, v105, v107, l_editUsername_0, v125.joinExperience, v125.isLoading, v110, v131, v104, if l_FFlagProfilePlatformNewProfileHeader_0 then v124 else nil, l_profileType_0, l_editAvatar_0, if v78 then v128 else nil, if v78 then v129 else nil)));
end;