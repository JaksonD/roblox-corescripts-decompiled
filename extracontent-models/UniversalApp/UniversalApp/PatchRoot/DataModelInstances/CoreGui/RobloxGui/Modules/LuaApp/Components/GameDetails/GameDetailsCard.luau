local CorePackages = game:GetService("CorePackages")
local AdService = game:GetService("AdService")
local IXPService = game:GetService("IXPService")
local Roact = require(CorePackages.Packages.Roact)
local Cryo = require(CorePackages.Packages.Cryo)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local memoize = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local usePlayButtonState = require(CorePackages.Workspace.Packages.GamePlayButton).usePlayButtonState
local PlayButtonStates = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonStates
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local FetchGamePlayabilityAndProductInfo = require(CorePackages.Workspace.Packages.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local PlayabilityStatusEnum = require(CorePackages.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local EnumGameDetailErrorTypes = require(CorePackages.Workspace.Packages.DiscoveryTypes).EnumGameDetailErrorTypes
local getSafeAreaSize = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local React = require(CorePackages.Packages.React)
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local RoactNavigation = require(CorePackages.Packages.RoactNavigation)
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local ExperienceDetailsExperimentation = require(script.Parent.Parent.ExperienceDetails.ExperienceDetailsExperimentation)
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local ExperienceDetailsNoticeType = require(CorePackages.Workspace.Packages.DiscoveryTypes).ExperienceDetailsNoticeType
local UIBlox = require(CorePackages.Packages.UIBlox)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local withStyle = UIBlox.Style.withStyle
local LoadingStateContainer = UIBlox.App.Container.LoadingStateContainer
local RetrievalStatus2 = UIBlox.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBlox.App.Indicator.EmptyState
local PlayWithRewardComponent = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).PlayWithRewardComponent
local FetchPlayWithRewardState = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).FetchPlayWithRewardState
local SetPlayWithRewardState = require(CorePackages.Workspace.Packages.PlayWithRewardState).SetPlayWithRewardState
local useEdpServerIxpVariables = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables)
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local MediaGallerySwiped = Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaGallerySwiped
local MediaGalleryMediaChanged = Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaGalleryMediaChanged
local checkAndFormatPossibleLink = require(CorePackages.Workspace.Packages.CollectionViews).checkAndFormatPossibleLink
local Modules2 = game:GetService("CoreGui").RobloxGui.Modules
local Constants = require(Modules2.LuaApp.Constants)
local ApiFetchExperienceDetailsPage = require(Modules2.LuaApp.Thunks.ApiFetchExperienceDetailsPage)
local ApiFetchExperienceDetailsPageCounters = require(Modules2.LuaApp.Thunks.ApiFetchExperienceDetailsPageCounters)
local LoadingSkeleton = require(Modules2.LuaApp.Components.LoadingSkeleton)
local GameInfoList = require(Modules2.LuaApp.Components.GameDetails.GameInfoList)
local GameHeader = require(Modules2.LuaApp.Components.GameDetails.GameHeader)
local GamePlaysAndRatings = require(Modules2.LuaApp.Components.GameDetails.GamePlaysAndRatings)
local FetchGameDetailsPageData = require(Modules2.LuaApp.Thunks.Games.FetchGameDetailsPageData)
local RecommendedGames = require(Modules2.LuaApp.Thunks.Games.RecommendedGames)
local EventsListWrapper = require(Modules2.LuaApp.Components.VirtualEvents.EventsListWrapper)
local GameStatsCarousel = require(Modules2.LuaApp.Components.ExperienceDetails.GameStatsCarousel)
local ExperienceTagsContainer = require(Modules2.LuaApp.Components.ExperienceDetails.ExperienceTagsContainer)
local ExperienceDescription = require(Modules2.LuaApp.Components.ExperienceDetails.ExperienceDescription)
local ExperienceMediaGallery = require(Modules2.LuaApp.Components.ExperienceDetails.ExperienceMediaGallery)
local IgrsRatingLabel = require(Modules2.LuaApp.Components.ExperienceDetails.IgrsRatingLabel)
local GameRefundPolicy = require(Modules2.LuaApp.Components.GameDetails.GameRefundPolicy)
local OpenRefundPolicyLearnMorePage = require(Modules2.LuaApp.Thunks.OpenRefundPolicyLearnMorePage)
local OpenWebview = require(Modules2.LuaApp.Thunks.OpenWebview)
local ExperienceSongsCarousel = require(Modules2.LuaApp.Components.ExperienceDetails.ExperienceSongsCarousel)
local RecommendedExperienceCarousel = require(Modules2.LuaApp.Components.ExperienceDetails.RecommendedExperienceCarousel)
local EdpSduiUtils = require(script.Parent.Parent.ExperienceDetails.EdpSduiUtils)
local ServerDrivenUi = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local GameDetailTelemetry = require(CorePackages.Workspace.Packages.GameDetailTelemetry)
local EDPTTIConstants = GameDetailTelemetry.EDPTTIConstants
local FFlagEDPTTITrackingEnabled = GameDetailTelemetry.FFlagEDPTTITrackingEnabled
local useEDPTTITracking = require(Modules2.LuaApp.Components.ExperienceDetails.useEDPTTITracking)
local useFirstMediaCarouselImageUri = require(Modules2.LuaApp.Components.ExperienceDetails.useFirstMediaCarouselImageUri).useFirstMediaCarouselImageUri
local FFlagLuaAppExperienceDetailsLayoutOrderConfig = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExperienceDetailsLayoutOrderConfig
local FFlagSongEdpCarouselIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp
local v75 = game:DefineFastFlag("LuaAppFixNoticeLocalization", false)
local FFlagLuaAppEnableConsolidatedGameRefundPolicy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableConsolidatedGameRefundPolicy
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagEnablePlayWithRewardComponent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardComponent
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local FFlagLuaAppAddIgrsRatingToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local t1 = {
	[1] = {
		Size = UDim2.new(0.5, 0, 0, 35)
	},
	[2] = {
		Size = UDim2.new(0.25, 0, 0, 24)
	},
	[3] = {
		Size = UDim2.new(1, 0, 0, 200)
	},
	[4] = {
		Size = UDim2.new(1, 0, 0, 24)
	},
	[5] = {
		Size = UDim2.new(0.6, 0, 0, 24)
	}
}
local t2 = {
	Header = 100,
	MediaGallery = 125,
	StatsCarousel = 200,
	TagSection = 300,
	MovedEventsList = 400,
	Description = 500,
	IgrsRatingLabel = if not FFlagLuaAppAddIgrsRatingToEdp then nil else 550,
	PlaysAndRatings = 600,
	InfoList = 700,
	RefundPolicy = 900,
	Notice = 1000,
	RecommendedGames = 1100,
	ExperienceSongsCarousel = 1200,
	SduiFeedItemsDefault = 1500
}
local v90 = Roact.PureComponent:extend("GameDetailsCard")

