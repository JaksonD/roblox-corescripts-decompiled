local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Roact = require(Modules.Common.Roact)
local RoactLocalization = require(Modules.LuaApp.Services.RoactLocalization)
local RoactRodux = require(Modules.Common.RoactRodux)
local memoize = require(Modules.Common.memoize)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local AppEventIngestService = require(Modules.LuaApp.Services.AppEventIngestService)
local Cryo = require(CorePackages.Packages.Cryo)
local AppCommonLib = require(CorePackages.Workspace.Packages.AppCommonLib)
local ImpressionsTagUtility = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTagUtility
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local AppPage = require(Modules.LuaApp.AppPage)
local ApiFetchGamePasses = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local OpenCentralOverlayForLeaveRobloxAlert = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlay = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local GameInfoRow = require(Modules.LuaApp.Components.GameDetails.GameInfoRow)
local PassesGrid = require(Modules.LuaApp.Components.Passes.PassesGrid)
local EdpSocialLinksImpressionsDetector = require(Modules.LuaApp.Components.ExperienceDetails.EdpSocialLinksImpressionsDetector)
local CommunityLinks = require(CorePackages.Workspace.Packages.CommunityLinks)
local ExperienceCommunityLink = CommunityLinks.Components.ExperienceCommunityLink
local getCommunityUrl = CommunityLinks.Utils.getCommunityUrl
local UIBlox = require(CorePackages.Packages.UIBlox)
local withStyle = UIBlox.Style.withStyle
local useTextSizeOffset = UIBlox.Core.Style.useTextSizeOffset
local RoactAppExperiment = require(CorePackages.Packages.RoactAppExperiment)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local UrlBuilder = require(Modules.LuaApp.Http.UrlBuilder)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local SocialMediaGroup = require(Modules.LuaApp.Components.GameDetails.SocialMediaGroup)
local VerifiedBadges = require(CorePackages.Workspace.Packages.VerifiedBadges)
local GuildedLogoWhiteAsset = require(CorePackages.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset
local Constants = require(CorePackages.Workspace.Packages.CommunityLinks).Analytics.Constants
local clickCommunityLinkEvent = require(CorePackages.Workspace.Packages.CommunityLinks).Analytics.Events.clickCommunityLinkEvent
local ExperienceDetailsExperimentation = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation)
local GetFFlagGameDetailsSeparateChatFeatureRows = require(Modules.LuaApp.Flags.GetFFlagGameDetailsSeparateChatFeatureRows)
local GetFFlagLuaAppFixExperienceInfoShowServersPolicy = require(Modules.LuaApp.Flags.GetFFlagLuaAppFixExperienceInfoShowServersPolicy)
local FStringLuaAppGenreOverride = require(Modules.Personalization.Flags.FStringLuaAppGenreOverride)
local EnableCommunityProfilePageIXP = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local FFlagLuaAppUseExperienceLogoTrayInGameInfoList = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUseExperienceLogoTrayInGameInfoList
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local ExperienceLogoTray = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceLogoTray)
local FFlagLuaAppUpdateContentDescriptorsTranslation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUpdateContentDescriptorsTranslation
local EdpStoreAnalytics = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants2 = EdpStoreAnalytics.Constants
local EdpStoreImpressionsDetector = EdpStoreAnalytics.EdpStoreImpressionsDetector
local GetFFlagEnableEdpStoreClickLogging = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local abbreviateCount = require(CorePackages.Workspace.Packages.Localization).abbreviateCount
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local useEdpServerIxpVariables = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useEdpServerIxpVariables)
local GetFFlagEnableEdpStoreGridPositionLogging = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local FFlagLuaAppBadgesSeeAllEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled
local FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp
local FFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local FFlagLuaAppHideEdpStoreForUnplayable = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppHideEdpStoreForUnplayable
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local getSubscriptionPurchaseCloseCallback = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback
local v64 = Roact.PureComponent:extend("GameInfoList")
local t1 = {
	All = "Feature.GameDetails.Label.GenreAll",
	Adventure = "Feature.GameDetails.Label.GenreAdventure",
	Building = "Feature.GameDetails.Label.GenreBuilding",
	Comedy = "Feature.GameDetails.Label.GenreComedy",
	Fighting = "Feature.GameDetails.Label.GenreFighting",
	FPS = "Feature.GameDetails.Label.GenreFPS",
	Horror = "Feature.GameDetails.Label.LabelGenreHorror",
	Medieval = "Feature.GameDetails.Label.GenreMedieval",
	Military = "Feature.GameDetails.Label.GenreMilitary",
	Naval = "Feature.GameDetails.Label.GenreNaval",
	RPG = "Feature.GameDetails.Label.GenreRPG",
	["Sci-Fi"] = "Feature.GameDetails.Label.GenreSciFi",
	Sports = "Feature.GameDetails.Label.LabelGenreSports",
	["Town and City"] = "Feature.GameDetails.Label.LabelGenreTownAndCity",
	Western = "Feature.GameDetails.Label.GenreWestern"
}

