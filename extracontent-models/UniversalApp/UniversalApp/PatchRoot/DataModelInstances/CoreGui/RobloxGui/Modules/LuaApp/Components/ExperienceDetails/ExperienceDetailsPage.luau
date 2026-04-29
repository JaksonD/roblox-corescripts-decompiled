local LocalizationService = game:GetService("LocalizationService")
local IXPService = game:GetService("IXPService")
local AppStorageService = game:GetService("AppStorageService")
local CorePackages = game:GetService("CorePackages")
local v5 = game:DefineFastFlag("LuaAppRemoveEDPLoadingState", false)
local React = require(CorePackages.Packages.React)
local Roact = require(CorePackages.Packages.Roact)
local Cryo = require(CorePackages.Packages.Cryo)
local Promise = require(CorePackages.Packages.Promise)
local t = require(CorePackages.Packages.t)
local Foundation = require(CorePackages.Packages.Foundation)
local Responsive = require(CorePackages.Workspace.Packages.Responsive)
local useTokens = Foundation.Hooks.useTokens
local ButtonSize = Foundation.Enums.ButtonSize
local UIBlox = require(CorePackages.Packages.UIBlox)
local RetrievalStatus = UIBlox.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBlox.App.Indicator.EmptyState
local LoadingStateContainer = UIBlox.App.Container.LoadingStateContainer
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local withStyle = UIBlox.Core.Style.withStyle
local DetailsPageSelector = require(CorePackages.Workspace.Packages.AppBlox).DetailsPageSelector
local ContentPosition = require(CorePackages.Workspace.Packages.AppBlox).ContentPosition
local useCloseWithBackButton = require(CorePackages.Workspace.Packages.AppBlox).useCloseWithBackButton
local Images = UIBlox.App.ImageSet.Images
local PlayerCount = UIBlox.App.Indicator.PlayerCount
local TooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
local MenuDirection = UIBlox.App.Menu.MenuDirection
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local ReactFocusNavigation = require(CorePackages.Packages.ReactFocusNavigation)
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local VerifiedBadges = require(CorePackages.Workspace.Packages.VerifiedBadges)
local RobloxAppEnums = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local RobloxAppHooks = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local DeviceType = RobloxAppEnums.DeviceType
local UiMode = RobloxAppEnums.UiMode
local useUiModeInfo = RobloxAppHooks.useUiModeInfo
local memoize = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local abbreviateCount = require(CorePackages.Workspace.Packages.Localization).abbreviateCount
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local GameStats = require(CorePackages.Workspace.Packages.GameTile).GameStats
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local ExperienceDetailsExperimentation = require(script.Parent.ExperienceDetailsExperimentation)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local AppCommonLib = require(CorePackages.Workspace.Packages.AppCommonLib)
local Display = require(CorePackages.Workspace.Packages.Display)
local ExperienceCommunityLink = require(CorePackages.Workspace.Packages.CommunityLinks).Components.ExperienceCommunityLink
local InputHandlers = require(CorePackages.Packages.InputHandlers)
local FocusNavigationUtils = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtils.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local AgeRecommendationDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).AgeRecommendations.AgeRecommendationDetails
local ExperienceDetailsNoticeType = require(CorePackages.Workspace.Packages.DiscoveryTypes).ExperienceDetailsNoticeType
local EnumGameDetailErrorTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local ExperienceRatings = Modules.LuaApp.Components.ExperienceDetails.ExperienceRatings
local getPlayButtonProps = Modules.LuaApp.Common.Experience.getPlayButtonProps
local PlayButton = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButton
local PlayWithRewardComponent = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).PlayWithRewardComponent
local checkAndFormatPossibleLink = require(CorePackages.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink
local RetrievalStatus2 = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local Modules2 = game:GetService("CoreGui").RobloxGui.Modules
local Constants = require(Modules2.LuaApp.Constants)
local TransitionAnimation = require(Modules2.LuaApp.Enum.TransitionAnimation)
local openExternalBrowser = require(Modules2.LuaApp.openExternalBrowser)
local EventsListWrapper = require(Modules2.LuaApp.Components.VirtualEvents.EventsListWrapper)
local GameRefundPolicy = require(Modules2.LuaApp.Components.GameDetails.GameRefundPolicy)
local GameDetailNotificationsButtonHint = require(Modules2.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint)
local ExperienceDescription = require(script.Parent.ExperienceDescription)
local IgrsRatingLabel = require(script.Parent.IgrsRatingLabel)
local ExperienceLogoTray = require(script.Parent.ExperienceLogoTray)
local ExperienceInfoTable = require(script.Parent.ExperienceInfoTable)
local ExperienceDetailsLoadingStatePage = require(script.Parent.ExperienceDetailsLoadingStatePage)
local ExperienceMediaGallery = require(script.Parent.ExperienceMediaGallery)
local ExperienceTagsContainer = require(script.Parent.ExperienceTagsContainer)
local RecommendedExperienceCarousel = require(script.Parent.RecommendedExperienceCarousel)
local ExperienceSongsCarousel = require(script.Parent.ExperienceSongsCarousel)
local ApiFetchExperienceDetailsPageCounters = require(Modules2.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters)
local ServerDrivenUi = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local EdpSduiUtils = require(script.Parent.EdpSduiUtils)
local useEdpServerIxpVariables = require(script.Parent.Hooks.useEdpServerIxpVariables)
local EdpSocialLinksImpressionsDetector = require(Modules2.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector)
local GameDetailTelemetry = require(CorePackages.Workspace.Packages.GameDetailTelemetry)
local EDPTTIConstants = GameDetailTelemetry.EDPTTIConstants
local FFlagEDPTTITrackingEnabled = GameDetailTelemetry.FFlagEDPTTITrackingEnabled
local useEDPTTITracking = require(script.Parent.useEDPTTITracking)
local useFirstMediaCarouselImageUri = require(script.Parent.useFirstMediaCarouselImageUri).useFirstMediaCarouselImageUri
local GetFFlagEnableTenftUiDetailsMoreDropupMenu = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableTenftUiDetailsMoreDropupMenu
local GetFFlagExpDetailsUseSelectionBumpers = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagExpDetailsUseSelectionBumpers
local FFlagExperienceDetailsTextUseTokens = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens)
local GetFFlagLuaAppEnableNotificationsEDPTooltip = require(Modules2.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip)
local GetFIntNotificationsEDPTooltipTimeLimit = require(Modules2.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit)
local GetFFlagConsoleApplyTokenizationEdp = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagConsoleApplyTokenizationEdp
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local GetFFlagNotificationsForceEnableEDPDiscoverability = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability
local FFlagLuaAppDesktopMediaGalleryTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry
local FFlagLuaAppEdpFixDefaultBanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner
local FFlagSongEdpCarouselIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp
local FFlagLuaAppExperienceDetailsLayoutOrderConfig = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExperienceDetailsLayoutOrderConfig
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEnableConsolidatedGameRefundPolicy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableConsolidatedGameRefundPolicy
local FFlagLuaAppEdpMediaGalleryFullScreen = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagEnableCreatorSubtitleNavigation = require(Modules2.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation)
local FFlagCreatorSubtitleNavigationIXPEnabled = require(Modules2.LuaApp.Flags.FFlagCreatorSubtitleNavigationIXPEnabled)
local FStringCreatorSubtitleNavigationExperimentLayer = require(Modules2.LuaApp.Flags.FStringCreatorSubtitleNavigationExperimentLayer)
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppUnifyPlayButtonNonMobileEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonNonMobileEdp
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppFixEdpInitialFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppFixEdpInitialFocus
local FFlagHideCloseButtonEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local FFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local FFlagLuaAppGameStatsFallbackRendering = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGameStatsFallbackRendering
local FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp
local FFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local FFlagLuaAppAddIgrsRatingToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp
local FFlagLuaAppIgrsRatingPropMemoization = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppIgrsRatingPropMemoization
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagEnablePlayWithRewardNonPeekviewEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardNonPeekviewEdp
local v128 = game:DefineFastInt("PlayWithRewardNonPeekviewEdpLayoutOrder", 75)
local v129 = if not FFlagLuaAppGameStatsFallbackRendering then nil else "--"
local t1 = {
	PlayWithReward = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else v128,
	MediaGalleryMediaFirst = 100,
	EventsListRedesign = 200,
	Description = 300,
	MediaGallery = 400,
	IgrsRatingLabel = if not FFlagLuaAppAddIgrsRatingToEdp then nil else 450,
	ExperienceRatings = 500,
	PlaysAndVisits = 600,
	CommunityLink = 700,
	ExperienceInfoTable = 800,
	RefundPolicy = 900,
	LogoTraySection = 1000,
	Notice = 1200,
	RecommendedExperiences = 1300,
	ExperienceSongsCarousel = 1400,
	SduiFeedItemsDefault = 1500
}
local t2 = {
	PlayWithReward = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else v128,
	MediaGallery = 100,
	EventsListRedesign = 200,
	Description = 300,
	IgrsRatingLabel = if not FFlagLuaAppAddIgrsRatingToEdp then nil else 350,
	RecommendedExperiences = 500,
	ExperienceSongsCarousel = 600,
	ExperienceRatings = 700,
	PlaysAndVisits = 800,
	CommunityLink = 900,
	ExperienceInfoTable = 1000,
	RefundPolicy = 1100,
	LogoTraySection = 1200,
	Notice = 1300,
	SduiFeedItemsDefault = 1500
}
local v132 = Roact.PureComponent:extend("ExperienceDetailsPage")