function v90.init(p1) -- line: 162
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy), ArgCheck (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), MediaGallerySwiped (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), MediaGalleryMediaChanged (copy), memoize (copy), checkAndFormatPossibleLink (copy), Roact (copy), RetrievalStatus (copy)
	if FFlagEnablePlayWithRewardComponent then
		p1.state = {
			didFocus = false
		}

		function p1.onDidFocus() -- line: 165
			-- upvalues: p1 (copy)
			p1:setState({
				didFocus = true
			})
		end
	end

	local universeId = p1.props.universeId

	ArgCheck.isType(universeId, "string", "GameDetailsCard.init.universeId")

	function p1.fetchGameDetailsPageData() -- line: 173
		-- upvalues: p1 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy)
		local networking = p1.props.networking
		local universeId2 = p1.props.universeId

		return p1.props.fetchGameDetailsPageData(networking, universeId2, if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p1.props.shouldHydrateLegacyIxp, if not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else p1.props.shouldInterleaveSduiIxp, if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not p1.props.shouldInterleaveSduiIxp) then nil else p1.props.sduiDataUpdatedTimestamp)
	end

	p1.onMediaGallerySwiped = not FFlagLuaAppEdpMediaGalleryRedesignTelemetry and function() -- line: 192
		-- upvalues: p1 (copy), MediaGallerySwiped (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy)
		local v190 = p1.props.gameDetail and p1.props.gameDetail.rootPlaceId or nil

		if v190 then
			MediaGallerySwiped(p1.props.eventIngest, "GameDetailsCard", v190, if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else {
				universeId = p1.props.universeId
			})
		end
	end or nil
	p1.onMediaGalleryMediaChanged = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else function(p2, p3, p4, p5) -- line: 209
		-- upvalues: p1 (copy), MediaGalleryMediaChanged (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy)
		local v195 = p1.props.gameDetail and p1.props.gameDetail.rootPlaceId or nil

		if v195 then
			MediaGalleryMediaChanged(p1.props.eventIngest, "GameDetailsCard", v195, {
				imageAssetId = p2,
				videoAssetId = p3,
				isYouTubeVideo = p4,
				autoAdvance = p5,
				universeId = if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else p1.props.universeId
			})
		end
	end
	p1.linkStartStyle = memoize(function(p6) -- line: 223
		local LinkColor3 = p6.Tokens.Semantic.Color.Text.Link.Color3

		return `<font color="{ string.format("rgb(%d, %d, %d)", math.round(LinkColor3.R * 255), math.round(LinkColor3.G * 255), (math.round(LinkColor3.B * 255))) }"><b>`
	end)
	p1.checkAndFormatPossibleLink = memoize(function(p7, p8) -- line: 235
		-- upvalues: checkAndFormatPossibleLink (copy), p1 (copy)
		return checkAndFormatPossibleLink(p8, nil, nil, p1.linkStartStyle(p7), "</b></font>")
	end)

	function p1.renderRefundPolicy(p9, p10, p11) -- line: 241
		-- upvalues: p1 (copy), Roact (copy)
		local Body = p9.Tokens.Semantic.Typography.Body
		local Muted = p9.Tokens.Semantic.Color.Text.Muted
		local v205, v206 = p1.checkAndFormatPossibleLink(p9, p10.policyText)

		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p11
		}, {
			RefundPolicy = Roact.createElement("TextButton", {
				BackgroundTransparency = 1,
				Text = v206,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = Body.Font,
				TextSize = Body.FontSize,
				TextColor3 = Muted.Color3,
				TextTransparency = Muted.Transparency,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				RichText = v205,
				[Roact.Event.Activated] = function(_) -- line: 265
					-- upvalues: p1 (copy), p10 (copy)
					p1.props.openRefundPolicyLearnMorePage(p10.learnMoreUrl)
				end
			})
		})
	end

	p1.maybeFetchPlayWithReward = if not FFlagEnablePlayWithRewardComponent then nil else function() -- line: 273
		-- upvalues: p1 (copy), RetrievalStatus (copy)
		if p1.state.didFocus ~= true or p1.props.gameDetailsPageDataStatus ~= RetrievalStatus.Done then
			return
		end

		local num = tonumber(p1.props.localUserId)

		if not num then
			return
		end

		if p1.props.playWithRewardData and p1.props.playWithRewardData.universeId == p1.props.universeId then
			return
		end

		p1:setState({
			didFocus = false
		})
		p1.props.fetchPlayWithReward(p1.props.universeId, num):catch(function() -- line: 288
		end)
	end
