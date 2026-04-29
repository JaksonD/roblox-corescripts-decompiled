local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local getFirstFocusableDescendant = require(CorePackages.Workspace.Packages.FocusNavigationUtils).getFirstFocusableDescendant
local getSafeAreaSize = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local React = require(CorePackages.Packages.React)
local useUserExperiment = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment

require(CorePackages.Workspace.Packages.PlayabilityRodux)

local PlayabilityStatusEnum = require(CorePackages.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local PlayButtonStates = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonStates
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local RoactNavigation = require(CorePackages.Packages.RoactNavigation)
local usePlayWithRewardData = require(CorePackages.Workspace.Packages.PlayWithRewardComponent).usePlayWithRewardData
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ExperienceDetailsExperimentation = require(script.Parent.ExperienceDetailsExperimentation)
local RobloxAppHooks = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local useUiModeInfo = RobloxAppHooks.useUiModeInfo
local useDeviceType = RobloxAppHooks.useDeviceType
local useRoactService = RobloxAppHooks.useRoactService
local useAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppEventIngestService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppEventIngestService
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local hasPageInCurrentRoute = require(CorePackages.Workspace.Packages.DiscoveryRouting).hasPageInCurrentRoute
local selectCurrentLegacyRoute = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors.selectCurrentLegacyRoute
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local GameDetailsEvents = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents
local Follow = GameDetailsEvents.Follow
local MediaGalleryActivated = GameDetailsEvents.MediaGalleryActivated
local MediaGalleryMediaChanged = GameDetailsEvents.MediaGalleryMediaChanged
local MediaGalleryEnterFullscreen = GameDetailsEvents.MediaGalleryEnterFullscreen
local MediaGalleryExitFullscreen = GameDetailsEvents.MediaGalleryExitFullscreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local useExperienceDetailsState = require(script.Parent.useExperienceDetailsState)
local useExperienceDetailsFetches = require(script.Parent.useExperienceDetailsFetches)
local useExperienceDetailsDesignTokens = require(script.Parent.Hooks.useExperienceDetailsDesignTokens)
local useExperienceDetailsNavigation = require(script.Parent.useExperienceDetailsNavigation)
local useExperienceDetailsFocusNavigationBindings = require(script.Parent.useExperienceDetailsFocusNavigationBindings)
local useExperienceDetailsConfiguration = require(script.Parent.useExperienceDetailsConfiguration)
local ExperienceDetailsPage = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsPage)
local LaunchExperienceConnector = require(Modules.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector)
local SendGameFollow = require(Modules.LuaApp.Thunks.SendGameFollow)
local GetFFlagRemoveVerifiedBadgeReducer = require(Modules.LuaApp.Flags.GetFFlagRemoveVerifiedBadgeReducer)
local GetFFlagLuaAppLaunchConnectorFix = require(Modules.LuaApp.Flags.GetFFlagLuaAppLaunchConnectorFix)
local GetFFlagEnableBigGameIconInDetailsPage = require(Modules.LuaApp.Flags.GetFFlagEnableBigGameIconInDetailsPage)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp
local FFlagLuaAppEdpBackendV2SduiInterleaveDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault
local GetNotificationsExperienceDetailsVariant = require(CorePackages.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local GetFFlagNotificationsForceEnableEDPDiscoverability = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability
local FFlagLuaAppDesktopMediaGalleryTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry
local FFlagLuaAppEdpFixDefaultBanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpFixDefaultBanner
local FFlagLuaAppEdpMediaGalleryRedesignIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignIxp
local FFlagLuaAppEdpMediaGalleryVideoPreviewIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreviewIxp
local FFlagSongEdpCarouselIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp
local FFlagEnableCreatorSubtitleNavigation = require(Modules.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation)
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppUnifyPlayButtonNonMobileEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonNonMobileEdp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local FFlagLuaAppAddIgrsRatingToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddIgrsRatingToEdp
local FFlagExtendScrollingFramesBySafeInsets = require(CorePackages.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets
local FFlagEnablePlayWithRewardNonPeekviewEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePlayWithRewardNonPeekviewEdp

return (LaunchExperienceConnector.connect(function(p1) -- line: 587
	return {
		universeId = p1.universeId,
		launchSource = "ExperienceDetailsPage",
		referralSource = p1.referralSource,
		extraParams = if not p1.experienceJoinData then nil else p1.experienceJoinData,
		placeId = p1.placeIdOverride
	}
end, function(p2, _) -- line: 595
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy)
	return {
		playabilityStatus = p2.playabilityStatus,
		playButtonState = p2.playButtonState,
		onPlayButtonActivated = p2.onPlayButtonActivated,
		onPlaySquadButtonActivated = if not FFlagLuaAppEnablePlaySquadButton then nil else p2.onPlaySquadButtonActivated,
		playButtonContextualMessage = p2.playButtonContextualMessage
	}
end)(function(t1: {[any]: any}) --[[ ExperienceDetailsContainer ]] -- line: 120
	-- upvalues: useAppPolicy (copy), useRoactService (copy), RoactNetworking (copy), AppLinking (copy), AppEventIngestService (copy), AppSessionService (copy), useSelector (copy), selectCurrentLegacyRoute (copy), FFlagEnablePlayWithRewardNonPeekviewEdp (copy), PlayabilityStatusEnum (copy), PlayButtonStates (copy), React (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ExperienceDetailsExperimentation (copy), FFlagLuaAppEdpBackendV2SduiInterleaveIxp (copy), IXPService (copy), AppUserLayers (copy), useExperienceDetailsState (copy), useExperienceDetailsNavigation (copy), useExperienceDetailsFetches (copy), FFlagLuaAppEdpBackendV2SduiInterleaveDefault (copy), useDispatch (copy), useDeviceType (copy), GetFFlagEnableBigGameIconInDetailsPage (copy), GetFFlagLuaAppLaunchConnectorFix (copy), useUiModeInfo (copy), useUserExperiment (copy), GetFFlagNotificationsForceEnableEDPDiscoverability (copy), GetNotificationsExperienceDetailsVariant (copy), FFlagSongEdpCarouselIxp (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), usePlayWithRewardData (copy), RetrievalStatus (copy), SendGameFollow (copy), Follow (copy), FFlagLuaAppDesktopMediaGalleryTelemetry (copy), FFlagLuaAppEdpMediaGalleryRedesignTelemetry (copy), MediaGalleryActivated (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), MediaGalleryMediaChanged (copy), MediaGalleryEnterFullscreen (copy), MediaGalleryExitFullscreen (copy), hasPageInCurrentRoute (copy), AppPage (copy), SessionType (copy), GuiService (copy), getSafeAreaSize (copy), GetFFlagRemoveVerifiedBadgeReducer (copy), useExperienceDetailsConfiguration (copy), useExperienceDetailsDesignTokens (copy), getFirstFocusableDescendant (copy), useExperienceDetailsFocusNavigationBindings (copy), FFlagExtendScrollingFramesBySafeInsets (copy), ExperienceDetailsPage (copy), FFlagLuaAppUnifyPlayButtonNonMobileEdp (copy), FFlagLuaAppEdpFixDefaultBanner (copy), FFlagEnableCreatorSubtitleNavigation (copy), FFlagLuaAppEnablePlaySquadButton (copy), FFlagLuaAppAddIgrsRatingToEdp (copy), RoactNavigation (copy)
	local v69 = useAppPolicy(function(p4) -- line: 122
		return {
			roundedCorners = p4.getUseRoundedCorners(),
			webViewSupport = p4.getWebViewSupport(),
			notificationsCanEnableExperience = p4.getNotificationsCanReceiveExperience(),
			experienceDetailsNoticeType = p4.getExperienceDetailsNoticeType()
		}
	end)
	local v70 = useRoactService(RoactNetworking)
	local v71 = useRoactService(AppLinking)
	local v72 = useRoactService(AppEventIngestService)
	local v73 = useRoactService(AppSessionService)
	local v74 = useSelector(function(p5) -- line: 138
		return {
			screenSize = p5.ScreenSize,
			globalGuiInset = p5.GlobalGuiInset
		}
	end)
	local v75 = useSelector(selectCurrentLegacyRoute)
	local v76 = nil
	local v77 = nil
	local u78 = nil

	if FFlagEnablePlayWithRewardNonPeekviewEdp then
		v76 = t1.playabilityStatus ~= nil and (t1.playabilityStatus.playabilityStatus == PlayabilityStatusEnum.Playable and t1.playButtonState == PlayButtonStates.Playable)

		local v79

		v77, v79 = React.useState(false)
		u78 = v79
	end

	local v80 = nil

	if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then
		v80 = ExperienceDetailsExperimentation.getShouldHydrateLegacy()
	end

	local v81 = nil

	if FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		v81 = ExperienceDetailsExperimentation.getShouldInterleaveSdui()
	end

	if FFlagLuaAppEdpBackendV2HydrateLegacyIxp or FFlagLuaAppEdpBackendV2SduiInterleaveIxp then
		React.useEffect(function() -- line: 165
			-- upvalues: IXPService (copy), AppUserLayers (copy)
			IXPService:LogUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
		end, {})
	end

	local v82 = useExperienceDetailsState(t1, if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else v80)
	local v83 = useExperienceDetailsNavigation(if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else v80)
	local v84 = useExperienceDetailsFetches(if not FFlagLuaAppEdpBackendV2SduiInterleaveDefault and not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else t1.universeId, if not FFlagLuaAppEdpBackendV2HydrateLegacyIxp then nil else v80, if not FFlagLuaAppEdpBackendV2SduiInterleaveIxp then nil else v81)
	local v85 = useDispatch()
	local v86 = useDeviceType()
	local u88

	if GetFFlagEnableBigGameIconInDetailsPage() and GetFFlagLuaAppLaunchConnectorFix() then
		local v87 = useUiModeInfo()

		u88 = React.useCallback(function() -- line: 194
			-- upvalues: v84 (copy), v70 (copy), t1 (copy), v87 (copy)
			return v84.fetchGameDetailsPageData(v70, t1.universeId, v87)
		end, {
			v70,
			t1.universeId,
			v87
		})
	else
		u88 = React.useCallback(function() -- line: 198
			-- upvalues: v84 (copy), v70 (copy), t1 (copy)
			return v84.fetchGameDetailsPageData(v70, t1.universeId, nil)
		end, {
			v70,
			t1.universeId
		})
	end

	local v89 = useUserExperiment({ AppUserLayers.EDPCommunityLinksLayer }, function(p6) -- line: 205
		-- upvalues: AppUserLayers (copy)
		return (p6[AppUserLayers.EDPCommunityLinksLayer] or {}).communityLinkDisplayConfig or {}
	end, false)
	local v90 = not not GetFFlagNotificationsForceEnableEDPDiscoverability() or useUserExperiment({ AppUserLayers.ExperienceDetailsPageLayer }, function(p7) -- line: 214
		-- upvalues: AppUserLayers (copy), GetNotificationsExperienceDetailsVariant (copy)
		return ((p7[AppUserLayers.ExperienceDetailsPageLayer] or {})[GetNotificationsExperienceDetailsVariant.getNotificationsVariantFieldName] or -1) == 2
	end, true)
	local v91 = nil

	if FFlagSongEdpCarouselIxp then
		v91 = useUserExperiment({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p8) -- line: 225
			-- upvalues: AppUserLayers (copy)
			return (p8[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}).showSongCarousel
		end, true)
	end

	local v92 = nil
	local v93 = nil

	if FFlagLuaAppEdpMediaGalleryRedesignIxp or FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then
		v92, v93 = useUserExperiment({ AppUserLayers.ExperienceDetailsPageExposureLayer }, function(p9) -- line: 237
			-- upvalues: AppUserLayers (copy), FFlagLuaAppEdpMediaGalleryRedesignIxp (copy), FFlagLuaAppEdpMediaGalleryVideoPreviewIxp (copy)
			local v129 = p9[AppUserLayers.ExperienceDetailsPageExposureLayer] or {}
			local v130 = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else v129.MediaGalleryRedesignEnabled

			if FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then
				return v130, v129.MediaGalleryVideoPreviewEnabled
			end

			return v130, nil
		end, true)
	end

	local v94 = nil
	local v95 = nil

	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v94, v95 = useUserExperiment({ AppUserLayers.PlayButtonUXExposureLayer }, function(p10) -- line: 250
			-- upvalues: AppUserLayers (copy)
			local v132 = p10[AppUserLayers.PlayButtonUXExposureLayer] or {}

			return v132.HasUnifiedPlayButton, v132.UnifyToUIBlox
		end, true)
	end

	React.useEffect(function() -- line: 258
		-- upvalues: u88 (ref)
		u88()
	end, { t1.universeId })

	local playWithRewardData = nil
	local showPlayWithReward = nil

	if FFlagEnablePlayWithRewardNonPeekviewEdp then
		local v98 = React.useCallback(function() -- line: 264
			-- upvalues: u78 (ref)
			u78(false)
		end, {})
		local v99 = usePlayWithRewardData({
			universeId = t1.universeId,
			shouldFetch = v77 and v82.gameDetailsPageDataStatus == RetrievalStatus.Done,
			onFetchDispatched = v98
		})

		playWithRewardData = v99.playWithRewardData
		showPlayWithReward = v99.showPlayWithReward
	end

	local v100 = React.useCallback(function(p11, p12) -- line: 277
		-- upvalues: v82 (copy), v85 (copy), SendGameFollow (copy), v70 (copy), v90 (copy), Follow (copy), v72 (copy)
		local v135 = v82.gameDetail and v82.gameDetail.rootPlaceId or v82.gameInfo and v82.gameInfo.placeId

		if v135 == nil or p11 == nil then
			return
		end

		local v136 = v82.notificationsEnabled and v82.notificationsEnabled.count or 0
		local v137 = v82.notificationsEnabled and v82.notificationsEnabled.limit or 0

		v85(SendGameFollow(v70, p11, p12, v90, v136, v137))
		Follow(v72, "ExperienceDetailsActionBar", v135, not p12)
	end, {
		v85,
		v70,
		v72,
		t1.universeId,
		v82
	})
	local v101 = nil
	local v102 = nil

	if FFlagLuaAppDesktopMediaGalleryTelemetry and not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then
		v101 = React.useCallback(function(p13) -- line: 307
			-- upvalues: v82 (copy), MediaGalleryActivated (copy), v72 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), t1 (copy)
			local v139 = v82.gameDetail and v82.gameDetail.rootPlaceId or v82.gameInfo and v82.gameInfo.placeId

			if v139 then
				MediaGalleryActivated(v72, "ExperienceDetailsPage", v139, {
					selectedIndex = p13,
					universeId = if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
				})
			end
		end, {
			v72,
			v82,
			if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
		})
		v102 = React.useCallback(function(p14, p15) -- line: 326
			-- upvalues: v82 (copy), MediaGalleryMediaChanged (copy), v72 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), t1 (copy)
			local v142 = v82.gameDetail and v82.gameDetail.rootPlaceId or v82.gameInfo and v82.gameInfo.placeId

			if v142 and p14 ~= p15 then
				MediaGalleryMediaChanged(v72, "ExperienceDetailsPage", v142, {
					previousIndex = p14,
					selectedIndex = p15,
					universeId = if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
				})
			end
		end, {
			v72,
			v82,
			if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
		})
	end

	local v103 = nil
	local v104 = nil
	local v105 = nil

	if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then
		v103 = React.useCallback(function(p16, p17, p18, p19) -- line: 352
			-- upvalues: v82 (copy), MediaGalleryMediaChanged (copy), v72 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), t1 (copy)
			local v147 = v82.gameDetail and v82.gameDetail.rootPlaceId or v82.gameInfo and v82.gameInfo.placeId

			if v147 then
				MediaGalleryMediaChanged(v72, "ExperienceDetailsPage", v147, {
					imageAssetId = p16,
					videoAssetId = p17,
					isYouTubeVideo = p18,
					autoAdvance = p19,
					universeId = if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
				})
			end
		end, {
			v72,
			v82,
			if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
		})
		v104 = React.useCallback(function(p20, p21) -- line: 374
			-- upvalues: v82 (copy), MediaGalleryEnterFullscreen (copy), v72 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), t1 (copy)
			local v150 = v82.gameDetail and v82.gameDetail.rootPlaceId or v82.gameInfo and v82.gameInfo.placeId

			if v150 then
				MediaGalleryEnterFullscreen(v72, "ExperienceDetailsPage", v150, {
					selectedIndex = p20,
					isVideo = p21,
					universeId = if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
				})
			end
		end, {
			v72,
			v82,
			if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
		})
		v105 = React.useCallback(function(p22, p23) -- line: 394
			-- upvalues: v82 (copy), MediaGalleryExitFullscreen (copy), v72 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), t1 (copy)
			local v153 = v82.gameDetail and v82.gameDetail.rootPlaceId or v82.gameInfo and v82.gameInfo.placeId

			if v153 then
				MediaGalleryExitFullscreen(v72, "ExperienceDetailsPage", v153, {
					selectedIndex = p22,
					isVideo = p23,
					universeId = if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
				})
			end
		end, {
			v72,
			v82,
			if not FFlagLuaAppAddUniverseIdToGameDetailsEvents then nil else t1.universeId
		})
	end

	local v106 = React.useCallback(function() -- line: 414
		-- upvalues: v83 (copy), hasPageInCurrentRoute (copy), v75 (copy), AppPage (copy), v73 (copy), SessionType (copy)
		v83.navigateBack()

		if not hasPageInCurrentRoute(v75, AppPage.GameDetail, true) and not hasPageInCurrentRoute(v75, AppPage.ExperienceDetail, true) then
			v73:RemoveSession(SessionType.StructuralIdentifier.GameDetailSource)
		end
	end, {
		v83,
		v75
	})
	local screenSize = v74.screenSize
	local SafeZoneOffsets = GuiService:GetSafeZoneOffsets()
	local YOffset = getSafeAreaSize(screenSize, SafeZoneOffsets).Y.Offset
	local uDim2 = UDim2.new(1, 0, 1, 0)

	if v69.roundedCorners then
		uDim2 = UDim2.new(1, 0, 1, 0)
	end

	local v111 = v82.gameDetail and v82.gameDetail.creator
	local v112 = if not GetFFlagRemoveVerifiedBadgeReducer() then v82.creatorVerified else v111 and v111.hasVerifiedBadge
	local v113 = useExperienceDetailsConfiguration()
	local v114 = useExperienceDetailsDesignTokens()
	local v115 = React.useRef(nil)
	local v116 = React.useCallback(function() -- line: 450
		-- upvalues: v115 (copy), GuiService (copy), getFirstFocusableDescendant (copy)
		if v115.current then
			GuiService.SelectedCoreObject = getFirstFocusableDescendant(v115.current)
		end
	end, {})
	local v117 = React.useCallback(function(_) -- line: 460
		-- upvalues: t1 (copy)
		t1.onPlayButtonActivated()
	end, { t1.onPlayButtonActivated })
	local v118, v119 = useExperienceDetailsFocusNavigationBindings(v117, v116)

	return React.createElement("Frame", {
		ref = v118,
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, SafeZoneOffsets.top),
		Size = uDim2,
		BackgroundTransparency = 1,
		ClipsDescendants = not FFlagExtendScrollingFramesBySafeInsets
	}, {
		ExperienceDetailsPage = React.createElement(t1.ExperienceDetailsPage or ExperienceDetailsPage, {
			universeId = t1.universeId,
			referralSource = t1.referralSource,
			experienceJoinData = if not FFlagLuaAppUnifyPlayButtonNonMobileEdp and not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else t1.experienceJoinData,
			placeIdOverride = t1.placeIdOverride,
			onClose = v106,
			statsAndInfoRef = v115,
			thumbnail = v82.thumbnail,
			bannerImageId = v82.bannerImageId,
			defaultBannerUrl = if not FFlagLuaAppEdpFixDefaultBanner then nil else v82.defaultBannerUrl,
			gameInfo = v82.gameInfo,
			gameDetail = v82.gameDetail,
			gameDetailError = v82.gameDetailError,
			creatorVerified = v112,
			gameDetailsPageDataStatus = v82.gameDetailsPageDataStatus,
			gameProductInfo = v82.gameProductInfo,
			socialLinks = v82.socialLinks,
			ageRecommendations = v82.ageRecommendations,
			communityLink = v82.communityLink,
			communityLinksEnabled = v89.inTreatment,
			communityLinkVariant = v89.linkVariant,
			gameFollowings = v82.gameFollowings,
			enableNotificationsDiscoverability = v90,
			mediaGalleryRedesignEnabledIxp = if not FFlagLuaAppEdpMediaGalleryRedesignIxp then nil else v92,
			mediaGalleryVideoPreviewEnabledIxp = if not FFlagLuaAppEdpMediaGalleryVideoPreviewIxp then nil else v93,
			showSongCarousel = if not FFlagSongEdpCarouselIxp then nil else v91,
			hasUnifiedPlayButtonIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else v94,
			unifyToUIBloxIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else v95,
			fetchGameDetailsPageData = u88,
			openLeaveRobloxAlertUIBlox = v83.openLeaveRobloxAlertUIBlox,
			openVerifiedBadgeModal = v83.openVerifiedBadgeModal,
			closeAlert = v83.closeAlert,
			openMoreContextualMenu = v83.openMoreContextualMenu,
			openShareContextualMenu = v83.openShareContextualMenu,
			openCreatorPage = if not FFlagEnableCreatorSubtitleNavigation then v83.openCreatorPage else nil,
			openCommunityProfilePage = if not FFlagEnableCreatorSubtitleNavigation then nil else v83.openCommunityProfilePage,
			openUserProfilePage = if not FFlagEnableCreatorSubtitleNavigation then nil else v83.openUserProfilePage,
			openExperienceGuidelinesExplained = v83.openExperienceGuidelinesExplained,
			setControllerBarNavigation = v119,
			playabilityStatus = t1.playabilityStatus,
			playButtonState = t1.playButtonState,
			onPlayButtonActivated = t1.onPlayButtonActivated,
			onPlaySquadButtonActivated = if not FFlagLuaAppEnablePlaySquadButton then nil else t1.onPlaySquadButtonActivated,
			playButtonContextualMessage = t1.playButtonContextualMessage,
			toggleFollowExperience = if not v90 then nil else v100,
			onMediaGalleryPreviewActivated = if not FFlagLuaAppDesktopMediaGalleryTelemetry or FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else v101,
			onMediaGalleryThumbnailActivated = if not FFlagLuaAppDesktopMediaGalleryTelemetry or FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else v102,
			onMediaGalleryMediaChanged = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else v103,
			onMediaGalleryEnterFullscreen = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else v104,
			onMediaGalleryExitFullscreen = if not FFlagLuaAppEdpMediaGalleryRedesignTelemetry then nil else v105,
			openRefundPolicyLearnMorePage = v83.openRefundPolicyLearnMorePage,
			openWebview = if not FFlagLuaAppAddIgrsRatingToEdp then nil else v83.openWebview,
			linking = v71,
			deviceType = v86,
			viewHeight = YOffset,
			detailsPageConfiguration = v113,
			tokens = v114,
			webViewSupport = v69.webViewSupport,
			notificationsCanEnableExperience = v69.notificationsCanEnableExperience,
			experienceDetailsNoticeType = v69.experienceDetailsNoticeType,
			playWithRewardData = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else playWithRewardData,
			showPlayWithReward = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else showPlayWithReward,
			isPlayable = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else v76
		}),
		NavigationEvents = if not FFlagEnablePlayWithRewardNonPeekviewEdp then nil else React.createElement(RoactNavigation.NavigationEvents, {
			onDidFocus = function() --[[ onDidFocus ]] -- line: 579
				-- upvalues: u78 (ref)
				u78(true)
			end
		})
	})
end))