v132.validateProps = t.strictInterface({
	universeId = t.string,
	referralSource = t.optional(t.string),
	experienceJoinData = if not FFlagLuaAppUnifyPlayButtonNonMobileEdp and not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else t.optional(t.table),
	placeIdOverride = t.optional(t.string),
	onClose = t.callback,
	thumbnail = t.optional(t.table),
	bannerImageId = t.optional(t.string),
	defaultBannerUrl = if not FFlagLuaAppEdpFixDefaultBanner then nil else t.optional(t.string),
	gameInfo = t.optional(t.table),
	gameDetail = t.optional(t.table),
	gameDetailError = t.optional(t.table),
	creatorVerified = t.optional(t.boolean),
	gameDetailsPageDataStatus = t.optional(t.string),
	gameProductInfo = t.optional(t.table),
	socialLinks = t.optional(t.table),
	ageRecommendations = t.optional(AgeRecommendationDetails.validateModel),
	communityLink = t.optional(t.table),
	gameFollowings = t.optional(t.table),
	sduiFeedItemConfigs = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else t.optional(t.table),
	playWithRewardData = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else t.optional(t.table),
	showPlayWithReward = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else t.optional(t.boolean),
	isPlayable = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else t.optional(t.boolean),
	communityLinksEnabled = t.optional(t.boolean),
	communityLinkVariant = t.optional(t.string),
	enableNotificationsDiscoverability = t.optional(t.boolean),
	mediaGalleryRedesignEnabledIxp = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else t.optional(t.boolean),
	mediaGalleryVideoPreviewEnabledIxp = if not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then nil else t.optional(t.boolean),
	showSongCarousel = if not FFlagSongEdpCarouselIxp then nil else t.optional(t.boolean),
	shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else t.optional(t.boolean),
	shouldInterleaveSduiIxp = if not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else t.optional(t.boolean),
	edpServerIxpVariables = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else t.optional(t.table),
	hideCloseButton = if not FFlagHideCloseButtonEdp then nil else t.optional(t.boolean),
	hasUnifiedPlayButtonIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else t.optional(t.boolean),
	unifyToUIBloxIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else t.optional(t.boolean),
	fetchGameDetailsPageData = t.callback,
	openLeaveRobloxAlertUIBlox = t.callback,
	openMoreContextualMenu = t.callback,
	openShareContextualMenu = t.callback,
	closeAlert = t.callback,
	openVerifiedBadgeModal = t.optional(t.callback),
	openCreatorPage = if not FFlagEnableCreatorSubtitleNavigation then t.callback else nil,
	openCommunityProfilePage = if not FFlagEnableCreatorSubtitleNavigation then nil else t.optional(t.callback),
	openUserProfilePage = if not FFlagEnableCreatorSubtitleNavigation then nil else t.optional(t.callback),
	openExperienceGuidelinesExplained = t.callback,
	toggleFollowExperience = t.optional(t.callback),
	openRefundPolicyLearnMorePage = t.callback,
	openWebview = if not FFlagLuaAppAddIgrsRatingToEdp then nil else t.callback,
	onMediaGalleryPreviewActivated = if not FFlagLuaAppDesktopMediaGalleryTelemetry or FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else t.optional(t.callback),
	onMediaGalleryThumbnailActivated = if not FFlagLuaAppDesktopMediaGalleryTelemetry or FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else t.optional(t.callback),
	onMediaGalleryMediaChanged = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else t.optional(t.callback),
	onMediaGalleryEnterFullscreen = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else t.optional(t.callback),
	onMediaGalleryExitFullscreen = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else t.optional(t.callback),
	linking = t.table,
	playabilityStatus = t.optional(t.table),
	playButtonState = t.string,
	onPlayButtonActivated = t.callback,
	onPlaySquadButtonActivated = if not FFlagLuaAppEnablePlaySquadButton then nil else t.callback,
	playButtonContextualMessage = t.optional(t.string),
	deviceType = t.optional(t.string),
	detailsPageConfiguration = t.optional(t.table),
	viewWidth = t.optional(t.number),
	viewHeight = t.optional(t.number),
	setControllerBarNavigation = t.optional(t.callback),
	uiModeInfo = t.optional(t.any),
	focusGuiObject = t.optional(t.callback),
	tokens = t.strictInterface({
		thumbnailSize = t.optional(t.number),
		thumbnailMargin = t.optional(t.number),
		thumbnailShadowHeight = t.optional(t.number),
		sideMargin = t.optional(t.number),
		headerItemPadding = t.optional(t.number),
		headerDescriptionMaxRows = t.optional(t.number),
		headerDescriptionLineHeight = t.optional(t.number),
		actionBarButtonBackgroundColor = t.optional(t.table),
		actionBarTextButtonPadding = t.optional(t.Vector2),
		headerGradientHeight = t.optional(t.number),
		headerBarBackgroundHeight = t.optional(t.number),
		headerBottomMargin = t.optional(t.number),
		animationConfig = t.optional(t.table),
		itemPadding = t.optional(t.number),
		safeAreaSize = t.optional(t.Vector2),
		trailingWhitespace = t.optional(t.number),
		iconSize = t.optional(t.number),
		expandableAreaHeightOffset = if not GetFFlagConsoleApplyTokenizationEdp() then nil else t.optional(t.number),
		actionBarHeight = t.optional(t.number)
	}),
	webViewSupport = t.boolean,
	notificationsCanEnableExperience = t.optional(t.boolean),
	experienceDetailsNoticeType = t.optional(t.string),
	iconButtonSize = t.optional(t.UDim2),
	textButtonSize = t.optional(t.UDim2),
	playButtonSize = t.optional(t.UDim2),
	actionBarHeight = t.optional(t.number),
	statsAndInfoRef = t.optional(t.table),
	playButtonRef = t.optional(t.union(t.table, t.callback)),
	containerRef = t.optional(t.union(t.table, t.callback)),
	foundationTokens = t.optional(t.table),
	disableStickyActionBar = t.optional(t.boolean)
})

local t3 = {
	showEventsList = true,
	showLogoTraySection = true,
	showCornerGradientPropEnabled = false,
	showCommunityLink = false
}