end
function v90.renderOnLoading(_, p14) -- line: 293
	-- upvalues: Roact (copy), LoadingSkeleton (copy), t1 (copy)
	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, p14),
			PaddingRight = UDim.new(0, p14)
		}),
		Skeleton = Roact.createElement(LoadingSkeleton, {
			Size = UDim2.new(1, 0, 1, 0),
			createLayout = function() --[[ createLayout ]] -- line: 305
				-- upvalues: Roact (copy)
				return Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 15)
				})
			end,
			panels = t1
		})
	})
end
function v90.renderOnLoaded(p15, p16, p17, p18, p19) -- line: 318
	-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentation (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), FFlagEnablePlayWithRewardComponent (copy), withStyle (copy), Roact (copy), FFlagLuaAppExperienceDetailsLayoutOrderConfig (copy), GameHeader (copy), t2 (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceMediaGallery (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), GameStatsCarousel (copy), ExperienceTagsContainer (copy), EventsListWrapper (copy), ExperienceDescription (copy), RetrievalStatus2 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy), IgrsRatingLabel (copy), Constants (copy), GamePlaysAndRatings (copy), GameInfoList (copy), FFlagLuaAppEnableConsolidatedGameRefundPolicy (copy), GameRefundPolicy (copy), ExperienceDetailsNoticeType (copy), v75 (copy), RetrievalStatus (copy), RecommendedExperienceCarousel (copy), FFlagSongEdpCarouselIxp (copy), ExperienceSongsCarousel (copy), PlayWithRewardComponent (copy)
	local universeId = p15.props.universeId
	local gameDetail = p15.props.gameDetail
	local gameInfo = p15.props.gameInfo
	local v111 = gameDetail and gameDetail.rootPlaceId or gameInfo and gameInfo.placeId
	local v112 = p15.props.showRecommendedGames and p15.props.enableRecommendedGames
	local v113 = gameDetail and p15.props.enableSocial
	local v114 = gameDetail and p15.props.enableGameInfoList
	local enableGamePlaysAndRatings = p15.props.enableGamePlaysAndRatings
	local enableGamePassPreview = p15.props.enableGamePassPreview

	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentation.getShouldInterleaveSdui()) and (p15.props.edpServerIxpVariables and p15.props.edpServerIxpVariables.hideGameRatings == true) then
		enableGamePlaysAndRatings = false
	end

	local v117 = gameDetail and (gameDetail.description ~= nil and gameDetail.description ~= "")
	local showGlobalCounters = p15.props.showGlobalCounters
	local showLikesFavoritesCount = p15.props.showLikesFavoritesCount
	local ageRecommendations = p15.props.ageRecommendations
	local v121 = if not FFlagLuaAppAddIgrsRatingToEdp or (not ageRecommendations or (not ageRecommendations.summary or (not ageRecommendations.summary.ageRecommendation or (not ageRecommendations.summary.ageRecommendation.igrsRating or ageRecommendations.summary.ageRecommendation.igrsRating == "")))) then nil else ageRecommendations.summary.ageRecommendation.igrsRating
	local v122 = if not FFlagLuaAppAddIgrsRatingToEdp or (not ageRecommendations or (not ageRecommendations.summary or (not ageRecommendations.summary.ageRecommendation or not ageRecommendations.summary.ageRecommendation.igrsRatingDisplayMessage))) then nil else ageRecommendations.summary.ageRecommendation.igrsRatingDisplayMessage
	local notificationsCanAccessExperience = p15.props.notificationsCanAccessExperience

	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentation.getShouldInterleaveSdui()) and (p15.props.edpServerIxpVariables and p15.props.edpServerIxpVariables.hideNotifyButton == true) then
		notificationsCanAccessExperience = false
	end

	local n1 = 0

	local function v125() -- line: 137
		-- upvalues: n1 (ref)
		n1 += 1

		return n1
	end

	local v126 = p15.props.webViewSupport and (gameDetail ~= nil and gameDetail.refundPolicy ~= nil)
	local v127 = if not FFlagEnablePlayWithRewardComponent then nil else p15.props.isPlayabilitySettledAndPlayable

	return withStyle(function(p20) -- line: 381
		-- upvalues: Roact (copy), p17 (copy), FFlagLuaAppExperienceDetailsLayoutOrderConfig (copy), GameHeader (copy), t2 (copy), universeId (copy), notificationsCanAccessExperience (ref), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), p15 (copy), v125 (copy), ExperienceMediaGallery (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), p16 (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentation (copy), GameStatsCarousel (copy), ExperienceTagsContainer (copy), EventsListWrapper (copy), v111 (copy), v117 (copy), ExperienceDescription (copy), RetrievalStatus2 (copy), p18 (copy), gameDetail (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), AppPage (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), v121 (copy), IgrsRatingLabel (copy), v122 (copy), Constants (copy), p19 (copy), enableGamePlaysAndRatings (ref), GamePlaysAndRatings (copy), showGlobalCounters (copy), showLikesFavoritesCount (copy), v114 (copy), GameInfoList (copy), v113 (copy), ageRecommendations (copy), enableGamePassPreview (copy), v126 (copy), FFlagLuaAppEnableConsolidatedGameRefundPolicy (copy), GameRefundPolicy (copy), ExperienceDetailsNoticeType (copy), v75 (copy), RetrievalStatus (copy), v112 (copy), RecommendedExperienceCarousel (copy), FFlagSongEdpCarouselIxp (copy), ExperienceSongsCarousel (copy), gameInfo (copy), FFlagEnablePlayWithRewardComponent (copy), v127 (copy), PlayWithRewardComponent (copy)
		local t3 = {
			ListLayout = Roact.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20)
			}),
			PagePadding = Roact.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p17),
				PaddingRight = UDim.new(0, p17),
				PaddingTop = UDim.new(0, 0),
				PaddingBottom = UDim.new(0, 20)
			}),
			Header = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then Roact.createElement("Frame", {
				LayoutOrder = v125(),
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ListLayout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 20)
				}),
				MediaGalleryFrame = Roact.createElement("Frame", {
					LayoutOrder = 2,
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					MediaGallery = Roact.createElement(ExperienceMediaGallery, {
						universeId = universeId,
						deviceType = "Phone",
						showYouTubeVideoFirst = false,
						onSwipe = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p15.onMediaGallerySwiped else nil,
						onMediaGalleryMediaChanged = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else p15.onMediaGalleryMediaChanged,
						mediaGalleryRedesignEnabledIxp = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else p15.props.mediaGalleryRedesignEnabledIxp,
						mediaGalleryVideoPreviewEnabledIxp = if not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then nil else p15.props.mediaGalleryVideoPreviewEnabledIxp,
						shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
					}),
					SizeConstraint = Roact.createElement("UISizeConstraint", {
						MinSize = Vector2.new(0, (p16 - p17 * 2) / 1.7777777777777777)
					})
				}),
				Header = Roact.createElement(GameHeader, {
					LayoutOrder = 1,
					universeId = universeId,
					showNotificationButton = notificationsCanAccessExperience,
					shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
				})
			}) else Roact.createElement(GameHeader, {
				LayoutOrder = t2.Header,
				universeId = universeId,
				showNotificationButton = notificationsCanAccessExperience,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
			}),
			MediaGalleryFrame = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then nil else Roact.createElement("Frame", {
				LayoutOrder = t2.MediaGallery,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				MediaGallery = Roact.createElement(ExperienceMediaGallery, {
					universeId = universeId,
					deviceType = "Phone",
					showYouTubeVideoFirst = false,
					onSwipe = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then p15.onMediaGallerySwiped else nil,
					onMediaGalleryMediaChanged = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else p15.onMediaGalleryMediaChanged,
					mediaGalleryRedesignEnabledIxp = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else p15.props.mediaGalleryRedesignEnabledIxp,
					mediaGalleryVideoPreviewEnabledIxp = if not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then nil else p15.props.mediaGalleryVideoPreviewEnabledIxp,
					shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
				}),
				SizeConstraint = Roact.createElement("UISizeConstraint", {
					MinSize = Vector2.new(0, (p16 - p17 * 2) / 1.7777777777777777)
				})
			}),
			StatsCarousel = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentation.getShouldInterleaveSdui()) or (not p15.props.edpServerIxpVariables or p15.props.edpServerIxpVariables.hideStatsCarousel ~= true) then Roact.createElement(GameStatsCarousel, {
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.StatsCarousel,
				universeId = universeId,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
			}) else nil,
			TagSection = Roact.createElement(ExperienceTagsContainer, {
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.TagSection,
				universeId = universeId,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp,
				hideContentDescriptors = not (not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentation.getShouldInterleaveSdui())) and (not not p15.props.edpServerIxpVariables and p15.props.edpServerIxpVariables.showContentDescriptorsInInfoList == true) or nil
			}),
			MovedEventsList = Roact.createElement(EventsListWrapper, {
				layoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.MovedEventsList,
				universeId = universeId,
				referralSource = "expDetailsPage",
				defaultThumbnail = if not v111 then nil else ("rbxthumb://type=GameThumbnail&id=%d&w=768&h=432"):format(v111),
				peekViewFormat = true
			}),
			Description = if not v117 then nil else Roact.createElement(ExperienceDescription, {
				dataStatus = RetrievalStatus2.fromRawValue(p18),
				descriptionText = gameDetail and gameDetail.description,
				expandable = true,
				listPadding = p20.Tokens.Global.Space_125,
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.Description,
				universeId = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else universeId,
				pageContext = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else AppPage.GameDetail,
				componentType = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else "gameDescription",
				viewportBoundsOffset = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else p15.props.viewportBoundsOffset
			}),
			IgrsRatingLabel = if not FFlagLuaAppAddIgrsRatingToEdp or not v121 then nil else Roact.createElement(IgrsRatingLabel, {
				igrsRating = v121,
				igrsRatingDisplayMessage = v122,
				onActivated = function() --[[ onActivated ]] -- line: 565
					-- upvalues: p15 (copy), Constants (copy), p19 (copy)
					p15.props.openWebview(Constants.INDONESIAN_CONTENT_MATURITY_URL, p19.contentMaturityHeader)
				end,
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.IgrsRatingLabel
			}),
			PlaysAndRatings = enableGamePlaysAndRatings and Roact.createElement(GamePlaysAndRatings, {
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.PlaysAndRatings,
				universeId = universeId,
				containerWidth = p16 - 2 * p17,
				rowPadding = 20,
				showGlobalCounters = showGlobalCounters,
				showLikesFavoritesCount = showLikesFavoritesCount,
				hideVisits = true,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
			}),
			InfoList = v114 and Roact.createElement(GameInfoList, {
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.InfoList,
				universeId = universeId,
				leftPadding = p17,
				rightPadding = p17,
				showSocial = v113,
				ageRecommendations = ageRecommendations,
				width = p16,
				enableGamePassPreview = enableGamePassPreview,
				shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
			}),
			RefundPolicy = if not v126 then nil else if not FFlagLuaAppEnableConsolidatedGameRefundPolicy then p15.renderRefundPolicy(p20, gameDetail.refundPolicy, if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.RefundPolicy) else Roact.createElement(GameRefundPolicy, {
				refundPolicy = gameDetail.refundPolicy,
				layoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.RefundPolicy
			}),
			Notice = if p15.props.experienceDetailsNoticeType ~= ExperienceDetailsNoticeType.InExperiencePurchase then nil else Roact.createElement(ExperienceDescription, {
				dataStatus = if not v75 then RetrievalStatus2.fromRawValue(p18) else RetrievalStatus2.fromRawValue(RetrievalStatus.Done),
				headerText = p19.noticeHeader,
				descriptionText = p19.noticeText,
				expandable = false,
				listPadding = p20.Tokens.Global.Space_125,
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.Notice,
				universeId = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else universeId,
				pageContext = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else AppPage.GameDetail,
				componentType = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else "gameNotice",
				viewportBoundsOffset = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else p15.props.viewportBoundsOffset
			}),
			RecommendedGames = v112 and Roact.createElement("Frame", {
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.RecommendedGames,
				Size = UDim2.new(1, 0, 0, 0),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1
			}, {
				Carousel = Roact.createElement(RecommendedExperienceCarousel, {
					universeId = universeId,
					pageContext = AppPage.GameDetail,
					onPeekViewClosed = p15.props.onPeekViewClosed,
					scrollingEnabled = true,
					shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p15.props.shouldHydrateLegacyIxp
				})
			}),
			ExperienceSongsCarousel = if not FFlagSongEdpCarouselIxp or not p15.props.showSongCarousel then nil else Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = if not FFlagLuaAppExperienceDetailsLayoutOrderConfig then v125() else t2.ExperienceSongsCarousel
			}, { Roact.createElement(ExperienceSongsCarousel, {
				universeId = universeId,
				universeTitle = gameDetail and gameDetail.name or (gameInfo and gameInfo.name or ""),
				collectionOrder = 2,
				clipsDescendants = false
			}) }),
			PlayWithRewardComponent = if not FFlagEnablePlayWithRewardComponent or not v127 then nil else Roact.createElement(PlayWithRewardComponent, {
				universeId = universeId,
				placeId = v111,
				placeIdOverride = p15.props.placeIdOverride,
				experienceJoinData = p15.props.experienceJoinData,
				flowId = not p15.props.playWithRewardData and "" or p15.props.playWithRewardData.flowId,
				fetchedUniverseId = if not p15.props.playWithRewardData then nil else p15.props.playWithRewardData.universeId,
				isAdDataExpected = not not p15.props.playWithRewardData and p15.props.playWithRewardData.isAdDataExpected,
				playWithRewardAdData = if not p15.props.playWithRewardData then nil else p15.props.playWithRewardData.adData
			})
		}

		if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p15.props.shouldInterleaveSduiIxp) and p15.props.sduiFeedItemConfigs then
			for v210, v211 in p15.props.sduiFeedItemConfigs do
				t3[`SduiFeedItem_{ v210 }`] = Roact.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					LayoutOrder = v211.portraitLayoutOrder
				}, {
					SduiComponent = v211.renderComponent()
				})
			end
		end

		return Roact.createElement("Frame", {
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y
		}, t3)
	end)
