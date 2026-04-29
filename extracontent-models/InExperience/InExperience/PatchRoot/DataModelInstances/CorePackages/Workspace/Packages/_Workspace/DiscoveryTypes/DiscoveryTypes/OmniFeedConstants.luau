local Parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local FFlagLuaAppHeaderButtonText = require(Parent.SharedFlags).FFlagLuaAppHeaderButtonText
local FFlagLuaAppGameCarouselAmpUpsellAction = require(Parent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction
local FFlagLuaAppRfySignalApportioningIxp = require(Parent.SharedFlags).FFlagLuaAppRfySignalApportioningIxp
local FFlagLuaAppEnableWhyThisAdModal = require(Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppSupportAdRatingFooter = require(Parent.SharedFlags).FFlagLuaAppSupportAdRatingFooter
local FFlagLuaAppSupportAdRatingFooterExperiment = require(Parent.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment
local FFlagLuaAppChartsStickyHeader = require(Parent.SharedFlags).FFlagLuaAppChartsStickyHeader

require(script.Parent.RoduxTypes)

return {
	EventContext = "HomeOmniFeed",
	OmniSortRetrievalStatus = {
		Exception = "Exception",
		Success = "Success"
	},
	GlobalLayoutDataKeys = {
		JYFRefresh = "JYFRefresh"
	},
	TopicLayoutDataKeys = {
		PYMKFindFriendsEnabled = "PYMKFindFriendsEnabled",
		PYMKSeeAllEnabled = "PYMKSeeAllEnabled",
		JYFFindFriendsEnabled = "JYFFindFriendsEnabled",
		ComponentType = "componentType",
		PlayerCountStyle = "playerCountStyle",
		IsSponsoredFooterAllowed = "isSponsoredFooterAllowed",
		LinkPath = "linkPath",
		SubtitleLinkPath = "subtitleLinkPath",
		HideSeeAll = "hideSeeAll",
		InfoText = "infoText",
		EndTimestamp = "endTimestamp",
		CountdownString = "countdownString",
		PlayButtonStyle = "playButtonStyle",
		BackgroundImageAssetId = "backgroundImageAssetId",
		HeaderButtonText = if not FFlagLuaAppHeaderButtonText then nil else "headerButtonText",
		HideTileMetadata = "hideTileMetadata",
		HideTileTitle = "hideTileTitle",
		ContainedTile = "containedTile",
		EnableExplicitFeedback = "enableExplicitFeedback",
		EnableSignalApportioning = if not FFlagLuaAppRfySignalApportioningIxp then nil else "enableSignalApportioning",
		SponsoredUserCohort = if not FFlagLuaAppEnableWhyThisAdModal then nil else "sponsoredUserCohort",
		EnableSponsoredFeedback = "enableSponsoredFeedback",
		EnableCollectionGrid = "enableCollectionGrid",
		EnableReportAd = if not FFlagLuaAppEnableSponsoredReportAd then nil else "enableReportAd",
		IsSponsoredRatingFooterAllowed = if not FFlagLuaAppSupportAdRatingFooter then nil else "isSponsoredRatingFooterAllowed",
		SponsoredFooterAdLabelText = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else "sponsoredFooterAdLabelText",
		SponsoredFooterAdLabelFirst = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else "sponsoredFooterAdLabelFirst",
		SponsoredFooterIncludeRatingContent = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else "sponsoredFooterIncludeRatingContent",
		AmpUpsellFeatureName = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else "ampUpsellFeatureName",
		AmpUpsellNamespace = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else "ampUpsellNamespace"
	},
	ComponentTypeDataKeys = {
		EventTile = "EventTile",
		GridTile = "GridTile",
		AppGameTileNoMetadata = "AppGameTileNoMetadata"
	},
	ItemLayoutDataKeys = {
		Footer = "Footer"
	},
	OmniRecommendationsRequestIntent = {
		ManualRefresh = "manualRefresh",
		AutoRefresh = "autoRefresh",
		FriendPresenceChange = "friendPresenceChange",
		LogIn = "logIn",
		LoadMore = "loadMore",
		GameExit = "gameExit",
		AmpUpsellFeatureGranted = if not FFlagLuaAppGameCarouselAmpUpsellAction then nil else "ampUpsellFeatureGranted"
	},
	ContentGroupType = {
		Game = "Game",
		Text = "Text",
		User = "User"
	},
	OmniFeedPageSection = if not FFlagLuaAppChartsStickyHeader then nil else {
		Header = "Header"
	}
}