function v132.init(p1) -- line: 379
	-- upvalues: Localization (copy), LocalizationService (copy), abbreviateCount (copy), UiMode (copy), GetFFlagEnableTenftUiDetailsMoreDropupMenu (copy), FFlagEnableLeftNavOnConsole (copy), Display (copy), FFlagHideCloseButtonEdp (copy), memoize (copy), Text (copy), FFlagLuaAppGameStatsFallbackRendering (copy), Roact (copy), StyledTextLabel (copy), GetFFlagLuaAppEnableNotificationsEDPTooltip (copy), withStyle (copy), FFlagExperienceDetailsTextUseTokens (copy), FFlagCreatorSubtitleNavigationIXPEnabled (copy), IXPServiceWrapper (copy), FStringCreatorSubtitleNavigationExperimentLayer (copy), AppPage (copy), UrlBuilder (copy), TransitionAnimation (copy), FFlagEnableCreatorSubtitleNavigation (copy), VerifiedBadges (copy), React (copy), ExperienceTagsContainer (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameStats (copy), PlayerCount (copy), v129 (copy), Images (copy), ExperienceDescription (copy), RetrievalStatus (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), withLocalization (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), IgrsRatingLabel (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), Constants (copy), openExternalBrowser (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), AppCommonLib (copy), ExperienceLogoTray (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), EdpSocialLinksImpressionsDetector (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy), ExperienceMediaGallery (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), ExperienceRatings (copy), ExperienceInfoTable (copy), EventsListWrapper (copy), RecommendedExperienceCarousel (copy), FFlagSongEdpCarouselIxp (copy), ExperienceSongsCarousel (copy), ExperienceCommunityLink (copy), checkAndFormatPossibleLink (copy), FFlagLuaAppEnableConsolidatedGameRefundPolicy (copy), GameRefundPolicy (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), PlayWithRewardComponent (copy), FFlagLuaAppExperienceDetailsLayoutOrderConfig (copy), t1 (copy), t2 (copy), ContentPosition (copy), GetFFlagExpDetailsUseSelectionBumpers (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentation (copy), ExperienceDetailsNoticeType (copy), FocusNavigationEventNameEnum (copy), InputHandlers (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), IXPService (copy), AppUserLayers (copy), AppStorageService (copy)
	local v136 = Localization.new(LocalizationService.RobloxLocaleId)

	function p1.applyTokenScaling(n1: number) -- line: 381
		-- upvalues: p1 (copy)
		return n1 * p1.props.foundationTokens.Stroke.Standard
	end
	function p1.getAbbreviateCount(p2) -- line: 386
		-- upvalues: abbreviateCount (copy), v136 (copy)
		return abbreviateCount(p2, v136:GetLocale())
	end
	function p1.upperString(p3) -- line: 389
		-- upvalues: v136 (copy)
		return string.upper(v136:Format(p3))
	end
	function p1.onPlayButtonActivated() -- line: 393
		-- upvalues: p1 (copy)
		return p1.props.onPlayButtonActivated()
	end
	function p1.openMoreContextualMenu(p4) -- line: 397
		-- upvalues: p1 (copy), UiMode (copy), GetFFlagEnableTenftUiDetailsMoreDropupMenu (copy), FFlagEnableLeftNavOnConsole (copy), Display (copy), FFlagHideCloseButtonEdp (copy)
		local universeId = p1.props.universeId
		local vector2 = nil
		local v221 = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		local uDim2

		if GetFFlagEnableTenftUiDetailsMoreDropupMenu() and v221 then
			local v222 = nil

			if FFlagEnableLeftNavOnConsole then
				v222 = Display.GetDisplayStore().getDeviceSafePadding()
			end

			vector2 = Vector2.new(0, 1)
			uDim2 = UDim2.fromOffset(p4.AbsolutePosition.X, p4.AbsolutePosition.Y - 12 + (not FFlagEnableLeftNavOnConsole and 0 or v222.top))
		else
			uDim2 = UDim2.fromOffset(p4.AbsolutePosition.X + p4.AbsoluteSize.X - 300, p4.AbsolutePosition.Y + p4.AbsoluteSize.Y + 12)
		end

		return p1.props.openMoreContextualMenu(universeId, uDim2, vector2, if not FFlagHideCloseButtonEdp then nil else p1.props.hideCloseButton)
	end

	p1.getTextHeight = memoize(function(p5, p6, p7, p8) -- line: 432
		-- upvalues: Text (copy)
		return Text.GetTextHeight(p5, p6, p7, p8)
	end)

	function p1.openShareContextualMenu(p9) -- line: 436
		-- upvalues: p1 (copy), FFlagHideCloseButtonEdp (copy)
		local universeId = p1.props.universeId
		local uDim2 = UDim2.fromOffset(p9.AbsolutePosition.X + p9.AbsoluteSize.X - 300, p9.AbsolutePosition.Y + p9.AbsoluteSize.Y + 12)

		return p1.props.openShareContextualMenu(universeId, uDim2, if not FFlagHideCloseButtonEdp then nil else p1.props.hideCloseButton)
	end
	function p1.getPlaysAnsVisitsInfo(p10, p11) -- line: 450
		-- upvalues: FFlagLuaAppGameStatsFallbackRendering (copy)
		return {
			plays = p10 and p10.playing or (p11 and p11.playerCount or (not FFlagLuaAppGameStatsFallbackRendering and 0 or nil)),
			visits = p10 and p10.visits or (not FFlagLuaAppGameStatsFallbackRendering and 0 or nil),
			totalUpVotes = p11 and p11.totalUpVotes or 0,
			totalDownVotes = p11 and p11.totalDownVotes or 1
		}
	end
	function p1.getStyledTextLabel(p12, p13, p14) -- line: 461
		-- upvalues: Roact (copy), StyledTextLabel (copy)
		if p12 then
			return Roact.createElement(StyledTextLabel, {
				text = p12,
				fontStyle = p13,
				colorStyle = p14,
				automaticSize = Enum.AutomaticSize.XY,
				layoutOrder = 1,
				richText = false,
				lineHeight = 1
			})
		end

		return nil
	end
	function p1.toggleFollowExperience() -- line: 477
		-- upvalues: GetFFlagLuaAppEnableNotificationsEDPTooltip (copy), p1 (copy)
		if GetFFlagLuaAppEnableNotificationsEDPTooltip() then
			p1:setState({
				isNotificationsTooltipActive = false
			})
		end

		if not p1.props.gameFollowings then
			return
		end

		local universeId = p1.props.universeId
		local isFollowed = p1.props.gameFollowings.isFollowed

		if p1.props.toggleFollowExperience then
			p1.props.toggleFollowExperience(universeId, not isFollowed)
		end
	end
	function p1.renderSubtitleTextOverride(p15, p16, p17, _, p19, p20) -- line: 496
		-- upvalues: withStyle (copy), FFlagExperienceDetailsTextUseTokens (copy), FFlagCreatorSubtitleNavigationIXPEnabled (copy), IXPServiceWrapper (copy), FStringCreatorSubtitleNavigationExperimentLayer (copy), AppPage (copy), UrlBuilder (copy), v136 (copy), TransitionAnimation (copy), Roact (copy), FFlagEnableCreatorSubtitleNavigation (copy), p1 (copy), VerifiedBadges (copy)
		return Roact.createElement(VerifiedBadges.EmojiWrapper, {
			emoji = not p19 and "" or VerifiedBadges.emoji.verified,
			layoutOrder = 2,
			onActivated = if not p19 or not p20 then nil else p1.props.openVerifiedBadgeModal
		}, {
			userText = withStyle(function(p21) -- line: 505
				-- upvalues: FFlagExperienceDetailsTextUseTokens (copy), FFlagCreatorSubtitleNavigationIXPEnabled (copy), IXPServiceWrapper (copy), FStringCreatorSubtitleNavigationExperimentLayer (copy), p15 (copy), p20 (copy), AppPage (copy), UrlBuilder (copy), p17 (copy), p16 (copy), v136 (copy), TransitionAnimation (copy), Roact (copy), FFlagEnableCreatorSubtitleNavigation (copy), p1 (copy)
				local v377 = if not FFlagExperienceDetailsTextUseTokens then p21.Font.Header2 else p21.Tokens.Semantic.Typography.Subheader
				local v378 = if not FFlagExperienceDetailsTextUseTokens then v377.RelativeSize * p21.Font.BaseSize else v377.FontSize
				local TextMuted = p21.Theme.TextMuted

				if FFlagCreatorSubtitleNavigationIXPEnabled then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringCreatorSubtitleNavigationExperimentLayer)
				end

				if p15 and p20 then
					local t4 = {
						name = AppPage.GenericWebPage,
						detail = UrlBuilder.game.info.creator({
							creatorType = p17,
							creatorId = p16
						}),
						extraProps = {
							title = v136:Format("Feature.GameDetails.Label.Developer"),
							transitionAnimation = TransitionAnimation.SlideInFromRight
						}
					}

					return Roact.createElement("TextButton", {
						Text = p15,
						Font = v377.Font,
						TextColor3 = TextMuted.Color,
						LayoutOrder = 2,
						AutoButtonColor = false,
						LineHeight = 1,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextSize = v378,
						BackgroundTransparency = 1,
						[Roact.Event.Activated] = function() -- line: 543
							-- upvalues: FFlagEnableCreatorSubtitleNavigation (copy), p17 (copy), p1 (copy), p16 (copy), t4 (copy)
							if FFlagEnableCreatorSubtitleNavigation then
								if p17 == "User" then
									p1.props.openUserProfilePage(p16, "ExperienceDetailsPage:SubTitle")

									return
								end

								if p17 == "Group" then
									p1.props.openCommunityProfilePage(p16, "ExperienceDetailsPage:SubTitle")

									return
								end
							else
								p1.props.openCreatorPage(t4)
							end
						end
					})
				end

				return p1.getStyledTextLabel(p15, v377, TextMuted)
			end)
		})
	end
	function p1.renderTextOverride(p22, _, _, p25) -- line: 570
		-- upvalues: withStyle (copy), FFlagExperienceDetailsTextUseTokens (copy), p1 (copy), Roact (copy), VerifiedBadges (copy)
		return Roact.createElement(VerifiedBadges.EmojiWrapper, {
			emoji = not p25 and "" or VerifiedBadges.emoji.verified,
			layoutOrder = 0,
			size = UDim2.fromScale(0, 1)
		}, {
			userText = withStyle(function(p26) -- line: 572
				-- upvalues: FFlagExperienceDetailsTextUseTokens (copy), p1 (copy), p22 (copy)
				local v383 = if not FFlagExperienceDetailsTextUseTokens then p26.Font.Header2 else p26.Tokens.Semantic.Typography.Subheader
				local TextEmphasis = p26.Theme.TextEmphasis

				return p1.getStyledTextLabel(p22, v383, TextEmphasis)
			end)
		})
	end

	p1.renderExperienceGuidelines = memoize(function(p27) -- line: 590
		-- upvalues: React (copy), ExperienceTagsContainer (copy), FFlagHideCloseButtonEdp (copy), p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
		return React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 1,
			BackgroundTransparency = 1
		}, {
			UIPadding = React.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 4)
			}),
			ExperienceTagsContainer = React.createElement(ExperienceTagsContainer, {
				areTagsInteractable = true,
				includeAgeRecommendations = true,
				universeId = p27,
				LayoutOrder = 1,
				hideCloseButton = if not FFlagHideCloseButtonEdp then nil else p1.props.hideCloseButton,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp
			})
		})
	end)
	p1.renderInlinePlayerCountAndLikes = memoize(function(p28, p29, p30) -- line: 614
		-- upvalues: Roact (copy), GameStats (copy)
		return Roact.createElement("Frame", {
			Size = UDim2.new(0, 120, 0, 20),
			BackgroundTransparency = 1,
			LayoutOrder = 3
		}, {
			GameStats = Roact.createElement(GameStats, {
				stats = {
					playerCount = p28,
					totalUpVotes = p29,
					totalDownVotes = p30
				}
			})
		})
	end)

	function p1.renderBriefDescription(p31, p32) -- line: 630
		-- upvalues: withStyle (copy), FFlagExperienceDetailsTextUseTokens (copy), p1 (copy), Roact (copy), StyledTextLabel (copy)
		return withStyle(function(p33) -- line: 631
			-- upvalues: p31 (copy), FFlagExperienceDetailsTextUseTokens (copy), p1 (copy), p32 (copy), Roact (copy), StyledTextLabel (copy)
			local p33Font = p33.Font
			local headerDescriptionLineHeight = p31.headerDescriptionLineHeight
			local v388 = headerDescriptionLineHeight * math.floor(p33Font.BaseSize * p33Font.Body.RelativeSize) * p31.headerDescriptionMaxRows
			local v389 = if not FFlagExperienceDetailsTextUseTokens then p33Font.BaseSize * p33Font.Body.RelativeSize else p33.Tokens.Semantic.Typography.Body.FontSize
			local v390 = if not FFlagExperienceDetailsTextUseTokens then p33Font.Body.Font else p33.Tokens.Semantic.Typography.Body.Font
			local v391 = p1.getTextHeight(p32, v390, v389, UDim2.new(1, 0, 0, v388))

			return Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, (math.min(v391, v388))),
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				ClipsDescendants = true
			}, {
				GameDescriptionText = Roact.createElement(StyledTextLabel, {
					text = p32,
					fontStyle = if not FFlagExperienceDetailsTextUseTokens then p33Font.Body else p33.Tokens.Semantic.Typography.Body,
					colorStyle = p33.Theme.TextEmphasis,
					size = UDim2.fromScale(1, 1),
					richText = false,
					fluidSizing = false,
					lineHeight = headerDescriptionLineHeight
				})
			})
		end)
	end
	function p1.renderInfoContent(p34, p35, p36, p37, p38, p39, p40, p41, p42, p43) -- line: 666
		-- upvalues: p1 (copy), UiMode (copy), FFlagEnableCreatorSubtitleNavigation (copy), Roact (copy)
		local v264 = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot
		local v265 = p34 and p34.headerItemPadding or 0
		local v266 = v264 and (p40 ~= nil and #p40 > 0)
		local v267 = not v264

		return function() -- line: 685
			-- upvalues: FFlagEnableCreatorSubtitleNavigation (copy), p1 (copy), p36 (copy), p37 (copy), p38 (copy), p35 (copy), p39 (copy), UiMode (copy), Roact (copy), v265 (copy), v264 (copy), p41 (copy), p42 (copy), p43 (copy), v266 (copy), p34 (copy), p40 (copy), v267 (copy)
			local v392 = if not FFlagEnableCreatorSubtitleNavigation then p1.renderSubtitleTextOverride(p36, p37, p38, p35, p39) else p1.renderSubtitleTextOverride(p36, p37, p38, p35, p39, p1.props.uiModeInfo.uiMode ~= UiMode.TenFoot)

			return Roact.createElement("Frame", {
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1
			}, {
				ListLayout = Roact.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, v265)
				}),
				SubtitleText = v392,
				Padding = if not v265 then nil else Roact.createElement("UIPadding", {
					PaddingTop = UDim.new(0, v265)
				}),
				PlayStats = if not v264 then nil else p1.renderInlinePlayerCountAndLikes(p41, p42, p43),
				Description = if not v266 then nil else p1.renderBriefDescription(p34, p40),
				ExperienceGuidelinesComponent = if not v267 then nil else p1.renderExperienceGuidelines(p35)
			})
		end
	end

	p1.renderPlaysAndVisits = memoize(function(p44, p45) -- line: 724
		-- upvalues: Roact (copy), PlayerCount (copy), FFlagLuaAppGameStatsFallbackRendering (copy), v129 (copy), p1 (copy), Images (copy)
		return function() -- line: 725
			-- upvalues: Roact (copy), PlayerCount (copy), FFlagLuaAppGameStatsFallbackRendering (copy), p44 (copy), v129 (copy), p1 (copy), Images (copy), p45 (copy)
			return Roact.createElement(PlayerCount, {
				layoutOrder = 1,
				countLeft = {
					countText = if not FFlagLuaAppGameStatsFallbackRendering or p44 ~= nil then p1.getAbbreviateCount(p44) else v129,
					labelText = p1.upperString("Feature.GameDetails.Label.Playing"),
					icon = Images["icons/status/games/people-playing_large"]
				},
				countRight = {
					countText = if not FFlagLuaAppGameStatsFallbackRendering or p45 ~= nil then p1.getAbbreviateCount(p45) else v129,
					labelText = p1.upperString("Feature.GameDetails.Label.Visits"),
					icon = Images["icons/status/games/sessions_large"]
				}
			})
		end
	end)

	function p1.onFocusChanged(p46) -- line: 746
		-- upvalues: p1 (copy)
		if p1.props.setControllerBarNavigation then
			p1.props.setControllerBarNavigation(not p46)
		end
	end

	p1.renderDescription = memoize(function(p47, p48) -- line: 753
		-- upvalues: Roact (copy), ExperienceDescription (copy), RetrievalStatus (copy), p1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy)
		return function() -- line: 754
			-- upvalues: Roact (copy), ExperienceDescription (copy), RetrievalStatus (copy), p47 (copy), p48 (copy), p1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy)
			return Roact.createElement(ExperienceDescription, {
				dataStatus = RetrievalStatus.fromRawValue(p47),
				descriptionText = p48,
				onFocusChanged = p1.onFocusChanged,
				universeId = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else p1.props.universeId,
				pageContext = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else AppPage.ExperienceDetail,
				componentType = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else "gameDescription"
			})
		end
	end)
	p1.renderNotice = memoize(function(p49) -- line: 765
		-- upvalues: withLocalization (copy), Roact (copy), ExperienceDescription (copy), RetrievalStatus (copy), p1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy)
		return function() -- line: 766
			-- upvalues: withLocalization (copy), Roact (copy), ExperienceDescription (copy), RetrievalStatus (copy), p49 (copy), p1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy)
			return withLocalization({
				noticeHeader = "Feature.ExperienceDetails.Body.NotesTitle",
				noticeText = "Feature.ExperienceDetails.Notes.InExperiencePurchase"
			})(function(p50) -- line: 770
				-- upvalues: Roact (copy), ExperienceDescription (copy), RetrievalStatus (copy), p49 (copy), p1 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy)
				return Roact.createElement(ExperienceDescription, {
					dataStatus = RetrievalStatus.fromRawValue(p49),
					headerText = p50.noticeHeader,
					descriptionText = p50.noticeText,
					onFocusChanged = p1.onFocusChanged,
					universeId = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else p1.props.universeId,
					pageContext = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else AppPage.ExperienceDetail,
					componentType = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else "gameNotice"
				})
			end)
		end
	end)
	p1.renderIgrsRatingLabel = if not FFlagLuaAppAddIgrsRatingToEdp then nil else memoize(function(p51, p52, p53, p54, p55) -- line: 785
		-- upvalues: React (copy), IgrsRatingLabel (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), Constants (copy), v136 (copy), p1 (copy), openExternalBrowser (copy)
		return function() -- line: 786
			-- upvalues: React (copy), IgrsRatingLabel (copy), p51 (copy), p52 (copy), p53 (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), p54 (copy), Constants (copy), v136 (copy), p1 (copy), openExternalBrowser (copy), p55 (copy)
			return React.createElement(IgrsRatingLabel, {
				igrsRating = p51,
				igrsRatingDisplayMessage = p52,
				onActivated = not p53 and function() -- line: 804
					-- upvalues: openExternalBrowser (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), p55 (copy), p1 (copy), Constants (copy)
					openExternalBrowser(if not FFlagLuaAppIgrsRatingPropMemoization then p1.props.linking else p55, Constants.INDONESIAN_CONTENT_MATURITY_URL)
				end or function() -- line: 791
					-- upvalues: FFlagLuaAppIgrsRatingPropMemoization (copy), p54 (copy), Constants (copy), v136 (copy), p1 (copy)
					if FFlagLuaAppIgrsRatingPropMemoization then
						p54(Constants.INDONESIAN_CONTENT_MATURITY_URL, v136:Format("Feature.GameDetails.Label.ContentMaturity"))

						return
					end

					p1.props.openWebview(Constants.INDONESIAN_CONTENT_MATURITY_URL, v136:Format("Feature.GameDetails.Label.ContentMaturity"))
				end
			})
		end
	end)
	p1.renderLogoTray = memoize(function(p56, p57) -- line: 815
		-- upvalues: FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), p1 (copy), React (copy), AppCommonLib (copy), Roact (copy), ExperienceLogoTray (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), EdpSocialLinksImpressionsDetector (copy), AppPage (copy)
		return function() -- line: 816
			-- upvalues: FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), p1 (copy), React (copy), AppCommonLib (copy), Roact (copy), ExperienceLogoTray (copy), p56 (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), p57 (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), EdpSocialLinksImpressionsDetector (copy), AppPage (copy)
			if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then
				local v393 = `EXPERIENCE_SOCIAL_LINKS_{ p1.props.universeId }`
				local v394 = React.createRef()
				local v395 = AppCommonLib.Signal.new()

				return React.createElement(React.Fragment, nil, {
					ExperienceLogoTray = Roact.createElement(ExperienceLogoTray, {
						socialLinks = p56,
						linking = if not FFlagLuaAppIgrsRatingPropMemoization then p1.props.linking else p57,
						openLeaveRobloxAlertUIBlox = p1.props.openLeaveRobloxAlertUIBlox,
						closeAlert = p1.props.closeAlert,
						impressionsTag = v393,
						forwardRef = v394,
						onAbsolutePositionChanged = function(_) -- line: 828
							-- upvalues: v395 (copy)
							v395:fire()
						end,
						universeId = if not FFlagLuaAppAddSocialLinkClickTelemetryToEdp then nil else p1.props.universeId
					}),
					EdpSocialLinksImpressionsDetector = Roact.createElement(EdpSocialLinksImpressionsDetector, {
						parentRef = v394,
						scrollViewPositionChangedSignal = v395,
						pageContext = AppPage.ExperienceDetail,
						impressionsTag = v393,
						socialLinks = p56,
						universeId = p1.props.universeId
					})
				})
			end

			return Roact.createElement(ExperienceLogoTray, {
				socialLinks = p56,
				linking = if not FFlagLuaAppIgrsRatingPropMemoization then p1.props.linking else p57,
				openLeaveRobloxAlertUIBlox = p1.props.openLeaveRobloxAlertUIBlox,
				closeAlert = p1.props.closeAlert,
				universeId = if not FFlagLuaAppAddSocialLinkClickTelemetryToEdp then nil else p1.props.universeId
			})
		end
	end)

	function p1.onMediaGalleryPreviewActivated(p59, p60) -- line: 870
		-- upvalues: p1 (copy), UiMode (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy)
		local v284 = p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot

		if not p1.state.isFullscreen and (v284 and p1.props.setControllerBarNavigation) then
			p1.props.setControllerBarNavigation(false)
		end

		p1:setState({
			isFullscreen = true,
			mediaGalleryShowIndex = p59,
			currentIndex = if not v284 then nil else p59
		})

		if FFlagLuaAppEdpMediaGalleryRedesignTelemetry and p1.props.onMediaGalleryEnterFullscreen then
			p1.props.onMediaGalleryEnterFullscreen(p59, p60)

			return
		end

		if FFlagLuaAppDesktopMediaGalleryTelemetry and p1.props.onMediaGalleryPreviewActivated then
			p1.props.onMediaGalleryPreviewActivated(p59)
		end
	end

	p1.renderMediaGallery = memoize(function(p61, p62) -- line: 889
		-- upvalues: p1 (copy), UiMode (copy), Roact (copy), ExperienceMediaGallery (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy)
		if p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot then
			return function() -- line: 892
				-- upvalues: Roact (copy), ExperienceMediaGallery (copy), p1 (copy), p61 (copy), p62 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
				return Roact.createElement(ExperienceMediaGallery, {
					tokens = p1.props.tokens,
					deviceType = p1.props.deviceType,
					universeId = p61,
					onPreviewActivated = p1.onMediaGalleryPreviewActivated,
					isFullscreenState = p62,
					exitFullscreen = p1.onClose,
					onSelectionGained = p1.onSelectionGained,
					mediaGalleryGainFocused = p1.mediaGalleryGainFocused,
					uiMode = p1.props.uiModeInfo.uiMode,
					shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp
				})
			end
		end

		return function() -- line: 909
			-- upvalues: Roact (copy), ExperienceMediaGallery (copy), p1 (copy), p61 (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), p62 (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
			return Roact.createElement(ExperienceMediaGallery, {
				deviceType = p1.props.deviceType,
				universeId = p61,
				startIndex = if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else p1.state.mediaGalleryShowIndex,
				onPreviewActivated = p1.onMediaGalleryPreviewActivated,
				onThumbnailActivated = if not FFlagLuaAppDesktopMediaGalleryTelemetry or FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else p1.props.onMediaGalleryThumbnailActivated,
				onMediaGalleryMediaChanged = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else p1.props.onMediaGalleryMediaChanged,
				isOccluded = if not FFlagLuaAppEdpMediaGalleryFullScreen or not FFlagLuaAppEdpMediaGalleryAutoAdvance and not FFlagLuaAppEdpMediaGalleryVideoPreview then nil else p62,
				mediaGalleryRedesignEnabledIxp = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else p1.props.mediaGalleryRedesignEnabledIxp,
				mediaGalleryVideoPreviewEnabledIxp = if not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then nil else p1.props.mediaGalleryVideoPreviewEnabledIxp,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp
			})
		end
	end)
	p1.renderExperienceRating = memoize(function(p63) -- line: 940
		-- upvalues: Roact (copy), ExperienceRatings (copy), p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
		return function() -- line: 941
			-- upvalues: Roact (copy), ExperienceRatings (copy), p63 (copy), p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
			return Roact.createElement(ExperienceRatings, {
				universeId = p63,
				height = math.floor((p1.applyTokenScaling(72))),
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp,
				styleProps = {
					statWidgetIconSize = math.floor((p1.applyTokenScaling(48)))
				}
			})
		end
	end)
	p1.renderExperienceInfoTable = memoize(function(p64) -- line: 955
		-- upvalues: Roact (copy), p1 (copy), ExperienceInfoTable (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagHideCloseButtonEdp (copy)
		return function() -- line: 956
			-- upvalues: Roact (copy), p1 (copy), ExperienceInfoTable (copy), p64 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagHideCloseButtonEdp (copy)
			return Roact.createElement("Folder", {
				[Roact.Ref] = p1.props.statsAndInfoRef
			}, Roact.createElement(ExperienceInfoTable, {
				renderTextOverride = p1.renderTextOverride,
				universeId = p64,
				key = "ExperienceInfoTable",
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp,
				hideCloseButton = if not FFlagHideCloseButtonEdp then nil else p1.props.hideCloseButton
			}))
		end
	end)
	p1.renderEventsList = memoize(function(p65, p66) -- line: 975
		-- upvalues: Roact (copy), EventsListWrapper (copy)
		return function() -- line: 976
			-- upvalues: Roact (copy), EventsListWrapper (copy), p65 (copy), p66 (copy)
			return Roact.createElement(EventsListWrapper, {
				universeId = p65,
				referralSource = "expDetailsPage",
				defaultThumbnail = if not p66 then nil else "rbxassetid://" .. p66
			})
		end
	end)
	p1.renderRecommendedExperiencesCarousel = memoize(function(p67) -- line: 985
		-- upvalues: Roact (copy), RecommendedExperienceCarousel (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), p1 (copy), AppPage (copy)
		return function() -- line: 986
			-- upvalues: Roact (copy), RecommendedExperienceCarousel (copy), p67 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), p1 (copy), AppPage (copy)
			return Roact.createElement(RecommendedExperienceCarousel, {
				universeId = p67,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp,
				pageContext = AppPage.ExperienceDetail
			})
		end
	end)

	if FFlagSongEdpCarouselIxp then
		p1.renderExperienceSongsCarousel = memoize(function(p68, p69) -- line: 998
			-- upvalues: React (copy), ExperienceSongsCarousel (copy)
			return function() -- line: 999
				-- upvalues: React (copy), ExperienceSongsCarousel (copy), p68 (copy), p69 (copy)
				return React.createElement(ExperienceSongsCarousel, {
					universeId = p68,
					fractionalItemAmount = 0,
					universeTitle = p69 or "",
					collectionOrder = 2,
					clipsDescendants = true
				})
			end
		end)
	end

	p1.renderCommunityLink = memoize(function(p70, p71, p72) -- line: 1011
		-- upvalues: React (copy), ExperienceCommunityLink (copy)
		return function() -- line: 1012
			-- upvalues: React (copy), ExperienceCommunityLink (copy), p70 (copy), p71 (copy), p72 (copy)
			return React.createElement("Frame", {
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1
			}, {
				UIPadding = React.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 16)
				}),
				ExperienceCommunityLink = React.createElement(ExperienceCommunityLink, {
					communityInfo = p70,
					experienceName = p71 or "",
					universeId = p72
				})
			})
		end
	end)
	p1.linkStartStyle = memoize(function(p73) -- line: 1030
		local LinkColor3 = p73.Tokens.Semantic.Color.Text.Link.Color3

		return `<font color="{ string.format("rgb(%d, %d, %d)", math.round(LinkColor3.R * 255), math.round(LinkColor3.G * 255), (math.round(LinkColor3.B * 255))) }"><b>`
	end)
	p1.checkAndFormatPossibleLink = memoize(function(p74, p75) -- line: 1042
		-- upvalues: checkAndFormatPossibleLink (copy), p1 (copy)
		return checkAndFormatPossibleLink(p75, nil, nil, p1.linkStartStyle(p74), "</b></font>")
	end)
	p1.renderRefundPolicy = memoize(function(p76) -- line: 1048
		-- upvalues: FFlagLuaAppEnableConsolidatedGameRefundPolicy (copy), withStyle (copy), Roact (copy), GameRefundPolicy (copy), p1 (copy), React (copy)
		return function() -- line: 1049
			-- upvalues: FFlagLuaAppEnableConsolidatedGameRefundPolicy (copy), withStyle (copy), Roact (copy), GameRefundPolicy (copy), p76 (copy), p1 (copy), React (copy)
			if FFlagLuaAppEnableConsolidatedGameRefundPolicy then
				return withStyle(function(p77) -- line: 1051
					-- upvalues: Roact (copy), GameRefundPolicy (copy), p76 (copy)
					return Roact.createElement(GameRefundPolicy, {
						refundPolicy = p76,
						paddingTop = p77.Tokens.Global.Space_300
					})
				end)
			end

			return withStyle(function(p78) -- line: 1058
				-- upvalues: p1 (copy), p76 (copy), React (copy)
				local Body = p78.Tokens.Semantic.Typography.Body
				local Muted = p78.Tokens.Semantic.Color.Text.Muted
				local v413, v414 = p1.checkAndFormatPossibleLink(p78, p76.policyText)

				return React.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIPadding = React.createElement("UIPadding", {
						PaddingTop = UDim.new(0, p78.Tokens.Global.Space_300)
					}),
					RefundPolicy = React.createElement("TextButton", {
						BackgroundTransparency = 1,
						Text = v414,
						AutomaticSize = Enum.AutomaticSize.XY,
						Font = Body.Font,
						TextSize = Body.FontSize,
						TextColor3 = Muted.Color3,
						TextTransparency = Muted.Transparency,
						TextWrapped = true,
						TextXAlignment = Enum.TextXAlignment.Left,
						RichText = v413,
						[React.Event.Activated] = function(_) -- line: 1085
							-- upvalues: p1 (copy), p76 (copy)
							p1.props.openRefundPolicyLearnMorePage(p76.learnMoreUrl)
						end
					})
				})
			end)
		end
	end)

	if FFlagEnablePlayWithRewardNonPeekviewEdp then
		p1.renderPlayWithReward = memoize(function(p80, p81, p82, p83, p84) -- line: 1096
			-- upvalues: Roact (copy), PlayWithRewardComponent (copy)
			return function() -- line: 1097
				-- upvalues: Roact (copy), PlayWithRewardComponent (copy), p80 (copy), p81 (copy), p83 (copy), p84 (copy), p82 (copy)
				return Roact.createElement(PlayWithRewardComponent, {
					universeId = p80,
					placeId = p81,
					placeIdOverride = p83,
					experienceJoinData = p84,
					flowId = p82.flowId,
					fetchedUniverseId = p82.universeId,
					isAdDataExpected = p82.isAdDataExpected,
					playWithRewardAdData = p82.adData,
					useLargerStyles = true
				})
			end
		end)
	end

	p1.getBodyComponentListProps = memoize(function(p85, p86, p87, p88, p89, p90, p91, p92, p93, p94, p95, p96, p97, p98, p99, p100, p101, p102, p103, p104, p105, p106, p107, p108, p109, p110, p111, p112) -- line: 1115
		-- upvalues: p1 (copy), FFlagLuaAppExperienceDetailsLayoutOrderConfig (copy), t1 (copy), t2 (copy), ContentPosition (copy), GetFFlagExpDetailsUseSelectionBumpers (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentation (copy), ExperienceDetailsNoticeType (copy), FFlagSongEdpCarouselIxp (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy)
		local v335 = p95.showLogoTraySection and (p91 and next(p91))
		local v336 = p95.showCommunityLink and (p93 and (p94 == "banner" and p92))
		local showEventsList = p95.showEventsList
		local v338 = p1.props.webViewSupport and p99 ~= nil
		local v339 = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 20 or t1.Description
		local v340 = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 40 or t1.MediaGallery
		local v341 = if p97 then v340 else v339
		local v342 = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v341 - 10 else t1.EventsListRedesign
		local v343 = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 10 or t2.EventsListRedesign
		local Left = ContentPosition.Left
		local t5 = {
			MediaGallery = {
				portraitLayoutOrder = if p97 then v339 else not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 5 or t1.MediaGalleryMediaFirst,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 10 or t2.MediaGallery,
				landscapePosition = ContentPosition.Right,
				showCornerGradient = not p95.showCornerGradientPropEnabled and nil,
				useSelectionBumper = not not GetFFlagExpDetailsUseSelectionBumpers() or nil,
				renderComponent = p1.renderMediaGallery(p85, p96)
			},
			Description = {
				portraitLayoutOrder = v341,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 20 or t2.Description,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderDescription(p86, p87)
			},
			IgrsRatingLabel = if not FFlagLuaAppAddIgrsRatingToEdp or not p102 then nil else {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 45 or t1.IgrsRatingLabel,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 30 or t2.IgrsRatingLabel,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderIgrsRatingLabel(p102, p103, if not FFlagLuaAppIgrsRatingPropMemoization then p1.props.webViewSupport else p104, if not FFlagLuaAppIgrsRatingPropMemoization then nil else p105, if not FFlagLuaAppIgrsRatingPropMemoization then nil else p106)
			},
			ExperienceRatings = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentation.getShouldInterleaveSdui()) or (not p1.props.edpServerIxpVariables or p1.props.edpServerIxpVariables.hideGameRatings ~= true) then {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 50 or t1.ExperienceRatings,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 40 or t2.ExperienceRatings,
				landscapePosition = ContentPosition.Left,
				useSelectionBumper = not not GetFFlagExpDetailsUseSelectionBumpers() or nil,
				renderComponent = p1.renderExperienceRating(p85)
			} else nil,
			PlaysAndVisits = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentation.getShouldInterleaveSdui()) or (not p1.props.edpServerIxpVariables or p1.props.edpServerIxpVariables.showVisitsInInfoList ~= true) then {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 60 or t1.PlaysAndVisits,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 50 or t2.PlaysAndVisits,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderPlaysAndVisits(p89, p90)
			} else nil,
			CommunityLink = if not v336 then nil else {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 70 or t1.CommunityLink,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 60 or t2.CommunityLink,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderCommunityLink(p92, p88, p85)
			},
			ExperienceInfoTable = {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 80 or t1.ExperienceInfoTable,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 70 or t2.ExperienceInfoTable,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderExperienceInfoTable(p85)
			},
			RefundPolicy = if not v338 then nil else {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 85 or t1.RefundPolicy,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 75 or t2.RefundPolicy,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderRefundPolicy(p99)
			},
			LogoTraySection = v335 and {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 90 or t1.LogoTraySection,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 80 or t2.LogoTraySection,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderLogoTray(p91, if not FFlagLuaAppIgrsRatingPropMemoization then nil else p106)
			} or nil,
			EventsList = if not showEventsList then nil else {
				portraitLayoutOrder = v342,
				landscapeLayoutOrder = v343,
				landscapePosition = Left,
				renderComponent = p1.renderEventsList(p85, p98)
			},
			Notice = if p100 ~= ExperienceDetailsNoticeType.InExperiencePurchase then nil else {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 100 or t1.Notice,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 100 or t2.Notice,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderNotice(p86)
			},
			RecommendedExperiences = {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 110 or t1.RecommendedExperiences,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 30 or t2.RecommendedExperiences,
				landscapePosition = ContentPosition.Right,
				useSelectionBumper = not not GetFFlagExpDetailsUseSelectionBumpers() or nil,
				renderComponent = p1.renderRecommendedExperiencesCarousel(p85)
			},
			ExperienceSongsCarousel = if not FFlagSongEdpCarouselIxp or not p1.props.showSongCarousel then nil else {
				portraitLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 120 or t1.ExperienceSongsCarousel,
				landscapeLayoutOrder = not FFlagLuaAppExperienceDetailsLayoutOrderConfig and 35 or t2.ExperienceSongsCarousel,
				landscapePosition = ContentPosition.Right,
				renderComponent = p1.renderExperienceSongsCarousel(p85, p88)
			},
			PlayWithReward = if not FFlagEnablePlayWithRewardNonPeekviewEdp or (not p109 or (not p108 or not p107)) then nil else {
				portraitLayoutOrder = t1.PlayWithReward,
				landscapeLayoutOrder = t2.PlayWithReward,
				landscapePosition = ContentPosition.Left,
				renderComponent = p1.renderPlayWithReward(p85, p110, p107, p111, p112)
			}
		}

		if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p1.props.shouldInterleaveSduiIxp) and p101 then
			for v346, v347 in p101 do
				t5[`SduiFeedItem_{ v346 }`] = {
					portraitLayoutOrder = v347.portraitLayoutOrder,
					landscapeLayoutOrder = v347.landscapeLayoutOrder,
					landscapePosition = ContentPosition.Left,
					renderComponent = v347.renderComponent
				}
			end
		end

		return t5
	end)

	function p1.onClose() -- line: 1391
		-- upvalues: p1 (copy), UiMode (copy)
		if p1.state.isFullscreen then
			p1:setState({
				isFullscreen = false
			})

			if p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot and p1.props.setControllerBarNavigation then
				p1.props.setControllerBarNavigation(true)

				return
			end
		else
			p1.props.onClose()
		end
	end

	p1.exitFullscreen = if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else function(p113, p114) -- line: 1408
		-- upvalues: p1 (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy)
		if not p1.state.isFullscreen then
			return
		end

		if FFlagLuaAppEdpMediaGalleryRedesignTelemetry and p1.props.onMediaGalleryExitFullscreen then
			p1.props.onMediaGalleryExitFullscreen(p113, p114)
		end

		p1:setState({
			isFullscreen = false,
			mediaGalleryShowIndex = p113
		})
	end
	p1.focusEventHandlers = {
		[FocusNavigationEventNameEnum.NavigateBack] = {
			handler = InputHandlers.onRelease(function(p115) -- line: 1426
				-- upvalues: p1 (copy)
				p1.onClose()
				p115:cancel()
			end)
		}
	}
	p1.renderFullscreenContent = memoize(function(p116, p117, p118, p119, p120, p121) -- line: 1434
		-- upvalues: p1 (copy), UiMode (copy), Roact (copy), ExperienceMediaGallery (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy)
		if p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot then
			return function() -- line: 1437
				-- upvalues: Roact (copy), ExperienceMediaGallery (copy), p1 (copy), p116 (copy), p117 (copy), p118 (copy), p119 (copy), p121 (copy), p120 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
				return Roact.createElement(ExperienceMediaGallery, {
					tokens = p1.props.tokens,
					universeId = p116,
					isFullscreen = true,
					fullscreenShowIndex = p117,
					deviceType = p1.props.deviceType,
					isFullscreenState = p118,
					isCrossFade = p119,
					setCrossFade = p1.setCrossFade,
					nextIndex = p121,
					currentIndex = p120,
					setCurrentIndex = p1.setCurrentIndex,
					uiMode = p1.props.uiModeInfo.uiMode,
					shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp
				})
			end
		end

		return function() -- line: 1457
			-- upvalues: Roact (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), p1 (copy), ExperienceMediaGallery (copy), p116 (copy), p117 (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
			return Roact.createElement(FocusNavigableSurfaceWrapper, {
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
				isIsolated = true,
				customEventHandlers = p1.focusEventHandlers
			}, {
				ExperienceMediaGallery = Roact.createElement(ExperienceMediaGallery, {
					universeId = p116,
					isFullscreen = true,
					fullscreenShowIndex = p117,
					onMediaGalleryMediaChanged = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else p1.props.onMediaGalleryMediaChanged,
					startIndex = if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else p117,
					exitFullscreen = if not FFlagLuaAppEdpMediaGalleryFullScreen then nil else p1.exitFullscreen,
					mediaGalleryRedesignEnabledIxp = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else p1.props.mediaGalleryRedesignEnabledIxp,
					mediaGalleryVideoPreviewEnabledIxp = if not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then nil else p1.props.mediaGalleryVideoPreviewEnabledIxp,
					shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp
				})
			})
		end
	end)

	function p1.resolveTitleText(p122, p123) -- line: 1488
		return p122 and p122.name or (p123 and p123.name or nil)
	end
	function p1.checkCommunityLinkExposureLogging() -- line: 1493
		-- upvalues: p1 (copy), IXPService (copy), AppUserLayers (copy)
		if p1.props.communityLink then
			IXPService:LogUserLayerExposure(AppUserLayers.EDPCommunityLinksLayer)
		end
	end

	if p1.props.uiModeInfo and p1.props.uiModeInfo.uiMode == UiMode.TenFoot then
		p1.state = {
			bannerImageId = p1.props.bannerImageId,
			isCrossFade = false,
			currentIndex = 1,
			nextIndex = 1
		}

		function p1.setCurrentIndex(p124) -- line: 1508
			-- upvalues: p1 (copy)
			p1:setState({
				currentIndex = p124
			})
		end
		function p1.setCrossFade(p125) -- line: 1514
			-- upvalues: p1 (copy)
			p1:setState({
				isCrossFade = p125
			})
		end
		function p1.onSelectionGained(p126, p127) -- line: 1520
			-- upvalues: p1 (copy)
			if p126 ~= p1.state.nextIndex and p1.state.isCrossFade == false then
				p1.setCrossFade(true)
			end

			p1:setState({
				bannerImageId = p127,
				nextIndex = p126
			})
		end
		function p1.mediaGalleryGainFocused(p128) -- line: 1531
			-- upvalues: p1 (copy)
			if not p128 then
				p1:setState({
					bannerImageId = p1.props.bannerImageId
				})
			end
		end
	end

	if GetFFlagLuaAppEnableNotificationsEDPTooltip() then
		p1.isMounted = false

		local ok, result = pcall(function() -- line: 1543
			-- upvalues: AppStorageService (copy)
			return AppStorageService:GetItem("ShowNotificationsOptInTooltip")
		end)

		p1.showTooltip = not not ok and result == "true"
		p1:setState({
			isNotificationsTooltipActive = p1.showTooltip
		})
	end
end
function v132.didMount(p129) -- line: 1552
	-- upvalues: GetFFlagLuaAppEnableNotificationsEDPTooltip (copy), AppStorageService (copy), Promise (copy), GetFIntNotificationsEDPTooltipTimeLimit (copy)
	p129.checkCommunityLinkExposureLogging()

	if GetFFlagLuaAppEnableNotificationsEDPTooltip() then
		p129.isMounted = true

		if p129.showTooltip then
			pcall(function() -- line: 1558
				-- upvalues: AppStorageService (copy)
				AppStorageService:SetItem("ShowNotificationsOptInTooltip", "false")
				AppStorageService:Flush()
			end)
		end

		Promise.delay(GetFIntNotificationsEDPTooltipTimeLimit()):andThen(function() -- line: 1564
			-- upvalues: p129 (copy)
			if p129.isMounted then
				p129:setState({
					isNotificationsTooltipActive = false
				})
			end
		end)
	end
end
function v132.didUpdate(p130, p131) -- line: 1574
	if not p131.communityLink then
		p130.checkCommunityLinkExposureLogging()
	end
end
function v132.render(p132) -- line: 1580
	-- upvalues: v5 (copy), RetrievalStatus2 (copy), Roact (copy), LoadingStateContainer (copy), RetrievalStatus (copy)
	if v5 then
		if p132.props.gameDetailsPageDataStatus == RetrievalStatus2.Failed and not p132.props.gameInfo then
			return p132:renderOnFailed()
		end

		return p132:renderOnLoaded()
	end

	return Roact.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus.fromRawValue(p132.props.gameDetailsPageDataStatus),
		renderOnFailed = function() --[[ renderOnFailed ]] -- line: 1598
			-- upvalues: p132 (copy)
			if p132.props.gameInfo then
				return p132:renderOnLoaded()
			end

			return p132:renderOnFailed()
		end,
		renderOnLoaded = function() --[[ renderOnLoaded ]] -- line: 1606
			-- upvalues: p132 (copy)
			return p132:renderOnLoaded()
		end,
		renderOnLoading = function() --[[ renderOnLoading ]] -- line: 1609
			-- upvalues: p132 (copy)
			return p132:renderOnLoading()
		end
	})