end
function v90.renderOnFailed(p21, p22, p23, p24) -- line: 729
	-- upvalues: v75 (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), EnumGameDetailErrorTypes (copy), Roact (copy), EmptyState (copy)
	if p21.props.gameInfo then
		return p21:renderOnLoaded(p23, p24, nil, if not v75 and not FFlagLuaAppAddIgrsRatingToEdp then nil else p22)
	end

	local v132 = p21.props.gameDetailError and p21.props.gameDetailError.errorType == EnumGameDetailErrorTypes.ExperienceUnavailable

	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 100),
			PaddingLeft = UDim.new(0, p24),
			PaddingRight = UDim.new(0, p24),
			PaddingBottom = UDim.new(0, 20)
		}),
		EmptyState = Roact.createElement(EmptyState, {
			onActivated = if not v132 then p21.fetchGameDetailsPageData else nil,
			text = if not v132 then p22.failedMessage else p22.experienceUnavailableMessage,
			maxSizeTextLabel = Vector2.new(p23 - 2 * p24, 1e999)
		})
	})
end
function v90.getImageSize(_, p26, p27, p28, p29) -- line: 764
	local v138 = p27 * 1.8
	local v139 = p29 / p28
	local v140 = math.max(v138, p26 * v139)
	local v141 = v140 / v139

	return Vector2.new(v141, v140)
