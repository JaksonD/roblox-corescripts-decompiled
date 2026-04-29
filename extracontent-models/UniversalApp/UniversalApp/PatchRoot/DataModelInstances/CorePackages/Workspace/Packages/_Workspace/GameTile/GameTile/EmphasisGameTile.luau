local GameTile = script:FindFirstAncestor("GameTile")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local GameTileView = require(GameTile.GameTileView)
local getGameTileLayoutData = require(GameTile.getGameTileLayoutData)

require(GameTile.GameTileTypes)

local formatExperienceThumbnail = require(GameTile.formatExperienceThumbnail)
local GameStats = require(GameTile.Footer.GameStats)
local GameTileConstants = require(GameTile.GameTileConstants)
local GameTileViewConfig = require(GameTile.GameTileViewConfig)
local CreatorNameMetadata = require(GameTile.Footer.CreatorNameMetadata)
local AppExperienceActionRow = require(GameTile.AppExperienceActionRow)
local useIsHoveredTile = require(GameTile.useIsHoveredTile)
local GridTileTextFooter = require(GameTile.Footer.GridTileTextFooter)
local ItemLayoutDataParsingUtils = require(GameTile.ItemLayoutDataParsingUtils)
local HoverTileCoordinator = require(GameTile.HoverTileCoordinator)
local getTileBadgeByPositionConfigFromEntry = require(GameTile.getTileBadgeByPositionConfigFromEntry)
local GameTileParent = GameTile.Parent
local GameCollectionItemTypes = require(GameTileParent.DiscoveryTypes).GameCollectionItemTypes
local React = require(GameTileParent.React)
local RoactUtils = require(GameTileParent.RoactUtils)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local GameInfosReducer = require(GameTileParent.GameInfosRodux).GameInfosReducer
local BigGameIconReducer = require(GameTileParent.GameIconRodux).BigGameIcons.BigGameIconReducer
local ApiFetchGameDetails = require(GameTileParent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local RoactNetworking = require(GameTileParent.RoactServiceTags).RoactNetworking
local useRoactService = require(GameTileParent.RobloxAppHooks).useRoactService
local ImpressionsTagUtility = require(GameTileParent.Impressions).ImpressionsTagUtility
local useTokens = require(GameTileParent.Foundation).Hooks.useTokens
local useDesignTokens = require(GameTileParent.Style).useDesignTokens
local IsVRAppBuild = require(GameTileParent.AppCommonLib).IsVRAppBuild
local sponsoredGamesRecordClick = require(GameTileParent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local useTagAsViewportAutoplayCandidate = require(GameTileParent.VideoUtils).useTagAsViewportAutoplayCandidate
local GameTileThumbnailBadges = require(GameTile.Overlays.GameTileThumbnailBadges)
local v34 = game:DefineFastFlag("WrapEmphasisTileDescriptionText", false)
local FFlagLuaAppTwoByOneTileTelemetryFix = require(GameTileParent.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix
local FFlagLuaAppGameTileLockedBadge = require(GameTileParent.SharedFlags).FFlagLuaAppGameTileLockedBadge
local v37 = game:DefineFastFlag("LuaAppFixEmphasisHoverLogic", false)
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(GameTileParent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppSupportPrimaryMediaContentMetadata = require(GameTileParent.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata
local FFlagLuaAppHomeTouchAutoplay = require(GameTileParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppTileVideoCandidateOnly = require(GameTileParent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly

return function(t1: {[any]: any}) -- line: 92
	-- upvalues: useDesignTokens (copy), useTokens (copy), useSelector (copy), GameInfosReducer (copy), useRoactService (copy), RoactNetworking (copy), useDispatch (copy), React (copy), ApiFetchGameDetails (copy), getGameTileLayoutData (copy), FFlagLuaAppSupportPrimaryMediaContentMetadata (copy), ItemLayoutDataParsingUtils (copy), formatExperienceThumbnail (copy), BigGameIconReducer (copy), GameTileViewConfig (copy), v37 (copy), IsVRAppBuild (copy), useIsHoveredTile (copy), HoverTileCoordinator (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy), AppExperienceActionRow (copy), GridTileTextFooter (copy), CreatorNameMetadata (copy), GameStats (copy), GameTileConstants (copy), v34 (copy), ImpressionsTagUtility (copy), FFlagLuaAppHomeTouchAutoplay (copy), useTagAsViewportAutoplayCandidate (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppGameTileLockedBadge (copy), getTileBadgeByPositionConfigFromEntry (copy), GameTileThumbnailBadges (copy), GameTileView (copy), UserGameSettings (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy)
	local v43 = useDesignTokens()
	local v44 = useTokens()
	local universeId = t1.entry.universeId
	local v46 = useSelector(function(p1) -- line: 100
		-- upvalues: GameInfosReducer (copy), universeId (copy)
		return p1.Personalization[GameInfosReducer.key][universeId]
	end)
	local v47 = useSelector(function(p2) -- line: 103
		-- upvalues: universeId (copy)
		return p2.GameDetails[universeId]
	end)
	local v48 = useRoactService(RoactNetworking)
	local v49 = useDispatch()

	React.useEffect(function() -- line: 109
		-- upvalues: v47 (copy), v49 (copy), ApiFetchGameDetails (copy), v48 (copy), universeId (copy)
		if v47 then
			return
		end

		v49(ApiFetchGameDetails.Fetch(v48, { universeId }))
	end, {
		v47,
		universeId,
		v48,
		v49
	})

	local v50 = getGameTileLayoutData(v46, t1.topicId)
	local v51 = t1.gameTileLayoutType or "Narrow"
	local v52 = v51 == "Wide" or v51 == "Event"
	local v53 = ((if not FFlagLuaAppSupportPrimaryMediaContentMetadata or not t1.entry.primaryWideImageAssetId then ItemLayoutDataParsingUtils.getWideImageAssetId(v50) else t1.entry.primaryWideImageAssetId)) or (v46 and v46.primaryWideAssetId or nil)
	local v54 = formatExperienceThumbnail(v53, t1.entry.placeId, true)
	local v55 = useSelector(function(p3) -- line: 131
		-- upvalues: BigGameIconReducer (copy), universeId (copy)
		return p3[BigGameIconReducer.key][universeId] and p3[BigGameIconReducer.key][universeId].url or ""
	end)
	local v56 = GameTileViewConfig.getImageAspectRatio(v51)
	local v57 = v50 and v50.title or (v46 and v46.name or "")
	local v58 = nil
	local u59 = nil

	if v37 then
		local v60 = not IsVRAppBuild() and (not not t1.useHoverTile and (t1.impressionsTag ~= nil or false))

		v58 = React.useRef(nil)

		local v61 = `{ t1.impressionsTag or "" }_{ t1.index }_{ v51 }`

		u59 = useIsHoveredTile(v58, v61, v60)
	end

	local v62 = React.useCallback(function() -- line: 154
		-- upvalues: v37 (copy), u59 (ref), HoverTileCoordinator (copy), t1 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy), universeId (copy), sponsoredGamesRecordClick (copy), v48 (copy)
		if v37 and u59 then
			HoverTileCoordinator.default:reset()
		end

		local t2 = {
			source = t1.source,
			index = t1.index,
			referralSource = t1.referralSource,
			onPeekViewClosed = t1.onPeekViewClosed,
			experienceJoinData = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else {
				tileType = t1.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.EmphasisTile,
				nativeAdData = t1.entry.adId
			}
		}

		t1.navigateToGameDetails(universeId, t2)
		t1.reportGameDetailOpened(t1.index, universeId)

		if t1.entry.isSponsored then
			sponsoredGamesRecordClick(v48, t1.entry.adId)
		end
	end, {
		universeId,
		t1.source,
		t1.onPeekViewClosed,
		t1.entry.isSponsored,
		t1.entry.adId,
		t1.reportGameDetailOpened,
		v48,
		t1.navigateToGameDetails,
		t1.referralSource,
		t1.index,
		if not v37 then nil else u59
	})

	if not v37 then
		local v63 = not IsVRAppBuild() and (not not t1.useHoverTile and (t1.impressionsTag ~= nil or false))

		v58 = React.useRef(nil)

		local v64 = `{ t1.impressionsTag or "" }_{ t1.index }_{ v51 }`

		u59 = useIsHoveredTile(v58, v64, v63)
	end

	local v65 = t1.showDescription or false
	local v66 = v46 and v46.totalUpVotes or 0
	local v67 = v46 and v46.totalDownVotes or 0
	local v68 = v47 and (v47.creator and v47.creator.hasVerifiedBadge)
	local v69 = v47 and v47.description or ""
	local v70 = v47 and v47.licenseDescription or nil
	local v71 = v47 and v47.localizedFiatPrice or nil
	local v72 = v70 or v71
	local v73 = t1.hideGameStats or (v65 or v72 ~= nil)
	local v74 = v46 and (v46.creatorName ~= "" and v46.creatorName) or v47 and (v47.creator and v47.creator.name)
	local v75 = not v72 and 3 or 2
	local v76 = React.useMemo(function() -- line: 228
		-- upvalues: v74 (copy), v65 (copy), v75 (copy), v73 (copy), v72 (copy)
		local n1 = 0

		if v74 and v74 ~= "" then
			n1 += 1
		end

		if v65 then
			n1 += v75
		end

		if not v73 then
			n1 += 1
		end

		if v72 then
			n1 += 1
		end

		return n1
	end, {
		v74,
		v65,
		v73,
		v72,
		v75
	})
	local v77 = t1.isContained or false
	local playButtonHeight = GameTileViewConfig.getElementSizes(v43, t1.textSizeOffset, 1, v44, true, v76).playButtonHeight
	local v79 = if not v37 then nil else React.useCallback(function(...) -- line: 262
		-- upvalues: u59 (ref), HoverTileCoordinator (copy), t1 (copy)
		if u59 then
			HoverTileCoordinator.default:reset()
		end

		if t1.reportExperienceLaunched then
			t1.reportExperienceLaunched(...)
		end
	end, {
		u59,
		t1.reportExperienceLaunched
	})
	local v80 = React.useMemo(function() -- line: 274
		-- upvalues: React (copy), AppExperienceActionRow (copy), universeId (copy), t1 (copy), v37 (copy), v79 (copy), v62 (copy), v56 (copy), playButtonHeight (copy)
		return React.createElement(AppExperienceActionRow, {
			universeId = universeId,
			referralSource = t1.referralSource,
			launchSource = "FeaturedSearchTile",
			reportExperienceLaunched = if not v37 then t1.reportExperienceLaunched else v79,
			openGameDetails = v62,
			entry = t1.entry,
			launchExperienceEventContext = t1.launchExperienceEventContext,
			showButtonText = v56 > 1,
			horizontalPadding = 0,
			verticalPadding = 0,
			height = playButtonHeight,
			index = t1.index,
			isUnifiedGameTileEnabled = true
		})
	end, {
		universeId,
		t1.referralSource,
		if not v37 then t1.reportExperienceLaunched else v79,
		v62,
		t1.entry,
		t1.launchExperienceEventContext,
		playButtonHeight,
		t1.index,
		v56
	})
	local v81 = React.useMemo(function() -- line: 307
		-- upvalues: React (copy), v72 (copy), GridTileTextFooter (copy), CreatorNameMetadata (copy), v74 (copy), v68 (copy), GameStats (copy), v66 (copy), v67 (copy), t1 (copy), GameTileConstants (copy), v52 (copy), v73 (copy), v51 (copy), v65 (copy), v69 (copy), v75 (copy), v34 (copy)
		return React.createElement(React.Fragment, {}, {
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if not v72 then nil else React.createElement(GridTileTextFooter, {
				text = v72,
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true
			}),
			CreatorName = React.createElement(CreatorNameMetadata, {
				name = v74,
				hasVerifiedBadge = v68,
				LayoutOrder = 2
			}),
			GameStats = React.createElement(GameStats, {
				stats = {
					totalUpVotes = v66,
					totalDownVotes = v67,
					playerCount = if t1.playerCountStyle ~= GameTileConstants.PlayerCountStyleValues.Footer then nil else t1.entry.playerCount
				},
				isGridTile = v52,
				hideGameStats = v73,
				gameTileLayoutType = v51,
				LayoutOrder = 3,
				useLargerFont = true,
				isUnifiedGameTile = true
			}),
			Description = if not v65 then nil else React.createElement(GridTileTextFooter, {
				text = v69,
				LayoutOrder = 4,
				linesOfText = v75,
				useLargerFont = true,
				isUnifiedGameTile = true,
				TextYAlignment = Enum.TextYAlignment.Top,
				ClipsDescendants = true,
				TextWrapped = not not v34 or nil
			})
		})
	end, {
		v74,
		v66,
		v67,
		t1.playerCountStyle,
		t1.entry.playerCount,
		v52,
		v73,
		v51,
		v65,
		v69,
		v72,
		v68,
		v75
	})
	local v82, v83 = React.useState(Vector2.new(0, 0))
	local v84 = React.useMemo(function() -- line: 376
		-- upvalues: GameTileViewConfig (copy), v43 (copy), v82 (copy), v51 (copy), v77 (copy), t1 (copy), v76 (copy), v44 (copy)
		local v93 = GameTileViewConfig.getTileHeight(v43, v82.X, v51, v77, false, false, t1.textSizeOffset, nil, 1, v76, v44, true)

		return v82.Y - v93
	end, {
		v43,
		v82,
		v51,
		v77,
		t1.textSizeOffset,
		1,
		v76,
		v44
	})
	local v85 = React.useRef(nil)

	React.useEffect(function() -- line: 407
		-- upvalues: ImpressionsTagUtility (copy), v85 (copy), t1 (copy)
		ImpressionsTagUtility.AddTag(v85, t1.impressionsTag, t1.index)

		return function() -- line: 409
			-- upvalues: ImpressionsTagUtility (copy), v85 (copy), t1 (copy)
			ImpressionsTagUtility.RemoveTag(v85, t1.impressionsTag, t1.index)
		end
	end, {
		t1.impressionsTag,
		t1.index
	})

	if FFlagLuaAppHomeTouchAutoplay then
		useTagAsViewportAutoplayCandidate(v85, t1.videoPlaybackContext, not FFlagLuaAppTileVideoCandidateOnly and nil)
	end

	local v86 = nil

	if FFlagLuaAppGameTileLockedBadge then
		local v87 = getTileBadgeByPositionConfigFromEntry(t1.entry)

		if v87 then
			v86 = React.createElement(GameTileThumbnailBadges, {
				tileBadgesByPosition = v87
			})
		end
	end

	return React.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = t1.layoutOrder,
		ZIndex = -t1.index
	}, {
		EmphasisTileContainer = React.createElement("Frame", {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			Size = t1.size,
			BackgroundTransparency = 1,
			ref = v85,
			[React.Change.AbsoluteSize] = function(p4) -- line: 446
				-- upvalues: v83 (copy)
				v83(p4.AbsoluteSize)
			end
		}, {
			GameTileView = React.createElement(GameTileView, {
				forwardRef = v58,
				selectionOrder = t1.selectionOrder,
				isDisabled = t1.isDisabled,
				onActivated = v62,
				onSelectionGained = t1.onSelectionGained,
				onSelectionLost = t1.onSelectionLost,
				image = if not v52 then v55 else v54,
				title = v57,
				numLinesForTitle = 1,
				numLinesForMetadata = v76,
				isHovered = u59,
				footerMetadata = v81,
				isUnifiedGameTile = true,
				imageAspectRatio = v56,
				isContained = v77,
				extraFooterContent = if not v65 then v80 else nil,
				extraFooterSpace = if not v65 then v84 else nil,
				hidePlayButton = true,
				reducedMotion = UserGameSettings.ReducedMotion,
				thumbnailOverlay = if not FFlagLuaAppGameTileLockedBadge then nil else v86,
				onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t1.onTileImageLoaded
			})
		})
	})
end