end
function v132.renderOnLoading(_) -- line: 1615
	-- upvalues: Roact (copy), ExperienceDetailsLoadingStatePage (copy)
	return Roact.createElement(ExperienceDetailsLoadingStatePage)
end
function v132.renderOnFailed(p134) -- line: 1619
	-- upvalues: withLocalization (copy), EnumGameDetailErrorTypes (copy), Roact (copy), EmptyState (copy)
	return withLocalization({
		failedMessage = "Feature.EmptyStatePage.Message.NoInternet",
		experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable"
	})(function(p135) -- line: 1623
		-- upvalues: p134 (copy), EnumGameDetailErrorTypes (copy), Roact (copy), EmptyState (copy)
		local v365 = p134.props.gameDetailError and p134.props.gameDetailError.errorType == EnumGameDetailErrorTypes.ExperienceUnavailable

		return Roact.createElement(EmptyState, {
			onActivated = if not v365 then p134.props.fetchGameDetailsPageData else nil,
			text = if not v365 then p135.failedMessage else p135.experienceUnavailableMessage
		})
	end)
end
function v132.willUnmount(p136) -- line: 1634
	-- upvalues: GetFFlagLuaAppEnableNotificationsEDPTooltip (copy)
	if GetFFlagLuaAppEnableNotificationsEDPTooltip() then
		p136.isMounted = false
	end
