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
local l_USER_BLOCKING_ERRORS_0 = v88.USER_BLOCKING_ERRORS;
local l_USER_FRIENDING_ERRORS_0 = v88.USER_FRIENDING_ERRORS;
local l_STATUS_CODES_0 = v88.STATUS_CODES;
local v92 = ("%*share/g/%%s"):format(l_Url_0.BASE_URL);
local v93 = tostring(DateTime.now().UnixTimestampMillis);
local function _(v94) --[[ Line: 114 ]] --[[ Name: areFollowActionsSupportedForProfileType ]]
    -- upvalues: v52 (copy)
    return v94 == v52.ProfileTypes.Community;
end;
local v96 = if l_FFlagLegacyProfileTCIndicator_0 then v60.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v97) --[[ Line: 124 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v20 (copy), v49 (copy), l_useShortUrl_0 (copy), l_useGetOrGenerateLinkUrl_0 (copy), l_useEffectOnce_0 (copy), v3 (copy), v93 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v40 (copy), l_useLocalization_0 (copy), v52 (copy), l_FFlagProfilePlatformAddTC_0 (copy), v75 (copy), v76 (copy), v62 (copy), v65 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagEnablePlatformProfileContextualMenuOption_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), v46 (copy), l_useJoinUserInExperience_0 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_useProfileShareLink_0 (copy), l_Contexts_0 (copy), l_ProfileSharePolicyEnum_0 (copy), l_USER_FRIENDING_ERRORS_0 (copy), l_STATUS_CODES_0 (copy), l_HttpService_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ButtonVariant_0 (copy), v51 (copy), v35 (copy), l_Images_0 (copy), v44 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_ButtonType_0 (copy), l_ContextualInfoTypes_0 (copy), v43 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_ChatEntryPointNames_0 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy), v34 (copy), v10 (copy), l_IconName_0 (copy), v5 (copy), v45 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), l_default_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v73 (copy), l_AbuseVector_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_CloseCentralOverlay_0 (copy), l_Url_0 (copy), v48 (copy), l_USER_BLOCKING_ERRORS_0 (copy), v67 (copy), v92 (copy), v47 (copy), v42 (copy), v41 (copy), l_UrlBuilder_0 (copy), v64 (copy), l_UrlBase_0 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v96 (copy), l_Sources_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v72 (copy), v50 (copy), l_TransferDirection_0 (copy), l_TransferOrigination_0 (copy), l_dependencyArray_0 (copy)
    local v98 = l_useLocalUserId_0();
    local v99 = l_useDispatch_0();
    local v100 = l_useNavigation_0();
    local v101 = v20();
    local v102 = v101.navigateTo and v101.navigateTo.navigateToTransfer or nil;
    local v103 = v49();
    local v104 = l_useShortUrl_0();
    local v105 = l_useGetOrGenerateLinkUrl_0();
    local v106 = v104 ~= nil;
    l_useEffectOnce_0(v105, not v106);
    local v107 = v3.useMemo(function() --[[ Line: 138 ]]
        -- upvalues: v104 (copy), v93 (ref)
        return string.format("%s&source=ProfileShare&stamp=%s", v104 or "", v93);
    end, {
        v104
    });
    local v108 = if l_FFlagConnectionsToFriendsRename_0 then v40.AcceptFriend else v40.AcceptConnection;
    local v109 = if l_FFlagConnectionsToFriendsRename_0 then v40.AddFriend else v40.AddConnection;
    local v110 = l_useLocalization_0({
        [v52.ProfileActions.AcceptFriendRequest] = v108, 
        [v52.ProfileActions.AcceptOffNetworkFriendRequest] = v108, 
        [v52.ProfileActions.AddFriend] = v109, 
        [v52.ProfileActions.AddFriendFromContacts] = v109, 
        [v52.ProfileActions.AddFriendFromContactsSent] = v40.PendingRequest, 
        [v52.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v40.AddTrustedConnection else nil, 
        [v52.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v40.AcceptTrustedConnection else nil, 
        [v52.ProfileActions.Block] = v40.Block, 
        [v52.ProfileActions.CannotAddFriend] = v109, 
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
    local v111 = v3.useCallback(function() --[[ Line: 259 ]]
        -- upvalues: v101 (copy)
        v101.navigateTo.previousView(true);
    end, {
        v101.navigateTo.previousView
    });
    local l_profileId_0 = v101.profileId;
    local v113 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v101.profilePlatformId else nil;
    local l_profileType_0 = v101.profileType;
    local v115 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        v115 = v46().aboutSections;
    end;
    local v116 = l_useJoinUserInExperience_0(l_profileId_0, {
        isHomePageCarousel = v101.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
        homepageCarouselAbsolutePosition = v101.sourceInfo.homepageCarouselAbsolutePosition, 
        openGameDetailsPeekViewClosed = v111
    });
    local l_qRCodePage_0 = v101.navigateTo.qRCodePage;
    local l_editUsername_0 = v101.navigateTo.editUsername;
    local v119 = if v75 then v101.navigateTo.editEmotes else nil;
    local v120 = if v75 then v101.navigateTo.switchAvatar else nil;
    local l_editAvatar_0 = v101.navigateTo.editAvatar;
    local v122 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v123 = l_useProfileShareLink_0({
        context = l_Contexts_0.ProfileCard
    });
    local v124 = v123.policy == l_ProfileSharePolicyEnum_0.Disabled;
    local v125 = {
        [l_USER_FRIENDING_ERRORS_0.INVALID_TARGET_USER_ERROR] = v110.invalidTargetUserError, 
        [l_USER_FRIENDING_ERRORS_0.ALREADY_FRIEND_ERROR] = v110.alreadyFriendError, 
        [l_USER_FRIENDING_ERRORS_0.MAX_FRIENDS_ERROR] = v110.maxFriendsError, 
        [l_USER_FRIENDING_ERRORS_0.INVALID_NICKNAME_ERROR] = v110.invalidNicknameError
    };
    local v126 = {
        [l_USER_FRIENDING_ERRORS_0.UNAUTHORIZED_ERROR] = v110.unauthorizedError
    };
    local v127 = {
        [l_USER_FRIENDING_ERRORS_0.USER_BANNED_ERROR] = v110.userBannedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_BLOCKED_ERROR] = v110.userBlockedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_NOT_PASSED_CAPTCHA_ERROR] = v110.userNotPassedCaptchaError
    };
    local v128 = {
        [l_USER_FRIENDING_ERRORS_0.TOO_MANY_REQUESTS_ERROR] = v110.tooManyRequestsError
    };
    local function _(v129, v130, v131) --[[ Line: 316 ]] --[[ Name: getErrorToastMessage ]]
        -- upvalues: v52 (ref), l_STATUS_CODES_0 (ref), v125 (copy), v126 (copy), v127 (copy), v128 (copy)
        if v129 == v52.ProfileActions.AddFriend or v129 == v52.ProfileActions.AddFriendFromContacts then
            if v130 == l_STATUS_CODES_0.BAD_REQUEST then
                return v125[v131];
            elseif v130 == l_STATUS_CODES_0.UNAUTHORIZED then
                return v126[v131];
            elseif v130 == l_STATUS_CODES_0.FORBIDDEN then
                return v127[v131];
            elseif v130 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then
                return v128[v131];
            end;
        end;
        return nil;
    end;
    local function v139(v133, v134) --[[ Line: 331 ]] --[[ Name: setErrorToast ]]
        -- upvalues: l_HttpService_0 (ref), v52 (ref), l_STATUS_CODES_0 (ref), v125 (copy), v126 (copy), v127 (copy), v128 (copy), v110 (copy), v99 (copy), l_SetCurrentToastMessage_0 (ref)
        if v134 ~= nil then
            local l_StatusCode_0 = v134.StatusCode;
            local v136 = if v134.Body then l_HttpService_0:JSONDecode(v134.Body) else nil;
            local v137 = if v136 and v136.errors and v136.errors[1] and v136.errors[1].code then v136.errors[1].code else nil;
            local v138 = (if not (v133 ~= v52.ProfileActions.AddFriend) or v133 == v52.ProfileActions.AddFriendFromContacts then if l_StatusCode_0 == l_STATUS_CODES_0.BAD_REQUEST then v125[v137] else if l_StatusCode_0 == l_STATUS_CODES_0.UNAUTHORIZED then v126[v137] else if l_StatusCode_0 == l_STATUS_CODES_0.FORBIDDEN then v127[v137] else if l_StatusCode_0 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then v128[v137] else nil else nil) or v110.defaultFriendingError;
            v99(l_SetCurrentToastMessage_0({
                toastMessage = v138, 
                isLocalized = true
            }));
            return;
        else
            v99(l_SetCurrentToastMessage_0({
                toastMessage = v110.defaultFriendingError, 
                isLocalized = true
            }));
            return;
        end;
    end;
    return (v3.useMemo(function() --[[ Line: 355 ]]
        -- upvalues: v52 (ref), v110 (copy), l_ButtonVariant_0 (ref), v103 (copy), v51 (ref), v97 (copy), v101 (copy), v99 (copy), v35 (ref), l_profileId_0 (copy), v98 (copy), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v44 (ref), l_FriendRequestNicknamesIXP_0 (ref), v122 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v139 (copy), l_ButtonType_0 (ref), l_ContextualInfoTypes_0 (ref), v43 (ref), l_profileType_0 (copy), v100 (copy), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref), v34 (ref), v10 (ref), v75 (ref), l_IconName_0 (ref), l_editAvatar_0 (copy), v76 (ref), v119 (copy), v120 (copy), v5 (ref), l_editUsername_0 (copy), v45 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref), v116 (copy), l_qRCodePage_0 (copy), v124 (copy), l_default_0 (ref), l_Contexts_0 (ref), v107 (copy), v40 (ref), v123 (copy), v62 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v73 (ref), l_AbuseVector_0 (ref), l_OpenDynamicAbuseReport_0 (ref), l_CloseCentralOverlay_0 (ref), l_Url_0 (ref), v48 (ref), l_USER_BLOCKING_ERRORS_0 (ref), v67 (ref), v92 (ref), v47 (ref), v42 (ref), v41 (ref), l_UrlBuilder_0 (ref), v64 (ref), v65 (ref), l_UrlBase_0 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v96 (ref), l_FFlagProfilePlatformAddTC_0 (ref), l_Sources_0 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), v72 (ref), l_FFlagProfilePlatformNewProfileHeader_0 (ref), v115 (ref), l_FFlagEnablePlatformProfileContextualMenuOption_0 (ref), v50 (ref), v113 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v102 (copy), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
        return {
            [v52.ProfileActions.AcceptFriendRequest] = {
                text = v110[v52.ProfileActions.AcceptFriendRequest], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 360 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v101 (ref), v52 (ref), v99 (ref), v35 (ref), l_profileId_0 (ref), v98 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonAcceptFriendRequest, {
                        buttonSurface = v97, 
                        absolutePosition = v101.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v101.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v101.sourceInfo.isRecommendation, 
                        source = v101.sourceInfo.source, 
                        contextualInfoType = v101.sourceInfo.contextualInfoType, 
                        recommendationContextType = v101.sourceInfo.recommendationContextType, 
                        recommendationRank = v101.sourceInfo.recommendationRank, 
                        recommendationSessionId = v101.sourceInfo.recommendationSessionId
                    });
                    return v99(v35.AcceptFriendRequestFromUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v98
                    })):andThen(function() --[[ Line: 376 ]]
                        -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v99(l_SetCurrentToastMessage_0({
                            toastMessage = v110.friendAcceptedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v99(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.AcceptOffNetworkFriendRequest] = {
                text = v110[v52.ProfileActions.AcceptOffNetworkFriendRequest], 
                onActivated = function() --[[ Line: 388 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v101 (ref), v99 (ref), v35 (ref), l_profileId_0 (ref), v98 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonAddFriendFromContacts, {
                        shareLinkId = v101.sourceInfo.shareLinkId
                    });
                    return v99(v35.AcceptFriendRequestWithToken.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v98, 
                        friendingToken = v101.offNetworkFriendRequestToken
                    })):andThen(function() --[[ Line: 396 ]]
                        -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v99(l_SetCurrentToastMessage_0({
                            toastMessage = v110.friendAcceptedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v99(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.AddFriend] = {
                text = v110[v52.ProfileActions.AddFriend], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 409 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v101 (ref), v52 (ref), l_FriendRequestNicknamesIXP_0 (ref), v122 (ref), v99 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v35 (ref), v98 (ref), v44 (ref), v139 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonAddFriend, {
                        buttonSurface = v97, 
                        absolutePosition = v101.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v101.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v101.sourceInfo.isRecommendation, 
                        source = v101.sourceInfo.source, 
                        contextualInfoType = v101.sourceInfo.contextualInfoType, 
                        recommendationContextType = v101.sourceInfo.recommendationContextType, 
                        recommendationRank = v101.sourceInfo.recommendationRank, 
                        recommendationSessionId = v101.sourceInfo.recommendationSessionId
                    });
                    if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v122 then
                        return v99(l_NavigateDown_0({
                            name = l_AppPage_0.SetNicknameModal, 
                            extraProps = {
                                friendRequestParams = {
                                    targetUserId = l_profileId_0, 
                                    source = v101.sourceInfo.friendshipOriginSourceType
                                }
                            }
                        }));
                    else
                        v99(l_SetCurrentToastMessage_0({
                            toastMessage = v110.friendRequestSentToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v99(v35.RequestFriendshipFromUserId.API({
                            targetUserId = l_profileId_0, 
                            currentUserId = v98, 
                            friendshipOriginSourceType = v101.sourceInfo.friendshipOriginSourceType
                        })):andThen(function() --[[ Line: 444 ]]
                            -- upvalues: v99 (ref), v44 (ref), l_profileId_0 (ref)
                            return v99(v44(l_profileId_0));
                        end):catch(function(v140) --[[ Line: 447 ]]
                            -- upvalues: v139 (ref), v52 (ref)
                            v139(v52.ProfileActions.AddFriend, v140);
                        end);
                    end;
                end
            }, 
            [v52.ProfileActions.AddFriendFromContacts] = {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v110[v52.ProfileActions.AddFriendFromContacts], 
                onActivated = function() --[[ Line: 457 ]] --[[ Name: onActivated ]]
                    -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v35 (ref), v98 (ref), l_profileId_0 (ref), l_ContextualInfoTypes_0 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref), v139 (ref)
                    v99(l_SetCurrentToastMessage_0({
                        toastMessage = v110.friendRequestSentToast, 
                        toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isLocalized = true
                    }));
                    return v99(v35.RequestFriendshipFromContactId.API({
                        currentUserId = v98, 
                        contactId = l_profileId_0, 
                        contextType = l_ContextualInfoTypes_0.Contacts
                    })):andThen(function() --[[ Line: 468 ]]
                        -- upvalues: v99 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        return v99(v43({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = {
                                v52.Components.ContactProfileHeader, 
                                v52.Components.Actions, 
                                v52.Components.ContactDescription
                            }
                        }));
                    end):catch(function(v141) --[[ Line: 479 ]]
                        -- upvalues: v139 (ref), v52 (ref)
                        v139(v52.ProfileActions.AddFriendFromContacts, v141);
                    end);
                end
            }, 
            [v52.ProfileActions.AddFriendFromContactsSent] = {
                buttonType = l_ButtonType_0.Secondary, 
                variant = l_ButtonVariant_0.Subtle, 
                text = v110[v52.ProfileActions.AddFriendFromContactsSent], 
                onActivated = function() --[[ Line: 488 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.Block] = {
                text = v110[v52.ProfileActions.Block], 
                onActivated = function() --[[ Line: 493 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v100 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonBlock, {
                        buttonSurface = v97
                    });
                    v100.push(l_AppPage_0.BlockingModal, {
                        navProps = {
                            userId = l_profileId_0, 
                            onBlockSuccess = function() --[[ Line: 500 ]] --[[ Name: onBlockSuccess ]]
                                -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                                v99(l_SetCurrentToastMessage_0({
                                    toastMessage = v110.userBlockedToast, 
                                    toastIcon = l_Images_0["icons/actions/block"], 
                                    isLocalized = true
                                }));
                                v99(v44(l_profileId_0));
                            end
                        }
                    });
                end
            }, 
            [v52.ProfileActions.CannotAddFriend] = {
                text = v110[v52.ProfileActions.CannotAddFriend], 
                onActivated = function() --[[ Line: 515 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.Chat] = {
                text = v110[v52.ProfileActions.Chat], 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = function() --[[ Line: 521 ]] --[[ Name: onActivated ]]
                    -- upvalues: v97 (ref), v52 (ref), v103 (ref), v51 (ref), v99 (ref), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_profileId_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
                    if v97 == v52.ButtonSurface.ContextualMenu then
                        v103.fireAnalyticsEvent(v51.ContextualMenuButtonChat, {
                            buttonSurface = v97
                        });
                    else
                        v103.fireAnalyticsEvent(v51.CTAButtonChat, {
                            buttonSurface = v97
                        });
                    end;
                    v99(l_EnteredChatFromEntryPoint_0(l_ChatEntryPointNames_0.ProfilePeekView));
                    l_GuiService_0:BroadcastNotification(l_profileId_0, l_l_GuiService_0_NotificationTypeList_0.LAUNCH_CONVERSATION);
                end
            }, 
            [v52.ProfileActions.EditAlias] = {
                text = v110[v52.ProfileActions.EditAlias], 
                onActivated = function() --[[ Line: 538 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (ref), v103 (ref), v51 (ref), v97 (ref), v100 (ref), v52 (ref), l_profileId_0 (ref), v10 (ref)
                    v34.Stopwatch.start(v34.Events.CustomizeNameOpened);
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonSetAlias, {
                        buttonSurface = v97
                    });
                    v100.navigate(v52.Screens.SetAliasModal, {
                        profileUserId = l_profileId_0, 
                        origin = v10.Analytics.EntryPoints.ContextualMenu
                    });
                end
            }, 
            [v52.ProfileActions.EditAppearance] = if v75 then {
                text = v110[v52.ProfileActions.EditAppearance], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 553 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonEditAppearance, {
                        buttonSurface = v97
                    });
                end
            } else nil, 
            [v52.ProfileActions.EditAvatar] = {
                text = v110[v52.ProfileActions.EditAvatar], 
                icon = if v75 then l_IconName_0.Person else nil, 
                onActivated = function() --[[ Line: 563 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v75 (ref), v51 (ref), v97 (ref), l_editAvatar_0 (ref)
                    v103.fireAnalyticsEvent(if v75 then v51.EditAppearanceMenuEditAvatar else v51.CTAButtonEditAvatar, {
                        buttonSurface = v97
                    });
                    l_editAvatar_0();
                end
            }, 
            [v52.ProfileActions.EditLook] = if v76 then {
                text = v110[v52.ProfileActions.EditLook], 
                icon = l_IconName_0.Person, 
                onActivated = function() --[[ Line: 579 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), l_editAvatar_0 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonEditLook, {
                        buttonSurface = v97
                    });
                    l_editAvatar_0();
                end
            } else nil, 
            [v52.ProfileActions.EditEmotes] = if v75 then {
                text = v110[v52.ProfileActions.EditEmotes], 
                icon = l_IconName_0.SquareFaceWavingHand, 
                onActivated = function() --[[ Line: 591 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v119 (ref)
                    v103.fireAnalyticsEvent(v51.EditAppearanceMenuEditEmote, {
                        buttonSurface = v97
                    });
                    v119();
                end
            } else nil, 
            [v52.ProfileActions.SwitchAvatar] = if v75 then {
                text = v110[v52.ProfileActions.SwitchAvatar], 
                icon = l_IconName_0.PersonStandingArrowReverse, 
                onActivated = function() --[[ Line: 603 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v120 (ref)
                    v103.fireAnalyticsEvent(v51.EditAppearanceMenuSwitchAvatar, {
                        buttonSurface = v97
                    });
                    v120();
                end
            } else nil, 
            [v52.ProfileActions.EditProfile] = {
                component = v5.Button, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.Standard, 
                text = v110[v52.ProfileActions.EditProfile], 
                onActivated = function() --[[ Line: 616 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (ref), v103 (ref), v51 (ref), v97 (ref), v100 (ref), v52 (ref), l_editUsername_0 (ref), v99 (ref), v45 (ref), l_profileId_0 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref)
                    v34.Stopwatch.start(v34.Events.EditProfileOpened);
                    v103.fireAnalyticsEvent(v51.CTAButtonOpenEditProfilePage, {
                        buttonSurface = v97
                    });
                    v100.navigate(v52.Screens.EditProfilePage, {
                        profileScreens = v52.Screens, 
                        navigateToEditUsername = function(v142) --[[ Line: 623 ]] --[[ Name: navigateToEditUsername ]]
                            -- upvalues: l_editUsername_0 (ref), v99 (ref), v45 (ref), l_profileId_0 (ref)
                            l_editUsername_0({
                                showToast = v142, 
                                onUsernameChanged = function() --[[ Line: 626 ]] --[[ Name: onUsernameChanged ]]
                                    -- upvalues: v99 (ref), v45 (ref), l_profileId_0 (ref)
                                    v99(v45(l_profileId_0));
                                end
                            });
                        end, 
                        onIdentityChange = function() --[[ Line: 631 ]] --[[ Name: onIdentityChange ]]
                            -- upvalues: v99 (ref), v45 (ref), l_profileId_0 (ref)
                            v99(v45(l_profileId_0));
                        end, 
                        onToggleInExperienceMode = l_FFlagMoveInExperienceModeToEditProfile_0 and function() --[[ Line: 635 ]]
                            -- upvalues: v99 (ref), v45 (ref), l_profileId_0 (ref), v103 (ref), v51 (ref)
                            v99(v45(l_profileId_0));
                            v103.fireAnalyticsEvent(v51.ToggleInExperienceModeButton, {});
                        end or nil
                    });
                end
            }, 
            [v52.ProfileActions.IgnoreFriendRequest] = {
                text = v110[v52.ProfileActions.IgnoreFriendRequest], 
                onActivated = function() --[[ Line: 645 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v35 (ref), l_profileId_0 (ref), v98 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonIgnoreFriendRequest, {
                        buttonSurface = v97
                    });
                    return v99(v35.DeclineFriendRequestFromUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v98
                    })):andThen(function() --[[ Line: 652 ]]
                        -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v99(l_SetCurrentToastMessage_0({
                            toastMessage = v110.friendRequestIgnoredToast, 
                            toastIcon = l_Images_0["icons/actions/reject"], 
                            isLocalized = true
                        }));
                        return v99(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.JoinExperience] = {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                isLoading = v116.isLoading, 
                isDisabled = not v116.isInExperience, 
                text = v110[v52.ProfileActions.JoinExperience], 
                onActivated = function() --[[ Line: 669 ]] --[[ Name: onActivated ]]
                    -- upvalues: v116 (ref)
                    v116.joinExperience();
                end
            }, 
            [v52.ProfileActions.PendingFriendRequest] = {
                buttonType = l_ButtonType_0.Secondary, 
                variant = l_ButtonVariant_0.Subtle, 
                text = v110[v52.ProfileActions.PendingFriendRequest], 
                onActivated = function() --[[ Line: 678 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.QrCode] = {
                text = v110[v52.ProfileActions.QrCode], 
                icon = l_IconName_0.SquaresGridQr, 
                onActivated = function() --[[ Line: 684 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), l_qRCodePage_0 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonShareProfileQRCode, {
                        buttonSurface = v97
                    });
                    l_qRCodePage_0();
                end
            }, 
            [v52.ProfileActions.ShareProfile] = {
                component = v5.Button, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.Standard, 
                text = v110[v52.ProfileActions.ShareProfile], 
                onActivated = function() --[[ Line: 696 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v124 (ref), l_default_0 (ref), l_Contexts_0 (ref), v107 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v40 (ref), v123 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonShareProfile, {
                        buttonSurface = v97
                    });
                    if v124 then
                        l_default_0:setClipboardText({
                            context = l_Contexts_0.ProfileCard, 
                            text = string.format("%s/%s", v107, l_profileId_0)
                        });
                        v99(l_SetCurrentToastMessage_0({
                            toastMessage = v40.LinkCopied
                        }));
                        return;
                    else
                        v123.onActivated();
                        return;
                    end;
                end
            }, 
            [v52.ProfileActions.Report] = {
                text = v110[v52.ProfileActions.Report], 
                onActivated = function() --[[ Line: 715 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v62 (ref), l_profileType_0 (ref), v52 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v73 (ref), l_AbuseVector_0 (ref), v99 (ref), l_OpenDynamicAbuseReport_0 (ref), l_profileId_0 (ref), l_CloseCentralOverlay_0 (ref), v44 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v40 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonReport, {
                        buttonSurface = v97
                    });
                    local v143 = nil;
                    if v62 then
                        if l_profileType_0 == v52.ProfileTypes.User then
                            v143 = "userprofile";
                        elseif l_profileType_0 == v52.ProfileTypes.Community then
                            v143 = "group";
                        end;
                    end;
                    if l_FFlagEnableAbuseReportRevampFlow_0 and v73 then
                        local l_UserProfile_0 = l_AbuseVector_0.UserProfile;
                        if v62 and l_profileType_0 == v52.ProfileTypes.Community then
                            l_UserProfile_0 = l_AbuseVector_0.Group;
                        end;
                        v99(l_OpenDynamicAbuseReport_0({
                            abuseVector = l_UserProfile_0, 
                            targetId = l_profileId_0, 
                            onClose = function() --[[ Line: 738 ]] --[[ Name: onClose ]]
                                -- upvalues: v99 (ref), l_CloseCentralOverlay_0 (ref), v44 (ref), l_profileId_0 (ref)
                                v99(l_CloseCentralOverlay_0());
                                v99(v44(l_profileId_0));
                            end
                        }));
                        return;
                    else
                        v99(l_NavigateDown_0({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = if v62 then ("%*abusereport/%*?id=%*"):format(l_Url_0.BASE_URL, v143, l_profileId_0) else string.format("%sabusereport/userprofile?id=%s", l_Url_0.BASE_URL, l_profileId_0), 
                            extraProps = {
                                titleKey = v40.Report
                            }
                        }));
                        return;
                    end;
                end
            }, 
            [v52.ProfileActions.Unblock] = {
                text = v110[v52.ProfileActions.Unblock], 
                onActivated = function() --[[ Line: 758 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v48 (ref), l_profileId_0 (ref), v98 (ref), v44 (ref), l_USER_BLOCKING_ERRORS_0 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), v67 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonUnblock, {
                        buttonSurface = v97
                    });
                    return v99(v48.UnblockUserById.API({
                        userId = l_profileId_0, 
                        currentUserId = v98
                    })):andThen(function() --[[ Line: 766 ]]
                        -- upvalues: v99 (ref), v44 (ref), l_profileId_0 (ref)
                        return v99(v44(l_profileId_0));
                    end):catch(function(v145) --[[ Line: 769 ]]
                        -- upvalues: l_USER_BLOCKING_ERRORS_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), v67 (ref)
                        if v145 ~= nil and tonumber(v145.Body) == l_USER_BLOCKING_ERRORS_0.PARENT_BLOCKED_TARGET_USER_ERROR then
                            v99(l_SetCurrentToastMessage_0({
                                toastMessage = v110.unblockTargetParentManagedToast, 
                                isLocalized = true
                            }));
                            return;
                        elseif v145 ~= nil and tonumber(v145.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
                            v99(l_SetCurrentToastMessage_0({
                                toastMessage = v110.unblockTargetNotBlockedToast, 
                                isLocalized = true
                            }));
                            return;
                        elseif v67 and v145 ~= nil and tonumber(v145.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
                            v99(l_SetCurrentToastMessage_0({
                                toastMessage = v110.blockedOnPlatformToast, 
                                isLocalized = true
                            }));
                            return;
                        else
                            v99(l_SetCurrentToastMessage_0({
                                toastMessage = v110.somethingIsWrongToast, 
                                isLocalized = true
                            }));
                            return;
                        end;
                    end);
                end
            }, 
            [v52.ProfileActions.Unfriend] = {
                text = v110[v52.ProfileActions.Unfriend], 
                onActivated = function() --[[ Line: 812 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v35 (ref), l_profileId_0 (ref), v98 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonUnfriend, {
                        buttonSurface = v97
                    });
                    return v99(v35.UnfriendTargetUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v98
                    })):andThen(function() --[[ Line: 819 ]]
                        -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v99(l_SetCurrentToastMessage_0({
                            toastMessage = v110.friendRemovedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                            isLocalized = true
                        }));
                        return v99(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.CopyLink] = if v62 then {
                text = v110[v52.ProfileActions.CopyLink], 
                onActivated = function() --[[ Line: 832 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), l_default_0 (ref), l_Contexts_0 (ref), v92 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v40 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonCopyLink, {
                        buttonSurface = v97
                    });
                    l_default_0:setClipboardText({
                        context = l_Contexts_0.ProfileCard, 
                        text = string.format(v92, l_profileId_0)
                    });
                    v99(l_SetCurrentToastMessage_0({
                        toastMessage = v40.LinkCopied
                    }));
                end
            } else nil, 
            [v52.ProfileActions.JoinCommunity] = if v62 then {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v110[v52.ProfileActions.JoinCommunity], 
                onActivated = function() --[[ Line: 852 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v47 (ref), l_profileId_0 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonJoinCommunity, {
                        buttonSurface = v97
                    });
                    return v99(v47.JoinGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 859 ]]
                        -- upvalues: v99 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v99(v42.API({
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
                text = v110[v52.ProfileActions.CancelJoinCommunityRequest], 
                onActivated = function() --[[ Line: 875 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v47 (ref), l_profileId_0 (ref), v98 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonCancelJoinCommunityRequest, {
                        buttonSurface = v97
                    });
                    return v99(v47.CancelJoinGroupRequest.API({
                        groupId = l_profileId_0, 
                        userId = v98
                    })):andThen(function() --[[ Line: 883 ]]
                        -- upvalues: v99 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v99(v43({
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
                text = v110[v52.ProfileActions.ViewCommunity], 
                onActivated = function() --[[ Line: 900 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_profileId_0 (ref), v40 (ref), v64 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonViewCommunity, {
                        buttonSurface = v97
                    });
                    v99(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.user.group({
                            groupId = l_profileId_0
                        }), 
                        extraProps = {
                            titleKey = v40.Community, 
                            onClose = function() --[[ Line: 910 ]] --[[ Name: onClose ]]
                                -- upvalues: v64 (ref), v99 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                                if v64 then
                                    v99(v42.API({
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
                text = v110[v52.ProfileActions.ViewFullProfile], 
                onActivated = function() --[[ Line: 930 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref), l_profileId_0 (ref), v40 (ref), v64 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonViewFullProfile, {
                        buttonSurface = v97
                    });
                    v99(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.new({
                            base = l_UrlBase_0.WWW, 
                            path = ("profiles/%*"):format(l_profileId_0)
                        })(), 
                        extraProps = {
                            titleKey = v40.Profile, 
                            onClose = function() --[[ Line: 943 ]] --[[ Name: onClose ]]
                                -- upvalues: v64 (ref), v99 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                                if v64 then
                                    v99(v42.API({
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
                text = v110[v52.ProfileActions.LeaveCommunity], 
                onActivated = function() --[[ Line: 961 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v47 (ref), l_profileId_0 (ref), v98 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonLeaveCommunity, {
                        buttonSurface = v97
                    });
                    return v99(v47.LeaveGroup.API({
                        groupId = l_profileId_0, 
                        userId = v98
                    })):andThen(function() --[[ Line: 969 ]]
                        -- upvalues: v99 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v99(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.MakePrimaryCommunity] = if v62 then {
                text = v110[v52.ProfileActions.MakePrimaryCommunity], 
                onActivated = function() --[[ Line: 983 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v47 (ref), l_profileId_0 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonMakePrimaryCommunity, {
                        buttonSurface = v97
                    });
                    return v99(v47.MakePrimaryGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 990 ]]
                        -- upvalues: v99 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v99(v43({
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
                text = v110[v52.ProfileActions.RemovePrimaryCommunity], 
                onActivated = function() --[[ Line: 1005 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v47 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonRemovePrimaryCommunity, {
                        buttonSurface = v97
                    });
                    return v99(v47.RemovePrimaryGroup.API()):andThen(function() --[[ Line: 1010 ]]
                        -- upvalues: v99 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v99(v43({
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
                text = v110[v52.ProfileActions.Follow], 
                onActivated = function() --[[ Line: 1028 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v47 (ref), l_profileId_0 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonFollow, {
                        buttonSurface = v97
                    });
                    return v99(v47.JoinGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 1034 ]]
                        -- upvalues: v99 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v99(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.Unfollow] = if v65 and l_profileType_0 == v52.ProfileTypes.Community then {
                text = v110[v52.ProfileActions.Unfollow], 
                onActivated = function() --[[ Line: 1049 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), v47 (ref), l_profileId_0 (ref), v98 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonUnfollow, {
                        buttonSurface = v97
                    });
                    return v99(v47.LeaveGroup.API({
                        groupId = l_profileId_0, 
                        userId = v98
                    })):andThen(function() --[[ Line: 1057 ]]
                        -- upvalues: v99 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v99(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.RemoveTrustedConnection] = {
                text = v110[v52.ProfileActions.RemoveTrustedConnection], 
                onActivated = function() --[[ Line: 1070 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v96 (ref), l_profileId_0 (ref), v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), v35 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonRemoveTrustedConnection, {
                        buttonSurface = v97
                    });
                    if l_FFlagLegacyProfileTCIndicator_0 then
                        return v96.removeTrustedConnectionRequest(l_profileId_0):andThen(function() --[[ Line: 1075 ]]
                            -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                            v99(l_SetCurrentToastMessage_0({
                                toastMessage = v110.trustedConnectionRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                isLocalized = true
                            }));
                            return v99(v44(l_profileId_0));
                        end);
                    else
                        return v99(v35.RemoveTC.API(l_profileId_0)):andThen(function() --[[ Line: 1084 ]]
                            -- upvalues: v99 (ref), l_SetCurrentToastMessage_0 (ref), v110 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                            v99(l_SetCurrentToastMessage_0({
                                toastMessage = v110.trustedConnectionRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                isLocalized = true
                            }));
                            return v99(v44(l_profileId_0));
                        end);
                    end;
                end
            }, 
            [v52.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v110[v52.ProfileActions.AddTrustedConnection], 
                onActivated = function() --[[ Line: 1098 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v100 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_Sources_0 (ref), v99 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonAddTrustedConnection, {
                        buttonSurface = v97
                    });
                    v100.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        source = l_Sources_0.ProfilePlatform, 
                        onRequestSent = function() --[[ Line: 1105 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v99 (ref), v44 (ref), l_profileId_0 (ref)
                            return v99(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.AddTrustedConnectionViaLink] = if l_FFlagTCShareLinkSenderUI_0 then {
                text = v110[v52.ProfileActions.AddTrustedConnection], 
                onActivated = function() --[[ Line: 1115 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), l_Sources_0 (ref), v100 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v99 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonAddTrustedConnection, {
                        buttonSurface = v97, 
                        modalVariantOverride = l_Sources_0.ShareLinkSender
                    });
                    v100.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        source = l_Sources_0.ProfilePlatform, 
                        modalVariantOverride = l_Sources_0.ShareLinkSender, 
                        onRequestSent = function() --[[ Line: 1124 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v99 (ref), v44 (ref), l_profileId_0 (ref)
                            return v99(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v110[v52.ProfileActions.AddIncomingTrustedConnection], 
                onActivated = function() --[[ Line: 1134 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v100 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v99 (ref), v44 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonAddIncomingTrustedConnection, {
                        buttonSurface = v97
                    });
                    v100.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        onRequestAccepted = function() --[[ Line: 1140 ]] --[[ Name: onRequestAccepted ]]
                            -- upvalues: v99 (ref), v44 (ref), l_profileId_0 (ref)
                            return v99(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.PendingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v110[v52.ProfileActions.AddTrustedConnection], 
                isDisabled = true, 
                onActivated = function() --[[ Line: 1151 ]] --[[ Name: onActivated ]]

                end
            } else nil, 
            [v52.ProfileActions.PendingIncomingTrustedConnection] = if v72 then {
                text = v110[v52.ProfileActions.AddIncomingTrustedConnection], 
                isDisabled = true, 
                onActivated = function() --[[ Line: 1158 ]] --[[ Name: onActivated ]]

                end
            } else nil, 
            [v52.ProfileActions.ViewAbout] = if l_FFlagProfilePlatformNewProfileHeader_0 then {
                text = v110[v52.ProfileActions.ViewAbout], 
                onActivated = function() --[[ Line: 1164 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v99 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v115 (ref)
                    v103.fireAnalyticsEvent(v51.CTAButtonViewFullProfile, {
                        buttonSurface = v97
                    });
                    v99(l_NavigateDown_0({
                        name = l_AppPage_0.AboutDetailsSheet, 
                        extraProps = {
                            sections = v115
                        }
                    }));
                end
            } else nil, 
            [v52.ProfileActions.ViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then {
                text = v110[v52.ProfileActions.ViewPlatformProfile], 
                onActivated = function() --[[ Line: 1181 ]] --[[ Name: onActivated ]]
                    -- upvalues: v103 (ref), v51 (ref), v97 (ref), v50 (ref), v113 (ref)
                    v103.fireAnalyticsEvent(v51.ContextualMenuButtonViewPlatformProfile, {
                        buttonSurface = v97
                    });
                    v50:ShowProfile(v113);
                end
            } else nil, 
            [v52.ProfileActions.CurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
                text = v110[v52.ProfileActions.CurrencyTransfer], 
                onActivated = function() --[[ Line: 1192 ]] --[[ Name: onActivated ]]
                    -- upvalues: v97 (ref), v52 (ref), v103 (ref), v51 (ref), v102 (ref), l_profileId_0 (ref), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
                    if v97 == v52.ButtonSurface.ContextualMenu then
                        v103.fireAnalyticsEvent(v51.ContextualMenuButtonCurrencyTransfer, {
                            buttonSurface = v97
                        });
                    else
                        v103.fireAnalyticsEvent(v51.CTAButtonCurrencyTransfer, {
                            buttonSurface = v97
                        });
                    end;
                    if v102 then
                        v102({
                            recipientUserId = l_profileId_0, 
                            direction = l_TransferDirection_0.Send, 
                            transferOrigination = l_TransferOrigination_0.Profile
                        });
                    end;
                end
            } else nil
        };
    end, l_dependencyArray_0(v99, l_profileId_0, v101, if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v102 else nil, l_qRCodePage_0, v110, v98, v100, l_editUsername_0, v116.joinExperience, v116.isLoading, v103, v122, v97, if l_FFlagProfilePlatformNewProfileHeader_0 then v115 else nil, l_profileType_0, l_editAvatar_0, if v75 then v119 else nil, if v75 then v120 else nil)));
end;