v64.defaultProps = {
	leftPadding = 0,
	rightPadding = 0
}

function v64.init(p1) -- line: 125
	-- upvalues: Roact (copy), AppCommonLib (copy), EdpStoreImpressionsDetector (copy), Constants2 (copy), ImpressionsTagUtility (copy), GameInfoRow (copy), GetFFlagEnableEdpStoreGridPositionLogging (copy), PassesGrid (copy), GetFFlagEnableEdpStoreClickLogging (copy), IXPService (copy), AppUserLayers (copy)
	function p1.createGamePassPreviewRow(p2, p3, p4, p5) -- line: 126
		-- upvalues: p1 (copy), Roact (copy), AppCommonLib (copy), EdpStoreImpressionsDetector (copy), Constants2 (copy), ImpressionsTagUtility (copy), GameInfoRow (copy), GetFFlagEnableEdpStoreGridPositionLogging (copy), PassesGrid (copy), GetFFlagEnableEdpStoreClickLogging (copy)
		local v192 = p1.props.gameDetail and p1.props.gameDetail.rootPlaceId
		local passes = p1.props.passes

		if not passes or not v192 then
			return
		end

		local leftPadding = p1.props.leftPadding
		local rightPadding = p1.props.rightPadding
		local width = p1.props.width
		local v197 = Roact.createRef()
		local v198 = Roact.createRef()

		v198.current = AppCommonLib.Signal.new()

		local v199 = Roact.createElement(EdpStoreImpressionsDetector, {
			parentRef = v197,
			scrollViewPositionChangedSignal = v198,
			impressionsTag = Constants2.ImpressionsTags.Preview,
			parameters = {
				universeId = p2,
				productType = Constants2.StoreEnums.ProductType.GamePasses,
				locationType = Constants2.StoreEnums.LocationType.Edp
			}
		})

		return Roact.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			LayoutOrder = p3
		}, {
			UIListLayout = Roact.createElement("UIListLayout", {
				Padding = UDim.new(0, 10),
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			PassesAndGears = Roact.createElement(GameInfoRow, {
				Size = UDim2.new(1, 0, 0, 57),
				useVerifiedBadgeEmojiWrapper = p4.useVerifiedBadgeEmojiWrapper,
				LayoutOrder = 1,
				viewWidth = if not GetFFlagEnableEdpStoreGridPositionLogging() then nil else width,
				placeId = v192,
				infoName = p4.infoName,
				infoData = p4.infoData,
				linkPage = p4.linkPage,
				linkView = p4.linkView,
				universeId = p2,
				leftPadding = leftPadding,
				rightPadding = rightPadding,
				topPadding = 10,
				bottomPadding = 10,
				analyticsSubPage = p4.analyticsSubPage,
				testId = p4.testId
			}),
			GamePassPreview = Roact.createElement("Frame", {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				BorderSizePixel = 0,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				[Roact.Ref] = function(p6) -- line: 157
					-- upvalues: v197 (copy), ImpressionsTagUtility (copy), Constants2 (copy), p3 (copy)
					v197.current = p6
					ImpressionsTagUtility.AddTag(v197, Constants2.ImpressionsTags.Preview, p3)
				end,
				[Roact.Change.AbsolutePosition] = function(_) -- line: 142
					-- upvalues: v198 (copy)
					v198.current:fire()
				end
			}, {
				Layout = Roact.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				Padding = Roact.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 20),
					PaddingLeft = UDim.new(0, leftPadding),
					PaddingRight = UDim.new(0, rightPadding)
				}),
				Grid = Roact.createElement(PassesGrid, {
					universeId = p2,
					passes = passes,
					numRows = 1,
					viewWidth = width,
					textSizeOffset = p5,
					locationType = if not GetFFlagEnableEdpStoreClickLogging() then nil else Constants2.StoreEnums.LocationType.Edp
				})
			}),
			ImpressionsDetecter = v199
		})
	end
	function p1.checkCommunityLinkExposureLogging() -- line: 229
		-- upvalues: p1 (copy), IXPService (copy), AppUserLayers (copy)
		if p1.props.communityLink then
			IXPService:LogUserLayerExposure(AppUserLayers.EDPCommunityLinksLayer)
		end
	end