end
function v90.render(p30) -- line: 775
	-- upvalues: getSafeAreaSize (copy), Roact (copy), withLocalization (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), LoadingStateContainer (copy), RetrievalStatus2 (copy), FFlagEnablePlayWithRewardComponent (copy), RoactNavigation (copy)
	local screenSize = p30.props.screenSize
	local globalGuiInset = p30.props.globalGuiInset
	local gameDetailsPageDataStatus = p30.props.gameDetailsPageDataStatus
	local v146 = getSafeAreaSize(screenSize, globalGuiInset)
	local v147 = math.min(v146.X.Offset, 640)
	local YOffset = v146.Y.Offset
	local v149 = not (v147 < 600) and 40 or 20
	local v150 = Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true
	}, {
		GameDetails = Roact.createElement("Frame", {
			Position = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1
		}, {
			Background = Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, YOffset),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				ZIndex = 1
			}),
			LoadingState = withLocalization({
				failedMessage = "Feature.EmptyStatePage.Message.NoInternet",
				experienceUnavailableMessage = "Feature.GamePage.QuickLaunch.LaunchError.TemporarilyUnavailable",
				noticeHeader = "Feature.ExperienceDetails.Body.NotesTitle",
				noticeText = "Feature.ExperienceDetails.Notes.InExperiencePurchase",
				contentMaturityHeader = if not FFlagLuaAppAddIgrsRatingToEdp then nil else "Feature.GameDetails.Label.ContentMaturity"
			})(function(p31) -- line: 812
				-- upvalues: Roact (copy), LoadingStateContainer (copy), RetrievalStatus2 (copy), gameDetailsPageDataStatus (copy), p30 (copy), v147 (copy), v149 (copy)
				return Roact.createElement("Frame", {
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, 0, 0, 0),
					ZIndex = 2,
					BackgroundTransparency = 1
				}, {
					LoadingStateContainer = Roact.createElement(LoadingStateContainer, {
						dataStatus = RetrievalStatus2.fromRawValue(gameDetailsPageDataStatus),
						renderOnFailed = function() --[[ renderOnFailed ]] -- line: 822
							-- upvalues: p30 (copy), p31 (copy), v147 (copy), v149 (copy)
							return p30:renderOnFailed(p31, v147, v149)
						end,
						renderOnLoading = function() --[[ renderOnLoading ]] -- line: 825
							-- upvalues: p30 (copy), v149 (copy)
							return p30:renderOnLoading(v149)
						end,
						renderOnLoaded = function() --[[ renderOnLoaded ]] -- line: 828
							-- upvalues: p30 (copy), v147 (copy), v149 (copy), gameDetailsPageDataStatus (copy), p31 (copy)
							return p30:renderOnLoaded(v147, v149, gameDetailsPageDataStatus, p31)
						end
					})
				})
			end)
		})
	})

	if FFlagEnablePlayWithRewardComponent then
		return Roact.createFragment({
			Content = v150,
			NavigationEvents = Roact.createElement(RoactNavigation.NavigationEvents, {
				onDidFocus = p30.onDidFocus
			})
		})
	end

	return v150
