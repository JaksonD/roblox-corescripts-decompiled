local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Enums = require(ProfilePlatform.Common.Enums)

require(ProfilePlatformParent.CurrencyTransfers)

local FFlagProfilePlatformEnableStore = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagAddSocialLinksToCommunityProfile = require(ProfilePlatformParent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagEnablePlatformProfileContextualMenuOption = require(ProfilePlatformParent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagAddIEMProfilePage = require(ProfilePlatformParent.SharedFlags).FFlagAddIEMProfilePage
local FFlagProfilePlatformEnableEditAppearanceMenu = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEnableCurrencyTransfer = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer

return React.createContext({
	profileId = "TEST_ID",
	profilePlatformId = if not FFlagEnablePlatformProfileContextualMenuOption then nil else "TEST_PLATFORM_ID",
	profileType = Enums.ProfileTypes.User,
	navigateTo = {
		qRCodePage = function() --[[ qRCodePage ]] -- line: 100
		end,
		previousView = function() --[[ previousView ]] -- line: 101
		end,
		itemDetails = function() --[[ itemDetails ]] -- line: 102
		end,
		itemOrBundleDetails = if not FFlagProfilePlatformEnableStore then nil else function() -- line: 103
		end,
		catalogSearch = if not FFlagProfilePlatformEnableStore then nil else function() -- line: 104
		end,
		inspectAvatar = if not FFlagAddIEMProfilePage then nil else function() -- line: 105
		end,
		editEmotes = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else function() -- line: 106
		end,
		switchAvatar = if not FFlagProfilePlatformEnableEditAppearanceMenu then nil else function() -- line: 107
		end,
		editAvatar = function() --[[ editAvatar ]] -- line: 108
		end,
		editUsername = function() --[[ editUsername ]] -- line: 109
		end,
		openLeaveRobloxAlertUIBlox = if not FFlagAddSocialLinksToCommunityProfile then nil else function() -- line: 110
		end,
		closeLeaveRobloxAlert = if not FFlagAddSocialLinksToCommunityProfile then nil else function() -- line: 111
		end,
		navigateToTransfer = if not FFlagProfilePlatformEnableCurrencyTransfer then nil else function() -- line: 112
		end
	},
	externalAnalytics = {
		catalogAnalytics = {}
	},
	sourceInfo = {
		isRecommendation = false,
		source = "TEST_SOURCE",
		contextualInfoType = "TEST_CONTEXTUAL_INFO_TYPE",
		contextualOverride = {},
		friendshipOriginSourceType = "TEST_FRIENDSHIP_ORIGIN_SOURCE_TYPE"
	}
})