end
function v132.renderOnLoaded(p137) -- line: 1640
	-- upvalues: UiMode (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), getPlayButtonProps (copy), GetFFlagLuaAppEnableNotificationsEDPTooltip (copy), DeviceType (copy), GetFFlagNotificationsForceEnableEDPDiscoverability (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentation (copy), Cryo (copy), Images (copy), Roact (copy), React (copy), GameDetailNotificationsButtonHint (copy), TooltipOrientation (copy), withLocalization (copy), FFlagHideCloseButtonEdp (copy), FFlagLuaAppEdpFixDefaultBanner (copy), FFlagLuaAppUnifyPlayButtonNonMobileEdp (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), FFlagLuaAppEnablePlaySquadButton (copy), PlayButton (copy), ButtonSize (copy), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (copy), MenuDirection (copy), t3 (copy), FFlagLuaAppIgrsRatingPropMemoization (copy), DetailsPageSelector (copy)
	local deviceType = p137.props.deviceType
	local universeId = p137.props.universeId
	local gameInfo = p137.props.gameInfo
	local thumbnail = p137.props.thumbnail
	local tokens = p137.props.tokens
	local v152 = p137.props.uiModeInfo and p137.props.uiModeInfo.uiMode == UiMode.TenFoot
	local u153 = thumbnail and thumbnail.url
	local gameDetail = p137.props.gameDetail
	local v155 = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else gameDetail and gameDetail.rootPlaceId or gameInfo and gameInfo.placeId
	local v156 = gameDetail and gameDetail.description or nil
	local v157 = gameDetail and gameDetail.name or nil
	local v158 = p137.resolveTitleText(gameDetail, gameInfo)
	local v159 = gameDetail and gameDetail.creator.name or nil
	local v160 = gameDetail and gameDetail.creator.id or nil
	local v161 = gameDetail and gameDetail.creator.type or nil
	local v162 = nil
	local u163 = nil
	local u164 = nil

	if p137.props.ageRecommendations then
		local summary = p137.props.ageRecommendations.summary

		v162 = if not summary or not summary.ageRecommendation then nil else if not summary.ageRecommendation.displayNameWithHeaderShort then summary.ageRecommendation.displayName else summary.ageRecommendation.displayNameWithHeaderShort

		if FFlagLuaAppAddIgrsRatingToEdp then
			u163 = if not summary or (not summary.ageRecommendation or (not summary.ageRecommendation.igrsRating or summary.ageRecommendation.igrsRating == "")) then nil else summary.ageRecommendation.igrsRating
			u164 = if not summary or (not summary.ageRecommendation or not summary.ageRecommendation.igrsRatingDisplayMessage) then nil else summary.ageRecommendation.igrsRatingDisplayMessage
		end
	end

	local v166 = p137.getPlaysAnsVisitsInfo(gameDetail, gameInfo)
	local socialLinks = p137.props.socialLinks
	local communityLink = p137.props.communityLink
	local v169 = getPlayButtonProps(p137.props.playButtonState, p137.props.gameProductInfo)
	local textKey = v169.textKey
	local price = v169.price
	local icon = v169.icon
	local v173 = not not GetFFlagLuaAppEnableNotificationsEDPTooltip() and p137.state.isNotificationsTooltipActive
	local isFullscreen = p137.state.isFullscreen
	local isCrossFade = p137.state.isCrossFade
	local currentIndex = p137.state.currentIndex
	local nextIndex = p137.state.nextIndex
	local mediaGalleryShowIndex = p137.state.mediaGalleryShowIndex
	local thumbnailSize = nil
	local sideMargin = nil
	local headerBarBackgroundHeight = nil

	if tokens then
		thumbnailSize = tokens.thumbnailSize
		sideMargin = tokens.sideMargin
		headerBarBackgroundHeight = tokens.headerBarBackgroundHeight
	end

	local u182 = nil

	if deviceType == DeviceType.Tablet then
		u182 = math.min(p137.props.viewHeight / 3, 500)
		thumbnailSize = 200
	elseif not v152 then
		u182 = 208
	end

	local v183 = v152 and v162
	local v184 = not not GetFFlagNotificationsForceEnableEDPDiscoverability() or p137.props.enableNotificationsDiscoverability
	local notificationsCanEnableExperience = p137.props.notificationsCanEnableExperience

	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentation.getShouldInterleaveSdui()) and (p137.props.edpServerIxpVariables and p137.props.edpServerIxpVariables.hideNotifyButton == true) then
		v184 = false
	end

	local v186 = Cryo.List.filter({
		not v152 and {
			props = {
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = Images["icons/actions/friends/friendsplaying"],
				userInteractionEnabled = true,
				showBackground = true,
				onActivated = p137.openShareContextualMenu,
				size = p137.props.iconButtonSize,
				backgroundColor = tokens and tokens.actionBarButtonBackgroundColor or nil
			}
		} or nil,
		{
			props = {
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = Images["icons/common/more"],
				userInteractionEnabled = true,
				showBackground = true,
				onActivated = p137.openMoreContextualMenu,
				size = p137.props.iconButtonSize,
				backgroundColor = tokens and tokens.actionBarButtonBackgroundColor or nil
			}
		},
		v184 and (not not notificationsCanEnableExperience and {
			props = {
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UDim2.fromScale(0.5, 0.5),
				icon = if not p137.props.gameFollowings or not p137.props.gameFollowings.isFollowed then Images["icons/common/notificationOff"] else Images["icons/common/notificationOn"],
				userInteractionEnabled = true,
				showBackground = true,
				onActivated = p137.toggleFollowExperience,
				size = p137.props.iconButtonSize,
				backgroundColor = tokens and tokens.actionBarButtonBackgroundColor or nil,
				[Roact.Children] = if not GetFFlagLuaAppEnableNotificationsEDPTooltip() then nil else {
					Tooltip = React.createElement(GameDetailNotificationsButtonHint, {
						isActive = v173,
						preferredOrientation = TooltipOrientation.Bottom
					})
				}
			}
		}) or nil
	}, function(p138) -- line: 1788
		return p138 ~= nil
	end)
	local t6 = nil

	if v152 then
		local v188 = p137.props.gameDetail and p137.props.gameDetail.licenseDescription or nil

		if v183 or v188 then
			t6 = {}
		end

		if v183 then
			local t7 = {
				props = {
					anchorPoint = Vector2.new(0, 0.5),
					position = UDim2.fromScale(0, 0.5),
					text = v162,
					horizontalPadding = tokens.actionBarTextButtonPadding.X,
					verticalPadding = tokens.actionBarTextButtonPadding.Y,
					userInteractionEnabled = true,
					showBackground = true,
					size = p137.props.textButtonSize,
					onActivated = function() --[[ onActivated ]] -- line: 1810
						-- upvalues: p137 (copy), universeId (copy)
						p137.props.openExperienceGuidelinesExplained(universeId, true)
					end,
					backgroundColor = tokens and tokens.actionBarButtonBackgroundColor or nil
				}
			}

			table.insert(t6, t7)
		end

		if v188 then
			local t8 = {
				props = {
					anchorPoint = Vector2.new(0, 0.5),
					position = UDim2.fromScale(0, 0.5),
					text = v188,
					horizontalPadding = tokens.actionBarTextButtonPadding.X,
					verticalPadding = tokens.actionBarTextButtonPadding.Y,
					userInteractionEnabled = false,
					showBackground = true,
					size = p137.props.textButtonSize,
					backgroundColor = tokens and tokens.actionBarButtonBackgroundColor or nil
				}
			}

			table.insert(t6, t8)
		end
	else
		t6 = if not v183 then nil else {{
			props = {
				anchorPoint = Vector2.new(0, 0.5),
				position = UDim2.fromScale(0, 0.5),
				text = v162,
				horizontalPadding = tokens.actionBarTextButtonPadding.X,
				verticalPadding = tokens.actionBarTextButtonPadding.Y,
				userInteractionEnabled = true,
				showBackground = true,
				size = p137.props.textButtonSize,
				onActivated = function() --[[ onActivated ]] -- line: 1845
					-- upvalues: p137 (copy), universeId (copy)
					p137.props.openExperienceGuidelinesExplained(universeId, true)
				end,
				backgroundColor = tokens and tokens.actionBarButtonBackgroundColor or nil
			}
		}}
	end

	return withLocalization({
		buttonText = textKey
	})(function(p139) -- line: 1857
		-- upvalues: v169 (copy), price (copy), p137 (copy), deviceType (copy), u153 (ref), v158 (copy), FFlagHideCloseButtonEdp (copy), tokens (copy), universeId (copy), v159 (copy), v160 (copy), v161 (copy), v156 (copy), v166 (copy), FFlagLuaAppEdpFixDefaultBanner (copy), FFlagLuaAppUnifyPlayButtonNonMobileEdp (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), FFlagLuaAppEnablePlaySquadButton (copy), icon (copy), Images (copy), Roact (copy), PlayButton (copy), v152 (copy), ButtonSize (copy), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (copy), MenuDirection (copy), v186 (copy), t6 (ref), v157 (copy), socialLinks (copy), communityLink (copy), t3 (copy), isFullscreen (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentation (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), u163 (ref), u164 (ref), FFlagLuaAppIgrsRatingPropMemoization (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), v155 (copy), mediaGalleryShowIndex (copy), isCrossFade (copy), currentIndex (copy), nextIndex (copy), sideMargin (ref), u182 (ref), thumbnailSize (ref), headerBarBackgroundHeight (ref), DetailsPageSelector (copy)
		local buttonText = p139.buttonText

		if v169.localizedFiatPrice then
			buttonText = v169.localizedFiatPrice
		elseif price then
			buttonText = p137.getAbbreviateCount(price)
		end

		local t9 = {
			deviceType = deviceType,
			thumbnailImageUrl = u153,
			titleText = v158,
			hideCloseButton = if not FFlagHideCloseButtonEdp then nil else p137.props.hideCloseButton,
			actionBarLabelText = p137.props.playButtonContextualMessage,
			renderInfoContent = p137.renderInfoContent(tokens, universeId, v159, v160, v161, p137.props.creatorVerified or false, v156, v166.plays, v166.totalUpVotes, v166.totalDownVotes),
			onClose = p137.onClose
		}
		local defaultBannerUrl

		if FFlagLuaAppEdpFixDefaultBanner then
			defaultBannerUrl = p137.props.defaultBannerUrl

			if not defaultBannerUrl then
				local v371 = p137.state.bannerImageId or p137.props.bannerImageId

				defaultBannerUrl = not v371 and "" or "rbxassetid://" .. v371
			end
		else
			local v372 = p137.state.bannerImageId or p137.props.bannerImageId

			defaultBannerUrl = not v372 and "" or "rbxassetid://" .. v372
		end

		t9.bannerImageUrl = defaultBannerUrl
		t9.actionBarProps = {
			iconSize = p137.props.tokens.iconSize,
			buttonHeight = p137.props.actionBarHeight,
			buttonPadding = tokens.headerItemPadding,
			button = if not FFlagLuaAppUnifyPlayButtonNonMobileEdp or not not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and not p137.props.hasUnifiedPlayButtonIxp then {
				props = if not FFlagLuaAppEnablePlaySquadButton or not v169.showSquadButton then {
					onActivated = p137.onPlayButtonActivated,
					icon = if not icon then nil else Images[icon],
					text = buttonText,
					isDisabled = v169.isDisabled,
					isLoading = v169.isLoading,
					buttonType = v169.buttonType,
					size = p137.props.playButtonSize,
					buttonRef = p137.props.playButtonRef
				} else {
					button = {
						onActivated = p137.onPlayButtonActivated,
						icon = if not icon then nil else Images[icon],
						text = buttonText,
						isDisabled = v169.isDisabled
					},
					overflow = {
						isDisabled = v169.isSquadButtonDisabled,
						onActivated = p137.props.onPlaySquadButtonActivated
					},
					size = p137.props.playButtonSize
				}
			} else nil,
			buttonOverride = if not FFlagLuaAppUnifyPlayButtonNonMobileEdp or not not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and not p137.props.hasUnifiedPlayButtonIxp then nil else Roact.createElement(PlayButton, {
				universeId = universeId,
				referralSource = p137.props.referralSource,
				launchSource = "ExperienceDetailsPage",
				fillBehavior = "Fill",
				experienceJoinData = p137.props.experienceJoinData,
				placeId = p137.props.placeIdOverride,
				buttonSize = if not v152 then ButtonSize.Large else ButtonSize.Medium,
				squadButtonHeight = UDim.new(0, p137.props.actionBarHeight),
				squadButtonMenuDirection = if not FFlagLuaAppUnifiedPlayButtonSquadMenuDirection then nil else MenuDirection.Down,
				useUIBloxButton = p137.props.unifyToUIBloxIxp,
				testId = "--experience-details--play-button"
			}),
			icons = v186,
			textButtons = t6
		}
		t9.actionBarWidth = if not FFlagLuaAppEnablePlaySquadButton or not v169.showSquadButton then p137.applyTokenScaling(380) else p137.applyTokenScaling(420)
		t9.actionBarHeight = p137.props.actionBarHeight
		t9.componentList = p137.getBodyComponentListProps(universeId, p137.props.gameDetailsPageDataStatus, v156, v157, v166.plays, v166.visits, socialLinks, communityLink, p137.props.communityLinksEnabled, p137.props.communityLinkVariant, p137.props.detailsPageConfiguration or t3, isFullscreen, v152, p137.props.bannerImageId, if not p137.props.gameDetail then nil else p137.props.gameDetail.refundPolicy, p137.props.experienceDetailsNoticeType, if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentation.getShouldInterleaveSdui()) then nil else p137.props.sduiFeedItemConfigs, if not FFlagLuaAppAddIgrsRatingToEdp then nil else u163, if not FFlagLuaAppAddIgrsRatingToEdp then nil else u164, if not FFlagLuaAppIgrsRatingPropMemoization then nil else p137.props.webViewSupport, if not FFlagLuaAppIgrsRatingPropMemoization then nil else p137.props.openWebview, if not FFlagLuaAppIgrsRatingPropMemoization then nil else p137.props.linking, if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else p137.props.playWithRewardData, if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else p137.props.showPlayWithReward, if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else p137.props.isPlayable, if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else v155, if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else p137.props.placeIdOverride, if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else p137.props.experienceJoinData)
		t9.isFullscreen = isFullscreen
		t9.renderFullscreenContent = p137.renderFullscreenContent(universeId, mediaGalleryShowIndex, isFullscreen, isCrossFade, currentIndex, nextIndex)
		t9.sideMargin = sideMargin
		t9.startingOffsetPosition = u182
		t9.thumbnailHeight = thumbnailSize
		t9.headerBarBackgroundHeight = headerBarBackgroundHeight
		t9.dualPanelBreakpoint = 1e999
		t9.maxContentWidth = 850
		t9.tokens = if not tokens then nil else {
			thumbnailMargin = tokens.thumbnailMargin,
			thumbnailShadowHeight = tokens.thumbnailShadowHeight,
			headerGradientHeight = tokens.headerGradientHeight,
			headerBottomMargin = tokens.headerBottomMargin,
			animationConfig = tokens.animationConfig,
			itemPadding = tokens.itemPadding,
			safeAreaSize = tokens.safeAreaSize,
			trailingWhitespace = tokens.trailingWhitespace,
			actionBarHeight = p137.props.actionBarHeight
		}
		t9.disableStickyActionBar = p137.props.disableStickyActionBar
		t9.containerRef = p137.props.containerRef

		return Roact.createElement(DetailsPageSelector, {
			deviceType = deviceType,
			detailsPageProps = t9
		})
	end)