end
function v64.makeGameInfoListData(p8) -- line: 237
	-- upvalues: GetFFlagLuaAppFixExperienceInfoShowServersPolicy (copy), FFlagLuaAppHideEdpStoreForUnplayable (copy), AppPage (copy), GuildedLogoWhiteAsset (copy), getCommunityUrl (copy), clickCommunityLinkEvent (copy), Constants (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), ExperienceDetailsExperimentation (copy), abbreviateCount (copy), FFlagLuaAppUpdateContentDescriptorsTranslation (copy), EnableCommunityProfilePageIXP (copy), UrlBuilder (copy), FStringLuaAppGenreOverride (copy), t1 (copy), GetFFlagGameDetailsSeparateChatFeatureRows (copy), FFlagLuaAppBadgesSeeAllEnabled (copy), FFlagEnableBlackbirdPageCloseCallback (copy), getSubscriptionPurchaseCloseCallback (copy)
	local localization = p8.props.localization
	local universeId = p8.props.universeId
	local maxPlayers = p8.props.gameDetail.maxPlayers
	local creator = p8.props.gameDetail.creator
	local id = p8.props.gameDetail.creator.id
	local type = p8.props.gameDetail.creator.type
	local name = p8.props.gameDetail.creator.name
	local creatorVerified = p8.props.creatorVerified
	local genre = p8.props.gameDetail.genre
	local genre_l1 = p8.props.gameDetail.genre_l1
	local genre_l2 = p8.props.gameDetail.genre_l2
	local dateTime = DateTime.fromIsoDate(p8.props.gameDetail.created)
	local dateTime2 = DateTime.fromIsoDate(p8.props.gameDetail.updated)
	local showPasses = p8.props.showPasses
	local showSubscriptionProducts = p8.props.showSubscriptionProducts
	local showDeveloperProducts = p8.props.showDeveloperProducts
	local showBadges = p8.props.showBadges
	local groupLink = p8.props.groupLink
	local v91 = nil
	local v92 = nil

	if p8.props.ageRecommendations then
		local summary = p8.props.ageRecommendations.summary

		v91 = if not summary or not summary.ageRecommendation then nil else summary.ageRecommendation.displayName
		v92 = if not summary or not summary.ageRecommendation then nil else summary.ageRecommendation.minimumAgeDisplay
	end

	local enableGroupLinks = p8.props.enableGroupLinks
	local showBadgesRow = p8.props.showBadgesRow
	local showCreatedRow = p8.props.showCreatedRow
	local showDeveloperRow = p8.props.showDeveloperRow
	local showRNVDeveloper = p8.props.showRNVDeveloper
	local showGamepassesRow = p8.props.showGamepassesRow
	local showGenreRow = p8.props.showGenreRow
	local showSubgenreRow = p8.props.showSubgenreRow
	local showMaxPlayersRow = p8.props.showMaxPlayersRow
	local v103 = if not GetFFlagLuaAppFixExperienceInfoShowServersPolicy() then p8.props.showGamepassesRow else p8.props.showServersRow
	local showUpdatedRow = p8.props.showUpdatedRow
	local experienceVoiceEnabled = p8.props.experienceVoiceEnabled
	local experienceVideoEnabled = p8.props.experienceVideoEnabled
	local enableGamePassPreview = p8.props.enableGamePassPreview

	if showBadgesRow == false then
		showBadges = false
	end

	if showGamepassesRow == false then
		showPasses = false
		showSubscriptionProducts = false
		showDeveloperProducts = false
	end

	p8.gameInfoListData = {}

	local Locale = localization:GetLocale()
	local v109 = dateTime:FormatLocalTime("l", Locale)
	local v110 = dateTime2:FormatLocalTime("l", Locale)

	if showPasses and enableGamePassPreview and (not FFlagLuaAppHideEdpStoreForUnplayable or p8.props.isPlayable) then
		table.insert(p8.gameInfoListData, {
			renderFunction = p8.createGamePassPreviewRow,
			itemInfo = {
				infoName = "Feature.GameDetails.Label.Store",
				infoData = "",
				linkView = AppPage.PassesPage,
				analyticsSubPage = "PassesAndGear",
				testId = "--store-row-tail"
			}
		})
	end

	local communityLink = p8.props.communityLink
	local communityLinksEnabled = p8.props.communityLinksEnabled
	local communityLinkVariant = p8.props.communityLinkVariant

	if communityLinksEnabled and communityLinkVariant == "infolist" and communityLink then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Community",
			infoData = "",
			infoIcon = GuildedLogoWhiteAsset,
			linkUrl = getCommunityUrl(communityLink.communityId),
			testId = "--community-row-tail",
			linkClickCallback = function() --[[ linkClickCallback ]] -- line: 328
				-- upvalues: clickCommunityLinkEvent (copy), p8 (copy), Constants (copy), communityLink (copy), universeId (copy)
				clickCommunityLinkEvent(p8.props.eventIngest, Constants.Context.ExperienceInfoList, {
					guildedServerId = communityLink.communityId,
					entityType = "universe",
					entityId = universeId
				})
			end
		})
	end

	local edpServerIxpVariables = p8.props.edpServerIxpVariables

	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentation.getShouldInterleaveSdui()) and (edpServerIxpVariables and edpServerIxpVariables.showVisitsInInfoList == true) then
		local v115 = p8.props.gameDetail and p8.props.gameDetail.visits or 0

		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Visits",
			infoData = abbreviateCount(v115, Locale) or "--",
			testId = "--visits-row-tail"
		})
	end

	table.insert(p8.gameInfoListData, {
		infoName = not p8.props.ageRecommendationHeader and "Feature.GameDetails.Label.ContentMaturity" or p8.props.ageRecommendationHeader,
		infoData = v91 or localization:Format("Feature.GameDetails.Label.Unavailable"),
		linkView = if not v91 then nil else AppPage.ExperienceGuidelinesExplained,
		analyticsSubPage = AppPage.ExperienceGuidelinesExplained,
		disableInfoNameLocalization = p8.props.ageRecommendationHeader ~= nil,
		testId = "--content-maturity-row-tail"
	})

	if v92 and v92 ~= "" then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Age",
			infoData = v92,
			testId = "--age-row-tail"
		})
	end

	if (FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp and ExperienceDetailsExperimentation.getShouldInterleaveSdui()) and (edpServerIxpVariables and edpServerIxpVariables.showContentDescriptorsInInfoList == true and p8.props.ageRecommendations and p8.props.ageRecommendations.descriptorUsages and #p8.props.ageRecommendations.descriptorUsages > 0) then
		for _, v in ipairs(p8.props.ageRecommendations.descriptorUsages) do
			if v.name == "strong-language" and v.contains then
				table.insert(p8.gameInfoListData, {
					infoName = not FFlagLuaAppUpdateContentDescriptorsTranslation and "Feature.AccountSettings.Heading.Communication" or "Feature.AgeGuidelines.Label.CreatorEnabled",
					infoData = localization:Format("Feature.AgeGuidelines.DisplayName.StrongLanguage"),
					testId = "--content-descriptors-row-tail"
				})

				break
			end
		end
	end

	if showDeveloperRow or showRNVDeveloper and creator.isRNVAccount then
		if EnableCommunityProfilePageIXP.FFlagIsSetupEnabled and p8.props.communityProfilePageEnabled and type == Enum.CreatorType.Group.Name then
			table.insert(p8.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Developer",
				infoData = name,
				linkView = "CommunityProfilePlatform",
				linkViewData = id,
				analyticsSubPage = "Developer",
				useVerifiedBadgeEmojiWrapper = creatorVerified,
				testId = "--developer-row-tail"
			})
		elseif type == Enum.CreatorType.User.Name then
			table.insert(p8.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Developer",
				infoData = name,
				linkView = "UserProfilePlatform",
				linkViewData = id,
				analyticsSubPage = "Developer",
				useVerifiedBadgeEmojiWrapper = creatorVerified,
				testId = "--developer-row-tail"
			})
		else
			table.insert(p8.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Developer",
				infoData = name,
				linkPage = UrlBuilder.game.info.creator({
					creatorType = type,
					creatorId = id
				}),
				analyticsSubPage = "Developer",
				useVerifiedBadgeEmojiWrapper = creatorVerified,
				testId = "--developer-row-tail"
			})
		end
	end

	if showMaxPlayersRow then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.MaxPlayers",
			infoData = tostring(maxPlayers),
			testId = "--server-size-row-tail"
		})
	end

	local v118 = nil

	if genre_l1 and genre_l1 ~= "" then
		v118 = genre_l1
	elseif FStringLuaAppGenreOverride == "N/A" then
		v118 = localization:Format("Feature.GameDetails.Label.Unavailable")
	elseif FStringLuaAppGenreOverride == "All" then
		v118 = localization:Format("Feature.GameDetails.Label.GenreAll")
	end

	local v119 = t1[genre]

	if v118 then
		genre = v118
	elseif v119 ~= nil then
		genre = localization:Format(v119)
	end

	if showGenreRow then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Genre",
			infoData = genre,
			testId = "--genre-row-tail"
		})
	end

	if showSubgenreRow and genre_l2 and genre_l2 ~= "" then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Subgenre",
			infoData = genre_l2,
			testId = "--subgenre-row-tail"
		})
	end

	if showCreatedRow then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Created",
			infoData = v109,
			testId = "--created-row-tail"
		})
	end

	if showUpdatedRow then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Updated",
			infoData = v110,
			testId = "--updated-row-tail"
		})
	end

	if GetFFlagGameDetailsSeparateChatFeatureRows() then
		local v120 = localization:Format("Feature.GameDetails.Label.NotSupported")
		local v121 = localization:Format("Feature.GameDetails.Label.NotSupported")

		if experienceVideoEnabled then
			v121 = localization:Format("Feature.GameDetails.Label.Supported")
		end

		if experienceVoiceEnabled then
			v120 = localization:Format("Feature.GameDetails.Label.Supported")
		end

		if not p8.props.isLocalUserUnder13 then
			table.insert(p8.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.VoiceChat",
				infoData = v120,
				testId = "--voice-chat-row-tail"
			})
		end

		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Camera",
			infoData = v121,
			testId = "--camera-row-tail"
		})
	else
		local t2 = {}

		if experienceVoiceEnabled and not p8.props.isLocalUserUnder13 then
			table.insert(t2, localization:Format("Feature.GameDetails.Label.Microphone"))
		end

		if experienceVideoEnabled then
			table.insert(t2, localization:Format("Feature.GameDetails.Label.Camera"))
		end

		if #t2 < 1 then
			table.insert(t2, localization:Format("Feature.GameDetails.Label.None"))
		end

		table.insert(p8.gameInfoListData, {
			infoName = "Feature.AccountSettings.Heading.Communication",
			infoData = table.concat(t2, ", "),
			testId = "--communication-row-tail"
		})
	end

	if not enableGamePassPreview and (showPasses or showSubscriptionProducts or showDeveloperProducts) and (not FFlagLuaAppHideEdpStoreForUnplayable or p8.props.isPlayable) then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Store",
			infoData = "",
			linkView = AppPage.PassesPage,
			analyticsSubPage = "PassesAndGear",
			testId = "--store-row-tail"
		})
	end

	if showBadges then
		table.insert(p8.gameInfoListData, {
			infoName = "CommonUI.Features.Label.Badges",
			infoData = "",
			linkPage = if not FFlagLuaAppBadgesSeeAllEnabled then UrlBuilder.game.info.badges({
				universeId = universeId
			}) else nil,
			linkView = if not FFlagLuaAppBadgesSeeAllEnabled then nil else AppPage.BadgesSeeAll,
			analyticsSubPage = "Badges",
			testId = "--badges-row-tail"
		})
	end

	if v103 then
		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Servers",
			infoData = "",
			linkPage = UrlBuilder.game.info.servers({
				universeId = universeId
			}),
			analyticsSubPage = "Servers",
			testId = "--servers-row-tail",
			onClose = if not FFlagEnableBlackbirdPageCloseCallback or not getSubscriptionPurchaseCloseCallback then nil else getSubscriptionPurchaseCloseCallback()
		})
	end

	if groupLink and enableGroupLinks then
		if EnableCommunityProfilePageIXP.FFlagIsSetupEnabled and p8.props.communityProfilePageEnabled and groupLink.communityId ~= nil then
			table.insert(p8.gameInfoListData, {
				infoName = "Feature.GameDetails.Label.Group",
				infoData = "",
				linkView = "CommunityProfilePlatform",
				linkViewData = groupLink.communityId,
				analyticsSubPage = "Group",
				testId = "--group-row-tail"
			})

			return
		end

		table.insert(p8.gameInfoListData, {
			infoName = "Feature.GameDetails.Label.Group",
			infoData = "",
			linkPage = groupLink.url,
			analyticsSubPage = "Group",
			testId = "--group-row-tail"
		})
	end
