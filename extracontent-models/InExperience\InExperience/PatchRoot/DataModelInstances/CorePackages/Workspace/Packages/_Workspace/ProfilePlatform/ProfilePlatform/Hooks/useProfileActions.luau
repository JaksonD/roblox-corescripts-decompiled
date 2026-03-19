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
local v71 = game:DefineFastFlag("EnableAbuseReportRevampProfileAndGroup", false);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = v13.FFlagProfilePlatformEnableCurrencyTransfer;
local v73 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableEditAppearanceMenu);
local l_FFlagLegacyProfileTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagLegacyProfileTCIndicator;
local v75 = require(l_Parent_0.GenericAbuseReporting);
local l_AbuseVector_0 = v75.Enums.AbuseVector;
local l_OpenDynamicAbuseReport_0 = v75.Thunks.OpenDynamicAbuseReport;
local l_ChatEntryPointNames_0 = v8.Enums.ChatEntryPointNames;
local l_EnteredChatFromEntryPoint_0 = v7.Actions.EnteredChatFromEntryPoint;
local l_l_GuiService_0_NotificationTypeList_0 = l_GuiService_0:GetNotificationTypeList();
local l_FriendRequestNicknamesIXP_0 = require(l_Parent_0.FriendRequestNicknames).FriendRequestNicknamesIXP;
local l_Enums_0 = require(l_Parent_0.CurrencyTransfers).Enums;
local l_TransferDirection_0 = l_Enums_0.TransferDirection;
local l_TransferOrigination_0 = l_Enums_0.TransferOrigination;
local v85 = require(l_script_FirstAncestor_0.Common.Constants);
local l_USER_BLOCKING_ERRORS_0 = v85.USER_BLOCKING_ERRORS;
local l_USER_FRIENDING_ERRORS_0 = v85.USER_FRIENDING_ERRORS;
local l_STATUS_CODES_0 = v85.STATUS_CODES;
local v89 = ("%*share/g/%%s"):format(l_Url_0.BASE_URL);
local v90 = tostring(DateTime.now().UnixTimestampMillis);
local function _(v91) --[[ Line: 111 ]] --[[ Name: areFollowActionsSupportedForProfileType ]]
    -- upvalues: v52 (copy)
    return v91 == v52.ProfileTypes.Community;
