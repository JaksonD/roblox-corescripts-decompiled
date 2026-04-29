local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local SocialLuaAnalytics = require(ProfilePlatformParent.SocialLuaAnalytics)
local AnalyticsConstants = require(script.Parent.AnalyticsConstants)
local Enums = SocialLuaAnalytics.Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNames = require(script.Parent.EventNames)
local FFlagProfilePlatformUseProfileTypeContext = require(ProfilePlatform.Flags.FFlagProfilePlatformUseProfileTypeContext)
local FFlagEnablePlatformProfileContextualMenuOption = require(ProfilePlatformParent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagProfilePlatformUseCatalogItemOpenedNewFields = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local FFlagTCShareLinkSenderUI = require(ProfilePlatformParent.SharedFlags).FFlagTCShareLinkSenderUI
local FFlagProfilePlatformEnableCurrencyTransfer = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableEditAppearanceMenu = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEnableEditAppearanceAnalytics = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceAnalytics)

local function v16(p1) -- line: 26
	return p1
end

return {
	[EventNames.ProfilePageLoadedWithData] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.PageLoad,
		formatRulesForAdditionalInfo = {
			friendStatus = v16,
			playerPresence = v16,
			absolutePosition = v16,
			isHomePageCarousel = v16,
			isRecommendation = v16,
			recommendationContextType = v16,
			recommendationRank = v16,
			recommendationSessionId = v16,
			source = v16,
			profileType = v16,
			shareLinkId = v16,
			primaryAction = v16
		}
	},
	[EventNames.ProfilePresenceLoaded] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.PresenceLoaded,
		formatRulesForAdditionalInfo = {
			presenceType = v16,
			universeId = v16
		}
	},
	[EventNames.ContextualMenuButtonChat] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.Chat,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonIgnoreFriendRequest] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.IgnoreFriendRequest,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonReport] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.Report,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonUnfriend] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.Unfriend,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonBlock] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.Block,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonSetAlias] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.SetAlias,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonCopyLink] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.CopyLink,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonLeaveCommunity] = {
		context = if not FFlagProfilePlatformUseProfileTypeContext then Contexts.PlayerProfile else Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.LeaveCommunity,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonUnfollow] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.Unfollow,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonRemoveTrustedConnection] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.RemoveTrustedConnection,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonAddTrustedConnection] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.AddTrustedConnection,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16,
			modalVariantOverride = if not FFlagTCShareLinkSenderUI then nil else v16
		}
	},
	[EventNames.ContextualMenuButtonAddIncomingTrustedConnection] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.AddIncomingTrustedConnection,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonMakePrimaryCommunity] = {
		context = if not FFlagProfilePlatformUseProfileTypeContext then Contexts.PlayerProfile else Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.MakePrimaryCommunity,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonRemovePrimaryCommunity] = {
		context = if not FFlagProfilePlatformUseProfileTypeContext then Contexts.PlayerProfile else Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.RemovePrimaryCommunity,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButtonCurrencyTransfer] = if not FFlagProfilePlatformEnableCurrencyTransfer then nil else {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.CurrencyTransfer,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonOpenEditProfilePage] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.OpenEditProfilePage
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonChat] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.Chat
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonUnlockChat] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.UnlockChat
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonUnfriend] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.Unfriend
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonUnblock] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.Unblock
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonAddFriend] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.AddFriend
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = v16,
			isHomePageCarousel = v16,
			isRecommendation = v16,
			recommendationContextType = v16,
			recommendationRank = v16,
			recommendationSessionId = v16,
			source = v16,
			contextualInfoType = v16,
			shareLinkId = v16,
			profileType = v16
		}
	},
	[EventNames.CTAButtonAddFriendFromContacts] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.AddFriendFromContacts
		},
		formatRulesForAdditionalInfo = {
			shareLinkId = v16
		}
	},
	[EventNames.CTAButtonAcceptFriendRequest] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.AcceptFriendRequest
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = v16,
			contextualInfoType = v16,
			isHomePageCarousel = v16,
			isRecommendation = v16,
			recommendationContextType = v16,
			recommendationRank = v16,
			recommendationSessionId = v16,
			source = v16,
			buttonSurface = v16,
			shareLinkId = v16,
			profileType = v16
		}
	},
	[EventNames.CTAButtonEditAvatar] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.EditAvatar
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonEditLook] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.EditLook
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonShareProfile] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.ShareProfile
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonShareProfileQRCode] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.ShareProfileQRCode
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonJoinCommunity] = {
		context = if not FFlagProfilePlatformUseProfileTypeContext then Contexts.PlayerProfile else Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.JoinCommunity,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonFollow] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.Follow,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonViewCommunity] = {
		context = if not FFlagProfilePlatformUseProfileTypeContext then Contexts.PlayerProfile else Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.ViewCommunity,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonViewFullProfile] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.ViewFullProfile,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonCurrencyTransfer] = if not FFlagProfilePlatformEnableCurrencyTransfer then nil else {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.CurrencyTransfer,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonCancelJoinCommunityRequest] = {
		context = if not FFlagProfilePlatformUseProfileTypeContext then Contexts.PlayerProfile else Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.CancelJoinCommunityRequest,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.FriendsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.Friends
		}
	},
	[EventNames.FollowersButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.Followers
		}
	},
	[EventNames.FollowingsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.Following
		}
	},
	[EventNames.MutualFriendsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.MutualFriends
		}
	},
	[EventNames.ViewPlayerProfileButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.ViewPlayerProfile
		},
		formatRulesForAdditionalInfo = {
			absolutePosition = v16,
			friendStatus = v16,
			isHomePageCarousel = v16,
			isRecommendation = v16,
			recommendationContextType = v16,
			recommendationRank = v16,
			recommendationSessionId = v16,
			source = v16,
			buttonSurface = v16
		}
	},
	[EventNames.ContextualMenuButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.ContextualMenu
		}
	},
	[EventNames.GameDetailsButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.GameDetails
		}
	},
	[EventNames.EditDisplayNameButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.EditDisplayName
		},
		formatRulesForAdditionalInfo = {
			canSetDisplayName = v16
		}
	},
	[EventNames.SetAliasButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.SetAlias
		}
	},
	[EventNames.ProfileClosed] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.Dismissed
	},
	[EventNames.StoreHeaderButton] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.StoreHeader
		}
	},
	[EventNames.FavoriteExperienceOpened] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.FavoriteExperience
		},
		formatRulesForAdditionalInfo = {
			experienceId = v16,
			positionInComponent = v16
		}
	},
	[EventNames.FavoriteExperienceSeeAll] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.FavoriteExperienceSeeAll
		}
	},
	[EventNames.ExperienceOpened] = {
		context = if not FFlagProfilePlatformUseProfileTypeContext then Contexts.PlayerProfile else Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.Experience
		},
		formatRulesForAdditionalInfo = {
			experienceId = v16,
			positionInComponent = v16
		}
	},
	[EventNames.EventOpened] = {
		context = Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.Event
		},
		formatRulesForAdditionalInfo = {
			virtualEventId = v16
		}
	},
	[EventNames.EventRSVP] = {
		context = Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.EventRSVP
		},
		formatRulesForAdditionalInfo = {
			virtualEventId = v16,
			status = v16
		}
	},
	[EventNames.EventJoined] = {
		context = Contexts.CommunityProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.EventJoin
		},
		formatRulesForAdditionalInfo = {
			virtualEventId = v16
		}
	},
	[EventNames.CatalogItemOpened] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.ViewCatalogItem
		},
		formatRulesForAdditionalInfo = if not FFlagProfilePlatformUseCatalogItemOpenedNewFields then {
			itemId = v16,
			positionInComponent = v16,
			component = v16
		} else {
			btnContext = v16,
			btnUnitId = v16,
			btnSortPosition = v16
		}
	},
	[EventNames.UsernameCopied] = {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.Username
		}
	},
	[EventNames.ContextualMenuButtonViewPlatformProfile] = if not FFlagEnablePlatformProfileContextualMenuOption then nil else {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.ContextualMenuButtons.ViewPlatformProfile,
			optionType = "CTAType"
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.CTAButtonEditAppearance] = if not FFlagProfilePlatformEnableEditAppearanceMenu or not FFlagProfilePlatformEnableEditAppearanceAnalytics then nil else {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.CTAButtons.EditAppearance
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.EditAppearanceMenuEditAvatar] = if not FFlagProfilePlatformEnableEditAppearanceMenu or not FFlagProfilePlatformEnableEditAppearanceAnalytics then nil else {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.EditAppearanceEditAvatar
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.EditAppearanceMenuEditEmote] = if not FFlagProfilePlatformEnableEditAppearanceMenu or not FFlagProfilePlatformEnableEditAppearanceAnalytics then nil else {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.EditAppearanceEditEmote
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	},
	[EventNames.EditAppearanceMenuSwitchAvatar] = if not FFlagProfilePlatformEnableEditAppearanceMenu or not FFlagProfilePlatformEnableEditAppearanceAnalytics then nil else {
		context = Contexts.PlayerProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = {
			btn = AnalyticsConstants.Btns.EditAppearanceSwitchAvatar
		},
		formatRulesForAdditionalInfo = {
			buttonSurface = v16
		}
	}
}