end

return function(p140) --[[ ExperienceDetailsPageFn ]] -- line: 2029
	-- upvalues: FFlagEDPTTITrackingEnabled (copy), useFirstMediaCarouselImageUri (copy), useEDPTTITracking (copy), EDPTTIConstants (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceDetailsExperimentation (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), ServerDrivenUi (copy), EdpSduiUtils (copy), t1 (copy), t2 (copy), ApiFetchExperienceDetailsPageCounters (copy), useEdpServerIxpVariables (copy), useUiModeInfo (copy), ReactFocusNavigation (copy), React (copy), UiMode (copy), useTokens (copy), FFlagLuaAppFixEdpInitialFocus (copy), Responsive (copy), FFlagHideCloseButtonEdp (copy), useCloseWithBackButton (copy), Roact (copy), v132 (copy), Cryo (copy)
	if FFlagEDPTTITrackingEnabled then
		local v192 = useFirstMediaCarouselImageUri(p140.universeId)

		useEDPTTITracking(EDPTTIConstants.EDP_IMPLEMENTATION.LEGACY_FULL_PAGE, p140.universeId, v192)
	end

	local v193 = nil

	if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then
		v193 = ExperienceDetailsExperimentation.getShouldHydrateLegacy()
	end

	local v194 = nil

	if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		v194 = ExperienceDetailsExperimentation.getShouldInterleaveSdui()
	end

	local v195 = nil
	local v196 = nil

	if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		local v197 = ServerDrivenUi.useSduiContextFromSignalAndProcessConfigs(EdpSduiUtils.getUnprocessedEdpStoreKey((tostring(p140.universeId))), EdpSduiUtils.getEdpStoreKey((tostring(p140.universeId))), FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and v194)

		v195 = ServerDrivenUi.useSduiEdpFeedItemConfigs({
			sduiContext = v197,
			storeKey = EdpSduiUtils.getEdpStoreKey((tostring(p140.universeId))),
			portraitLayoutConfig = t1,
			landscapeLayoutConfig = t2,
			defaultLayoutOrder = t1.SduiFeedItemsDefault,
			logLayoutConflictFn = ApiFetchExperienceDetailsPageCounters.logSduiLayoutOrderConflict,
			shouldInterleaveSdui = FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and v194
		})
		v196 = useEdpServerIxpVariables()
	end

	local v198 = useUiModeInfo()
	local v199 = ReactFocusNavigation.useFocusGuiObject()
	local v200, v201 = React.useState(nil)
	local v202 = not p140.tokens and 0 or p140.tokens.iconSize
	local v203 = if v198.uiMode ~= UiMode.TenFoot then nil else UDim2.fromOffset(v202, v202)
	local uDim2 = UDim2.fromOffset(0, v202)
	local v205 = p140.tokens and p140.tokens.actionBarHeight or v202
	local uDim2_2 = UDim2.new(1, 0, 0, v205)
	local v207 = useTokens()
	local v208 = nil
	local u209 = nil

	if FFlagLuaAppFixEdpInitialFocus then
		u209 = React.useRef(nil)
		u209.current = Responsive.usePreferredInput() == Responsive.Input.Directional
	end

	local v210 = if not FFlagLuaAppFixEdpInitialFocus then Responsive.usePreferredInput() == Responsive.Input.Directional else u209.current

	if FFlagHideCloseButtonEdp then
		v208 = v210
	end

	local v211 = nil

	if FFlagLuaAppFixEdpInitialFocus then
		v201 = useCloseWithBackButton(v201, p140.onClose)

		local v212

		v212, v211 = React.useState(nil)

		local u213 = v212
		local v214 = React.useRef(nil)

		React.useEffect(function() -- line: 2107
			-- upvalues: u213 (ref), v214 (copy), u209 (ref), v199 (copy)
			if u213 == nil then
				v214.current = false

				return
			end

			if u213 and u209.current and not v214.current then
				v199(u213)
				v214.current = true
			end
		end, {
			u213,
			v199
		})
		React.useEffect(function() -- line: 2119
			-- upvalues: v200 (copy)
			local n2 = -1
			local connection = nil

			if v200 then
				connection = v200.SelectionChanged:Connect(function(_, p142, p143) -- line: 2123
					-- upvalues: v200 (copy), n2 (ref)
					if p143 == nil or (p142 == nil or not p143:IsDescendantOf(v200) or not p142:IsDescendantOf(v200)) then
						return
					end

					p143.SelectionOrder = n2
					n2 -= 1
				end)
			end

			return function() -- line: 2137
				-- upvalues: connection (ref)
				if connection then
					connection:Disconnect()
				end
			end
		end, { v200 })
	end

	return Roact.createElement(v132, Cryo.Dictionary.join({
		foundationTokens = v207,
		uiModeInfo = v198,
		focusGuiObject = v199,
		iconButtonSize = v203,
		textButtonSize = uDim2,
		playButtonSize = uDim2_2,
		actionBarHeight = v205,
		playButtonRef = if not FFlagLuaAppFixEdpInitialFocus then nil else v211,
		containerRef = v201,
		sduiFeedItemConfigs = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not v194) then nil else v195,
		disableStickyActionBar = v210,
		hideCloseButton = if not FFlagHideCloseButtonEdp then nil else v208,
		shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else v193,
		shouldInterleaveSduiIxp = if not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else v194,
		edpServerIxpVariables = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not v194) then nil else v196
	}, p140))
end