end;
local v93 = if l_FFlagLegacyProfileTCIndicator_0 then v60.TrustedConnections.TrustedConnectionsStore.get() else nil;
return function(v94) --[[ Line: 121 ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), v20 (copy), v49 (copy), l_useShortUrl_0 (copy), l_useGetOrGenerateLinkUrl_0 (copy), l_useEffectOnce_0 (copy), v3 (copy), v90 (copy), v40 (copy), l_useLocalization_0 (copy), v52 (copy), l_FFlagProfilePlatformAddTC_0 (copy), v73 (copy), v62 (copy), v65 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_FFlagEnablePlatformProfileContextualMenuOption_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), v46 (copy), l_useJoinUserInExperience_0 (copy), l_FriendRequestNicknamesIXP_0 (copy), l_useProfileShareLink_0 (copy), l_Contexts_0 (copy), l_ProfileSharePolicyEnum_0 (copy), l_USER_FRIENDING_ERRORS_0 (copy), l_STATUS_CODES_0 (copy), l_HttpService_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ButtonVariant_0 (copy), v51 (copy), v35 (copy), l_Images_0 (copy), v44 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_ButtonType_0 (copy), l_ContextualInfoTypes_0 (copy), v43 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_ChatEntryPointNames_0 (copy), l_GuiService_0 (copy), l_l_GuiService_0_NotificationTypeList_0 (copy), v34 (copy), v10 (copy), l_IconName_0 (copy), v5 (copy), v45 (copy), l_FFlagMoveInExperienceModeToEditProfile_0 (copy), l_default_0 (copy), l_FFlagEnableAbuseReportRevampFlow_0 (copy), v71 (copy), l_AbuseVector_0 (copy), l_OpenDynamicAbuseReport_0 (copy), l_CloseCentralOverlay_0 (copy), l_Url_0 (copy), v48 (copy), l_USER_BLOCKING_ERRORS_0 (copy), v67 (copy), v89 (copy), v47 (copy), v42 (copy), v41 (copy), l_UrlBuilder_0 (copy), v64 (copy), l_UrlBase_0 (copy), l_FFlagLegacyProfileTCIndicator_0 (copy), v93 (copy), l_Sources_0 (copy), l_FFlagTCShareLinkSenderUI_0 (copy), v50 (copy), l_TransferDirection_0 (copy), l_TransferOrigination_0 (copy), l_dependencyArray_0 (copy)
    local v95 = l_useLocalUserId_0();
    local v96 = l_useDispatch_0();
    local v97 = l_useNavigation_0();
    local v98 = v20();
    local v99 = v98.navigateTo and v98.navigateTo.navigateToTransfer or nil;
    local v100 = v49();
    local v101 = l_useShortUrl_0();
    local v102 = l_useGetOrGenerateLinkUrl_0();
    local v103 = v101 ~= nil;
    l_useEffectOnce_0(v102, not v103);
    local v104 = v3.useMemo(function() --[[ Line: 135 ]]
        -- upvalues: v101 (copy), v90 (ref)
        return string.format("%s&source=ProfileShare&stamp=%s", v101 or "", v90);
    end, {
        v101
    });
    local l_AcceptConnection_0 = v40.AcceptConnection;
    local l_AddConnection_0 = v40.AddConnection;
    local v107 = l_useLocalization_0({
        [v52.ProfileActions.AcceptFriendRequest] = l_AcceptConnection_0, 
        [v52.ProfileActions.AcceptOffNetworkFriendRequest] = l_AcceptConnection_0, 
        [v52.ProfileActions.AddFriend] = l_AddConnection_0, 
        [v52.ProfileActions.AddFriendFromContacts] = l_AddConnection_0, 
        [v52.ProfileActions.AddFriendFromContactsSent] = v40.PendingRequest, 
        [v52.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v40.AddTrustedConnection else nil, 
        [v52.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then v40.AcceptTrustedConnection else nil, 
        [v52.ProfileActions.Block] = v40.Block, 
        [v52.ProfileActions.CannotAddFriend] = l_AddConnection_0, 
        [v52.ProfileActions.Chat] = v40.Chat, 
        [v52.ProfileActions.EditAlias] = v40.CustomizeName, 
        [v52.ProfileActions.EditAppearance] = if v73 then v40.EditAppearance else nil, 
        [v52.ProfileActions.EditEmotes] = if v73 then v40.EditEmotes else nil, 
        [v52.ProfileActions.SwitchAvatar] = if v73 then v40.SwitchAvatar else nil, 
        [v52.ProfileActions.EditAvatar] = v40.EditAvatar, 
        [v52.ProfileActions.EditProfile] = v40.EditProfile, 
        [v52.ProfileActions.IgnoreFriendRequest] = v40.IgnoreConnectionRequest, 
        [v52.ProfileActions.JoinExperience] = v40.Join, 
        [v52.ProfileActions.PendingFriendRequest] = v40.PendingRequest, 
        [v52.ProfileActions.QrCode] = v40.ToQRCode, 
        [v52.ProfileActions.Report] = v40.Report, 
        [v52.ProfileActions.ShareProfile] = v40.ShareProfile, 
        [v52.ProfileActions.Unblock] = v40.Unblock, 
        [v52.ProfileActions.Unfriend] = v40.RemoveConnection, 
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
        friendAcceptedToast = v40.ConnectionAdded, 
        friendRemovedToast = v40.ConnectionRemoved, 
        trustedConnectionRemovedToast = v40.TrustedConnectionRemoved, 
        friendRequestSentToast = v40.ConnectionRequestSent, 
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
    local v108 = v3.useCallback(function() --[[ Line: 241 ]]
        -- upvalues: v98 (copy)
        v98.navigateTo.previousView(true);
    end, {
        v98.navigateTo.previousView
    });
    local l_profileId_0 = v98.profileId;
    local v110 = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then v98.profilePlatformId else nil;
    local l_profileType_0 = v98.profileType;
    local v112 = nil;
    if l_FFlagProfilePlatformNewProfileHeader_0 then
        v112 = v46().aboutSections;
    end;
    local v113 = l_useJoinUserInExperience_0(l_profileId_0, {
        isHomePageCarousel = v98.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
        homepageCarouselAbsolutePosition = v98.sourceInfo.homepageCarouselAbsolutePosition, 
        openGameDetailsPeekViewClosed = v108
    });
    local l_qRCodePage_0 = v98.navigateTo.qRCodePage;
    local l_editUsername_0 = v98.navigateTo.editUsername;
    local v116 = if v73 then v98.navigateTo.editEmotes else nil;
    local v117 = if v73 then v98.navigateTo.switchAvatar else nil;
    local l_editAvatar_0 = v98.navigateTo.editAvatar;
    local v119 = l_FriendRequestNicknamesIXP_0.useFriendRequestNicknames();
    local v120 = l_useProfileShareLink_0({
        context = l_Contexts_0.ProfileCard
    });
    local v121 = v120.policy == l_ProfileSharePolicyEnum_0.Disabled;
    local v122 = {
        [l_USER_FRIENDING_ERRORS_0.INVALID_TARGET_USER_ERROR] = v107.invalidTargetUserError, 
        [l_USER_FRIENDING_ERRORS_0.ALREADY_FRIEND_ERROR] = v107.alreadyFriendError, 
        [l_USER_FRIENDING_ERRORS_0.MAX_FRIENDS_ERROR] = v107.maxFriendsError, 
        [l_USER_FRIENDING_ERRORS_0.INVALID_NICKNAME_ERROR] = v107.invalidNicknameError
    };
    local v123 = {
        [l_USER_FRIENDING_ERRORS_0.UNAUTHORIZED_ERROR] = v107.unauthorizedError
    };
    local v124 = {
        [l_USER_FRIENDING_ERRORS_0.USER_BANNED_ERROR] = v107.userBannedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_BLOCKED_ERROR] = v107.userBlockedError, 
        [l_USER_FRIENDING_ERRORS_0.USER_NOT_PASSED_CAPTCHA_ERROR] = v107.userNotPassedCaptchaError
    };
    local v125 = {
        [l_USER_FRIENDING_ERRORS_0.TOO_MANY_REQUESTS_ERROR] = v107.tooManyRequestsError
    };
    local function _(v126, v127, v128) --[[ Line: 298 ]] --[[ Name: getErrorToastMessage ]]
        -- upvalues: v52 (ref), l_STATUS_CODES_0 (ref), v122 (copy), v123 (copy), v124 (copy), v125 (copy)
        if v126 == v52.ProfileActions.AddFriend or v126 == v52.ProfileActions.AddFriendFromContacts then
            if v127 == l_STATUS_CODES_0.BAD_REQUEST then
                return v122[v128];
            elseif v127 == l_STATUS_CODES_0.UNAUTHORIZED then
                return v123[v128];
            elseif v127 == l_STATUS_CODES_0.FORBIDDEN then
                return v124[v128];
            elseif v127 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then
                return v125[v128];
            end;
        end;
        return nil;
    end;
    local function v136(v130, v131) --[[ Line: 313 ]] --[[ Name: setErrorToast ]]
        -- upvalues: l_HttpService_0 (ref), v52 (ref), l_STATUS_CODES_0 (ref), v122 (copy), v123 (copy), v124 (copy), v125 (copy), v107 (copy), v96 (copy), l_SetCurrentToastMessage_0 (ref)
        if v131 ~= nil then
            local l_StatusCode_0 = v131.StatusCode;
            local v133 = if v131.Body then l_HttpService_0:JSONDecode(v131.Body) else nil;
            local v134 = if v133 and v133.errors and v133.errors[1] and v133.errors[1].code then v133.errors[1].code else nil;
            local v135 = (if not (v130 ~= v52.ProfileActions.AddFriend) or v130 == v52.ProfileActions.AddFriendFromContacts then if l_StatusCode_0 == l_STATUS_CODES_0.BAD_REQUEST then v122[v134] else if l_StatusCode_0 == l_STATUS_CODES_0.UNAUTHORIZED then v123[v134] else if l_StatusCode_0 == l_STATUS_CODES_0.FORBIDDEN then v124[v134] else if l_StatusCode_0 == l_STATUS_CODES_0.TOO_MANY_REQUESTS then v125[v134] else nil else nil) or v107.defaultFriendingError;
            v96(l_SetCurrentToastMessage_0({
                toastMessage = v135, 
                isLocalized = true
            }));
            return;
        else
            v96(l_SetCurrentToastMessage_0({
                toastMessage = v107.defaultFriendingError, 
                isLocalized = true
            }));
            return;
        end;
    end;
    return (v3.useMemo(function() --[[ Line: 337 ]]
        -- upvalues: v52 (ref), v107 (copy), l_ButtonVariant_0 (ref), v100 (copy), v51 (ref), v94 (copy), v98 (copy), v96 (copy), v35 (ref), l_profileId_0 (copy), v95 (copy), l_SetCurrentToastMessage_0 (ref), l_Images_0 (ref), v44 (ref), l_FriendRequestNicknamesIXP_0 (ref), v119 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v136 (copy), l_ButtonType_0 (ref), l_ContextualInfoTypes_0 (ref), v43 (ref), l_profileType_0 (copy), v97 (copy), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref), v34 (ref), v10 (ref), v73 (ref), l_IconName_0 (ref), l_editAvatar_0 (copy), v116 (copy), v117 (copy), v5 (ref), l_editUsername_0 (copy), v45 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref), v113 (copy), l_qRCodePage_0 (copy), v121 (copy), l_default_0 (ref), l_Contexts_0 (ref), v104 (copy), v40 (ref), v120 (copy), v62 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v71 (ref), l_AbuseVector_0 (ref), l_OpenDynamicAbuseReport_0 (ref), l_CloseCentralOverlay_0 (ref), l_Url_0 (ref), v48 (ref), l_USER_BLOCKING_ERRORS_0 (ref), v67 (ref), v89 (ref), v47 (ref), v42 (ref), v41 (ref), l_UrlBuilder_0 (ref), v64 (ref), v65 (ref), l_UrlBase_0 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v93 (ref), l_FFlagProfilePlatformAddTC_0 (ref), l_Sources_0 (ref), l_FFlagTCShareLinkSenderUI_0 (ref), l_FFlagProfilePlatformNewProfileHeader_0 (ref), v112 (ref), l_FFlagEnablePlatformProfileContextualMenuOption_0 (ref), v50 (ref), v110 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v99 (copy), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
        return {
            [v52.ProfileActions.AcceptFriendRequest] = {
                text = v107[v52.ProfileActions.AcceptFriendRequest], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 342 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v98 (ref), v52 (ref), v96 (ref), v35 (ref), l_profileId_0 (ref), v95 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonAcceptFriendRequest, {
                        buttonSurface = v94, 
                        absolutePosition = v98.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v98.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v98.sourceInfo.isRecommendation, 
                        source = v98.sourceInfo.source, 
                        contextualInfoType = v98.sourceInfo.contextualInfoType, 
                        recommendationContextType = v98.sourceInfo.recommendationContextType, 
                        recommendationRank = v98.sourceInfo.recommendationRank, 
                        recommendationSessionId = v98.sourceInfo.recommendationSessionId
                    });
                    return v96(v35.AcceptFriendRequestFromUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v95
                    })):andThen(function() --[[ Line: 358 ]]
                        -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v96(l_SetCurrentToastMessage_0({
                            toastMessage = v107.friendAcceptedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v96(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.AcceptOffNetworkFriendRequest] = {
                text = v107[v52.ProfileActions.AcceptOffNetworkFriendRequest], 
                onActivated = function() --[[ Line: 370 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v98 (ref), v96 (ref), v35 (ref), l_profileId_0 (ref), v95 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonAddFriendFromContacts, {
                        shareLinkId = v98.sourceInfo.shareLinkId
                    });
                    return v96(v35.AcceptFriendRequestWithToken.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v95, 
                        friendingToken = v98.offNetworkFriendRequestToken
                    })):andThen(function() --[[ Line: 378 ]]
                        -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v96(l_SetCurrentToastMessage_0({
                            toastMessage = v107.friendAcceptedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v96(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.AddFriend] = {
                text = v107[v52.ProfileActions.AddFriend], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 391 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v98 (ref), v52 (ref), l_FriendRequestNicknamesIXP_0 (ref), v119 (ref), v96 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v35 (ref), v95 (ref), v44 (ref), v136 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonAddFriend, {
                        buttonSurface = v94, 
                        absolutePosition = v98.sourceInfo.homepageCarouselAbsolutePosition, 
                        isHomePageCarousel = v98.sourceInfo.source == v52.Sources.HomepageFriendsCarousel, 
                        isRecommendation = v98.sourceInfo.isRecommendation, 
                        source = v98.sourceInfo.source, 
                        contextualInfoType = v98.sourceInfo.contextualInfoType, 
                        recommendationContextType = v98.sourceInfo.recommendationContextType, 
                        recommendationRank = v98.sourceInfo.recommendationRank, 
                        recommendationSessionId = v98.sourceInfo.recommendationSessionId
                    });
                    if l_FriendRequestNicknamesIXP_0.FFlagFriendRequestNicknames and v119 then
                        return v96(l_NavigateDown_0({
                            name = l_AppPage_0.SetNicknameModal, 
                            extraProps = {
                                friendRequestParams = {
                                    targetUserId = l_profileId_0, 
                                    source = v98.sourceInfo.friendshipOriginSourceType
                                }
                            }
                        }));
                    else
                        v96(l_SetCurrentToastMessage_0({
                            toastMessage = v107.friendRequestSentToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                            isLocalized = true
                        }));
                        return v96(v35.RequestFriendshipFromUserId.API({
                            targetUserId = l_profileId_0, 
                            currentUserId = v95, 
                            friendshipOriginSourceType = v98.sourceInfo.friendshipOriginSourceType
                        })):andThen(function() --[[ Line: 426 ]]
                            -- upvalues: v96 (ref), v44 (ref), l_profileId_0 (ref)
                            return v96(v44(l_profileId_0));
                        end):catch(function(v137) --[[ Line: 429 ]]
                            -- upvalues: v136 (ref), v52 (ref)
                            v136(v52.ProfileActions.AddFriend, v137);
                        end);
                    end;
                end
            }, 
            [v52.ProfileActions.AddFriendFromContacts] = {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v107[v52.ProfileActions.AddFriendFromContacts], 
                onActivated = function() --[[ Line: 439 ]] --[[ Name: onActivated ]]
                    -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v35 (ref), v95 (ref), l_profileId_0 (ref), l_ContextualInfoTypes_0 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref), v136 (ref)
                    v96(l_SetCurrentToastMessage_0({
                        toastMessage = v107.friendRequestSentToast, 
                        toastIcon = l_Images_0["icons/actions/friends/friendAdd"], 
                        isLocalized = true
                    }));
                    return v96(v35.RequestFriendshipFromContactId.API({
                        currentUserId = v95, 
                        contactId = l_profileId_0, 
                        contextType = l_ContextualInfoTypes_0.Contacts
                    })):andThen(function() --[[ Line: 450 ]]
                        -- upvalues: v96 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        return v96(v43({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = {
                                v52.Components.ContactProfileHeader, 
                                v52.Components.Actions, 
                                v52.Components.ContactDescription
                            }
                        }));
                    end):catch(function(v138) --[[ Line: 461 ]]
                        -- upvalues: v136 (ref), v52 (ref)
                        v136(v52.ProfileActions.AddFriendFromContacts, v138);
                    end);
                end
            }, 
            [v52.ProfileActions.AddFriendFromContactsSent] = {
                buttonType = l_ButtonType_0.Secondary, 
                variant = l_ButtonVariant_0.Subtle, 
                text = v107[v52.ProfileActions.AddFriendFromContactsSent], 
                onActivated = function() --[[ Line: 470 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.Block] = {
                text = v107[v52.ProfileActions.Block], 
                onActivated = function() --[[ Line: 475 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v97 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonBlock, {
                        buttonSurface = v94
                    });
                    v97.push(l_AppPage_0.BlockingModal, {
                        navProps = {
                            userId = l_profileId_0, 
                            onBlockSuccess = function() --[[ Line: 482 ]] --[[ Name: onBlockSuccess ]]
                                -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                                v96(l_SetCurrentToastMessage_0({
                                    toastMessage = v107.userBlockedToast, 
                                    toastIcon = l_Images_0["icons/actions/block"], 
                                    isLocalized = true
                                }));
                                v96(v44(l_profileId_0));
                            end
                        }
                    });
                end
            }, 
            [v52.ProfileActions.CannotAddFriend] = {
                text = v107[v52.ProfileActions.CannotAddFriend], 
                onActivated = function() --[[ Line: 497 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.Chat] = {
                text = v107[v52.ProfileActions.Chat], 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = function() --[[ Line: 503 ]] --[[ Name: onActivated ]]
                    -- upvalues: v94 (ref), v52 (ref), v100 (ref), v51 (ref), v96 (ref), l_EnteredChatFromEntryPoint_0 (ref), l_ChatEntryPointNames_0 (ref), l_GuiService_0 (ref), l_profileId_0 (ref), l_l_GuiService_0_NotificationTypeList_0 (ref)
                    if v94 == v52.ButtonSurface.ContextualMenu then
                        v100.fireAnalyticsEvent(v51.ContextualMenuButtonChat, {
                            buttonSurface = v94
                        });
                    else
                        v100.fireAnalyticsEvent(v51.CTAButtonChat, {
                            buttonSurface = v94
                        });
                    end;
                    v96(l_EnteredChatFromEntryPoint_0(l_ChatEntryPointNames_0.ProfilePeekView));
                    l_GuiService_0:BroadcastNotification(l_profileId_0, l_l_GuiService_0_NotificationTypeList_0.LAUNCH_CONVERSATION);
                end
            }, 
            [v52.ProfileActions.EditAlias] = {
                text = v107[v52.ProfileActions.EditAlias], 
                onActivated = function() --[[ Line: 520 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (ref), v100 (ref), v51 (ref), v94 (ref), v97 (ref), v52 (ref), l_profileId_0 (ref), v10 (ref)
                    v34.Stopwatch.start(v34.Events.CustomizeNameOpened);
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonSetAlias, {
                        buttonSurface = v94
                    });
                    v97.navigate(v52.Screens.SetAliasModal, {
                        profileUserId = l_profileId_0, 
                        origin = v10.Analytics.EntryPoints.ContextualMenu
                    });
                end
            }, 
            [v52.ProfileActions.EditAppearance] = if v73 then {
                text = v107[v52.ProfileActions.EditAppearance], 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = function() --[[ Line: 535 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonEditAppearance, {
                        buttonSurface = v94
                    });
                end
            } else nil, 
            [v52.ProfileActions.EditAvatar] = {
                text = v107[v52.ProfileActions.EditAvatar], 
                icon = if v73 then l_IconName_0.Person else nil, 
                onActivated = function() --[[ Line: 545 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v73 (ref), v51 (ref), v94 (ref), l_editAvatar_0 (ref)
                    v100.fireAnalyticsEvent(if v73 then v51.EditAppearanceMenuEditAvatar else v51.CTAButtonEditAvatar, {
                        buttonSurface = v94
                    });
                    l_editAvatar_0();
                end
            }, 
            [v52.ProfileActions.EditEmotes] = if v73 then {
                text = v107[v52.ProfileActions.EditEmotes], 
                icon = l_IconName_0.SquareFaceWavingHand, 
                onActivated = function() --[[ Line: 561 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v116 (ref)
                    v100.fireAnalyticsEvent(v51.EditAppearanceMenuEditEmote, {
                        buttonSurface = v94
                    });
                    v116();
                end
            } else nil, 
            [v52.ProfileActions.SwitchAvatar] = if v73 then {
                text = v107[v52.ProfileActions.SwitchAvatar], 
                icon = l_IconName_0.PersonStandingArrowReverse, 
                onActivated = function() --[[ Line: 573 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v117 (ref)
                    v100.fireAnalyticsEvent(v51.EditAppearanceMenuSwitchAvatar, {
                        buttonSurface = v94
                    });
                    v117();
                end
            } else nil, 
            [v52.ProfileActions.EditProfile] = {
                component = v5.Button, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.Standard, 
                text = v107[v52.ProfileActions.EditProfile], 
                onActivated = function() --[[ Line: 586 ]] --[[ Name: onActivated ]]
                    -- upvalues: v34 (ref), v100 (ref), v51 (ref), v94 (ref), v97 (ref), v52 (ref), l_editUsername_0 (ref), v96 (ref), v45 (ref), l_profileId_0 (ref), l_FFlagMoveInExperienceModeToEditProfile_0 (ref)
                    v34.Stopwatch.start(v34.Events.EditProfileOpened);
                    v100.fireAnalyticsEvent(v51.CTAButtonOpenEditProfilePage, {
                        buttonSurface = v94
                    });
                    v97.navigate(v52.Screens.EditProfilePage, {
                        profileScreens = v52.Screens, 
                        navigateToEditUsername = function(v139) --[[ Line: 593 ]] --[[ Name: navigateToEditUsername ]]
                            -- upvalues: l_editUsername_0 (ref), v96 (ref), v45 (ref), l_profileId_0 (ref)
                            l_editUsername_0({
                                showToast = v139, 
                                onUsernameChanged = function() --[[ Line: 596 ]] --[[ Name: onUsernameChanged ]]
                                    -- upvalues: v96 (ref), v45 (ref), l_profileId_0 (ref)
                                    v96(v45(l_profileId_0));
                                end
                            });
                        end, 
                        onIdentityChange = function() --[[ Line: 601 ]] --[[ Name: onIdentityChange ]]
                            -- upvalues: v96 (ref), v45 (ref), l_profileId_0 (ref)
                            v96(v45(l_profileId_0));
                        end, 
                        onToggleInExperienceMode = l_FFlagMoveInExperienceModeToEditProfile_0 and function() --[[ Line: 605 ]]
                            -- upvalues: v96 (ref), v45 (ref), l_profileId_0 (ref), v100 (ref), v51 (ref)
                            v96(v45(l_profileId_0));
                            v100.fireAnalyticsEvent(v51.ToggleInExperienceModeButton, {});
                        end or nil
                    });
                end
            }, 
            [v52.ProfileActions.IgnoreFriendRequest] = {
                text = v107[v52.ProfileActions.IgnoreFriendRequest], 
                onActivated = function() --[[ Line: 615 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v35 (ref), l_profileId_0 (ref), v95 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonIgnoreFriendRequest, {
                        buttonSurface = v94
                    });
                    return v96(v35.DeclineFriendRequestFromUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v95
                    })):andThen(function() --[[ Line: 622 ]]
                        -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v96(l_SetCurrentToastMessage_0({
                            toastMessage = v107.friendRequestIgnoredToast, 
                            toastIcon = l_Images_0["icons/actions/reject"], 
                            isLocalized = true
                        }));
                        return v96(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.JoinExperience] = {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                isLoading = v113.isLoading, 
                isDisabled = not v113.isInExperience, 
                text = v107[v52.ProfileActions.JoinExperience], 
                onActivated = function() --[[ Line: 639 ]] --[[ Name: onActivated ]]
                    -- upvalues: v113 (ref)
                    v113.joinExperience();
                end
            }, 
            [v52.ProfileActions.PendingFriendRequest] = {
                buttonType = l_ButtonType_0.Secondary, 
                variant = l_ButtonVariant_0.Subtle, 
                text = v107[v52.ProfileActions.PendingFriendRequest], 
                onActivated = function() --[[ Line: 648 ]] --[[ Name: onActivated ]]

                end, 
                isDisabled = true
            }, 
            [v52.ProfileActions.QrCode] = {
                text = v107[v52.ProfileActions.QrCode], 
                icon = l_IconName_0.SquaresGridQr, 
                onActivated = function() --[[ Line: 654 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), l_qRCodePage_0 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonShareProfileQRCode, {
                        buttonSurface = v94
                    });
                    l_qRCodePage_0();
                end
            }, 
            [v52.ProfileActions.ShareProfile] = {
                component = v5.Button, 
                buttonType = l_ButtonType_0.PrimarySystem, 
                variant = l_ButtonVariant_0.Standard, 
                text = v107[v52.ProfileActions.ShareProfile], 
                onActivated = function() --[[ Line: 666 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v121 (ref), l_default_0 (ref), l_Contexts_0 (ref), v104 (ref), l_profileId_0 (ref), v96 (ref), l_SetCurrentToastMessage_0 (ref), v40 (ref), v120 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonShareProfile, {
                        buttonSurface = v94
                    });
                    if v121 then
                        l_default_0:setClipboardText({
                            context = l_Contexts_0.ProfileCard, 
                            text = string.format("%s/%s", v104, l_profileId_0)
                        });
                        v96(l_SetCurrentToastMessage_0({
                            toastMessage = v40.LinkCopied
                        }));
                        return;
                    else
                        v120.onActivated();
                        return;
                    end;
                end
            }, 
            [v52.ProfileActions.Report] = {
                text = v107[v52.ProfileActions.Report], 
                onActivated = function() --[[ Line: 685 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v62 (ref), l_profileType_0 (ref), v52 (ref), l_FFlagEnableAbuseReportRevampFlow_0 (ref), v71 (ref), l_AbuseVector_0 (ref), v96 (ref), l_OpenDynamicAbuseReport_0 (ref), l_profileId_0 (ref), l_CloseCentralOverlay_0 (ref), v44 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_Url_0 (ref), v40 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonReport, {
                        buttonSurface = v94
                    });
                    local v140 = nil;
                    if v62 then
                        if l_profileType_0 == v52.ProfileTypes.User then
                            v140 = "userprofile";
                        elseif l_profileType_0 == v52.ProfileTypes.Community then
                            v140 = "group";
                        end;
                    end;
                    if l_FFlagEnableAbuseReportRevampFlow_0 and v71 then
                        local l_UserProfile_0 = l_AbuseVector_0.UserProfile;
                        if v62 and l_profileType_0 == v52.ProfileTypes.Community then
                            l_UserProfile_0 = l_AbuseVector_0.Group;
                        end;
                        v96(l_OpenDynamicAbuseReport_0({
                            abuseVector = l_UserProfile_0, 
                            targetId = l_profileId_0, 
                            onClose = function() --[[ Line: 708 ]] --[[ Name: onClose ]]
                                -- upvalues: v96 (ref), l_CloseCentralOverlay_0 (ref), v44 (ref), l_profileId_0 (ref)
                                v96(l_CloseCentralOverlay_0());
                                v96(v44(l_profileId_0));
                            end
                        }));
                        return;
                    else
                        v96(l_NavigateDown_0({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = if v62 then ("%*abusereport/%*?id=%*"):format(l_Url_0.BASE_URL, v140, l_profileId_0) else string.format("%sabusereport/userprofile?id=%s", l_Url_0.BASE_URL, l_profileId_0), 
                            extraProps = {
                                titleKey = v40.Report
                            }
                        }));
                        return;
                    end;
                end
            }, 
            [v52.ProfileActions.Unblock] = {
                text = v107[v52.ProfileActions.Unblock], 
                onActivated = function() --[[ Line: 728 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v48 (ref), l_profileId_0 (ref), v95 (ref), v44 (ref), l_USER_BLOCKING_ERRORS_0 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), v67 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonUnblock, {
                        buttonSurface = v94
                    });
                    return v96(v48.UnblockUserById.API({
                        userId = l_profileId_0, 
                        currentUserId = v95
                    })):andThen(function() --[[ Line: 736 ]]
                        -- upvalues: v96 (ref), v44 (ref), l_profileId_0 (ref)
                        return v96(v44(l_profileId_0));
                    end):catch(function(v142) --[[ Line: 739 ]]
                        -- upvalues: l_USER_BLOCKING_ERRORS_0 (ref), v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), v67 (ref)
                        if v142 ~= nil and tonumber(v142.Body) == l_USER_BLOCKING_ERRORS_0.PARENT_BLOCKED_TARGET_USER_ERROR then
                            v96(l_SetCurrentToastMessage_0({
                                toastMessage = v107.unblockTargetParentManagedToast, 
                                isLocalized = true
                            }));
                            return;
                        elseif v142 ~= nil and tonumber(v142.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
                            v96(l_SetCurrentToastMessage_0({
                                toastMessage = v107.unblockTargetNotBlockedToast, 
                                isLocalized = true
                            }));
                            return;
                        elseif v67 and v142 ~= nil and tonumber(v142.Body) == l_USER_BLOCKING_ERRORS_0.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
                            v96(l_SetCurrentToastMessage_0({
                                toastMessage = v107.blockedOnPlatformToast, 
                                isLocalized = true
                            }));
                            return;
                        else
                            v96(l_SetCurrentToastMessage_0({
                                toastMessage = v107.somethingIsWrongToast, 
                                isLocalized = true
                            }));
                            return;
                        end;
                    end);
                end
            }, 
            [v52.ProfileActions.Unfriend] = {
                text = v107[v52.ProfileActions.Unfriend], 
                onActivated = function() --[[ Line: 782 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v35 (ref), l_profileId_0 (ref), v95 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonUnfriend, {
                        buttonSurface = v94
                    });
                    return v96(v35.UnfriendTargetUserId.API({
                        targetUserId = l_profileId_0, 
                        currentUserId = v95
                    })):andThen(function() --[[ Line: 789 ]]
                        -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                        v96(l_SetCurrentToastMessage_0({
                            toastMessage = v107.friendRemovedToast, 
                            toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                            isLocalized = true
                        }));
                        return v96(v44(l_profileId_0));
                    end);
                end
            }, 
            [v52.ProfileActions.CopyLink] = if v62 then {
                text = v107[v52.ProfileActions.CopyLink], 
                onActivated = function() --[[ Line: 802 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), l_default_0 (ref), l_Contexts_0 (ref), v89 (ref), l_profileId_0 (ref), v96 (ref), l_SetCurrentToastMessage_0 (ref), v40 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonCopyLink, {
                        buttonSurface = v94
                    });
                    l_default_0:setClipboardText({
                        context = l_Contexts_0.ProfileCard, 
                        text = string.format(v89, l_profileId_0)
                    });
                    v96(l_SetCurrentToastMessage_0({
                        toastMessage = v40.LinkCopied
                    }));
                end
            } else nil, 
            [v52.ProfileActions.JoinCommunity] = if v62 then {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                variant = l_ButtonVariant_0.Emphasis, 
                text = v107[v52.ProfileActions.JoinCommunity], 
                onActivated = function() --[[ Line: 822 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v47 (ref), l_profileId_0 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonJoinCommunity, {
                        buttonSurface = v94
                    });
                    return v96(v47.JoinGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 829 ]]
                        -- upvalues: v96 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v96(v42.API({
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
                text = v107[v52.ProfileActions.CancelJoinCommunityRequest], 
                onActivated = function() --[[ Line: 845 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v47 (ref), l_profileId_0 (ref), v95 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonCancelJoinCommunityRequest, {
                        buttonSurface = v94
                    });
                    return v96(v47.CancelJoinGroupRequest.API({
                        groupId = l_profileId_0, 
                        userId = v95
                    })):andThen(function() --[[ Line: 853 ]]
                        -- upvalues: v96 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v96(v43({
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
                text = v107[v52.ProfileActions.ViewCommunity], 
                onActivated = function() --[[ Line: 870 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_profileId_0 (ref), v40 (ref), v64 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonViewCommunity, {
                        buttonSurface = v94
                    });
                    v96(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.user.group({
                            groupId = l_profileId_0
                        }), 
                        extraProps = {
                            titleKey = v40.Community, 
                            onClose = function() --[[ Line: 880 ]] --[[ Name: onClose ]]
                                -- upvalues: v64 (ref), v96 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                                if v64 then
                                    v96(v42.API({
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
                text = v107[v52.ProfileActions.ViewFullProfile], 
                onActivated = function() --[[ Line: 900 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_UrlBuilder_0 (ref), l_UrlBase_0 (ref), l_profileId_0 (ref), v40 (ref), v64 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonViewFullProfile, {
                        buttonSurface = v94
                    });
                    v96(l_NavigateDown_0({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = l_UrlBuilder_0.new({
                            base = l_UrlBase_0.WWW, 
                            path = ("profiles/%*"):format(l_profileId_0)
                        })(), 
                        extraProps = {
                            titleKey = v40.Profile, 
                            onClose = function() --[[ Line: 913 ]] --[[ Name: onClose ]]
                                -- upvalues: v64 (ref), v96 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                                if v64 then
                                    v96(v42.API({
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
                text = v107[v52.ProfileActions.LeaveCommunity], 
                onActivated = function() --[[ Line: 931 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v47 (ref), l_profileId_0 (ref), v95 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonLeaveCommunity, {
                        buttonSurface = v94
                    });
                    return v96(v47.LeaveGroup.API({
                        groupId = l_profileId_0, 
                        userId = v95
                    })):andThen(function() --[[ Line: 939 ]]
                        -- upvalues: v96 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v96(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.MakePrimaryCommunity] = if v62 then {
                text = v107[v52.ProfileActions.MakePrimaryCommunity], 
                onActivated = function() --[[ Line: 953 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v47 (ref), l_profileId_0 (ref), v43 (ref), l_profileType_0 (ref), v52 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonMakePrimaryCommunity, {
                        buttonSurface = v94
                    });
                    return v96(v47.MakePrimaryGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 960 ]]
                        -- upvalues: v96 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v96(v43({
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
                text = v107[v52.ProfileActions.RemovePrimaryCommunity], 
                onActivated = function() --[[ Line: 975 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v47 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonRemovePrimaryCommunity, {
                        buttonSurface = v94
                    });
                    return v96(v47.RemovePrimaryGroup.API()):andThen(function() --[[ Line: 980 ]]
                        -- upvalues: v96 (ref), v43 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v52 (ref)
                        v96(v43({
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
                text = v107[v52.ProfileActions.Follow], 
                onActivated = function() --[[ Line: 998 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v47 (ref), l_profileId_0 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonFollow, {
                        buttonSurface = v94
                    });
                    return v96(v47.JoinGroup.API({
                        groupId = l_profileId_0
                    })):andThen(function() --[[ Line: 1004 ]]
                        -- upvalues: v96 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v96(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.Unfollow] = if v65 and l_profileType_0 == v52.ProfileTypes.Community then {
                text = v107[v52.ProfileActions.Unfollow], 
                onActivated = function() --[[ Line: 1019 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), v47 (ref), l_profileId_0 (ref), v95 (ref), v42 (ref), l_profileType_0 (ref), v41 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonUnfollow, {
                        buttonSurface = v94
                    });
                    return v96(v47.LeaveGroup.API({
                        groupId = l_profileId_0, 
                        userId = v95
                    })):andThen(function() --[[ Line: 1027 ]]
                        -- upvalues: v96 (ref), v42 (ref), l_profileType_0 (ref), l_profileId_0 (ref), v41 (ref)
                        v96(v42.API({
                            profileType = l_profileType_0, 
                            profileId = l_profileId_0, 
                            components = v41(), 
                            includeComponentOrdering = true
                        }));
                    end);
                end
            } else nil, 
            [v52.ProfileActions.RemoveTrustedConnection] = {
                text = v107[v52.ProfileActions.RemoveTrustedConnection], 
                onActivated = function() --[[ Line: 1040 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), l_FFlagLegacyProfileTCIndicator_0 (ref), v93 (ref), l_profileId_0 (ref), v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), v35 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonRemoveTrustedConnection, {
                        buttonSurface = v94
                    });
                    if l_FFlagLegacyProfileTCIndicator_0 then
                        return v93.removeTrustedConnectionRequest(l_profileId_0):andThen(function() --[[ Line: 1045 ]]
                            -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                            v96(l_SetCurrentToastMessage_0({
                                toastMessage = v107.trustedConnectionRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                isLocalized = true
                            }));
                            return v96(v44(l_profileId_0));
                        end);
                    else
                        return v96(v35.RemoveTC.API(l_profileId_0)):andThen(function() --[[ Line: 1054 ]]
                            -- upvalues: v96 (ref), l_SetCurrentToastMessage_0 (ref), v107 (ref), l_Images_0 (ref), v44 (ref), l_profileId_0 (ref)
                            v96(l_SetCurrentToastMessage_0({
                                toastMessage = v107.trustedConnectionRemovedToast, 
                                toastIcon = l_Images_0["icons/actions/friends/friendRemove"], 
                                isLocalized = true
                            }));
                            return v96(v44(l_profileId_0));
                        end);
                    end;
                end
            }, 
            [v52.ProfileActions.AddTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v107[v52.ProfileActions.AddTrustedConnection], 
                onActivated = function() --[[ Line: 1068 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v97 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), l_Sources_0 (ref), v96 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonAddTrustedConnection, {
                        buttonSurface = v94
                    });
                    v97.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        source = l_Sources_0.ProfilePlatform, 
                        onRequestSent = function() --[[ Line: 1075 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v96 (ref), v44 (ref), l_profileId_0 (ref)
                            return v96(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.AddTrustedConnectionViaLink] = if l_FFlagTCShareLinkSenderUI_0 then {
                text = v107[v52.ProfileActions.AddTrustedConnection], 
                onActivated = function() --[[ Line: 1085 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), l_Sources_0 (ref), v97 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v96 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonAddTrustedConnection, {
                        buttonSurface = v94, 
                        modalVariantOverride = l_Sources_0.ShareLinkSender
                    });
                    v97.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        source = l_Sources_0.ProfilePlatform, 
                        modalVariantOverride = l_Sources_0.ShareLinkSender, 
                        onRequestSent = function() --[[ Line: 1094 ]] --[[ Name: onRequestSent ]]
                            -- upvalues: v96 (ref), v44 (ref), l_profileId_0 (ref)
                            return v96(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.AddIncomingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v107[v52.ProfileActions.AddIncomingTrustedConnection], 
                onActivated = function() --[[ Line: 1104 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v97 (ref), l_AppPage_0 (ref), l_profileId_0 (ref), v96 (ref), v44 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonAddIncomingTrustedConnection, {
                        buttonSurface = v94
                    });
                    v97.push(l_AppPage_0.TrustedContactsModal, {
                        userId = l_profileId_0, 
                        onRequestAccepted = function() --[[ Line: 1110 ]] --[[ Name: onRequestAccepted ]]
                            -- upvalues: v96 (ref), v44 (ref), l_profileId_0 (ref)
                            return v96(v44(l_profileId_0));
                        end
                    });
                end
            } else nil, 
            [v52.ProfileActions.PendingTrustedConnection] = if l_FFlagProfilePlatformAddTC_0 then {
                text = v107[v52.ProfileActions.AddTrustedConnection], 
                isDisabled = true, 
                onActivated = function() --[[ Line: 1121 ]] --[[ Name: onActivated ]]

                end
            } else nil, 
            [v52.ProfileActions.ViewAbout] = if l_FFlagProfilePlatformNewProfileHeader_0 then {
                text = v107[v52.ProfileActions.ViewAbout], 
                onActivated = function() --[[ Line: 1127 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v96 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v112 (ref)
                    v100.fireAnalyticsEvent(v51.CTAButtonViewFullProfile, {
                        buttonSurface = v94
                    });
                    v96(l_NavigateDown_0({
                        name = l_AppPage_0.AboutDetailsSheet, 
                        extraProps = {
                            sections = v112
                        }
                    }));
                end
            } else nil, 
            [v52.ProfileActions.ViewPlatformProfile] = if l_FFlagEnablePlatformProfileContextualMenuOption_0 then {
                text = v107[v52.ProfileActions.ViewPlatformProfile], 
                onActivated = function() --[[ Line: 1144 ]] --[[ Name: onActivated ]]
                    -- upvalues: v100 (ref), v51 (ref), v94 (ref), v50 (ref), v110 (ref)
                    v100.fireAnalyticsEvent(v51.ContextualMenuButtonViewPlatformProfile, {
                        buttonSurface = v94
                    });
                    v50:ShowProfile(v110);
                end
            } else nil, 
            [v52.ProfileActions.CurrencyTransfer] = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then {
                text = v107[v52.ProfileActions.CurrencyTransfer], 
                onActivated = function() --[[ Line: 1155 ]] --[[ Name: onActivated ]]
                    -- upvalues: v94 (ref), v52 (ref), v100 (ref), v51 (ref), v99 (ref), l_profileId_0 (ref), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
                    if v94 == v52.ButtonSurface.ContextualMenu then
                        v100.fireAnalyticsEvent(v51.ContextualMenuButtonCurrencyTransfer, {
                            buttonSurface = v94
                        });
                    else
                        v100.fireAnalyticsEvent(v51.CTAButtonCurrencyTransfer, {
                            buttonSurface = v94
                        });
                    end;
                    if v99 then
                        v99({
                            recipientUserId = l_profileId_0, 
                            direction = l_TransferDirection_0.Send, 
                            transferOrigination = l_TransferOrigination_0.Profile
                        });
                    end;
                end
            } else nil
        };
    end, l_dependencyArray_0(v96, l_profileId_0, v98, if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v99 else nil, l_qRCodePage_0, v107, v95, v97, l_editUsername_0, v113.joinExperience, v113.isLoading, v100, v119, v94, if l_FFlagProfilePlatformNewProfileHeader_0 then v112 else nil, l_profileType_0, l_editAvatar_0, if v73 then v116 else nil, if v73 then v117 else nil)));
end;