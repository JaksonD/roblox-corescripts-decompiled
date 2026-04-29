local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local Foundation = require(ProfilePlatformParent.Foundation)
local RobloxAppEnums = require(ProfilePlatformParent.RobloxAppEnums)
local ButtonVariant = Foundation.Enums.ButtonVariant
local AppPage = RobloxAppEnums.AppPage
local UrlBuilder = require(ProfilePlatformParent.UrlBuilder).UrlBuilder
local UrlBase = require(ProfilePlatformParent.UrlBuilder).UrlBase
local default = require(ProfilePlatformParent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local Url = require(ProfilePlatformParent.Http).Url
local SetCurrentToastMessage = require(ProfilePlatformParent.ToastRodux).Actions.SetCurrentToastMessage
local NavigateDown = require(ProfilePlatformParent.NavigationRodux).Thunks.NavigateDown
local Contexts = require(ProfilePlatformParent.SocialLuaAnalytics).Analytics.Enums.Contexts
local GroupsNetworking = require(ProfilePlatform.Networking.GroupsNetworking)
local getProfilePlatform = require(ProfilePlatform.Networking.getProfilePlatform)
local refreshProfilePlatform = require(ProfilePlatform.Networking.refreshProfilePlatform)
local getAvailableCommunityComponents = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local TextKeys = require(ProfilePlatform.Common.TextKeys)
local Enums = require(ProfilePlatform.Common.Enums)

require(ProfilePlatform.Components.CTARow.Types)

local EventNames = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = Enums.ProfileTypes
local FFlagProfilePlatformEnableCommunityProfilePage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCommunityProfilePage)
local FFlagProfilePlatformRefreshOnWebviewClose = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshOnWebviewClose)
local FFlagProfilePlatformUpdateUXForNonSocialCommunities = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local v25 = `{ Url.BASE_URL }share/g/%s`

