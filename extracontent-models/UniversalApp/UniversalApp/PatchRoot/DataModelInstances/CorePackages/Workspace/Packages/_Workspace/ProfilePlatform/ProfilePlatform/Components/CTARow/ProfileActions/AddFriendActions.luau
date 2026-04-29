local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local HttpService = game:GetService("HttpService")
local Foundation = require(ProfilePlatformParent.Foundation)
local UIBlox = require(ProfilePlatformParent.UIBlox)
local SocialCommon = require(ProfilePlatformParent.SocialCommon)
local RobloxAppEnums = require(ProfilePlatformParent.RobloxAppEnums)
local Images = UIBlox.App.ImageSet.Images
local ButtonVariant = Foundation.Enums.ButtonVariant
local ContextualInfoTypes = SocialCommon.Enums.ContextualInfoTypes
local AppPage = RobloxAppEnums.AppPage
local SetCurrentToastMessage = require(ProfilePlatformParent.ToastRodux).Actions.SetCurrentToastMessage
local NavigateDown = require(ProfilePlatformParent.NavigationRodux).Thunks.NavigateDown
local NetworkingFriends = require(ProfilePlatform.Networking.NetworkingFriends)
local refreshProfilePlatformActionInfo = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local refreshProfilePlatform = require(ProfilePlatform.Networking.refreshProfilePlatform)
local Constants = require(ProfilePlatform.Common.Constants)
local Enums = require(ProfilePlatform.Common.Enums)

require(ProfilePlatform.Components.CTARow.Types)

local EventNames = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = Enums.ProfileTypes
local FriendRequestNicknamesIXP = require(ProfilePlatformParent.FriendRequestNicknames).FriendRequestNicknamesIXP
local USER_FRIENDING_ERRORS = Constants.USER_FRIENDING_ERRORS
local STATUS_CODES = Constants.STATUS_CODES

