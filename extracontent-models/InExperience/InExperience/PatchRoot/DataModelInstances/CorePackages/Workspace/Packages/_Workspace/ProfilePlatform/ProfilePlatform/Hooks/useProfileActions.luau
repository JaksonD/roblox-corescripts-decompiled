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
local v20 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local l_useNavigation_0 = v9.useNavigation;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v25 = require(l_Parent_0.NavigationRodux);
local l_Url_0 = v14.Url;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_IconName_0 = v5.Enums.IconName;
local l_NavigateDown_0 = v25.Thunks.NavigateDown;
local l_AppPage_0 = v12.AppPage;
local l_useJoinUserInExperience_0 = v11.useJoinUserInExperience;
local v34 = require(l_Parent_0.SocialStopwatch);
local v35 = require(l_script_FirstAncestor_0.Networking.NetworkingFriends);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v37 = require(l_Parent_0.ProfileShareLinks);
local l_Contexts_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Contexts;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v40 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v41 = require(l_script_FirstAncestor_0.Hooks.getAvailableCommunityComponents);
local v42 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
local v43 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatform);
local v44 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local v45 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserInfo);
local v46 = require(l_script_FirstAncestor_0.Hooks.useAboutSections);
local v47 = require(l_script_FirstAncestor_0.Networking.GroupsNetworking);
local v48 = require(l_script_FirstAncestor_0.Networking.myUserBlockingNetworking);
local v49 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v50 = require(l_script_FirstAncestor_0.Utils.getPlatformFriendsService);
local v51 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v52 = require(l_script_FirstAncestor_0.Common.Enums);
local l_dependencyArray_0 = v6.Hooks.dependencyArray;
local l_ContextualInfoTypes_0 = v8.Enums.ContextualInfoTypes;
local l_useProfileShareLink_0 = v37.Hooks.useProfileShareLink;
local l_useShortUrl_0 = v37.Hooks.useShortUrl;
local l_useGetOrGenerateLinkUrl_0 = v37.Hooks.useGetOrGenerateLinkUrl;
local l_useEffectOnce_0 = v6.Hooks.useEffectOnce;
local l_ProfileSharePolicyEnum_0 = v37.Enums.ProfileSharePolicyEnum;
local v60 = require(l_Parent_0.DataHydration);
local l_FFlagEnableAbuseReportRevampFlow_0 = v13.FFlagEnableAbuseReportRevampFlow;
local v62 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local l_FFlagMoveInExperienceModeToEditProfile_0 = require(l_Parent_0.SharedFlags).FFlagMoveInExperienceModeToEditProfile;
local v64 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformRefreshOnWebviewClose);
local v65 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities);
local l_FFlagProfilePlatformAddTC_0 = v13.FFlagProfilePlatformAddTC;
local v67 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage);
local l_FFlagEnablePlatformProfileContextualMenuOption_0 = require(l_Parent_0.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption;
local l_FFlagTCShareLinkSenderUI_0 = require(l_Parent_0.SharedFlags).FFlagTCShareLinkSenderUI;
local l_FFlagProfilePlatformNewProfileHeader_0 = v13.FFlagProfilePlatformNewProfileHeader;
local l_FFlagConnectionsToFriendsRename_0 = v13.FFlagConnectionsToFriendsRename;
local v72 = game:DefineFastFlag("PendingIncomingTrustedConnection", false);
local v73 = game:DefineFastFlag("EnableAbuseReportRevampProfileAndGroup", false);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = v13.FFlagProfilePlatformEnableCurrencyTransfer;
local v75 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local v76 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditLook);
local l_FFlagLegacyProfileTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagLegacyProfileTCIndicator;
local v78 = require(l_Parent_0.GenericAbuseReporting);
local l_AbuseVector_0 = v78.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v78.Thunks.OpenDynamicAbuseReport;
local l_ChatEntryPointNames_0 = v8.Enums.ChatEntryPointNames;
local l_EnteredChatFromEntryPoint_0 = v7.Actions.EnteredChatFromEntryPoint;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_0.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_Enums_0 = require(l_Parent_0.CurrencyTransfers).Enums;
local l_TransferDirection_0 = l_Enums_0.TransferDirection;
local l_TransferOrigination_0 = l_Enums_0.TransferOrigination;
local v88 = require(l_script_FirstAncestor_0.Common.Constants);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_USER_BLOCKING_ERRORS_0 = v88.USER_BLOCKING_ERRORS;
local l_USER_FRIENDING_ERRORS_0 = v88.USER_FRIENDING_ERRORS;
local l_STATUS_CODES_0 = v88.STATUS_CODES;
local v93 = ("%*share/g/%%s"):format(l_Url_0.BASE_URL);
local v94 = tostring(DateTime.now().UnixTimestampMillis);
local function _(v95) --[[ Line: 116 ]] --[[ Name: areFollowActionsSupportedForProfileType ]]
    -- upvalues: v52 (copy)
    return v95 == v52.ProfileTypes.Community;