return {
	[Enums.ProfileActions.CopyLink] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else function(p1) -- line: 43
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), default (copy), Contexts (copy), v25 (copy), SetCurrentToastMessage (copy), TextKeys (copy)
		return {
			text = p1.localized[Enums.ProfileActions.CopyLink],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 47
					-- upvalues: p1 (copy), EventNames (copy), default (copy), Contexts (copy), v25 (copy), SetCurrentToastMessage (copy), TextKeys (copy)
					p1.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonCopyLink, {
						buttonSurface = p1.buttonSurface
					})
					default:setClipboardText({
						context = Contexts.ProfileCard,
						text = string.format(v25, p1.profileId)
					})
					p1.dispatch(SetCurrentToastMessage({
						toastMessage = TextKeys.LinkCopied
					}))
				end
			}
		}
	end,
	[Enums.ProfileActions.JoinCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else function(p2) -- line: 66
		-- upvalues: ButtonVariant (copy), Enums (copy), ProfileTypes (copy), EventNames (copy), GroupsNetworking (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
		return {
			variant = ButtonVariant.Emphasis,
			text = p2.localized[Enums.ProfileActions.JoinCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 71
					-- upvalues: p2 (copy), EventNames (copy), GroupsNetworking (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
					p2.analytics.fireAnalyticsEvent(EventNames.CTAButtonJoinCommunity, {
						buttonSurface = p2.buttonSurface
					})

					return p2.dispatch(GroupsNetworking.JoinGroup.API({
						groupId = p2.profileId
					})):andThen(function() -- line: 80
						-- upvalues: p2 (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
						p2.dispatch(getProfilePlatform.API({
							profileType = p2.profileType,
							profileId = p2.profileId,
							components = getAvailableCommunityComponents(),
							includeComponentOrdering = true
						}))
					end)
				end
			}
		}
	end,
	[Enums.ProfileActions.CancelJoinCommunityRequest] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else function(p3) -- line: 95
		-- upvalues: ButtonVariant (copy), Enums (copy), ProfileTypes (copy), EventNames (copy), GroupsNetworking (copy), refreshProfilePlatform (copy)
		return {
			variant = ButtonVariant.Standard,
			text = p3.localized[Enums.ProfileActions.CancelJoinCommunityRequest],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 100
					-- upvalues: p3 (copy), EventNames (copy), GroupsNetworking (copy), refreshProfilePlatform (copy), Enums (copy)
					p3.analytics.fireAnalyticsEvent(EventNames.CTAButtonCancelJoinCommunityRequest, {
						buttonSurface = p3.buttonSurface
					})

					return p3.dispatch(GroupsNetworking.CancelJoinGroupRequest.API({
						groupId = p3.profileId,
						userId = p3.localUserId
					})):andThen(function() -- line: 110
						-- upvalues: p3 (copy), refreshProfilePlatform (copy), Enums (copy)
						p3.dispatch(refreshProfilePlatform({
							profileType = p3.profileType,
							profileId = p3.profileId,
							components = { Enums.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[Enums.ProfileActions.ViewCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else function(p4) -- line: 126
		-- upvalues: ButtonVariant (copy), Enums (copy), ProfileTypes (copy), EventNames (copy), NavigateDown (copy), AppPage (copy), UrlBuilder (copy), TextKeys (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
		return {
			variant = ButtonVariant.SubEmphasis,
			text = p4.localized[Enums.ProfileActions.ViewCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 131
					-- upvalues: p4 (copy), EventNames (copy), NavigateDown (copy), AppPage (copy), UrlBuilder (copy), TextKeys (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
					p4.analytics.fireAnalyticsEvent(EventNames.CTAButtonViewCommunity, {
						buttonSurface = p4.buttonSurface
					})
					p4.dispatch(NavigateDown({
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.user.group({
							groupId = p4.profileId
						}),
						extraProps = {
							titleKey = TextKeys.Community,
							onClose = function() --[[ onClose ]] -- line: 141
								-- upvalues: FFlagProfilePlatformRefreshOnWebviewClose (copy), p4 (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
								if FFlagProfilePlatformRefreshOnWebviewClose then
									p4.dispatch(getProfilePlatform.API({
										profileType = p4.profileType,
										profileId = p4.profileId,
										components = getAvailableCommunityComponents(),
										includeComponentOrdering = true
									}))
								end
							end
						}
					}))
				end
			}
		}
	end,
	[Enums.ProfileActions.ViewFullProfile] = if not FFlagProfilePlatformUpdateUXForNonSocialCommunities then nil else function(p5) -- line: 160
		-- upvalues: ButtonVariant (copy), Enums (copy), ProfileTypes (copy), EventNames (copy), NavigateDown (copy), AppPage (copy), UrlBuilder (copy), UrlBase (copy), TextKeys (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
		return {
			variant = ButtonVariant.SubEmphasis,
			text = p5.localized[Enums.ProfileActions.ViewFullProfile],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 165
					-- upvalues: p5 (copy), EventNames (copy), NavigateDown (copy), AppPage (copy), UrlBuilder (copy), UrlBase (copy), TextKeys (copy), FFlagProfilePlatformRefreshOnWebviewClose (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
					p5.analytics.fireAnalyticsEvent(EventNames.CTAButtonViewFullProfile, {
						buttonSurface = p5.buttonSurface
					})
					p5.dispatch(NavigateDown({
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.new({
							base = UrlBase.WWW,
							path = `profiles/{ p5.profileId }`
						})(),
						extraProps = {
							titleKey = TextKeys.Profile,
							onClose = function() --[[ onClose ]] -- line: 178
								-- upvalues: FFlagProfilePlatformRefreshOnWebviewClose (copy), p5 (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
								if FFlagProfilePlatformRefreshOnWebviewClose then
									p5.dispatch(getProfilePlatform.API({
										profileType = p5.profileType,
										profileId = p5.profileId,
										components = getAvailableCommunityComponents(),
										includeComponentOrdering = true
									}))
								end
							end
						}
					}))
				end
			}
		}
	end,
	[Enums.ProfileActions.LeaveCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else function(p6) -- line: 197
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), GroupsNetworking (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
		return {
			text = p6.localized[Enums.ProfileActions.LeaveCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 201
					-- upvalues: p6 (copy), EventNames (copy), GroupsNetworking (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
					p6.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonLeaveCommunity, {
						buttonSurface = p6.buttonSurface
					})

					return p6.dispatch(GroupsNetworking.LeaveGroup.API({
						groupId = p6.profileId,
						userId = p6.localUserId
					})):andThen(function() -- line: 211
						-- upvalues: p6 (copy), getProfilePlatform (copy), getAvailableCommunityComponents (copy)
						p6.dispatch(getProfilePlatform.API({
							profileType = p6.profileType,
							profileId = p6.profileId,
							components = getAvailableCommunityComponents(),
							includeComponentOrdering = true
						}))
					end)
				end
			}
		}
	end,
	[Enums.ProfileActions.MakePrimaryCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else function(p7) -- line: 226
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), GroupsNetworking (copy), refreshProfilePlatform (copy)
		return {
			text = p7.localized[Enums.ProfileActions.MakePrimaryCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 230
					-- upvalues: p7 (copy), EventNames (copy), GroupsNetworking (copy), refreshProfilePlatform (copy), Enums (copy)
					p7.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonMakePrimaryCommunity, {
						buttonSurface = p7.buttonSurface
					})

					return p7.dispatch(GroupsNetworking.MakePrimaryGroup.API({
						groupId = p7.profileId
					})):andThen(function() -- line: 239
						-- upvalues: p7 (copy), refreshProfilePlatform (copy), Enums (copy)
						p7.dispatch(refreshProfilePlatform({
							profileType = p7.profileType,
							profileId = p7.profileId,
							components = { Enums.Components.Actions }
						}))
					end)
				end
			}
		}
	end,
	[Enums.ProfileActions.RemovePrimaryCommunity] = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else function(p8) -- line: 255
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), GroupsNetworking (copy), refreshProfilePlatform (copy)
		return {
			text = p8.localized[Enums.ProfileActions.RemovePrimaryCommunity],
			onActivated = {
				[ProfileTypes.Community] = function() -- line: 259
					-- upvalues: p8 (copy), EventNames (copy), GroupsNetworking (copy), refreshProfilePlatform (copy), Enums (copy)
					p8.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonRemovePrimaryCommunity, {
						buttonSurface = p8.buttonSurface
					})

					return p8.dispatch(GroupsNetworking.RemovePrimaryGroup.API()):andThen(function() -- line: 264
						-- upvalues: p8 (copy), refreshProfilePlatform (copy), Enums (copy)
						p8.dispatch(refreshProfilePlatform({
							profileType = p8.profileType,
							profileId = p8.profileId,
							components = { Enums.Components.Actions }
						}))
					end)
				end
			}
		}
	end
}