end
function v64.createSocialMediaRow(p9, p10, p11) -- line: 617
	-- upvalues: FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), Roact (copy), AppCommonLib (copy), EdpSocialLinksImpressionsDetector (copy), AppPage (copy), FFlagLuaAppUseExperienceLogoTrayInGameInfoList (copy), ExperienceLogoTray (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), SocialMediaGroup (copy)
	local v126 = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else `EXPERIENCE_SOCIAL_LINKS_{ p10 }`
	local v127 = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else Roact.createRef()
	local v128 = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else AppCommonLib.Signal.new()
	local v129 = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else function(_) -- line: 633
		-- upvalues: v128 (copy)
		v128:fire()
	end
	local leftPadding = p9.props.leftPadding
	local rightPadding = p9.props.rightPadding

	return Roact.createElement("Frame", {
		LayoutOrder = p11,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		[Roact.Ref] = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else v127,
		[Roact.Change.AbsolutePosition] = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else v129
	}, {
		ListLayout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, leftPadding),
			PaddingRight = UDim.new(0, rightPadding),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}),
		EdpSocialLinksImpressionsDetector = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else Roact.createElement(EdpSocialLinksImpressionsDetector, {
			parentRef = v127,
			scrollViewPositionChangedSignal = v128,
			pageContext = AppPage.GameDetail,
			impressionsTag = v126,
			socialLinks = if not p9.props.socialLinks then nil else p9.props.socialLinks.externalLinks,
			universeId = p10
		}),
		SocialLinks = if not FFlagLuaAppUseExperienceLogoTrayInGameInfoList then Roact.createElement(SocialMediaGroup, {
			universeId = p10,
			impressionsTag = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else v126
		}) else if not p9.props.socialLinks or not p9.props.socialLinks.externalLinks then nil else Roact.createElement(ExperienceLogoTray, {
			socialLinks = p9.props.socialLinks.externalLinks,
			linking = p9.props.linking,
			openLeaveRobloxAlertUIBlox = p9.props.openLeaveRobloxAlertUIBlox,
			closeAlert = p9.props.closeAlert,
			impressionsTag = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then nil else v126,
			universeId = if not FFlagLuaAppAddSocialLinkClickTelemetryToEdp then nil else p9.props.universeId
		})
	})