end
function v90.didMount(p32) -- line: 854
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy)
	p32.fetchGameDetailsPageData()

	if FFlagEnablePlayWithRewardComponent then
		p32.maybeFetchPlayWithReward()
	end
end
function v90.didUpdate(p33) -- line: 861
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy)
	if FFlagEnablePlayWithRewardComponent then
		p33.maybeFetchPlayWithReward()
	end
end
function v90.willUnmount(p34) -- line: 867
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy)
	local eventIngest = p34.props.eventIngest
	local universeId = p34.props.universeId
	local v156 = p34.props.gameDetail and p34.props.gameDetail.rootPlaceId or nil
	local v157 = p34.props.source or "None"
	local v158 = p34.props.index or -1

	if eventIngest ~= nil and (universeId ~= nil and v156 ~= nil) then
		eventIngest:setRBXEventStream("GameDetailsCard", "viewClose", {
			universeId = universeId,
			rootPlaceId = v156,
			source = v157,
			index = v158
		})
	end

	if FFlagEnablePlayWithRewardComponent then
		p34.props.clearPlayWithReward()
	end
end

local v91 = memoize(function(p35, p36) -- line: 886
	-- upvalues: RetrievalStatus (copy)
	if p35 == RetrievalStatus.Done and (p36 == nil or #p36 == 0) then
		return false
	end

	return true
end)
local v92 = RoactRodux.connect(function(p37, p38) -- line: 896
	-- upvalues: FFlagEnablePlayWithRewardComponent (copy), FetchGamePlayabilityAndProductInfo (copy), RetrievalStatus (copy), PlayabilityStatusEnum (copy), PlayButtonStates (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPage (copy), ApiFetchGameDetails (copy), RecommendedGames (copy), GameInfosReducer (copy), v91 (copy)
	local v163 = if not FFlagEnablePlayWithRewardComponent then nil else FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p37, p38.universeId)
	local v164 = if not FFlagEnablePlayWithRewardComponent then nil else p37.PlayabilityStatus and p37.PlayabilityStatus[p38.universeId] or nil
	local v165 = if not FFlagEnablePlayWithRewardComponent then nil else v163 == RetrievalStatus.Done and (v164 ~= nil and (v164.playabilityStatus == PlayabilityStatusEnum.Playable and p38.playButtonState == PlayButtonStates.Playable))
	local v166, v167

	if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p38.shouldHydrateLegacyIxp then
		v166 = ApiFetchExperienceDetailsPage.GetFetchingStatus(p37, p38.universeId)
		v167 = ApiFetchExperienceDetailsPage.GetFetchingStatus(p37, p38.universeId)
	else
		v166 = ApiFetchGameDetails.GetFetchingStatus(p37, p38.universeId)
		v167 = RecommendedGames.GetFetchingStatus(p37, p38.universeId)
	end

	local v168 = p37.Personalization[GameInfosReducer.key][p38.universeId]
	local PlayWithRewardState = nil

	if FFlagEnablePlayWithRewardComponent and p37.PlayWithRewardState.universeId == p38.universeId then
		PlayWithRewardState = p37.PlayWithRewardState
	end

	return {
		topBarHeight = 0,
		gameDetail = if not FFlagLuaAppEdpBackendV2HydrateLegacyDefault and (not FFlagLuaAppEdpBackendV2HydrateLegacyIxp or not p38.shouldHydrateLegacyIxp) then p37.GameDetails[p38.universeId] else p37.GameDetailsV2[p38.universeId],
		gameDetailError = p37.GameDetailErrors[p38.universeId],
		gameDetailsPageDataStatus = v166,
		gameInfo = v168,
		screenSize = p37.ScreenSize,
		globalGuiInset = p37.GlobalGuiInset,
		showLoadingBackground = v166 ~= RetrievalStatus.Done,
		showRecommendedGames = v91(v167, p37.RecommendedGameEntries[p38.universeId]),
		ageRecommendations = p37.AgeRecommendations[p38.universeId],
		playWithRewardData = if not FFlagEnablePlayWithRewardComponent then nil else PlayWithRewardState,
		isPlayabilitySettledAndPlayable = if not FFlagEnablePlayWithRewardComponent then nil else v165,
		localUserId = if not FFlagEnablePlayWithRewardComponent then nil else p37.LocalUserId
	}
end, function(p39) -- line: 954
	-- upvalues: FetchGameDetailsPageData (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagEnablePlayWithRewardComponent (copy), SetPlayWithRewardState (copy), FetchPlayWithRewardState (copy), AdService (copy), OpenRefundPolicyLearnMorePage (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), OpenWebview (copy)
	return {
		fetchGameDetailsPageData = function(p40, p41, p42, p43, p44) --[[ fetchGameDetailsPageData ]] -- line: 956
			-- upvalues: p39 (copy), FetchGameDetailsPageData (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy)
			return p39(FetchGameDetailsPageData(p40, p41, nil, if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else p42, if not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else p43, if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not p43) then nil else p44))
		end,
		clearPlayWithReward = if not FFlagEnablePlayWithRewardComponent then nil else function() -- line: 978
			-- upvalues: p39 (copy), SetPlayWithRewardState (copy)
			return p39(SetPlayWithRewardState("", "", false, nil))
		end,
		fetchPlayWithReward = if not FFlagEnablePlayWithRewardComponent then nil else function(s1: string, n2: number) -- line: 983
			-- upvalues: p39 (copy), FetchPlayWithRewardState (copy), AdService (copy)
			return p39(FetchPlayWithRewardState(AdService, s1, n2))
		end,
		openRefundPolicyLearnMorePage = function(p45) --[[ openRefundPolicyLearnMorePage ]] -- line: 987
			-- upvalues: p39 (copy), OpenRefundPolicyLearnMorePage (copy)
			return p39(OpenRefundPolicyLearnMorePage(p45))
		end,
		openWebview = if not FFlagLuaAppAddIgrsRatingToEdp then nil else function(p46, p47) -- line: 991
			-- upvalues: p39 (copy), OpenWebview (copy)
			return p39(OpenWebview(p46, p47))
		end
	}
end)(v90)
local v93 = RoactServices.connect({
	networking = RoactNetworking,
	eventIngest = AppEventIngestService
})(v92)
local v94 = RoactAppPolicy.connect(function(p48, _) -- line: 1003
	return {
		enableRecommendedGames = p48.getRecommendedGames(),
		enableSocial = p48.getSocialLinks(),
		enableGameInfoList = p48.getGameInfoList(),
		enableGamePlaysAndRatings = p48.getGamePlaysAndRatings(),
		showGlobalCounters = p48.getShowGlobalCounters(),
		showLikesFavoritesCount = p48.getEnableAggregateLikesFavoritesCount(),
		enableGamePassPreview = p48.getShowPassesOnExperienceDetails(),
		webViewSupport = p48.getWebViewSupport(),
		notificationsCanAccessExperience = p48.getNotificationsCanReceiveExperience(),
		experienceDetailsNoticeType = p48.getExperienceDetailsNoticeType()
	}
end)(v93)

if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
	local v95 = v94

	function v94(p50) -- line: 1020
		-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ServerDrivenUi (copy), EdpSduiUtils (copy), t2 (copy), ApiFetchExperienceDetailsPageCounters (copy), React (copy), SignalsReact (copy), useEdpServerIxpVariables (copy), Roact (copy), v95 (copy), Cryo (copy)
		local v174 = nil
		local v175 = nil
		local v176 = nil

		if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
			local v177 = ServerDrivenUi.useSduiContextFromSignalAndProcessConfigs(EdpSduiUtils.getUnprocessedEdpStoreKey((tostring(p50.universeId))), EdpSduiUtils.getEdpStoreKey((tostring(p50.universeId))), FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p50.shouldInterleaveSduiIxp)

			v174 = ServerDrivenUi.useSduiEdpFeedItemConfigs({
				sduiContext = v177,
				storeKey = EdpSduiUtils.getEdpStoreKey((tostring(p50.universeId))),
				portraitLayoutConfig = t2,
				landscapeLayoutConfig = t2,
				defaultLayoutOrder = t2.SduiFeedItemsDefault,
				logLayoutConflictFn = ApiFetchExperienceDetailsPageCounters.logSduiLayoutOrderConflict,
				shouldInterleaveSdui = FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p50.shouldInterleaveSduiIxp
			})

			local v178 = React.useMemo(function() -- line: 1041
				-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), p50 (copy), ServerDrivenUi (copy), EdpSduiUtils (copy)
				return function(p51) -- line: 1042
					-- upvalues: FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), p50 (copy), ServerDrivenUi (copy), EdpSduiUtils (copy)
					if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and p50.shouldInterleaveSduiIxp) and p50.universeId then
						return ServerDrivenUi.getSduiFeedStore(EdpSduiUtils.getEdpStoreKey((tostring(p50.universeId)))).getDataUpdatedTimestamp(p51)
					end

					return nil
				end
			end, {
				p50.universeId,
				p50.shouldInterleaveSduiIxp
			})

			v175 = SignalsReact.useSignalState(v178)
			v176 = useEdpServerIxpVariables()
		end

		return Roact.createElement(v95, Cryo.Dictionary.join(p50, {
			currentSduiDataTimestamp = v175,
			sduiFeedItemConfigs = v174,
			edpServerIxpVariables = v176
		}))
	end
