local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local GuiService = game:GetService("GuiService")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local UIBlox = require(ProfilePlatformParent.UIBlox)
local Foundation = require(ProfilePlatformParent.Foundation)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local AppChat = require(ProfilePlatformParent.AppChat)
local SocialCommon = require(ProfilePlatformParent.SocialCommon)
local Navigation = require(ProfilePlatformParent.Navigation)
local SetAlias = require(ProfilePlatformParent.SetAlias)
local SocialExperienceJoin = require(ProfilePlatformParent.SocialExperienceJoin)
local RobloxAppEnums = require(ProfilePlatformParent.RobloxAppEnums)
local SharedFlags = require(ProfilePlatformParent.SharedFlags)
local Http = require(ProfilePlatformParent.Http)
local UrlBuilder = require(ProfilePlatformParent.UrlBuilder).UrlBuilder
local UrlBase = require(ProfilePlatformParent.UrlBuilder).UrlBase
local Images = UIBlox.App.ImageSet.Images
local HttpService = game:GetService("HttpService")
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local useNavigation = Navigation.useNavigation
local CloseCentralOverlay = require(ProfilePlatformParent.CentralOverlay).Thunks.CloseCentralOverlay
local default = require(ProfilePlatformParent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local SetCurrentToastMessage = require(ProfilePlatformParent.ToastRodux).Actions.SetCurrentToastMessage
local NavigationRodux = require(ProfilePlatformParent.NavigationRodux)
local Url = Http.Url
local useLocalization = require(ProfilePlatformParent.Localization).Hooks.useLocalization
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ButtonVariant = Foundation.Enums.ButtonVariant
local IconName = Foundation.Enums.IconName
local NavigateDown = NavigationRodux.Thunks.NavigateDown
local AppPage = RobloxAppEnums.AppPage
local useJoinUserInExperience = SocialExperienceJoin.useJoinUserInExperience
local SocialStopwatch = require(ProfilePlatformParent.SocialStopwatch)
local NetworkingFriends = require(ProfilePlatform.Networking.NetworkingFriends)
local useLocalUserId = require(ProfilePlatformParent.RobloxAppHooks).useLocalUserId
local ProfileShareLinks = require(ProfilePlatformParent.ProfileShareLinks)
local Contexts = require(ProfilePlatformParent.SocialLuaAnalytics).Analytics.Enums.Contexts
local Sources = require(ProfilePlatformParent.SocialLuaAnalytics).Analytics.Enums.Sources
local TextKeys = require(ProfilePlatform.Common.TextKeys)
local getAvailableCommunityComponents = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local getProfilePlatform = require(ProfilePlatform.Networking.getProfilePlatform)
local refreshProfilePlatform = require(ProfilePlatform.Networking.refreshProfilePlatform)
local refreshProfilePlatformActionInfo = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local refreshProfilePlatformUserInfo = require(ProfilePlatform.Networking.refreshProfilePlatformUserInfo)
local useAboutSections = require(ProfilePlatform.Hooks.useAboutSections)
local GroupsNetworking = require(ProfilePlatform.Networking.GroupsNetworking)
local myUserBlockingNetworking = require(ProfilePlatform.Networking.myUserBlockingNetworking)
local useProfileAnalyticsContext = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local getPlatformFriendsService = require(ProfilePlatform.Utils.getPlatformFriendsService)
local EventNames = require(ProfilePlatform.Analytics.EventNames)
local Enums = require(ProfilePlatform.Common.Enums)
local dependencyArray = RoactUtils.Hooks.dependencyArray
local ContextualInfoTypes = SocialCommon.Enums.ContextualInfoTypes
local useProfileShareLink = ProfileShareLinks.Hooks.useProfileShareLink
local useShortUrl = ProfileShareLinks.Hooks.useShortUrl
local useGetOrGenerateLinkUrl = ProfileShareLinks.Hooks.useGetOrGenerateLinkUrl
local useEffectOnce = RoactUtils.Hooks.useEffectOnce
local ProfileSharePolicyEnum = ProfileShareLinks.Enums.ProfileSharePolicyEnum
local DataHydration = require(ProfilePlatformParent.DataHydration)
local FFlagEnableAbuseReportRevampFlow = SharedFlags.FFlagEnableAbuseReportRevampFlow
local FFlagProfilePlatformEnableCommunityProfilePage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCommunityProfilePage)
local FFlagMoveInExperienceModeToEditProfile = require(ProfilePlatformParent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local FFlagProfilePlatformRefreshOnWebviewClose = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshOnWebviewClose)
local FFlagProfilePlatformUpdateUXForNonSocialCommunities = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local FFlagProfilePlatformAddTC = SharedFlags.FFlagProfilePlatformAddTC
local FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage)
local FFlagEnablePlatformProfileContextualMenuOption = require(ProfilePlatformParent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagTCShareLinkSenderUI = require(ProfilePlatformParent.SharedFlags).FFlagTCShareLinkSenderUI
local FFlagTCUnifyNavigationEntry = SharedFlags.FFlagTCUnifyNavigationEntry
local FFlagProfilePlatformNewProfileHeader = SharedFlags.FFlagProfilePlatformNewProfileHeader
local FFlagConnectionsToFriendsRename = SharedFlags.FFlagConnectionsToFriendsRename
local FFlagPendingIncomingTrustedConnection = require(ProfilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local FFlagProfilePlatformPassPresenceToJoinUserInExperience = SharedFlags.FFlagProfilePlatformPassPresenceToJoinUserInExperience
local FFlagEnableAbuseReportRevampProfileAndGroup = require(ProfilePlatform.Flags.FFlagEnableAbuseReportRevampProfileAndGroup)
local FFlagProfilePlatformEnableCurrencyTransfer = SharedFlags.FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableEditAppearanceMenu = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEnableEditLook = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local FFlagLegacyProfileTCIndicator = require(ProfilePlatformParent.SharedFlags).FFlagLegacyProfileTCIndicator
local FFlagProfilePlatformCTAsRefactor = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local ProfileActions = require(ProfilePlatform.Components.CTARow.ProfileActions)
local GenericAbuseReporting = require(ProfilePlatformParent.GenericAbuseReporting)
local AbuseVector = GenericAbuseReporting.Enums.AbuseVector
local OpenDynamicAbuseReport = GenericAbuseReporting.Thunks.OpenDynamicAbuseReport
local ChatEntryPointNames = SocialCommon.Enums.ChatEntryPointNames
local EnteredChatFromEntryPoint = AppChat.Actions.EnteredChatFromEntryPoint
local NotificationTypeList = GuiService:GetNotificationTypeList()
local FriendRequestNicknamesIXP = require(ProfilePlatformParent.FriendRequestNicknames).FriendRequestNicknamesIXP
local Enums2 = require(ProfilePlatformParent.CurrencyTransfers).Enums
local TransferDirection = Enums2.TransferDirection
local TransferOrigination = Enums2.TransferOrigination
local Constants = require(ProfilePlatform.Common.Constants)
local Presence = require(ProfilePlatform.Rodux.Presence)
local FFlagRemoveDependencyArrayAntipattern = require(ProfilePlatformParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local FFlagProfilePlatformEnableUnlockChat = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat)
local USER_BLOCKING_ERRORS = Constants.USER_BLOCKING_ERRORS
local USER_FRIENDING_ERRORS = Constants.USER_FRIENDING_ERRORS
local STATUS_CODES = Constants.STATUS_CODES
local v101 = `{ Url.BASE_URL }share/g/%s`
local str = tostring(DateTime.now().UnixTimestampMillis)
local v103 = if not FFlagLegacyProfileTCIndicator then nil else DataHydration.TrustedConnections.TrustedConnectionsStore.get()

return function(p1) -- line: 137
	-- upvalues: useLocalUserId (copy), useDispatch (copy), useNavigation (copy), useProfileWrapperContext (copy), useProfileAnalyticsContext (copy), useShortUrl (copy), useGetOrGenerateLinkUrl (copy), useEffectOnce (copy), React (copy), str (copy), FFlagConnectionsToFriendsRename (copy), TextKeys (copy), useLocalization (copy), Enums (copy), FFlagProfilePlatformAddTC (copy), FFlagProfilePlatformEnableUnlockChat (copy), FFlagProfilePlatformEnableEditAppearanceMenu (copy), FFlagProfilePlatformEnableEditLook (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), FFlagProfilePlatformUpdateUXForNonSocialCommunities (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagEnablePlatformProfileContextualMenuOption (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformPassPresenceToJoinUserInExperience (copy), useSelector (copy), Presence (copy), useAboutSections (copy), useJoinUserInExperience (copy), FriendRequestNicknamesIXP (copy), useProfileShareLink (copy), Contexts (copy), ProfileSharePolicyEnum (copy), USER_FRIENDING_ERRORS (copy), STATUS_CODES (copy), HttpService (copy), SetCurrentToastMessage (copy), FFlagProfilePlatformCTAsRefactor (copy), ProfileActions (copy), ButtonVariant (copy), EventNames (copy), NetworkingFriends (copy), Images (copy), refreshProfilePlatformActionInfo (copy), NavigateDown (copy), AppPage (copy), ButtonType (copy), ContextualInfoTypes (copy), refreshProfilePlatform (copy), EnteredChatFromEntryPoint (copy), ChatEntryPointNames (copy), GuiService (copy), NotificationTypeList (copy), SocialStopwatch (copy), SetAlias (copy), IconName (copy), Foundation (copy), refreshProfilePlatformUserInfo (copy), FFlagMoveInExperienceModeToEditProfile (copy), default (copy), FFlagEnableAbuseReportRevampFlow (copy), FFlagEnableAbuseReportRevampProfileAndGroup (copy), AbuseVector (copy), OpenDynamicAbuseReport (copy), CloseCentralOverlay (copy), Url (copy), myUserBlockingNetworking (copy), USER_BLOCKING_ERRORS (copy), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage (copy), v101 (copy), GroupsNetworking (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy), UrlBuilder (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), UrlBase (copy), FFlagLegacyProfileTCIndicator (copy), v103 (copy), FFlagTCUnifyNavigationEntry (copy), Sources (copy), FFlagTCShareLinkSenderUI (copy), FFlagPendingIncomingTrustedConnection (copy), getPlatformFriendsService (copy), TransferDirection (copy), TransferOrigination (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy)
	local v106 = useLocalUserId()
	local v107 = useDispatch()
	local v108 = useNavigation()
	local v109 = useProfileWrapperContext()
	local v110 = v109.navigateTo and v109.navigateTo.navigateToTransfer or nil
	local v111 = useProfileAnalyticsContext()
	local v112 = useShortUrl()
	local v113 = useGetOrGenerateLinkUrl()
	local v114 = v112 ~= nil

	useEffectOnce(v113, not v114)

	local v115 = React.useMemo(function() -- line: 151
		-- upvalues: v112 (copy), str (copy)
		return string.format("%s&source=ProfileShare&stamp=%s", v112 or "", str)
	end, { v112 })
	local v116 = if not FFlagConnectionsToFriendsRename then TextKeys.AcceptConnection else TextKeys.AcceptFriend
	local v117 = if not FFlagConnectionsToFriendsRename then TextKeys.AddConnection else TextKeys.AddFriend
	local v118 = useLocalization({
		[Enums.ProfileActions.AcceptFriendRequest] = v116,
		[Enums.ProfileActions.AcceptOffNetworkFriendRequest] = v116,
		[Enums.ProfileActions.AddFriend] = v117,
		[Enums.ProfileActions.AddFriendFromContacts] = v117,
		[Enums.ProfileActions.AddFriendFromContactsSent] = TextKeys.PendingRequest,
		[Enums.ProfileActions.AddTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else TextKeys.AddTrustedConnection,
		[Enums.ProfileActions.AddIncomingTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else TextKeys.AcceptTrustedConnection,
		[Enums.ProfileActions.Block] = TextKeys.Block,
		[Enums.ProfileActions.CannotAddFriend] = v117,
		[Enums.ProfileActions.Chat] = TextKeys.Chat,
		[Enums.ProfileActions.UnlockChat] = if not FFlagProfilePlatformEnableUnlockChat then nil else TextKeys.UnlockChat,
		[Enums.ProfileActions.EditAlias] = TextKeys.CustomizeName,
		[Enums.ProfileActions.EditAppearance] = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else TextKeys.EditAppearance,
		[Enums.ProfileActions.EditEmotes] = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else TextKeys.EditEmotes,
		[Enums.ProfileActions.SwitchAvatar] = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else TextKeys.SwitchAvatar,
		[Enums.ProfileActions.EditAvatar] = TextKeys.EditAvatar,
		[Enums.ProfileActions.EditLook] = if not FFlagProfilePlatformEnableEditLook then nil else TextKeys.EditLook,
		[Enums.ProfileActions.EditProfile] = TextKeys.EditProfile,
		[Enums.ProfileActions.IgnoreFriendRequest] = if not FFlagConnectionsToFriendsRename then TextKeys.IgnoreConnectionRequest else TextKeys.IgnoreFriendRequest,
		[Enums.ProfileActions.JoinExperience] = TextKeys.Join,
		[Enums.ProfileActions.PendingFriendRequest] = TextKeys.PendingRequest,
		[Enums.ProfileActions.QrCode] = TextKeys.ToQRCode,
		[Enums.ProfileActions.Report] = TextKeys.Report,
		[Enums.ProfileActions.ShareProfile] = TextKeys.ShareProfile,
		[Enums.ProfileActions.Unblock] = TextKeys.Unblock,
		[Enums.ProfileActions.Unfriend] = if not FFlagConnectionsToFriendsRename then TextKeys.RemoveConnection else TextKeys.Unfriend,
		[Enums.ProfileActions.CopyLink] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else TextKeys.CopyLink,
		[Enums.ProfileActions.JoinCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else TextKeys.JoinCommunity,
		[Enums.ProfileActions.CancelJoinCommunityRequest] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else TextKeys.CancelJoinCommunityRequest,
		[Enums.ProfileActions.ViewCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else TextKeys.ViewCommunity,
		[Enums.ProfileActions.ViewFullProfile] = if not FFlagProfilePlatformUpdateUXForNonSocialCommunities then nil else TextKeys.ViewFullProfile,
		[Enums.ProfileActions.LeaveCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else TextKeys.LeaveCommunity,
		[Enums.ProfileActions.MakePrimaryCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else TextKeys.MakePrimaryCommunity,
		[Enums.ProfileActions.RemovePrimaryCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else TextKeys.RemovePrimaryCommunity,
		[Enums.ProfileActions.Follow] = if not FFlagProfilePlatformUpdateUXForNonSocialCommunities then nil else TextKeys.Follow,
		[Enums.ProfileActions.Unfollow] = if not FFlagProfilePlatformUpdateUXForNonSocialCommunities then nil else TextKeys.Unfollow,
		[Enums.ProfileActions.RemoveTrustedConnection] = TextKeys.RemoveTrustedConnection,
		[Enums.ProfileActions.ViewAbout] = if not FFlagProfilePlatformNewProfileHeader then nil else TextKeys.AboutThisProfile,
		[Enums.ProfileActions.ViewPlatformProfile] = if not FFlagEnablePlatformProfileContextualMenuOption then nil else TextKeys.ViewPlatformProfile,
		[Enums.ProfileActions.CurrencyTransfer] = if not FFlagProfilePlatformEnableCurrencyTransfer then nil else TextKeys.CurrencyTransfer,
		friendAcceptedToast = if not FFlagConnectionsToFriendsRename then TextKeys.ConnectionAdded else TextKeys.FriendAdded,
		friendRemovedToast = if not FFlagConnectionsToFriendsRename then TextKeys.ConnectionRemoved else TextKeys.FriendRemoved,
		trustedConnectionRemovedToast = TextKeys.TrustedConnectionRemoved,
		friendRequestSentToast = if not FFlagConnectionsToFriendsRename then TextKeys.ConnectionRequestSent else TextKeys.FriendRequestSent,
		friendRequestIgnoredToast = TextKeys.RequestIgnored,
		userBlockedToast = TextKeys.UserBlocked,
		blockLimitReachedToast = TextKeys.BlockLimitReached,
		blocktargetAlreadyBlockedToast = TextKeys.BlockTargetAlreadyBlocked,
		blockedOnPlatformToast = TextKeys.UnblockTargetBlockedOnPlatform,
		unblockTargetNotBlockedToast = TextKeys.UnblockTargetNotBlocked,
		unblockTargetParentManagedToast = TextKeys.UnblockTargetParentManaged,
		somethingIsWrongToast = TextKeys.SomethingIsWrong,
		alreadyFriendError = TextKeys.AlreadyFriendError,
		defaultFriendingError = TextKeys.DefaultFriendingError,
		invalidNicknameError = TextKeys.InvalidNicknameError,
		invalidTargetUserError = TextKeys.InvalidTargetUserError,
		maxFriendsError = TextKeys.MaxFriendsError,
		unauthorizedError = TextKeys.UnauthorizedError,
		userBannedError = TextKeys.UserBannedError,
		userBlockedError = TextKeys.UserBlockedError,
		userNotPassedCaptchaError = TextKeys.UserNotPassedCaptchaError,
		tooManyRequestsError = TextKeys.TooManyRequestsError
	})
	local v119 = React.useCallback(function() -- line: 275
		-- upvalues: v109 (copy)
		v109.navigateTo.previousView(true)
	end, { v109.navigateTo.previousView })
	local profileId = v109.profileId
	local v121 = if not FFlagEnablePlatformProfileContextualMenuOption then nil else v109.profilePlatformId
	local profileType = v109.profileType
	local v123 = if not FFlagProfilePlatformPassPresenceToJoinUserInExperience then nil else useSelector(function(p2) -- line: 285
		-- upvalues: Presence (copy), profileId (copy)
		return Presence.Selectors.getUserPresenceByUserId(p2, profileId) or {
			userPresenceType = Presence.Enums.PresenceType.Offline,
			lastLocation = ""
		}
	end)
	local aboutSections = nil

	if FFlagProfilePlatformNewProfileHeader then
		aboutSections = useAboutSections().aboutSections
	end

	local v125 = useJoinUserInExperience(profileId, {
		isHomePageCarousel = v109.sourceInfo.source == Enums.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = v109.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = v119,
		presence = if not FFlagProfilePlatformPassPresenceToJoinUserInExperience then nil else v123
	})
	local qRCodePage = v109.navigateTo.qRCodePage
	local editUsername = v109.navigateTo.editUsername
	local v128 = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else v109.navigateTo.editEmotes
	local v129 = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else v109.navigateTo.switchAvatar
	local editAvatar = v109.navigateTo.editAvatar
	local v131 = FriendRequestNicknamesIXP.useFriendRequestNicknames()
	local v132 = useProfileShareLink({
		context = Contexts.ProfileCard
	})
	local v133 = v132.policy == ProfileSharePolicyEnum.Disabled
	local t1 = {
		[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = v118.invalidTargetUserError,
		[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = v118.alreadyFriendError,
		[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = v118.maxFriendsError,
		[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = v118.invalidNicknameError
	}
	local t2 = {
		[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = v118.unauthorizedError
	}
	local t3 = {
		[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = v118.userBannedError,
		[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = v118.userBlockedError,
		[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = v118.userNotPassedCaptchaError
	}
	local t4 = {
		[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = v118.tooManyRequestsError
	}

	local function setErrorToast(p3, p4) -- line: 358
		-- upvalues: HttpService (copy), Enums (copy), STATUS_CODES (copy), t1 (copy), t2 (copy), t3 (copy), t4 (copy), v118 (copy), v107 (copy), SetCurrentToastMessage (copy)
		if p4 ~= nil then
			local StatusCode = p4.StatusCode
			local v147 = if not p4.Body then nil else HttpService:JSONDecode(p4.Body)
			local v148 = if not v147 or (not v147.errors or (not v147.errors[1] or not v147.errors[1].code)) then nil else v147.errors[1].code
			local v149 = ((if p3 ~= Enums.ProfileActions.AddFriend and p3 ~= Enums.ProfileActions.AddFriendFromContacts then nil else (if StatusCode ~= STATUS_CODES.BAD_REQUEST then (if StatusCode ~= STATUS_CODES.UNAUTHORIZED then (if StatusCode ~= STATUS_CODES.FORBIDDEN then (if StatusCode ~= STATUS_CODES.TOO_MANY_REQUESTS then nil else t4[v148]) else t3[v148]) else t2[v148]) else t1[v148]))) or v118.defaultFriendingError

			v107(SetCurrentToastMessage({
				toastMessage = v149,
				isLocalized = true
			}))

			return
		end

		v107(SetCurrentToastMessage({
			toastMessage = v118.defaultFriendingError,
			isLocalized = true
		}))
	end

	local v139 = if not FFlagProfilePlatformCTAsRefactor then nil else {
		localized = v118,
		analytics = v111,
		buttonSurface = p1,
		profileWrapperContext = v109,
		navigateTo = v109.navigateTo,
		dispatch = v107,
		profileId = profileId,
		localUserId = v106,
		navigation = v108,
		profileType = profileType,
		experienceUtilities = v125,
		friendRequestNicknamesEnabled = v131,
		profileShareLink = v132,
		PROFILE_SHARE_LINK_URL = v115,
		aboutSections = if not FFlagProfilePlatformNewProfileHeader then nil else aboutSections
	}

	return (React.useMemo(function() -- line: 402
		-- upvalues: FFlagProfilePlatformCTAsRefactor (copy), ProfileActions (copy), v139 (copy), Enums (copy), v118 (copy), ButtonVariant (copy), v111 (copy), EventNames (copy), p1 (copy), v109 (copy), v107 (copy), NetworkingFriends (copy), profileId (copy), v106 (copy), SetCurrentToastMessage (copy), Images (copy), refreshProfilePlatformActionInfo (copy), FriendRequestNicknamesIXP (copy), v131 (copy), NavigateDown (copy), AppPage (copy), setErrorToast (copy), ButtonType (copy), ContextualInfoTypes (copy), refreshProfilePlatform (copy), profileType (copy), v108 (copy), EnteredChatFromEntryPoint (copy), ChatEntryPointNames (copy), GuiService (copy), NotificationTypeList (copy), SocialStopwatch (copy), SetAlias (copy), FFlagProfilePlatformEnableEditAppearanceMenu (copy), IconName (copy), editAvatar (copy), FFlagProfilePlatformEnableEditLook (copy), v128 (copy), v129 (copy), Foundation (copy), editUsername (copy), refreshProfilePlatformUserInfo (copy), FFlagMoveInExperienceModeToEditProfile (copy), v125 (copy), qRCodePage (copy), v133 (copy), default (copy), Contexts (copy), v115 (copy), TextKeys (copy), v132 (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), FFlagEnableAbuseReportRevampFlow (copy), FFlagEnableAbuseReportRevampProfileAndGroup (copy), AbuseVector (copy), OpenDynamicAbuseReport (copy), CloseCentralOverlay (copy), Url (copy), myUserBlockingNetworking (copy), USER_BLOCKING_ERRORS (copy), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage (copy), v101 (copy), GroupsNetworking (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy), UrlBuilder (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), FFlagProfilePlatformUpdateUXForNonSocialCommunities (copy), UrlBase (copy), FFlagLegacyProfileTCIndicator (copy), v103 (copy), FFlagProfilePlatformAddTC (copy), FFlagTCUnifyNavigationEntry (copy), Sources (copy), FFlagTCShareLinkSenderUI (copy), FFlagPendingIncomingTrustedConnection (copy), FFlagProfilePlatformNewProfileHeader (copy), aboutSections (ref), FFlagEnablePlatformProfileContextualMenuOption (copy), getPlatformFriendsService (copy), v121 (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), v110 (copy), TransferDirection (copy), TransferOrigination (copy)
		if FFlagProfilePlatformCTAsRefactor then
			local t5 = {}

			for v151, v152 in ProfileActions do
				local v153 = v152(v139)

				if v153 ~= nil then
					t5[v151] = v153
				end
			end

			return t5
		end

		return {
			[Enums.ProfileActions.AcceptFriendRequest] = {
				text = v118[Enums.ProfileActions.AcceptFriendRequest],
				variant = ButtonVariant.Emphasis,
				onActivated = function() --[[ onActivated ]] -- line: 428
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v109 (copy), Enums (copy), v107 (copy), NetworkingFriends (copy), profileId (copy), v106 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonAcceptFriendRequest, {
						buttonSurface = p1,
						absolutePosition = v109.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = v109.sourceInfo.source == Enums.Sources.HomepageFriendsCarousel,
						isRecommendation = v109.sourceInfo.isRecommendation,
						source = v109.sourceInfo.source,
						contextualInfoType = v109.sourceInfo.contextualInfoType,
						recommendationContextType = v109.sourceInfo.recommendationContextType,
						recommendationRank = v109.sourceInfo.recommendationRank,
						recommendationSessionId = v109.sourceInfo.recommendationSessionId
					})

					return v107(NetworkingFriends.AcceptFriendRequestFromUserId.API({
						targetUserId = profileId,
						currentUserId = v106
					})):andThen(function() -- line: 444
						-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
						v107(SetCurrentToastMessage({
							toastMessage = v118.friendAcceptedToast,
							toastIcon = Images["icons/actions/friends/friendAdd"],
							isLocalized = true
						}))

						return v107(refreshProfilePlatformActionInfo(profileId))
					end)
				end
			},
			[Enums.ProfileActions.AcceptOffNetworkFriendRequest] = {
				text = v118[Enums.ProfileActions.AcceptOffNetworkFriendRequest],
				onActivated = function() --[[ onActivated ]] -- line: 456
					-- upvalues: v111 (copy), EventNames (copy), v109 (copy), v107 (copy), NetworkingFriends (copy), profileId (copy), v106 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonAddFriendFromContacts, {
						shareLinkId = v109.sourceInfo.shareLinkId
					})

					return v107(NetworkingFriends.AcceptFriendRequestWithToken.API({
						targetUserId = profileId,
						currentUserId = v106,
						friendingToken = v109.offNetworkFriendRequestToken
					})):andThen(function() -- line: 464
						-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
						v107(SetCurrentToastMessage({
							toastMessage = v118.friendAcceptedToast,
							toastIcon = Images["icons/actions/friends/friendAdd"],
							isLocalized = true
						}))

						return v107(refreshProfilePlatformActionInfo(profileId))
					end)
				end
			},
			[Enums.ProfileActions.AddFriend] = {
				text = v118[Enums.ProfileActions.AddFriend],
				variant = ButtonVariant.Emphasis,
				onActivated = function() --[[ onActivated ]] -- line: 477
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v109 (copy), Enums (copy), FriendRequestNicknamesIXP (copy), v131 (copy), v107 (copy), NavigateDown (copy), AppPage (copy), profileId (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), NetworkingFriends (copy), v106 (copy), refreshProfilePlatformActionInfo (copy), setErrorToast (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonAddFriend, {
						buttonSurface = p1,
						absolutePosition = v109.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = v109.sourceInfo.source == Enums.Sources.HomepageFriendsCarousel,
						isRecommendation = v109.sourceInfo.isRecommendation,
						source = v109.sourceInfo.source,
						contextualInfoType = v109.sourceInfo.contextualInfoType,
						recommendationContextType = v109.sourceInfo.recommendationContextType,
						recommendationRank = v109.sourceInfo.recommendationRank,
						recommendationSessionId = v109.sourceInfo.recommendationSessionId
					})

					if FriendRequestNicknamesIXP.FFlagFriendRequestNicknames and v131 then
						return v107(NavigateDown({
							name = AppPage.SetNicknameModal,
							extraProps = {
								friendRequestParams = {
									targetUserId = profileId,
									source = v109.sourceInfo.friendshipOriginSourceType
								}
							}
						}))
					end

					v107(SetCurrentToastMessage({
						toastMessage = v118.friendRequestSentToast,
						toastIcon = Images["icons/actions/friends/friendAdd"],
						isLocalized = true
					}))

					return v107(NetworkingFriends.RequestFriendshipFromUserId.API({
						targetUserId = profileId,
						currentUserId = v106,
						friendshipOriginSourceType = v109.sourceInfo.friendshipOriginSourceType
					})):andThen(function() -- line: 514
						-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
						return v107(refreshProfilePlatformActionInfo(profileId))
					end):catch(function(p5) -- line: 517
						-- upvalues: setErrorToast (copy), Enums (copy)
						setErrorToast(Enums.ProfileActions.AddFriend, p5)
					end)
				end
			},
			[Enums.ProfileActions.AddFriendFromContacts] = {
				buttonType = ButtonType.PrimaryContextual,
				variant = ButtonVariant.Emphasis,
				text = v118[Enums.ProfileActions.AddFriendFromContacts],
				onActivated = function() --[[ onActivated ]] -- line: 527
					-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), NetworkingFriends (copy), v106 (copy), profileId (copy), ContextualInfoTypes (copy), refreshProfilePlatform (copy), profileType (copy), Enums (copy), setErrorToast (copy)
					v107(SetCurrentToastMessage({
						toastMessage = v118.friendRequestSentToast,
						toastIcon = Images["icons/actions/friends/friendAdd"],
						isLocalized = true
					}))

					return v107(NetworkingFriends.RequestFriendshipFromContactId.API({
						currentUserId = v106,
						contactId = profileId,
						contextType = ContextualInfoTypes.Contacts
					})):andThen(function() -- line: 538
						-- upvalues: v107 (copy), refreshProfilePlatform (copy), profileType (copy), profileId (copy), Enums (copy)
						return v107(refreshProfilePlatform({
							profileType = profileType,
							profileId = profileId,
							components = {
								Enums.Components.ContactProfileHeader,
								Enums.Components.Actions,
								Enums.Components.ContactDescription
							}
						}))
					end):catch(function(p6) -- line: 549
						-- upvalues: setErrorToast (copy), Enums (copy)
						setErrorToast(Enums.ProfileActions.AddFriendFromContacts, p6)
					end)
				end
			},
			[Enums.ProfileActions.AddFriendFromContactsSent] = {
				buttonType = ButtonType.Secondary,
				variant = ButtonVariant.Subtle,
				text = v118[Enums.ProfileActions.AddFriendFromContactsSent],
				onActivated = function() --[[ onActivated ]] -- line: 558
				end,
				isDisabled = true
			},
			[Enums.ProfileActions.Block] = {
				text = v118[Enums.ProfileActions.Block],
				onActivated = function() --[[ onActivated ]] -- line: 563
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v108 (copy), AppPage (copy), profileId (copy), v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonBlock, {
						buttonSurface = p1
					})
					v108.push(AppPage.BlockingModal, {
						navProps = {
							userId = profileId,
							onBlockSuccess = function() --[[ onBlockSuccess ]] -- line: 570
								-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
								v107(SetCurrentToastMessage({
									toastMessage = v118.userBlockedToast,
									toastIcon = Images["icons/actions/block"],
									isLocalized = true
								}))
								v107(refreshProfilePlatformActionInfo(profileId))
							end
						}
					})
				end
			},
			[Enums.ProfileActions.CannotAddFriend] = {
				text = v118[Enums.ProfileActions.CannotAddFriend],
				onActivated = function() --[[ onActivated ]] -- line: 585
				end,
				isDisabled = true
			},
			[Enums.ProfileActions.Chat] = {
				text = v118[Enums.ProfileActions.Chat],
				variant = ButtonVariant.Standard,
				onActivated = function() --[[ onActivated ]] -- line: 591
					-- upvalues: p1 (copy), Enums (copy), v111 (copy), EventNames (copy), v107 (copy), EnteredChatFromEntryPoint (copy), ChatEntryPointNames (copy), GuiService (copy), profileId (copy), NotificationTypeList (copy)
					if p1 == Enums.ButtonSurface.ContextualMenu then
						v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonChat, {
							buttonSurface = p1
						})
					else
						v111.fireAnalyticsEvent(EventNames.CTAButtonChat, {
							buttonSurface = p1
						})
					end

					v107(EnteredChatFromEntryPoint(ChatEntryPointNames.ProfilePeekView))
					GuiService:BroadcastNotification(profileId, NotificationTypeList.LAUNCH_CONVERSATION)
				end
			},
			[Enums.ProfileActions.EditAlias] = {
				text = v118[Enums.ProfileActions.EditAlias],
				onActivated = function() --[[ onActivated ]] -- line: 608
					-- upvalues: SocialStopwatch (copy), v111 (copy), EventNames (copy), p1 (copy), v108 (copy), Enums (copy), profileId (copy), SetAlias (copy)
					SocialStopwatch.Stopwatch.start(SocialStopwatch.Events.CustomizeNameOpened)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonSetAlias, {
						buttonSurface = p1
					})
					v108.navigate(Enums.Screens.SetAliasModal, {
						profileUserId = profileId,
						origin = SetAlias.Analytics.EntryPoints.ContextualMenu
					})
				end
			},
			[Enums.ProfileActions.EditAppearance] = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else {
				text = v118[Enums.ProfileActions.EditAppearance],
				variant = ButtonVariant.Emphasis,
				onActivated = function() --[[ onActivated ]] -- line: 623
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonEditAppearance, {
						buttonSurface = p1
					})
				end
			},
			[Enums.ProfileActions.EditAvatar] = {
				text = v118[Enums.ProfileActions.EditAvatar],
				icon = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else IconName.Person,
				onActivated = function() --[[ onActivated ]] -- line: 633
					-- upvalues: v111 (copy), FFlagProfilePlatformEnableEditAppearanceMenu (copy), EventNames (copy), p1 (copy), editAvatar (copy)
					v111.fireAnalyticsEvent(if not FFlagProfilePlatformEnableEditAppearanceMenu then EventNames.CTAButtonEditAvatar else EventNames.EditAppearanceMenuEditAvatar, {
						buttonSurface = p1
					})
					editAvatar()
				end
			},
			[Enums.ProfileActions.EditLook] = if not FFlagProfilePlatformEnableEditLook then nil else {
				text = v118[Enums.ProfileActions.EditLook],
				icon = IconName.Person,
				onActivated = function() --[[ onActivated ]] -- line: 649
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), editAvatar (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonEditLook, {
						buttonSurface = p1
					})
					editAvatar()
				end
			},
			[Enums.ProfileActions.EditEmotes] = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else {
				text = v118[Enums.ProfileActions.EditEmotes],
				icon = IconName.SquareFaceWavingHand,
				onActivated = function() --[[ onActivated ]] -- line: 661
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v128 (copy)
					v111.fireAnalyticsEvent(EventNames.EditAppearanceMenuEditEmote, {
						buttonSurface = p1
					})
					v128()
				end
			},
			[Enums.ProfileActions.SwitchAvatar] = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else {
				text = v118[Enums.ProfileActions.SwitchAvatar],
				icon = IconName.PersonStandingArrowReverse,
				onActivated = function() --[[ onActivated ]] -- line: 673
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v129 (copy)
					v111.fireAnalyticsEvent(EventNames.EditAppearanceMenuSwitchAvatar, {
						buttonSurface = p1
					})
					v129()
				end
			},
			[Enums.ProfileActions.EditProfile] = {
				component = Foundation.Button,
				buttonType = ButtonType.PrimarySystem,
				variant = ButtonVariant.Standard,
				text = v118[Enums.ProfileActions.EditProfile],
				onActivated = function() --[[ onActivated ]] -- line: 686
					-- upvalues: SocialStopwatch (copy), v111 (copy), EventNames (copy), p1 (copy), v108 (copy), Enums (copy), editUsername (copy), v107 (copy), refreshProfilePlatformUserInfo (copy), profileId (copy), FFlagMoveInExperienceModeToEditProfile (copy)
					SocialStopwatch.Stopwatch.start(SocialStopwatch.Events.EditProfileOpened)
					v111.fireAnalyticsEvent(EventNames.CTAButtonOpenEditProfilePage, {
						buttonSurface = p1
					})
					v108.navigate(Enums.Screens.EditProfilePage, {
						profileScreens = Enums.Screens,
						navigateToEditUsername = function(p7) --[[ navigateToEditUsername ]] -- line: 693
							-- upvalues: editUsername (copy), v107 (copy), refreshProfilePlatformUserInfo (copy), profileId (copy)
							editUsername({
								showToast = p7,
								onUsernameChanged = function() --[[ onUsernameChanged ]] -- line: 696
									-- upvalues: v107 (copy), refreshProfilePlatformUserInfo (copy), profileId (copy)
									v107(refreshProfilePlatformUserInfo(profileId))
								end
							})
						end,
						onIdentityChange = function() --[[ onIdentityChange ]] -- line: 701
							-- upvalues: v107 (copy), refreshProfilePlatformUserInfo (copy), profileId (copy)
							v107(refreshProfilePlatformUserInfo(profileId))
						end,
						onToggleInExperienceMode = if not FFlagMoveInExperienceModeToEditProfile then nil else function() -- line: 705
							-- upvalues: v107 (copy), refreshProfilePlatformUserInfo (copy), profileId (copy), v111 (copy), EventNames (copy)
							v107(refreshProfilePlatformUserInfo(profileId))
							v111.fireAnalyticsEvent(EventNames.ToggleInExperienceModeButton, {})
						end
					})
				end
			},
			[Enums.ProfileActions.IgnoreFriendRequest] = {
				text = v118[Enums.ProfileActions.IgnoreFriendRequest],
				onActivated = function() --[[ onActivated ]] -- line: 715
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), NetworkingFriends (copy), profileId (copy), v106 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonIgnoreFriendRequest, {
						buttonSurface = p1
					})

					return v107(NetworkingFriends.DeclineFriendRequestFromUserId.API({
						targetUserId = profileId,
						currentUserId = v106
					})):andThen(function() -- line: 722
						-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
						v107(SetCurrentToastMessage({
							toastMessage = v118.friendRequestIgnoredToast,
							toastIcon = Images["icons/actions/reject"],
							isLocalized = true
						}))

						return v107(refreshProfilePlatformActionInfo(profileId))
					end)
				end
			},
			[Enums.ProfileActions.JoinExperience] = {
				buttonType = ButtonType.PrimaryContextual,
				variant = ButtonVariant.Emphasis,
				isLoading = v125.isLoading,
				isDisabled = not v125.isInExperience,
				text = v118[Enums.ProfileActions.JoinExperience],
				onActivated = function() --[[ onActivated ]] -- line: 739
					-- upvalues: v125 (copy)
					v125.joinExperience()
				end
			},
			[Enums.ProfileActions.PendingFriendRequest] = {
				buttonType = ButtonType.Secondary,
				variant = ButtonVariant.Subtle,
				text = v118[Enums.ProfileActions.PendingFriendRequest],
				onActivated = function() --[[ onActivated ]] -- line: 748
				end,
				isDisabled = true
			},
			[Enums.ProfileActions.QrCode] = {
				text = v118[Enums.ProfileActions.QrCode],
				icon = IconName.SquaresGridQr,
				onActivated = function() --[[ onActivated ]] -- line: 754
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), qRCodePage (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonShareProfileQRCode, {
						buttonSurface = p1
					})
					qRCodePage()
				end
			},
			[Enums.ProfileActions.ShareProfile] = {
				component = Foundation.Button,
				buttonType = ButtonType.PrimarySystem,
				variant = ButtonVariant.Standard,
				text = v118[Enums.ProfileActions.ShareProfile],
				onActivated = function() --[[ onActivated ]] -- line: 766
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v133 (copy), default (copy), Contexts (copy), v115 (copy), profileId (copy), v107 (copy), SetCurrentToastMessage (copy), TextKeys (copy), v132 (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonShareProfile, {
						buttonSurface = p1
					})

					if v133 then
						default:setClipboardText({
							context = Contexts.ProfileCard,
							text = string.format("%s/%s", v115, profileId)
						})
						v107(SetCurrentToastMessage({
							toastMessage = TextKeys.LinkCopied
						}))

						return
					end

					v132.onActivated()
				end
			},
			[Enums.ProfileActions.Report] = {
				text = v118[Enums.ProfileActions.Report],
				onActivated = function() --[[ onActivated ]] -- line: 785
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), profileType (copy), Enums (copy), FFlagEnableAbuseReportRevampFlow (copy), FFlagEnableAbuseReportRevampProfileAndGroup (copy), AbuseVector (copy), v107 (copy), OpenDynamicAbuseReport (copy), profileId (copy), CloseCentralOverlay (copy), refreshProfilePlatformActionInfo (copy), NavigateDown (copy), AppPage (copy), Url (copy), TextKeys (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonReport, {
						buttonSurface = p1
					})

					local s1 = nil

					if FFlagProfilePlatformEnableCommunityProfilePage then
						if profileType == Enums.ProfileTypes.User then
							s1 = "userprofile"
						elseif profileType == Enums.ProfileTypes.Community then
							s1 = "group"
						end
					end

					if FFlagEnableAbuseReportRevampFlow and FFlagEnableAbuseReportRevampProfileAndGroup then
						local UserProfile = AbuseVector.UserProfile

						if FFlagProfilePlatformEnableCommunityProfilePage and profileType == Enums.ProfileTypes.Community then
							UserProfile = AbuseVector.Group
						end

						v107(OpenDynamicAbuseReport({
							abuseVector = UserProfile,
							targetId = profileId,
							onClose = function() --[[ onClose ]] -- line: 808
								-- upvalues: v107 (copy), CloseCentralOverlay (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
								v107(CloseCentralOverlay())
								v107(refreshProfilePlatformActionInfo(profileId))
							end
						}))

						return
					end

					v107(NavigateDown({
						name = AppPage.GenericWebPage,
						detail = if not FFlagProfilePlatformEnableCommunityProfilePage then string.format("%sabusereport/userprofile?id=%s", Url.BASE_URL, profileId) else `{ Url.BASE_URL }abusereport/{ s1 }?id={ profileId }`,
						extraProps = {
							titleKey = TextKeys.Report
						}
					}))
				end
			},
			[Enums.ProfileActions.Unblock] = {
				text = v118[Enums.ProfileActions.Unblock],
				onActivated = function() --[[ onActivated ]] -- line: 832
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), myUserBlockingNetworking (copy), profileId (copy), v106 (copy), refreshProfilePlatformActionInfo (copy), USER_BLOCKING_ERRORS (copy), SetCurrentToastMessage (copy), v118 (copy), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonUnblock, {
						buttonSurface = p1
					})

					return v107(myUserBlockingNetworking.UnblockUserById.API({
						userId = profileId,
						currentUserId = v106
					})):andThen(function() -- line: 840
						-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
						return v107(refreshProfilePlatformActionInfo(profileId))
					end):catch(function(p8) -- line: 843
						-- upvalues: USER_BLOCKING_ERRORS (copy), v107 (copy), SetCurrentToastMessage (copy), v118 (copy), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage (copy)
						if p8 ~= nil and tonumber(p8.Body) == USER_BLOCKING_ERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
							v107(SetCurrentToastMessage({
								toastMessage = v118.unblockTargetParentManagedToast,
								isLocalized = true
							}))

							return
						end

						if p8 ~= nil and tonumber(p8.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
							v107(SetCurrentToastMessage({
								toastMessage = v118.unblockTargetNotBlockedToast,
								isLocalized = true
							}))

							return
						end

						if FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage and p8 ~= nil and tonumber(p8.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
							v107(SetCurrentToastMessage({
								toastMessage = v118.blockedOnPlatformToast,
								isLocalized = true
							}))

							return
						end

						v107(SetCurrentToastMessage({
							toastMessage = v118.somethingIsWrongToast,
							isLocalized = true
						}))
					end)
				end
			},
			[Enums.ProfileActions.Unfriend] = {
				text = v118[Enums.ProfileActions.Unfriend],
				onActivated = function() --[[ onActivated ]] -- line: 887
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), NetworkingFriends (copy), profileId (copy), v106 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonUnfriend, {
						buttonSurface = p1
					})

					return v107(NetworkingFriends.UnfriendTargetUserId.API({
						targetUserId = profileId,
						currentUserId = v106
					})):andThen(function() -- line: 894
						-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
						v107(SetCurrentToastMessage({
							toastMessage = v118.friendRemovedToast,
							toastIcon = Images["icons/actions/friends/friendRemove"],
							isLocalized = true
						}))

						return v107(refreshProfilePlatformActionInfo(profileId))
					end)
				end
			},
			[Enums.ProfileActions.CopyLink] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
				text = v118[Enums.ProfileActions.CopyLink],
				onActivated = function() --[[ onActivated ]] -- line: 907
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), default (copy), Contexts (copy), v101 (copy), profileId (copy), v107 (copy), SetCurrentToastMessage (copy), TextKeys (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonCopyLink, {
						buttonSurface = p1
					})
					default:setClipboardText({
						context = Contexts.ProfileCard,
						text = string.format(v101, profileId)
					})
					v107(SetCurrentToastMessage({
						toastMessage = TextKeys.LinkCopied
					}))
				end
			},
			[Enums.ProfileActions.JoinCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
				buttonType = ButtonType.PrimaryContextual,
				variant = ButtonVariant.Emphasis,
				text = v118[Enums.ProfileActions.JoinCommunity],
				onActivated = function() --[[ onActivated ]] -- line: 927
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), GroupsNetworking (copy), profileId (copy), getProfilePlatform (copy), profileType (copy), getAvailableCommunityComponents (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonJoinCommunity, {
						buttonSurface = p1
					})

					return v107(GroupsNetworking.JoinGroup.API({
						groupId = profileId
					})):andThen(function() -- line: 934
						-- upvalues: v107 (copy), getProfilePlatform (copy), profileType (copy), profileId (copy), getAvailableCommunityComponents (copy)
						v107(getProfilePlatform.API({
							profileType = profileType,
							profileId = profileId,
							components = getAvailableCommunityComponents(),
							includeComponentOrdering = true
						}))
					end)
				end
			},
			[Enums.ProfileActions.CancelJoinCommunityRequest] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
				buttonType = ButtonType.PrimarySystem,
				variant = ButtonVariant.Standard,
				text = v118[Enums.ProfileActions.CancelJoinCommunityRequest],
				onActivated = function() --[[ onActivated ]] -- line: 950
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), GroupsNetworking (copy), profileId (copy), v106 (copy), refreshProfilePlatform (copy), profileType (copy), Enums (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonCancelJoinCommunityRequest, {
						buttonSurface = p1
					})

					return v107(GroupsNetworking.CancelJoinGroupRequest.API({
						groupId = profileId,
						userId = v106
					})):andThen(function() -- line: 958
						-- upvalues: v107 (copy), refreshProfilePlatform (copy), profileType (copy), profileId (copy), Enums (copy)
						v107(refreshProfilePlatform({
							profileType = profileType,
							profileId = profileId,
							components = { Enums.Components.Actions }
						}))
					end)
				end
			},
			[Enums.ProfileActions.ViewCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
				buttonType = ButtonType.PrimarySystem,
				variant = ButtonVariant.SubEmphasis,
				text = v118[Enums.ProfileActions.ViewCommunity],
				onActivated = function() --[[ onActivated ]] -- line: 975
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), NavigateDown (copy), AppPage (copy), UrlBuilder (copy), profileId (copy), TextKeys (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), getProfilePlatform (copy), profileType (copy), getAvailableCommunityComponents (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonViewCommunity, {
						buttonSurface = p1
					})
					v107(NavigateDown({
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.user.group({
							groupId = profileId
						}),
						extraProps = {
							titleKey = TextKeys.Community,
							onClose = function() --[[ onClose ]] -- line: 985
								-- upvalues: FFlagProfilePlatformRefreshOnWebviewClose (copy), v107 (copy), getProfilePlatform (copy), profileType (copy), profileId (copy), getAvailableCommunityComponents (copy)
								if FFlagProfilePlatformRefreshOnWebviewClose then
									v107(getProfilePlatform.API({
										profileType = profileType,
										profileId = profileId,
										components = getAvailableCommunityComponents(),
										includeComponentOrdering = true
									}))
								end
							end
						}
					}))
				end
			},
			[Enums.ProfileActions.ViewFullProfile] = if not FFlagProfilePlatformUpdateUXForNonSocialCommunities then nil else {
				buttonType = ButtonType.PrimarySystem,
				variant = ButtonVariant.SubEmphasis,
				text = v118[Enums.ProfileActions.ViewFullProfile],
				onActivated = function() --[[ onActivated ]] -- line: 1005
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), NavigateDown (copy), AppPage (copy), UrlBuilder (copy), UrlBase (copy), profileId (copy), TextKeys (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), getProfilePlatform (copy), profileType (copy), getAvailableCommunityComponents (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonViewFullProfile, {
						buttonSurface = p1
					})
					v107(NavigateDown({
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.new({
							base = UrlBase.WWW,
							path = `profiles/{ profileId }`
						})(),
						extraProps = {
							titleKey = TextKeys.Profile,
							onClose = function() --[[ onClose ]] -- line: 1018
								-- upvalues: FFlagProfilePlatformRefreshOnWebviewClose (copy), v107 (copy), getProfilePlatform (copy), profileType (copy), profileId (copy), getAvailableCommunityComponents (copy)
								if FFlagProfilePlatformRefreshOnWebviewClose then
									v107(getProfilePlatform.API({
										profileType = profileType,
										profileId = profileId,
										components = getAvailableCommunityComponents(),
										includeComponentOrdering = true
									}))
								end
							end
						}
					}))
				end
			},
			[Enums.ProfileActions.LeaveCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
				text = v118[Enums.ProfileActions.LeaveCommunity],
				onActivated = function() --[[ onActivated ]] -- line: 1036
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), GroupsNetworking (copy), profileId (copy), v106 (copy), getProfilePlatform (copy), profileType (copy), getAvailableCommunityComponents (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonLeaveCommunity, {
						buttonSurface = p1
					})

					return v107(GroupsNetworking.LeaveGroup.API({
						groupId = profileId,
						userId = v106
					})):andThen(function() -- line: 1044
						-- upvalues: v107 (copy), getProfilePlatform (copy), profileType (copy), profileId (copy), getAvailableCommunityComponents (copy)
						v107(getProfilePlatform.API({
							profileType = profileType,
							profileId = profileId,
							components = getAvailableCommunityComponents(),
							includeComponentOrdering = true
						}))
					end)
				end
			},
			[Enums.ProfileActions.MakePrimaryCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
				text = v118[Enums.ProfileActions.MakePrimaryCommunity],
				onActivated = function() --[[ onActivated ]] -- line: 1058
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), GroupsNetworking (copy), profileId (copy), refreshProfilePlatform (copy), profileType (copy), Enums (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonMakePrimaryCommunity, {
						buttonSurface = p1
					})

					return v107(GroupsNetworking.MakePrimaryGroup.API({
						groupId = profileId
					})):andThen(function() -- line: 1065
						-- upvalues: v107 (copy), refreshProfilePlatform (copy), profileType (copy), profileId (copy), Enums (copy)
						v107(refreshProfilePlatform({
							profileType = profileType,
							profileId = profileId,
							components = { Enums.Components.Actions }
						}))
					end)
				end
			},
			[Enums.ProfileActions.RemovePrimaryCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
				text = v118[Enums.ProfileActions.RemovePrimaryCommunity],
				onActivated = function() --[[ onActivated ]] -- line: 1080
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), GroupsNetworking (copy), refreshProfilePlatform (copy), profileType (copy), profileId (copy), Enums (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonRemovePrimaryCommunity, {
						buttonSurface = p1
					})

					return v107(GroupsNetworking.RemovePrimaryGroup.API()):andThen(function() -- line: 1085
						-- upvalues: v107 (copy), refreshProfilePlatform (copy), profileType (copy), profileId (copy), Enums (copy)
						v107(refreshProfilePlatform({
							profileType = profileType,
							profileId = profileId,
							components = { Enums.Components.Actions }
						}))
					end)
				end
			},
			[Enums.ProfileActions.Follow] = if not FFlagProfilePlatformUpdateUXForNonSocialCommunities or profileType ~= Enums.ProfileTypes.Community then nil else {
				buttonType = ButtonType.PrimaryContextual,
				variant = ButtonVariant.Standard,
				text = v118[Enums.ProfileActions.Follow],
				onActivated = function() --[[ onActivated ]] -- line: 1103
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), GroupsNetworking (copy), profileId (copy), getProfilePlatform (copy), profileType (copy), getAvailableCommunityComponents (copy)
					v111.fireAnalyticsEvent(EventNames.CTAButtonFollow, {
						buttonSurface = p1
					})

					return v107(GroupsNetworking.JoinGroup.API({
						groupId = profileId
					})):andThen(function() -- line: 1109
						-- upvalues: v107 (copy), getProfilePlatform (copy), profileType (copy), profileId (copy), getAvailableCommunityComponents (copy)
						v107(getProfilePlatform.API({
							profileType = profileType,
							profileId = profileId,
							components = getAvailableCommunityComponents(),
							includeComponentOrdering = true
						}))
					end)
				end
			},
			[Enums.ProfileActions.Unfollow] = if not FFlagProfilePlatformUpdateUXForNonSocialCommunities or profileType ~= Enums.ProfileTypes.Community then nil else {
				text = v118[Enums.ProfileActions.Unfollow],
				onActivated = function() --[[ onActivated ]] -- line: 1124
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), GroupsNetworking (copy), profileId (copy), v106 (copy), getProfilePlatform (copy), profileType (copy), getAvailableCommunityComponents (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonUnfollow, {
						buttonSurface = p1
					})

					return v107(GroupsNetworking.LeaveGroup.API({
						groupId = profileId,
						userId = v106
					})):andThen(function() -- line: 1132
						-- upvalues: v107 (copy), getProfilePlatform (copy), profileType (copy), profileId (copy), getAvailableCommunityComponents (copy)
						v107(getProfilePlatform.API({
							profileType = profileType,
							profileId = profileId,
							components = getAvailableCommunityComponents(),
							includeComponentOrdering = true
						}))
					end)
				end
			},
			[Enums.ProfileActions.RemoveTrustedConnection] = {
				text = v118[Enums.ProfileActions.RemoveTrustedConnection],
				onActivated = function() --[[ onActivated ]] -- line: 1145
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), FFlagLegacyProfileTCIndicator (copy), v103 (copy), profileId (copy), v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), NetworkingFriends (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonRemoveTrustedConnection, {
						buttonSurface = p1
					})

					if FFlagLegacyProfileTCIndicator then
						return v103.removeTrustedConnectionRequest(profileId):andThen(function() -- line: 1150
							-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
							v107(SetCurrentToastMessage({
								toastMessage = v118.trustedConnectionRemovedToast,
								toastIcon = Images["icons/actions/friends/friendRemove"],
								isLocalized = true
							}))

							return v107(refreshProfilePlatformActionInfo(profileId))
						end)
					end

					return v107(NetworkingFriends.RemoveTC.API(profileId)):andThen(function() -- line: 1159
						-- upvalues: v107 (copy), SetCurrentToastMessage (copy), v118 (copy), Images (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
						v107(SetCurrentToastMessage({
							toastMessage = v118.trustedConnectionRemovedToast,
							toastIcon = Images["icons/actions/friends/friendRemove"],
							isLocalized = true
						}))

						return v107(refreshProfilePlatformActionInfo(profileId))
					end)
				end
			},
			[Enums.ProfileActions.AddTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else {
				text = v118[Enums.ProfileActions.AddTrustedConnection],
				onActivated = function() --[[ onActivated ]] -- line: 1173
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), FFlagTCUnifyNavigationEntry (copy), v108 (copy), AppPage (copy), profileId (copy), Sources (copy), v107 (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonAddTrustedConnection, {
						buttonSurface = p1
					})

					if FFlagTCUnifyNavigationEntry then
						v108.push(AppPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = Sources.ProfilePlatform,
								onRequestSent = function() --[[ onRequestSent ]] -- line: 1182
									-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
									return v107(refreshProfilePlatformActionInfo(profileId))
								end
							}
						})

						return
					end

					v108.push(AppPage.TrustedContactsModal, {
						userId = profileId,
						source = Sources.ProfilePlatform,
						onRequestSent = function() --[[ onRequestSent ]] -- line: 1191
							-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
							return v107(refreshProfilePlatformActionInfo(profileId))
						end
					})
				end
			},
			[Enums.ProfileActions.AddTrustedConnectionViaLink] = if not FFlagTCShareLinkSenderUI then nil else {
				text = v118[Enums.ProfileActions.AddTrustedConnection],
				onActivated = function() --[[ onActivated ]] -- line: 1202
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), Sources (copy), FFlagTCUnifyNavigationEntry (copy), v108 (copy), AppPage (copy), profileId (copy), v107 (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonAddTrustedConnection, {
						buttonSurface = p1,
						modalVariantOverride = Sources.ShareLinkSender
					})

					if FFlagTCUnifyNavigationEntry then
						v108.push(AppPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = Sources.ProfilePlatform,
								modalVariantOverride = Sources.ShareLinkSender,
								onRequestSent = function() --[[ onRequestSent ]] -- line: 1213
									-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
									return v107(refreshProfilePlatformActionInfo(profileId))
								end
							}
						})

						return
					end

					v108.push(AppPage.TrustedContactsModal, {
						userId = profileId,
						source = Sources.ProfilePlatform,
						modalVariantOverride = Sources.ShareLinkSender,
						onRequestSent = function() --[[ onRequestSent ]] -- line: 1223
							-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
							return v107(refreshProfilePlatformActionInfo(profileId))
						end
					})
				end
			},
			[Enums.ProfileActions.AddIncomingTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else {
				text = v118[Enums.ProfileActions.AddIncomingTrustedConnection],
				onActivated = function() --[[ onActivated ]] -- line: 1234
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), FFlagTCUnifyNavigationEntry (copy), v108 (copy), AppPage (copy), profileId (copy), v107 (copy), refreshProfilePlatformActionInfo (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonAddIncomingTrustedConnection, {
						buttonSurface = p1
					})

					if FFlagTCUnifyNavigationEntry then
						v108.push(AppPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								onRequestAccepted = function() --[[ onRequestAccepted ]] -- line: 1245
									-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
									return v107(refreshProfilePlatformActionInfo(profileId))
								end
							}
						})

						return
					end

					v108.push(AppPage.TrustedContactsModal, {
						userId = profileId,
						onRequestAccepted = function() --[[ onRequestAccepted ]] -- line: 1253
							-- upvalues: v107 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
							return v107(refreshProfilePlatformActionInfo(profileId))
						end
					})
				end
			},
			[Enums.ProfileActions.PendingTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else {
				text = v118[Enums.ProfileActions.AddTrustedConnection],
				isDisabled = true,
				onActivated = function() --[[ onActivated ]] -- line: 1265
				end
			},
			[Enums.ProfileActions.PendingIncomingTrustedConnection] = if not FFlagPendingIncomingTrustedConnection then nil else {
				text = v118[Enums.ProfileActions.AddIncomingTrustedConnection],
				isDisabled = true,
				onActivated = function() --[[ onActivated ]] -- line: 1272
				end
			},
			[Enums.ProfileActions.ViewAbout] = if not FFlagProfilePlatformNewProfileHeader then nil else {
				text = v118[Enums.ProfileActions.ViewAbout],
				onActivated = function() --[[ onActivated ]] -- line: 1278
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), v107 (copy), NavigateDown (copy), AppPage (copy), aboutSections (ref)
					v111.fireAnalyticsEvent(EventNames.CTAButtonViewFullProfile, {
						buttonSurface = p1
					})
					v107(NavigateDown({
						name = AppPage.AboutDetailsSheet,
						extraProps = {
							sections = aboutSections
						}
					}))
				end
			},
			[Enums.ProfileActions.ViewPlatformProfile] = if not FFlagEnablePlatformProfileContextualMenuOption then nil else {
				text = v118[Enums.ProfileActions.ViewPlatformProfile],
				onActivated = function() --[[ onActivated ]] -- line: 1295
					-- upvalues: v111 (copy), EventNames (copy), p1 (copy), getPlatformFriendsService (copy), v121 (copy)
					v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonViewPlatformProfile, {
						buttonSurface = p1
					})
					getPlatformFriendsService:ShowProfile(v121)
				end
			},
			[Enums.ProfileActions.CurrencyTransfer] = if not FFlagProfilePlatformEnableCurrencyTransfer then nil else {
				text = v118[Enums.ProfileActions.CurrencyTransfer],
				onActivated = function() --[[ onActivated ]] -- line: 1306
					-- upvalues: p1 (copy), Enums (copy), v111 (copy), EventNames (copy), v110 (copy), profileId (copy), TransferDirection (copy), TransferOrigination (copy)
					if p1 == Enums.ButtonSurface.ContextualMenu then
						v111.fireAnalyticsEvent(EventNames.ContextualMenuButtonCurrencyTransfer, {
							buttonSurface = p1
						})
					else
						v111.fireAnalyticsEvent(EventNames.CTAButtonCurrencyTransfer, {
							buttonSurface = p1
						})
					end

					if v110 then
						v110({
							recipientUserId = profileId,
							direction = TransferDirection.Send,
							transferOrigination = TransferOrigination.Profile
						})
					end
				end
			}
		}
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v107, profileId, v109, if not FFlagProfilePlatformEnableCurrencyTransfer then nil else v110, qRCodePage, v118, v106, v108, editUsername, v125.joinExperience, v125.isLoading, v111, v131, p1, if not FFlagProfilePlatformNewProfileHeader then nil else aboutSections, profileType, editAvatar, if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else v128, if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else v129) else {
		v107,
		profileId,
		v109,
		if not FFlagProfilePlatformEnableCurrencyTransfer then nil else v110,
		qRCodePage,
		v118,
		v106,
		v108,
		editUsername,
		v125.joinExperience,
		v125.isLoading,
		v111,
		v131,
		p1,
		if not FFlagProfilePlatformNewProfileHeader then nil else aboutSections,
		profileType,
		editAvatar,
		if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else v128,
		if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else v129,
		if not FFlagProfilePlatformCTAsRefactor then nil else v115,
		if not FFlagProfilePlatformCTAsRefactor then nil else v125.isInExperience,
		if not FFlagProfilePlatformCTAsRefactor then nil else v139
	}))
end