end
function v64.createCommunityRow(p13, p14) -- line: 690
	-- upvalues: Roact (copy), ExperienceCommunityLink (copy)
	local leftPadding = p13.props.leftPadding
	local rightPadding = p13.props.rightPadding

	return Roact.createElement("Frame", {
		LayoutOrder = p14,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, leftPadding),
			PaddingRight = UDim.new(0, rightPadding),
			PaddingTop = UDim.new(0, 30),
			PaddingBottom = UDim.new(0, 10)
		}),
		ExperienceCommunityLink = Roact.createElement(ExperienceCommunityLink, {
			communityInfo = p13.props.communityLink,
			experienceName = p13.props.gameDetail.name,
			universeId = p13.props.universeId
		})
	})
end
function v64.render(p15) -- line: 715
	-- upvalues: Roact (copy), withStyle (copy), GameInfoRow (copy), EnableCommunityProfilePageIXP (copy), FFlagEnableBlackbirdPageCloseCallback (copy)
	local textSizeOffset = p15.props.textSizeOffset

	p15:makeGameInfoListData()

	local rootPlaceId = p15.props.gameDetail.rootPlaceId
	local universeId = p15.props.universeId
	local showSocial = p15.props.showSocial
	local propsLayoutOrder = p15.props.LayoutOrder
	local leftPadding = p15.props.leftPadding
	local rightPadding = p15.props.rightPadding
	local t3 = {
		Layout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}

	return withStyle(function(p16) -- line: 734
		-- upvalues: p15 (copy), t3 (copy), universeId (copy), textSizeOffset (copy), Roact (copy), GameInfoRow (copy), rootPlaceId (copy), EnableCommunityProfilePageIXP (copy), leftPadding (copy), rightPadding (copy), FFlagEnableBlackbirdPageCloseCallback (copy), showSocial (copy), propsLayoutOrder (copy)
		local DividerColor = p16.Theme.Divider.Color
		local DividerTransparency = p16.Theme.Divider.Transparency
		local n1 = 0
		local v205 = #p15.gameInfoListData

		for i, v in ipairs(p15.gameInfoListData) do
			local renderFunction = v.renderFunction
			local v209 = n1 + 1

			if renderFunction then
				t3["GameInfoRow" .. i] = renderFunction(universeId, v209, v.itemInfo, textSizeOffset)
			else
				t3["GameInfoRow" .. i] = Roact.createElement(GameInfoRow, {
					Size = UDim2.new(1, 0, 0, 57),
					useVerifiedBadgeEmojiWrapper = v.useVerifiedBadgeEmojiWrapper,
					LayoutOrder = v209,
					placeId = rootPlaceId,
					infoName = v.infoName,
					infoData = v.infoData,
					infoIcon = v.infoIcon,
					linkPage = v.linkPage,
					linkView = v.linkView,
					linkViewData = if not EnableCommunityProfilePageIXP.FFlagIsSetupEnabled then nil else v.linkViewData,
					linkUrl = v.linkUrl,
					linkClickCallback = v.linkClickCallback,
					universeId = universeId,
					leftPadding = leftPadding,
					rightPadding = rightPadding,
					topPadding = 10,
					bottomPadding = 10,
					analyticsSubPage = v.analyticsSubPage,
					disableInfoNameLocalization = v.disableInfoNameLocalization,
					testId = v.testId,
					onClose = if not FFlagEnableBlackbirdPageCloseCallback then nil else v.onClose
				})
			end

			n1 = v209 + 1
			t3["Divider" .. i] = Roact.createElement("Frame", {
				Size = UDim2.new(1, -leftPadding, 0, 1),
				BackgroundColor3 = DividerColor,
				BackgroundTransparency = DividerTransparency,
				BorderSizePixel = 0,
				LayoutOrder = n1
			})
		end

		local communityLinksEnabled = p15.props.communityLinksEnabled
		local communityLinkVariant = p15.props.communityLinkVariant

		if communityLinksEnabled and communityLinkVariant == "banner" then
			local v212 = p15.props.communityLink and p15:createCommunityRow(n1 + 1) or nil

			if v212 ~= nil then
				v205 += 1
				n1 += 1
				t3["GameInfoRow" .. v205] = v212
			end
		end

		local v213 = n1 + 1
		local v214 = showSocial and p15:createSocialMediaRow(universeId, v213) or nil

		if v214 ~= nil then
			t3["GameInfoRow" .. v205 + 1] = v214
		end

		return Roact.createElement("Frame", {
			Size = UDim2.new(1, leftPadding + rightPadding, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = propsLayoutOrder,
			ClipsDescendants = false
		}, t3)
	end)
end
function v64.didMount(p17) -- line: 812
	p17.checkCommunityLinkExposureLogging()
end
function v64.didUpdate(p18, p19, _) -- line: 816
	-- upvalues: AppPage (copy)
	local topPage = p18.props.topPage
	local topPage2 = p19.topPage

	if topPage.name ~= topPage2.name and (topPage2.name == AppPage.GenericWebPage and ((if not topPage2.extraProps then nil else topPage2.extraProps.passOwned)) == false) then
		p18.props.fetchGamePasses(p18.props.networking, p18.props.universeId)
	end

	if not p19.communityLink then
		p18.checkCommunityLinkExposureLogging()
	end
end

local v66 = memoize(function(p21) -- line: 833
	local t4 = {}

	if not p21 then
		return t4
	end

	for _, v in ipairs(p21) do
		if v.price ~= nil then
			table.insert(t4, v)
		end
	end

	return t4
end)
local v67 = RoactRodux.connect(function(p22, p23) -- line: 858
	-- upvalues: v66 (copy), VerifiedBadges (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), FFlagLuaAppUseExperienceLogoTrayInGameInfoList (copy), FFlagLuaAppHideEdpStoreForUnplayable (copy)
	local v160 = p22.GamePasses and v66(p22.GamePasses[p23.universeId])
	local v161 = p22.GameSubscriptionProducts[p23.universeId]
	local v162 = p22.GameDeveloperProducts[p23.universeId]
	local v163 = p22.GameBadges[p23.universeId]
	local v164 = true
	local v165 = v161 and #v161 > 0
	local v166 = v162 and #v162 > 0
	local v167 = true
	local v168 = p22.GameSocialLinks[p23.universeId]
	local v169 = v168 and v168.groupLink
	local v170 = false
	local v171 = VerifiedBadges.isCreatorOfGameVerified(p22, if not FFlagLuaAppEdpBackendV2HydrateLegacyDefault and (not FFlagLuaAppEdpBackendV2HydrateLegacyIxp or not p23.shouldHydrateLegacyIxp) then p23 else {
		universeId = p23.universeId,
		shouldUseV2GameDetails = true
	})
	local v172 = p22.CommunityLinks.ExperienceCommunityLinks[p23.universeId] or nil

	if v160 and #v160 == 0 then
		v164 = false
	end

	if v163 and #v163 == 0 then
		v167 = false
	end

	local v173 = p22.VoiceChatOptInStatus.isUserOptIn or false
	local v174 = false

	if p22.ShowAgeVerificationOverlay[p23.universeId] ~= nil then
		v170 = p22.ShowAgeVerificationOverlay[p23.universeId].isUniverseEnabledForVoice or false
		v174 = p22.ShowAgeVerificationOverlay[p23.universeId].isUniverseEnabledForAvatarVideo or false
	end

	local t5 = {
		gameDetail = if not FFlagLuaAppEdpBackendV2HydrateLegacyDefault and (not FFlagLuaAppEdpBackendV2HydrateLegacyIxp or not p23.shouldHydrateLegacyIxp) then p22.GameDetails[p23.universeId] else p22.GameDetailsV2[p23.universeId],
		creatorVerified = v171,
		showPasses = v164,
		passes = v160,
		showSubscriptionProducts = v165,
		showDeveloperProducts = v166,
		showBadges = v167,
		groupLink = v169,
		communityLink = v172,
		userVoiceEnabled = v173,
		experienceVoiceEnabled = v170,
		experienceVideoEnabled = v174,
		isLocalUserUnder13 = p22.IsLocalUserUnder13
	}
	local v176 = if not FFlagUseNavigationSelectors then p22.Navigation.history else Selectors.selectLegacyHistory(p22)
	local v177 = v176[#v176]

	t5.topPage = v177[#v177]
	t5.ageRecommendationHeader = p22.AgeRecommendationHeaders.headerDisplayName
	t5.socialLinks = if not FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp and not FFlagLuaAppUseExperienceLogoTrayInGameInfoList then nil else v168
	t5.isPlayable = if not FFlagLuaAppHideEdpStoreForUnplayable then nil else p22.PlayabilityStatus and (p22.PlayabilityStatus[p23.universeId] and p22.PlayabilityStatus[p23.universeId].isPlayable)

	return t5
end, function(p24) -- line: 928
	-- upvalues: ApiFetchGamePasses (copy), FFlagLuaAppUseExperienceLogoTrayInGameInfoList (copy), OpenCentralOverlayForLeaveRobloxAlert (copy), CloseCentralOverlay (copy)
	return {
		fetchGamePasses = function(p25, p26) --[[ fetchGamePasses ]] -- line: 930
			-- upvalues: p24 (copy), ApiFetchGamePasses (copy)
			return p24(ApiFetchGamePasses(p25, p26))
		end,
		openLeaveRobloxAlertUIBlox = if not FFlagLuaAppUseExperienceLogoTrayInGameInfoList then nil else function(p27) -- line: 934
			-- upvalues: p24 (copy), OpenCentralOverlayForLeaveRobloxAlert (copy)
			p24(OpenCentralOverlayForLeaveRobloxAlert(p27))
		end,
		closeAlert = if not FFlagLuaAppUseExperienceLogoTrayInGameInfoList then nil else function() -- line: 939
			-- upvalues: p24 (copy), CloseCentralOverlay (copy)
			p24(CloseCentralOverlay())
		end
	}
end)(v64)
local v68 = RoactAppExperiment.connectUserLayer({
	AppUserLayers.EDPCommunityLinksLayer,
	EnableCommunityProfilePageIXP.EnableCommunityProfilePageExperimentLayer
}, function(p28) -- line: 949
	-- upvalues: AppUserLayers (copy), EnableCommunityProfilePageIXP (copy)
	local v180 = (p28[AppUserLayers.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {}
	local v181 = if not EnableCommunityProfilePageIXP.FFlagIsSetupEnabled then nil else EnableCommunityProfilePageIXP.isFeatureActive(p28)

	return {
		communityLinksEnabled = v180.inTreatment,
		communityLinkVariant = v180.linkVariant,
		communityProfilePageEnabled = if not EnableCommunityProfilePageIXP.FFlagIsSetupEnabled then nil else v181
	}
end, false)(v67)
local v69 = RoactAppPolicy.connect(function(p29, _) -- line: 965
	return {
		enableGroupLinks = p29.getSocialGroupLinks(),
		showBadgesRow = p29.getGameInfoShowBadges(),
		showCreatedRow = p29.getGameInfoShowCreated(),
		showDeveloperRow = p29.getGameInfoListDeveloper(),
		showRNVDeveloper = p29.getGameInfoListShowRNVDeveloper(),
		showGamepassesRow = p29.getGameInfoShowGamepasses(),
		showGenreRow = p29.getGameInfoShowGenre(),
		showSubgenreRow = p29.getGameInfoShowSubgenre(),
		showMaxPlayersRow = p29.getGameInfoShowMaxPlayers(),
		showServersRow = p29.getGameInfoShowServers(),
		showUpdatedRow = p29.getGameInfoShowUpdated()
	}
end)(v68)
local u70 = RoactServices.connect({
	localization = RoactLocalization,
	networking = RoactNetworking,
	eventIngest = AppEventIngestService,
	linking = if not FFlagLuaAppUseExperienceLogoTrayInGameInfoList then nil else AppLinking
})(v69)

return function(p31) -- line: 987
	-- upvalues: useTextSizeOffset (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), useEdpServerIxpVariables (copy), Cryo (copy), ExperienceDetailsExperimentation (copy), Roact (copy), u70 (ref)
	local v185 = useTextSizeOffset()
	local v186 = nil

	if FFlagLuaAppEdpBackendV2SduiInterleaveDefault or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		v186 = useEdpServerIxpVariables()
	end

	local v187 = Cryo.Dictionary.join(p31, {
		textSizeOffset = v185,
		edpServerIxpVariables = if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and (not FFlagLuaAppEdpBackendV2SduiInterleaveIxp or not ExperienceDetailsExperimentation.getShouldInterleaveSdui()) then nil else v186
	})

	return Roact.createElement(u70, v187)
end