end

if FFlagSongEdpCarouselIxp or FFlagLuaAppEdpMediaGalleryRedesignIxp or FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then
	v94 = RoactAppExperiment.connectUserLayer({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p52, _) -- line: 1074
		-- upvalues: AppUserLayers (copy), FFlagSongEdpCarouselIxp (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy)
		local v181 = p52[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}

		return {
			showSongCarousel = if not FFlagSongEdpCarouselIxp then nil else v181.showSongCarousel,
			mediaGalleryRedesignEnabledIxp = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else v181.MediaGalleryRedesignEnabled,
			mediaGalleryVideoPreviewEnabledIxp = if not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then nil else v181.MediaGalleryVideoPreviewEnabled
		}
	end, true)(v94)
end

if FFlagLuaAppEdpBackendV2HydrateLegacyIxp or FFlagLuaAppEdpBackendV2SduiInterleaveIxp or FFlagEDPTTITrackingEnabled or FFlagEnablePlayWithRewardComponent then
	local v96 = v94

	function v94(p54) -- line: 1098
		-- upvalues: FFlagEDPTTITrackingEnabled (copy), useFirstMediaCarouselImageUri (copy), useEDPTTITracking (copy), EDPTTIConstants (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceDetailsExperimentation (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), FFlagEnablePlayWithRewardComponent (copy), useRoactService (copy), RoactNetworking (copy), usePlayButtonState (copy), React (copy), IXPService (copy), AppUserLayers (copy), Roact (copy), v96 (copy), Cryo (copy)
		if FFlagEDPTTITrackingEnabled then
			local v183 = useFirstMediaCarouselImageUri(p54.universeId)

			useEDPTTITracking(EDPTTIConstants.EDP_IMPLEMENTATION.LEGACY_PEEK_VIEW, p54.universeId, v183)
		end

		local v184 = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else ExperienceDetailsExperimentation.getShouldHydrateLegacy()
		local v185 = if not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else ExperienceDetailsExperimentation.getShouldInterleaveSdui()
		local playButtonState = nil

		if FFlagEnablePlayWithRewardComponent then
			local v187 = useRoactService(RoactNetworking)

			playButtonState = usePlayButtonState(v187, p54.universeId, nil).playButtonState
		end

		if FFlagLuaAppEdpBackendV2HydrateLegacyIxp or FFlagLuaAppEdpBackendV2SduiInterleaveIxp or FFlagEDPTTITrackingEnabled then
			React.useEffect(function() -- line: 1127
				-- upvalues: IXPService (copy), AppUserLayers (copy)
				IXPService:LogUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
			end, {})
		end

		return Roact.createElement(v96, Cryo.Dictionary.join(p54, {
			shouldHydrateLegacyIxp = if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else v184,
			shouldInterleaveSduiIxp = if not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else v185,
			playButtonState = if not FFlagEnablePlayWithRewardComponent then nil else playButtonState
		}))
	end
end

return v94