end;
local v97 = if l_FFlagLegacyProfileTCIndicator_0 then v60.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v98) --[[ Line: 126 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v20 (copy), v49 (copy), l_useShortUrl_0 (copy), l_useGetOrGenerateLinkUrl_0 (copy), l_useEffectOnce_0 (copy), v3 (copy), v94 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v40 (copy), l_useLocalization_0 (copy), v52 (copy), l_FFlagProfilePlatformAddTC_0 (copy), v75 (copy), v76 (copy), v62 (copy), v65 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagEnablePlatformProfileContextualMenuOption_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), v46 (copy), l_useJoinUserInExperience_0 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_useProfileShareLink_0 (copy), l_Contexts_0 (copy), l_ProfileSharePolicyEnum_0 (copy), l_USER_FRIENDING_ERRORS_0 (copy), l_STATUS_CODES_0 (copy), l_HttpService_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ButtonVariant_0 (copy), v51 (copy), v35 (copy), l_Images_0 (copy), v44 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_ButtonType_0 (copy), l_ContextualInfoTypes_0 (copy), v43 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_ChatEntryPointNames_0 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy), v34 (copy), v10 (copy), l_IconName_0 (copy), v5 (copy), v45 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), l_default_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v73 (copy), l_AbuseVector_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_CloseCentralOverlay_0 (copy), l_Url_0 (copy), v48 (copy), l_USER_BLOCKING_ERRORS_0 (copy), v67 (copy), v93 (copy), v47 (copy), v42 (copy), v41 (copy), l_UrlBuilder_0 (copy), v64 (copy), l_UrlBase_0 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v97 (copy), l_Sources_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v72 (copy), v50 (copy), l_TransferDirection_0 (copy), l_TransferOrigination_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v99 = l_useLocalUserId_0();
    local v100 = l_useDispatch_0();
    local v101 = l_useNavigation_0();
    local v102 = v20();
    local v103 = v102.navigateTo and v102.navigateTo.navigateToTransfer or nil;
    local v104 = v49();
    local v105 = l_useShortUrl_0();
    local v106 = l_useGetOrGenerateLinkUrl_0();
    local v107 = v105 ~= nil;
    l_useEffectOnce_0(v106, not v107);
    local v108 = v3.useMemo(function() --[[ Line: 140 ]]
        -- upvalues: v105 (copy), v94 (ref)
        return string.format("%s&source=ProfileShare&stamp=%s", v105 or "", v94);
    end, {
        v105
    });
    local v109 = if l_FFlagConnectionsToFriendsRename_0 then v40.AcceptFriend else v40.AcceptConnection;
    local v110 = if l_FFlagConnectionsToFriendsRename_0 then v40.AddFriend else v40.AddConnection;
    local v111 = l_useLocalization_0({
        [v52.ProfileActions.AcceptFriendRequest] = v109, 
        [v52.ProfileActions.AcceptOffNetworkFriendRequest] = v109, 
        [v52.ProfileActions.AddFriend] = v110, 
        [v52.ProfileActions.AddFriendFromContacts] = v110, 
        [v52.ProfileActions.AddFriendFromContactsSent] = v40.PendingRequest, 
        [v52.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v40.AddTrustedConnection else nil, 
        [v52.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v40.AcceptTrustedConnection else nil, 
        [v52.ProfileActions.Block] = v40.Block, 
        [v52.ProfileActions.CannotAddFriend] = v110, 
        [v52.ProfileActions.Chat] = v40.Chat, 
        [v52.ProfileActions.EditAlias] = v40.CustomizeName, 
        [v52.ProfileActions.EditAppearance] = if v75 then v40.EditAppearance else nil, 
        [v52.ProfileActions.EditEmotes] = if v75 then v40.EditEmotes else nil, 
        [v52.ProfileActions.SwitchAvatar] = if v75 then v40.SwitchAvatar else nil, 
        [v52.ProfileActions.EditAvatar] = v40.EditAvatar, 
        [v52.ProfileActions.EditLook] = if v76 then v40.EditLook else nil, 
        [v52.ProfileActions.EditProfile] = v40.EditProfile, 
        [v52.ProfileActions.IgnoreFriendRequest] = if l_FFlagConnectionsToFriendsRename_0 then v40.IgnoreFriendRequest else v40.IgnoreConnectionRequest, 
        [v52.ProfileActions.JoinExperience] = v40.Join, 
        [v52.ProfileActions.PendingFriendRequest] = v40.PendingRequest, 
        [v52.ProfileActions.QrCode] = v40.ToQRCode, 
        [v52.ProfileActions.Report] = v40.Report, 
        [v52.ProfileActions.ShareProfile] = v40.ShareProfile, 
        [v52.ProfileActions.Unblock] = v40.Unblock, 
        [v52.ProfileActions.Unfriend] = if l_FFlagConnectionsToFriendsRename_0 then v40.Unfriend else v40.RemoveConnection, 
        [v52.ProfileActions.CopyLink] = if v62 then v40.CopyLink else nil, 
        [v52.ProfileActions.JoinCommunity] = if v62 then v40.JoinCommunity else nil, 
        [v52.ProfileActions.CancelJoinCommunityRequest] = if v62 then v40.CancelJoinCommunityRequest else nil, 
        [v52.ProfileActions.ViewCommunity] = if v62 then v40.ViewCommunity else nil, 
        [v52.ProfileActions.ViewFullProfile] = if v65 then v40.ViewFullProfile else nil, 
        [v52.ProfileActions.LeaveCommunity] = if v62 then v40.LeaveCommunity else nil, 
        [v52.ProfileActions.MakePrimaryCommunity] = if v62 then v40.MakePrimaryCommunity else nil, 
        [v52.ProfileActions.RemovePrimaryCommunity] = if v62 then v40.RemovePrimaryCommunity else nil, 
        [v52.ProfileActions.Follow] = if v65 then v40.Follow else nil, 
        [v52.ProfileActions.Unfollow] = if v65 then v40.Unfollow else nil, 
        [v52.ProfileActions.RemoveTrustedConnection] = v40.RemoveTrustedConnection, 
        [v52.ProfileActions.ViewAbout] = if l_FFlagProfilePlatformNewProfileHeader_0 then v40.AboutThisProfile else nil, 
        [v52.ProfileActions.ViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v40.ViewPlatformProfile else nil, 
        [v52.ProfileActions.CurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v40.CurrencyTransfer else nil, 
        friendAcceptedToast = if l_FFlagConnectionsToFriendsRename_0 then v40.FriendAdded else v40.ConnectionAdded, 
        friendRemovedToast = if l_FFlagConnectionsToFriendsRename_0 then v40.FriendRemoved else v40.ConnectionRemoved, 
        trustedConnectionRemovedToast = v40.TrustedConnectionRemoved, 
        friendRequestSentToast = if l_FFlagConnectionsToFriendsRename_0 then v40.FriendRequestSent else v40.ConnectionRequestSent, 
        friendRequestIgnoredToast = v40.RequestIgnored, 
        userBlockedToast = v40.UserBlocked, 
        blockLimitReachedToast = v40.BlockLimitReached, 
        blocktargetAlreadyBlockedToast = v40.BlockTargetAlreadyBlocked, 
        blockedOnPlatformToast = v40.UnblockTargetBlockedOnPlatform, 
        unblockTargetNotBlockedToast = v40.UnblockTargetNotBlocked, 
        unblockTargetParentManagedToast = v40.UnblockTargetParentManaged, 
        somethingIsWrongToast = v40.SomethingIsWrong, 
        alreadyFriendError = v40.AlreadyFriendError, 
        defaultFriendingError = v40.DefaultFriendingError, 
        invalidNicknameError = v40.InvalidNicknameError, 
        invalidTargetUserError = v40.InvalidTargetUserError, 
        maxFriendsError = v40.MaxFriendsError, 
        unauthorizedError = v40.UnauthorizedError, 
        userBannedError = v40.UserBannedError, 
        userBlockedError = v40.UserBlockedError, 
        userNotPassedCaptchaError = v40.UserNotPassedCaptchaError, 
        tooManyRequestsError = v40.TooManyRequestsError
    });
    local v112 = v3.useCallback(function() --[[ Line: 261 ]]
        -- upvalues: v102 (copy)
        v102.navigateTo.previousView(true);
    end, {
        v102.navigateTo.previousView
    });
    local l_profileId_0 = v102.profileId;
    local v114 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v102.profilePlatformId else nil;
    local l_profileType_0 = v102.profileType;
    local v116 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        v116 = v46().aboutSections;
    end;
    local v117 = l_useJoinUserInExperience_0(l_profileId_0, {
        isHomePageCarousel = v102.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
        homepageCarouselAbsolutePosition = v102.sourceInfo.homepageCarouselAbsolutePosition, 
        openGameDetailsPeekViewClosed = v112
    });
    local l_qRCodePage_0 = v102.navigateTo.qRCodePage;
    local l_editUsername_0 = v102.navigateTo.editUsername;
    local v120 = if v75 then v102.navigateTo.editEmotes else nil;
    local v121 = if v75 then v102.navigateTo.switchAvatar else nil;
    local l_editAvatar_0 = v102.navigateTo.editAvatar;
    local v123 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v124 = l_useProfileShareLink_0({
        context = l_Contexts_0.ProfileCard
    });
    local v125 = v124.policy == l_ProfileSharePolicyEnum_0.Disabled;
    local v126 = {
        [l_USER_FRIENDING_ERRORS_0.INVALID_TARGET_USER_ERROR] = v111.invalidTargetUserError, 
        [l_USER_FRIENDING_ERRORS_0.ALREADY_FRIEND_ERROR] = v111.alreadyFriendError, 
        [l_USER_FRIENDING_ERRORS_0.MAX_FRIENDS_ERROR] = v111.maxFriendsError, 
        [l_USER_FRIENDING_ERRORS_0.INVALID_NICKNAME_ERROR] = v111.invalidNicknameError
    };
    local v127 = {
        [l_USER_FRIENDING_ERRORS_0.UNAUTHORIZED_ERROR] = v111.unauthorizedError
    };
    local v128 = {
        [l_USER_FRIENDING_ERRORS_0.USER_BANNED_ERROR] = v111.userBannedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_BLOCKED_ERROR] = v111.userBlockedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_NOT_PASSED_CAPTCHA_ERROR] = v111.userNotPassedCaptchaError
    };
    local v129 = {
        [l_USER_FRIENDING_ERRORS_0.TOO_MANY_REQUESTS_ERROR] = v111.tooManyRequestsError
    };
    local function _(v130, v131, v132) --[[ Line: 318 ]] --[[ Name: getErrorToastMessage ]]
        -- upvalues: v52 (ref), l_STATUS_CODES_0 (ref), v126 (copy), v127 (copy), v128 (copy), v129 (copy)
        if v130 == v52.ProfileActions.AddFriend or v130 == v52.ProfileActions.AddFriendFromContacts then
            if v131 == l_STATUS_CODES_0.BAD_REQUEST then
                return v126[v132];
            elseif v131 == l_STATUS_CODES_0.UNAUTHORIZED then
                return v127[v132];
            elseif v131 == l_STATUS_CODES_0.FORBIDDEN then
                return v128[v132];
            elseif v131 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then
                return v129[v132];
            end;
        end;
        return nil;
    end;
    local function v140(v134, v135) --[[ Line: 333 ]] --[[ Name: setErrorToast ]]
        -- upvalues: l_HttpService_0 (ref), v52 (ref), l_STATUS_CODES_0 (ref), v126 (copy), v127 (copy), v128 (copy), v129 (copy), v111 (copy), v100 (copy), l_SetCurrentToastMessage_0 (ref)
        if v135 ~= nil then
            local l_StatusCode_0 = v135.StatusCode;
            local v137 = if v135.Body then l_HttpService_0:JSONDecode(v135.Body) else nil;
            local v138 = if v137 and v137.errors and v137.errors[1] and v137.errors[1].code then v137.errors[1].code else nil;
            local v139 = (if not (v134 ~= v52.ProfileActions.AddFriend) or v134 == v52.ProfileActions.AddFriendFromContacts then if l_StatusCode_0 == l_STATUS_CODES_0.BAD_REQUEST then v126[v138] else if l_StatusCode_0 == l_STATUS_CODES_0.UNAUTHORIZED then v127[v138] else if l_StatusCode_0 == l_STATUS_CODES_0.FORBIDDEN then v128[v138] else if l_StatusCode_0 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then v129[v138] else nil else nil) or v111.defaultFriendingError;
            v100(l_SetCurrentToastMessage_0({
                toastMessage = v139, 
                isLocalized = true
            }));
            return;
        else
            v100(l_SetCurrentToastMessage_0({
                toastMessage = v111.defaultFriendingError, 
                isLocalized = true
            }));
            return;
        end;
    end;
    return (v3.useMemo(function() --[[ Line: 357 ]]
        -- upvalues: v52 (ref), v111 (copy), l_ButtonVariant_0 (ref), v104 (copy), v51 (ref), v98 (copy), v102 (copy), v100 (copy), v35 (ref), l_profileId_0 (copy), v99 (copy), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v44 (ref), l_FriendRequestNicknamesIXP_0 (ref), v123 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v140 (copy), l_ButtonType_0 (ref), l_ContextualInfoTypes_0 (ref), v43 (ref), l_profileType_0 (copy), v101 (copy), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref), v34 (ref), v10 (ref), v75 (ref), l_IconName_0 (ref), l_editAvatar_0 (copy), v76 (ref), v120 (copy), v121 (copy), v5 (ref), l_editUsername_0 (copy), v45 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref), v117 (copy), l_qRCodePage_0 (copy), v125 (copy), l_default_0 (ref), l_Contexts_0 (ref), v108 (copy), v40 (ref), v124 (copy), v62 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v73 (ref), l_AbuseVector_0 (ref), l_OpenDynamicAbuseReport_0 (ref), l_CloseCentralOverlay_0 (ref), l_Url_0 (ref), v48 (ref), l_USER_BLOCKING_ERRORS_0 (ref), v67 (ref), v93 (ref), v47 (ref), v42 (ref), v41 (ref), l_UrlBuilder_0 (ref), v64 (ref), v65 (ref), l_UrlBase_0 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v97 (ref), l_FFlagProfilePlatformAddTC_0 (ref), l_Sources_0 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), v72 (ref), l_FFlagProfilePlatformNewProfileHeader_0 (ref), v116 (ref), l_FFlagEnablePlatformProfileContextualMenuOption_0 (ref), v50 (ref), v114 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v103 (copy), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
        return {
            [v52.ProfileActions.AcceptFriendRequest] = {
                text = v111[v52.ProfileActions.AcceptFriendRequest], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 362 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v102 (ref), v52 (ref), v100 (ref), v35 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonAcceptFriendRequest, {
                        buttonSurface = v98, 
                        absolutePosition = v102.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v102.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v102.sourceInfo.isRecommendation, 
                        source = v102.sourceInfo.source, 
                        contextualInfoType = v102.sourceInfo.contextualInfoType, 
                        recommendationContextType = v102.sourceInfo.recommendationContextType, 
                        recommendationRank = v102.sourceInfo.recommendationRank, 
                        recommendationSessionId = v102.sourceInfo.recommendationSessionId
                    });
                    return v100(v35.AcceptFriendRequestFromUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v99
                    })):andThen(function() --[[ Line: 378 ]]
                        -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v100(l_SetCurrentToastMessage_0({
                            toastMessage = v111.friendAcceptedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v100(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.AcceptOffNetworkFriendRequest] = {
                text = v111[v52.ProfileActions.AcceptOffNetworkFriendRequest], 
                onActivated = function() --[[ Line: 390 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v102 (ref), v100 (ref), v35 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonAddFriendFromContacts, {
                        shareLinkId = v102.sourceInfo.shareLinkId
                    });
                    return v100(v35.AcceptFriendRequestWithToken.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v99, 
                        friendingToken = v102.offNetworkFriendRequestToken
                    })):andThen(function() --[[ Line: 398 ]]
                        -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v100(l_SetCurrentToastMessage_0({
                            toastMessage = v111.friendAcceptedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v100(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.AddFriend] = {
                text = v111[v52.ProfileActions.AddFriend], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 411 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v102 (ref), v52 (ref), l_FriendRequestNicknamesIXP_0 (ref), v123 (ref), v100 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v35 (ref), v99 (ref), v44 (ref), v140 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonAddFriend, {
                        buttonSurface = v98, 
                        absolutePosition = v102.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v102.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v102.sourceInfo.isRecommendation, 
                        source = v102.sourceInfo.source, 
                        contextualInfoType = v102.sourceInfo.contextualInfoType, 
                        recommendationContextType = v102.sourceInfo.recommendationContextType, 
                        recommendationRank = v102.sourceInfo.recommendationRank, 
                        recommendationSessionId = v102.sourceInfo.recommendationSessionId
                    });
                    if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v123 then
                        return v100(l_NavigateDown_0({
                            name = l_AppPage_0.SetNicknameModal, 
                            extraProps = {
                                friendRequestParams = {
                                    targetUserId = l_profileId_0, 
                                    source = v102.sourceInfo.friendshipOriginSourceType
                                }
                            }
                        }));
                    else
                        v100(l_SetCurrentToastMessage_0({
                            toastMessage = v111.friendRequestSentToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v100(v35.RequestFriendshipFromUserId.API({
                            targetUserId = l_profileId_0, 
                            currentUserId = v99, 
                            friendshipOriginSourceType = v102.sourceInfo.friendshipOriginSourceType
                        })):andThen(function() --[[ Line: 446 ]]
                            -- upvalues: v100 (ref), v44 (ref), l_profileId_0 (ref)
                            return v100(v44(l_profileId_0));
                        end):catch(function(v141) --[[ Line: 449 ]]
                            -- upvalues: v140 (ref), v52 (ref)
                            v140(v52.ProfileActions.AddFriend, v141);
                        end);
                    end;
                end
            }, 
            [v52.ProfileActions.AddFriendFromContacts] = {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v111[v52.ProfileActions.AddFriendFromContacts], 
                onActivated = function() --[[ Line: 459 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v35 (ref), v99 (ref), l_profileId_0 (ref), l_ContextualInfoTypes_0 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref), v140 (ref)
                    v100(l_SetCurrentToastMessage_0({
                        toastMessage = v111.friendRequestSentToast, 
                        toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isLocalized = true
                    }));
                    return v100(v35.RequestFriendshipFromContactId.API({
                        currentUserId = v99, 
                        contactId = l_profileId_0, 
                        contextType = l_ContextualInfoTypes_0.Contacts
                    })):andThen(function() --[[ Line: 470 ]]
                        -- upvalues: v100 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        return v100(v43({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = {
                                v52.Components.ContactProfileHeader, 
                                v52.Components.Actions, 
                                v52.Components.ContactDescription
                            }
                        }));
                    end):catch(function(v142) --[[ Line: 481 ]]
                        -- upvalues: v140 (ref), v52 (ref)
                        v140(v52.ProfileActions.AddFriendFromContacts, v142);
                    end);
                end
            }, 
            [v52.ProfileActions.AddFriendFromContactsSent] = {
                buttonType = l_ButtonType_0.Secondary, 
                variant = l_ButtonVariant_0.Subtle, 
                text = v111[v52.ProfileActions.AddFriendFromContactsSent], 
                onActivated = function() --[[ Line: 490 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.Block] = {
                text = v111[v52.ProfileActions.Block], 
                onActivated = function() --[[ Line: 495 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v101 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonBlock, {
                        buttonSurface = v98
                    });
                    v101.push(l_AppPage_0.BlockingModal, {
                        navProps = {
                            userId = l_profileId_0, 
                            onBlockSuccess = function() --[[ Line: 502 ]] --[[ Name: onBlockSuccess ]]
                                -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                                v100(l_SetCurrentToastMessage_0({
                                    toastMessage = v111.userBlockedToast, 
                                    toastIcon = l_Images_0["icons/actions/block"], 
                                    isLocalized = true
                                }));
                                v100(v44(l_profileId_0));
                            end
                        }
                    });
                end
            }, 
            [v52.ProfileActions.CannotAddFriend] = {
                text = v111[v52.ProfileActions.CannotAddFriend], 
                onActivated = function() --[[ Line: 517 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.Chat] = {
                text = v111[v52.ProfileActions.Chat], 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = function() --[[ Line: 523 ]] --[[ Name: onActivated ]]
                    -- upvalues: v98 (ref), v52 (ref), v104 (ref), v51 (ref), v100 (ref), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_profileId_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
                    if v98 == v52.ButtonSurface.ContextualMenu then
                        v104.fireAnalyticsEvent(v51.ContextualMenuButtonChat, {
                            buttonSurface = v98
                        });
                    else
                        v104.fireAnalyticsEvent(v51.CTAButtonChat, {
                            buttonSurface = v98
                        });
                    end;
                    v100(l_EnteredChatFromEntryPoint_0(l_ChatEntryPointNames_0.ProfilePeekView));
                    l_GuiService_0:BroadcastNotification(l_profileId_0, l_l_GuiService_0_NotificationTypeList_0.LAUNCH_CONVERSATION);
                end
            }, 
            [v52.ProfileActions.EditAlias] = {
                text = v111[v52.ProfileActions.EditAlias], 
                onActivated = function() --[[ Line: 540 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (ref), v104 (ref), v51 (ref), v98 (ref), v101 (ref), v52 (ref), l_profileId_0 (ref), v10 (ref)
                    v34.Stopwatch.start(v34.Events.CustomizeNameOpened);
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonSetAlias, {
                        buttonSurface = v98
                    });
                    v101.navigate(v52.Screens.SetAliasModal, {
                        profileUserId = l_profileId_0, 
                        origin = v10.Analytics.EntryPoints.ContextualMenu
                    });
                end
            }, 
            [v52.ProfileActions.EditAppearance] = if v75 then {
                text = v111[v52.ProfileActions.EditAppearance], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 555 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonEditAppearance, {
                        buttonSurface = v98
                    });
                end
            } else nil, 
            [v52.ProfileActions.EditAvatar] = {
                text = v111[v52.ProfileActions.EditAvatar], 
                icon = if v75 then l_IconName_0.Person else nil, 
                onActivated = function() --[[ Line: 565 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v75 (ref), v51 (ref), v98 (ref), l_editAvatar_0 (ref)
                    v104.fireAnalyticsEvent(if v75 then v51.EditAppearanceMenuEditAvatar else v51.CTAButtonEditAvatar, {
                        buttonSurface = v98
                    });
                    l_editAvatar_0();
                end
            }, 
            [v52.ProfileActions.EditLook] = if v76 then {
                text = v111[v52.ProfileActions.EditLook], 
                icon = l_IconName_0.Person, 
                onActivated = function() --[[ Line: 581 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), l_editAvatar_0 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonEditLook, {
                        buttonSurface = v98
                    });
                    l_editAvatar_0();
                end
            } else nil, 
            [v52.ProfileActions.EditEmotes] = if v75 then {
                text = v111[v52.ProfileActions.EditEmotes], 
                icon = l_IconName_0.SquareFaceWavingHand, 
                onActivated = function() --[[ Line: 593 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v120 (ref)
                    v104.fireAnalyticsEvent(v51.EditAppearanceMenuEditEmote, {
                        buttonSurface = v98
                    });
                    v120();
                end
            } else nil, 
            [v52.ProfileActions.SwitchAvatar] = if v75 then {
                text = v111[v52.ProfileActions.SwitchAvatar], 
                icon = l_IconName_0.PersonStandingArrowReverse, 
                onActivated = function() --[[ Line: 605 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v121 (ref)
                    v104.fireAnalyticsEvent(v51.EditAppearanceMenuSwitchAvatar, {
                        buttonSurface = v98
                    });
                    v121();
                end
            } else nil, 
            [v52.ProfileActions.EditProfile] = {
                component = v5.Button, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.Standard, 
                text = v111[v52.ProfileActions.EditProfile], 
                onActivated = function() --[[ Line: 618 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (ref), v104 (ref), v51 (ref), v98 (ref), v101 (ref), v52 (ref), l_editUsername_0 (ref), v100 (ref), v45 (ref), l_profileId_0 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref)
                    v34.Stopwatch.start(v34.Events.EditProfileOpened);
                    v104.fireAnalyticsEvent(v51.CTAButtonOpenEditProfilePage, {
                        buttonSurface = v98
                    });
                    v101.navigate(v52.Screens.EditProfilePage, {
                        profileScreens = v52.Screens, 
                        navigateToEditUsername = function(v143) --[[ Line: 625 ]] --[[ Name: navigateToEditUsername ]]
                            -- upvalues: l_editUsername_0 (ref), v100 (ref), v45 (ref), l_profileId_0 (ref)
                            l_editUsername_0({
                                showToast = v143, 
                                onUsernameChanged = function() --[[ Line: 628 ]] --[[ Name: onUsernameChanged ]]
                                    -- upvalues: v100 (ref), v45 (ref), l_profileId_0 (ref)
                                    v100(v45(l_profileId_0));
                                end
                            });
                        end, 
                        onIdentityChange = function() --[[ Line: 633 ]] --[[ Name: onIdentityChange ]]
                            -- upvalues: v100 (ref), v45 (ref), l_profileId_0 (ref)
                            v100(v45(l_profileId_0));
                        end, 
                        onToggleInExperienceMode = l_FFlagMoveInExperienceModeToEditProfile_0 and function() --[[ Line: 637 ]]
                            -- upvalues: v100 (ref), v45 (ref), l_profileId_0 (ref), v104 (ref), v51 (ref)
                            v100(v45(l_profileId_0));
                            v104.fireAnalyticsEvent(v51.ToggleInExperienceModeButton, {});
                        end or nil
                    });
                end
            }, 
            [v52.ProfileActions.IgnoreFriendRequest] = {
                text = v111[v52.ProfileActions.IgnoreFriendRequest], 
                onActivated = function() --[[ Line: 647 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v35 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonIgnoreFriendRequest, {
                        buttonSurface = v98
                    });
                    return v100(v35.DeclineFriendRequestFromUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v99
                    })):andThen(function() --[[ Line: 654 ]]
                        -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v100(l_SetCurrentToastMessage_0({
                            toastMessage = v111.friendRequestIgnoredToast, 
                            toastIcon = l_Images_0["icons/actions/reject"], 
                            isLocalized = true
                        }));
                        return v100(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.JoinExperience] = {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                isLoading = v117.isLoading, 
                isDisabled = not v117.isInExperience, 
                text = v111[v52.ProfileActions.JoinExperience], 
                onActivated = function() --[[ Line: 671 ]] --[[ Name: onActivated ]]
                    -- upvalues: v117 (ref)
                    v117.joinExperience();
                end
            }, 
            [v52.ProfileActions.PendingFriendRequest] = {
                buttonType = l_ButtonType_0.Secondary, 
                variant = l_ButtonVariant_0.Subtle, 
                text = v111[v52.ProfileActions.PendingFriendRequest], 
                onActivated = function() --[[ Line: 680 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.QrCode] = {
                text = v111[v52.ProfileActions.QrCode], 
                icon = l_IconName_0.SquaresGridQr, 
                onActivated = function() --[[ Line: 686 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), l_qRCodePage_0 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonShareProfileQRCode, {
                        buttonSurface = v98
                    });
                    l_qRCodePage_0();
                end
            }, 
            [v52.ProfileActions.ShareProfile] = {
                component = v5.Button, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.Standard, 
                text = v111[v52.ProfileActions.ShareProfile], 
                onActivated = function() --[[ Line: 698 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v125 (ref), l_default_0 (ref), l_Contexts_0 (ref), v108 (ref), l_profileId_0 (ref), v100 (ref), l_SetCurrentToastMessage_0 (ref), v40 (ref), v124 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonShareProfile, {
                        buttonSurface = v98
                    });
                    if v125 then
                        l_default_0:setClipboardText({
                            context = l_Contexts_0.ProfileCard, 
                            text = string.format("%s/%s", v108, l_profileId_0)
                        });
                        v100(l_SetCurrentToastMessage_0({
                            toastMessage = v40.LinkCopied
                        }));
                        return;
                    else
                        v124.onActivated();
                        return;
                    end;
                end
            }, 
            [v52.ProfileActions.Report] = {
                text = v111[v52.ProfileActions.Report], 
                onActivated = function() --[[ Line: 717 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v62 (ref), l_profileType_0 (ref), v52 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v73 (ref), l_AbuseVector_0 (ref), v100 (ref), l_OpenDynamicAbuseReport_0 (ref), l_profileId_0 (ref), l_CloseCentralOverlay_0 (ref), v44 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v40 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonReport, {
                        buttonSurface = v98
                    });
                    local v144 = nil;
                    if v62 then
                        if l_profileType_0 == v52.ProfileTypes.User then
                            v144 = "userprofile";
                        elseif l_profileType_0 == v52.ProfileTypes.Community then
                            v144 = "group";
                        end;
                    end;
                    if l_FFlagEnableAbuseReportRevampFlow_0 and v73 then
                        local l_UserProfile_0 = l_AbuseVector_0.UserProfile;
                        if v62 and l_profileType_0 == v52.ProfileTypes.Community then
                            l_UserProfile_0 = l_AbuseVector_0.Group;
                        end;
                        v100(l_OpenDynamicAbuseReport_0({
                            abuseVector = l_UserProfile_0, 
                            targetId = l_profileId_0, 
                            onClose = function() --[[ Line: 740 ]] --[[ Name: onClose ]]
                                -- upvalues: v100 (ref), l_CloseCentralOverlay_0 (ref), v44 (ref), l_profileId_0 (ref)
                                v100(l_CloseCentralOverlay_0());
                                v100(v44(l_profileId_0));
                            end
                        }));
                        return;
                    else
                        v100(l_NavigateDown_0({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = if v62 then ("%*abusereport/%*?id=%*"):format(l_Url_0.BASE_URL, v144, l_profileId_0) else string.format("%sabusereport/userprofile?id=%s", l_Url_0.BASE_URL, l_profileId_0), 
                            extraProps = {
                                titleKey = v40.Report
                            }
                        }));
                        return;
                    end;
                end
            }, 
            [v52.ProfileActions.Unblock] = {
                text = v111[v52.ProfileActions.Unblock], 
                onActivated = function() --[[ Line: 760 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v48 (ref), l_profileId_0 (ref), v99 (ref), v44 (ref), l_USER_BLOCKING_ERRORS_0 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), v67 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonUnblock, {
                        buttonSurface = v98
                    });
                    return v100(v48.UnblockUserById.API({
                        userId = l_profileId_0, 
                        currentUserId = v99
                    })):andThen(function() --[[ Line: 768 ]]
                        -- upvalues: v100 (ref), v44 (ref), l_profileId_0 (ref)
                        return v100(v44(l_profileId_0));
                    end):catch(function(v146) --[[ Line: 771 ]]
                        -- upvalues: l_USER_BLOCKING_ERRORS_0 (ref), v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), v67 (ref)
                        if v146 ~= nil and tonumber(v146.Body) == l_USER_BLOCKING_ERRORS_0.PARENT_BLOCKED_TARGET_USER_ERROR then
                            v100(l_SetCurrentToastMessage_0({
                                toastMessage = v111.unblockTargetParentManagedToast, 
                                isLocalized = true
                            }));
                            return;
                        elseif v146 ~= nil and tonumber(v146.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
                            v100(l_SetCurrentToastMessage_0({
                                toastMessage = v111.unblockTargetNotBlockedToast, 
                                isLocalized = true
                            }));
                            return;
                        elseif v67 and v146 ~= nil and tonumber(v146.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
                            v100(l_SetCurrentToastMessage_0({
                                toastMessage = v111.blockedOnPlatformToast, 
                                isLocalized = true
                            }));
                            return;
                        else
                            v100(l_SetCurrentToastMessage_0({
                                toastMessage = v111.somethingIsWrongToast, 
                                isLocalized = true
                            }));
                            return;
                        end;
                    end);
                end
            }, 
            [v52.ProfileActions.Unfriend] = {
                text = v111[v52.ProfileActions.Unfriend], 
                onActivated = function() --[[ Line: 814 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v35 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonUnfriend, {
                        buttonSurface = v98
                    });
                    return v100(v35.UnfriendTargetUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v99
                    })):andThen(function() --[[ Line: 821 ]]
                        -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v100(l_SetCurrentToastMessage_0({
                            toastMessage = v111.friendRemovedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                            isLocalized = true
                        }));
                        return v100(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.CopyLink] = if v62 then {
                text = v111[v52.ProfileActions.CopyLink], 
                onActivated = function() --[[ Line: 834 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), l_default_0 (ref), l_Contexts_0 (ref), v93 (ref), l_profileId_0 (ref), v100 (ref), l_SetCurrentToastMessage_0 (ref), v40 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonCopyLink, {
                        buttonSurface = v98
                    });
                    l_default_0:setClipboardText({
                        context = l_Contexts_0.ProfileCard, 
                        text = string.format(v93, l_profileId_0)
                    });
                    v100(l_SetCurrentToastMessage_0({
                        toastMessage = v40.LinkCopied
                    }));
                end
            } else nil, 
            [v52.ProfileActions.JoinCommunity] = if v62 then {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v111[v52.ProfileActions.JoinCommunity], 
                onActivated = function() --[[ Line: 854 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v47 (ref), l_profileId_0 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonJoinCommunity, {
                        buttonSurface = v98
                    });
                    return v100(v47.JoinGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 861 ]]
                        -- upvalues: v100 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v100(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.CancelJoinCommunityRequest] = if v62 then {
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.Standard, 
                text = v111[v52.ProfileActions.CancelJoinCommunityRequest], 
                onActivated = function() --[[ Line: 877 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v47 (ref), l_profileId_0 (ref), v99 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonCancelJoinCommunityRequest, {
                        buttonSurface = v98
                    });
                    return v100(v47.CancelJoinGroupRequest.API({
                        groupId = l_profileId_0, 
                        userId = v99
                    })):andThen(function() --[[ Line: 885 ]]
                        -- upvalues: v100 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v100(v43({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = {
                                v52.Components.Actions
                            }
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.ViewCommunity] = if v62 then {
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.SubEmphasis, 
                text = v111[v52.ProfileActions.ViewCommunity], 
                onActivated = function() --[[ Line: 902 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_profileId_0 (ref), v40 (ref), v64 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonViewCommunity, {
                        buttonSurface = v98
                    });
                    v100(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.user.group({
                            groupId = l_profileId_0
                        }), 
                        extraProps = {
                            titleKey = v40.Community, 
                            onClose = function() --[[ Line: 912 ]] --[[ Name: onClose ]]
                                -- upvalues: v64 (ref), v100 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                                if v64 then
                                    v100(v42.API({
                                        profileType = l_profileType_0, 
                                        profileId = l_profileId_0, 
                                        components = v41(), 
                                        includeComponentOrdering = true
                                    }));
                                end;
                            end
                        }
                    }));
                end
            } else nil, 
            [v52.ProfileActions.ViewFullProfile] = if v65 then {
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.SubEmphasis, 
                text = v111[v52.ProfileActions.ViewFullProfile], 
                onActivated = function() --[[ Line: 932 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref), l_profileId_0 (ref), v40 (ref), v64 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonViewFullProfile, {
                        buttonSurface = v98
                    });
                    v100(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.new({
                            base = l_UrlBase_0.WWW, 
                            path = ("profiles/%*"):format(l_profileId_0)
                        })(), 
                        extraProps = {
                            titleKey = v40.Profile, 
                            onClose = function() --[[ Line: 945 ]] --[[ Name: onClose ]]
                                -- upvalues: v64 (ref), v100 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                                if v64 then
                                    v100(v42.API({
                                        profileType = l_profileType_0, 
                                        profileId = l_profileId_0, 
                                        components = v41(), 
                                        includeComponentOrdering = true
                                    }));
                                end;
                            end
                        }
                    }));
                end
            } else nil, 
            [v52.ProfileActions.LeaveCommunity] = if v62 then {
                text = v111[v52.ProfileActions.LeaveCommunity], 
                onActivated = function() --[[ Line: 963 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v47 (ref), l_profileId_0 (ref), v99 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonLeaveCommunity, {
                        buttonSurface = v98
                    });
                    return v100(v47.LeaveGroup.API({
                        groupId = l_profileId_0, 
                        userId = v99
                    })):andThen(function() --[[ Line: 971 ]]
                        -- upvalues: v100 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v100(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.MakePrimaryCommunity] = if v62 then {
                text = v111[v52.ProfileActions.MakePrimaryCommunity], 
                onActivated = function() --[[ Line: 985 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v47 (ref), l_profileId_0 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonMakePrimaryCommunity, {
                        buttonSurface = v98
                    });
                    return v100(v47.MakePrimaryGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 992 ]]
                        -- upvalues: v100 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v100(v43({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = {
                                v52.Components.Actions
                            }
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.RemovePrimaryCommunity] = if v62 then {
                text = v111[v52.ProfileActions.RemovePrimaryCommunity], 
                onActivated = function() --[[ Line: 1007 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v47 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonRemovePrimaryCommunity, {
                        buttonSurface = v98
                    });
                    return v100(v47.RemovePrimaryGroup.API()):andThen(function() --[[ Line: 1012 ]]
                        -- upvalues: v100 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v100(v43({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = {
                                v52.Components.Actions
                            }
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.Follow] = if v65 and l_profileType_0 == v52.ProfileTypes.Community then {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Standard, 
                text = v111[v52.ProfileActions.Follow], 
                onActivated = function() --[[ Line: 1030 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v47 (ref), l_profileId_0 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonFollow, {
                        buttonSurface = v98
                    });
                    return v100(v47.JoinGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 1036 ]]
                        -- upvalues: v100 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v100(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.Unfollow] = if v65 and l_profileType_0 == v52.ProfileTypes.Community then {
                text = v111[v52.ProfileActions.Unfollow], 
                onActivated = function() --[[ Line: 1051 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), v47 (ref), l_profileId_0 (ref), v99 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonUnfollow, {
                        buttonSurface = v98
                    });
                    return v100(v47.LeaveGroup.API({
                        groupId = l_profileId_0, 
                        userId = v99
                    })):andThen(function() --[[ Line: 1059 ]]
                        -- upvalues: v100 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v100(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.RemoveTrustedConnection] = {
                text = v111[v52.ProfileActions.RemoveTrustedConnection], 
                onActivated = function() --[[ Line: 1072 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v97 (ref), l_profileId_0 (ref), v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), v35 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonRemoveTrustedConnection, {
                        buttonSurface = v98
                    });
                    if l_FFlagLegacyProfileTCIndicator_0 then
                        return v97.removeTrustedConnectionRequest(l_profileId_0):andThen(function() --[[ Line: 1077 ]]
                            -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                            v100(l_SetCurrentToastMessage_0({
                                toastMessage = v111.trustedConnectionRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                isLocalized = true
                            }));
                            return v100(v44(l_profileId_0));
                        end);
                    else
                        return v100(v35.RemoveTC.API(l_profileId_0)):andThen(function() --[[ Line: 1086 ]]
                            -- upvalues: v100 (ref), l_SetCurrentToastMessage_0 (ref), v111 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                            v100(l_SetCurrentToastMessage_0({
                                toastMessage = v111.trustedConnectionRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                isLocalized = true
                            }));
                            return v100(v44(l_profileId_0));
                        end);
                    end;
                end
            }, 
            [v52.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v111[v52.ProfileActions.AddTrustedConnection], 
                onActivated = function() --[[ Line: 1100 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v101 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_Sources_0 (ref), v100 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonAddTrustedConnection, {
                        buttonSurface = v98
                    });
                    v101.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        source = l_Sources_0.ProfilePlatform, 
                        onRequestSent = function() --[[ Line: 1107 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v100 (ref), v44 (ref), l_profileId_0 (ref)
                            return v100(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.AddTrustedConnectionViaLink] = if l_FFlagTCShareLinkSenderUI_0 then {
                text = v111[v52.ProfileActions.AddTrustedConnection], 
                onActivated = function() --[[ Line: 1117 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), l_Sources_0 (ref), v101 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v100 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonAddTrustedConnection, {
                        buttonSurface = v98, 
                        modalVariantOverride = l_Sources_0.ShareLinkSender
                    });
                    v101.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        source = l_Sources_0.ProfilePlatform, 
                        modalVariantOverride = l_Sources_0.ShareLinkSender, 
                        onRequestSent = function() --[[ Line: 1126 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v100 (ref), v44 (ref), l_profileId_0 (ref)
                            return v100(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v111[v52.ProfileActions.AddIncomingTrustedConnection], 
                onActivated = function() --[[ Line: 1136 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v101 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v100 (ref), v44 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonAddIncomingTrustedConnection, {
                        buttonSurface = v98
                    });
                    v101.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        onRequestAccepted = function() --[[ Line: 1142 ]] --[[ Name: onRequestAccepted ]]
                            -- upvalues: v100 (ref), v44 (ref), l_profileId_0 (ref)
                            return v100(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.PendingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v111[v52.ProfileActions.AddTrustedConnection], 
                isDisabled = true, 
                onActivated = function() --[[ Line: 1153 ]] --[[ Name: onActivated ]]

                end
            } else nil, 
            [v52.ProfileActions.PendingIncomingTrustedConnection] = if v72 then {
                text = v111[v52.ProfileActions.AddIncomingTrustedConnection], 
                isDisabled = true, 
                onActivated = function() --[[ Line: 1160 ]] --[[ Name: onActivated ]]

                end
            } else nil, 
            [v52.ProfileActions.ViewAbout] = if l_FFlagProfilePlatformNewProfileHeader_0 then {
                text = v111[v52.ProfileActions.ViewAbout], 
                onActivated = function() --[[ Line: 1166 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v100 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v116 (ref)
                    v104.fireAnalyticsEvent(v51.CTAButtonViewFullProfile, {
                        buttonSurface = v98
                    });
                    v100(l_NavigateDown_0({
                        name = l_AppPage_0.AboutDetailsSheet, 
                        extraProps = {
                            sections = v116
                        }
                    }));
                end
            } else nil, 
            [v52.ProfileActions.ViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then {
                text = v111[v52.ProfileActions.ViewPlatformProfile], 
                onActivated = function() --[[ Line: 1183 ]] --[[ Name: onActivated ]]
                    -- upvalues: v104 (ref), v51 (ref), v98 (ref), v50 (ref), v114 (ref)
                    v104.fireAnalyticsEvent(v51.ContextualMenuButtonViewPlatformProfile, {
                        buttonSurface = v98
                    });
                    v50:ShowProfile(v114);
                end
            } else nil, 
            [v52.ProfileActions.CurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
                text = v111[v52.ProfileActions.CurrencyTransfer], 
                onActivated = function() --[[ Line: 1194 ]] --[[ Name: onActivated ]]
                    -- upvalues: v98 (ref), v52 (ref), v104 (ref), v51 (ref), v103 (ref), l_profileId_0 (ref), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
                    if v98 == v52.ButtonSurface.ContextualMenu then
                        v104.fireAnalyticsEvent(v51.ContextualMenuButtonCurrencyTransfer, {
                            buttonSurface = v98
                        });
                    else
                        v104.fireAnalyticsEvent(v51.CTAButtonCurrencyTransfer, {
                            buttonSurface = v98
                        });
                    end;
                    if v103 then
                        v103({
                            recipientUserId = l_profileId_0, 
                            direction = l_TransferDirection_0.Send, 
                            transferOrigination = l_TransferOrigination_0.Profile
                        });
                    end;
                end
            } else nil
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v100, 
        l_profileId_0, 
        v102, 
        if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v103 else nil, 
        l_qRCodePage_0, 
        v111, 
        v99, 
        v101, 
        l_editUsername_0, 
        v117.joinExperience, 
        v117.isLoading, 
        v104, 
        v123, 
        v98, 
        if l_FFlagProfilePlatformNewProfileHeader_0 then v116 else nil, 
        l_profileType_0, 
        l_editAvatar_0, 
        if v75 then v120 else nil, 
        if v75 then v121 else nil
    } else l_dependencyArray_0(v100, l_profileId_0, v102, if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v103 else nil, l_qRCodePage_0, v111, v99, v101, l_editUsername_0, v117.joinExperience, v117.isLoading, v104, v123, v98, if l_FFlagProfilePlatformNewProfileHeader_0 then v116 else nil, l_profileType_0, l_editAvatar_0, if v75 then v120 else nil, if v75 then v121 else nil)));
end;