local function setErrorToast(p1, s1: string, p2) -- line: 32
	-- upvalues: Enums (copy), STATUS_CODES (copy), USER_FRIENDING_ERRORS (copy), HttpService (copy), SetCurrentToastMessage (copy)
	if p2 ~= nil then
		local StatusCode = p2.StatusCode
		local v29 = if not p2.Body then nil else HttpService:JSONDecode(p2.Body)
		local v30 = (function(p3, p4) --[[ getErrorToastMessage ]] -- line: 33
			-- upvalues: s1 (copy), Enums (copy), STATUS_CODES (copy), USER_FRIENDING_ERRORS (copy), p1 (copy)
			if s1 == Enums.ProfileActions.AddFriend or s1 == Enums.ProfileActions.AddFriendFromContacts then
				if p3 == STATUS_CODES.BAD_REQUEST then
					return ({
						[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = p1.localized.invalidTargetUserError,
						[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = p1.localized.alreadyFriendError,
						[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = p1.localized.maxFriendsError,
						[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = p1.localized.invalidNicknameError
					})[p4]
				end

				if p3 == STATUS_CODES.UNAUTHORIZED then
					return ({
						[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = p1.localized.unauthorizedError
					})[p4]
				end

				if p3 == STATUS_CODES.FORBIDDEN then
					return ({
						[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = p1.localized.userBannedError,
						[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = p1.localized.userBlockedError,
						[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = p1.localized.userNotPassedCaptchaError
					})[p4]
				end

				if p3 == STATUS_CODES.TOO_MANY_REQUESTS then
					return ({
						[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = p1.localized.tooManyRequestsError
					})[p4]
				end
			end

			return nil
		end)(StatusCode, (if not v29 or (not v29.errors or (not v29.errors[1] or not v29.errors[1].code)) then nil else v29.errors[1].code)) or p1.localized.defaultFriendingError

		p1.dispatch(SetCurrentToastMessage({
			toastMessage = v30,
			isLocalized = true
		}))

		return
	end

	p1.dispatch(SetCurrentToastMessage({
		toastMessage = p1.localized.defaultFriendingError,
		isLocalized = true
	}))
end

return {
	[Enums.ProfileActions.AddFriend] = function(p5) -- line: 84
		-- upvalues: Enums (copy), ButtonVariant (copy), ProfileTypes (copy), EventNames (copy), FriendRequestNicknamesIXP (copy), NavigateDown (copy), AppPage (copy), SetCurrentToastMessage (copy), Images (copy), NetworkingFriends (copy), refreshProfilePlatformActionInfo (copy), setErrorToast (copy)
		return {
			text = p5.localized[Enums.ProfileActions.AddFriend],
			variant = ButtonVariant.Emphasis,
			onActivated = {
				[ProfileTypes.User] = function() -- line: 89
					-- upvalues: p5 (copy), EventNames (copy), Enums (copy), FriendRequestNicknamesIXP (copy), NavigateDown (copy), AppPage (copy), SetCurrentToastMessage (copy), Images (copy), NetworkingFriends (copy), refreshProfilePlatformActionInfo (copy), setErrorToast (copy)
					p5.analytics.fireAnalyticsEvent(EventNames.CTAButtonAddFriend, {
						buttonSurface = p5.buttonSurface,
						absolutePosition = p5.profileWrapperContext.sourceInfo.homepageCarouselAbsolutePosition,
						isHomePageCarousel = p5.profileWrapperContext.sourceInfo.source == Enums.Sources.HomepageFriendsCarousel,
						isRecommendation = p5.profileWrapperContext.sourceInfo.isRecommendation,
						source = p5.profileWrapperContext.sourceInfo.source,
						contextualInfoType = p5.profileWrapperContext.sourceInfo.contextualInfoType,
						recommendationContextType = p5.profileWrapperContext.sourceInfo.recommendationContextType,
						recommendationRank = p5.profileWrapperContext.sourceInfo.recommendationRank,
						recommendationSessionId = p5.profileWrapperContext.sourceInfo.recommendationSessionId
					})

					if FriendRequestNicknamesIXP.FFlagFriendRequestNicknames and p5.friendRequestNicknamesEnabled then
						return p5.dispatch(NavigateDown({
							name = AppPage.SetNicknameModal,
							extraProps = {
								friendRequestParams = {
									targetUserId = p5.profileId,
									source = p5.profileWrapperContext.sourceInfo.friendshipOriginSourceType
								}
							}
						}))
					end

					p5.dispatch(SetCurrentToastMessage({
						toastMessage = p5.localized.friendRequestSentToast,
						toastIcon = Images["icons/actions/friends/friendAdd"],
						isLocalized = true
					}))

					return p5.dispatch(NetworkingFriends.RequestFriendshipFromUserId.API({
						targetUserId = p5.profileId,
						currentUserId = p5.localUserId,
						friendshipOriginSourceType = p5.profileWrapperContext.sourceInfo.friendshipOriginSourceType
					})):andThen(function() -- line: 127
						-- upvalues: p5 (copy), refreshProfilePlatformActionInfo (copy)
						return p5.dispatch(refreshProfilePlatformActionInfo(p5.profileId))
					end):catch(function(p6) -- line: 130
						-- upvalues: setErrorToast (copy), p5 (copy), Enums (copy)
						setErrorToast(p5, Enums.ProfileActions.AddFriend, p6)
					end)
				end
			}
		}
	end,
	[Enums.ProfileActions.AddFriendFromContacts] = function(p7) -- line: 139
		-- upvalues: ButtonVariant (copy), Enums (copy), ProfileTypes (copy), SetCurrentToastMessage (copy), Images (copy), NetworkingFriends (copy), ContextualInfoTypes (copy), refreshProfilePlatform (copy), setErrorToast (copy)
		return {
			variant = ButtonVariant.Emphasis,
			text = p7.localized[Enums.ProfileActions.AddFriendFromContacts],
			onActivated = {
				[ProfileTypes.Contact] = function() -- line: 144
					-- upvalues: p7 (copy), SetCurrentToastMessage (copy), Images (copy), NetworkingFriends (copy), ContextualInfoTypes (copy), refreshProfilePlatform (copy), Enums (copy), setErrorToast (copy)
					p7.dispatch(SetCurrentToastMessage({
						toastMessage = p7.localized.friendRequestSentToast,
						toastIcon = Images["icons/actions/friends/friendAdd"],
						isLocalized = true
					}))

					return p7.dispatch(NetworkingFriends.RequestFriendshipFromContactId.API({
						currentUserId = p7.localUserId,
						contactId = p7.profileId,
						contextType = ContextualInfoTypes.Contacts
					})):andThen(function() -- line: 156
						-- upvalues: p7 (copy), refreshProfilePlatform (copy), Enums (copy)
						return p7.dispatch(refreshProfilePlatform({
							profileType = p7.profileType,
							profileId = p7.profileId,
							components = {
								Enums.Components.ContactProfileHeader,
								Enums.Components.Actions,
								Enums.Components.ContactDescription
							}
						}))
					end):catch(function(p8) -- line: 167
						-- upvalues: setErrorToast (copy), p7 (copy), Enums (copy)
						setErrorToast(p7, Enums.ProfileActions.AddFriendFromContacts, p8)
					end)
				end
			}
		}
	end,
	[Enums.ProfileActions.AddFriendFromContactsSent] = function(p9) -- line: 175
		-- upvalues: ButtonVariant (copy), Enums (copy), ProfileTypes (copy)
		return {
			variant = ButtonVariant.Subtle,
			text = p9.localized[Enums.ProfileActions.AddFriendFromContactsSent],
			onActivated = {
				[ProfileTypes.Contact] = function() -- line: 180
				end
			},
			isDisabled = true
		}
	end,
	[Enums.ProfileActions.CannotAddFriend] = function(p10) -- line: 186
		-- upvalues: Enums (copy), ProfileTypes (copy)
		return {
			text = p10.localized[Enums.ProfileActions.CannotAddFriend],
			onActivated = {
				[ProfileTypes.User] = function() -- line: 190
				end
			},
			isDisabled = true
		}
	end
}
