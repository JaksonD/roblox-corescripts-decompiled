local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local DiscoveryMonolithParent = DiscoveryMonolith.Parent
local React = require(DiscoveryMonolithParent.React)
local RoactRodux = require(DiscoveryMonolithParent.RoactRodux)
local t = require(DiscoveryMonolithParent.t)
local RoactServices = require(DiscoveryMonolithParent.RoactServices).RoactServices
local withNavigation = require(DiscoveryMonolithParent.RoactNavigation).withNavigation
local GameTile = require(DiscoveryMonolithParent.GameTile)
local GameTileThumbnailBadges = GameTile.GameTileThumbnailBadges
local sponsoredGamesRecordClick = require(DiscoveryMonolithParent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local AppExperienceActionRow = GameTile.AppExperienceActionRow
local getTileBadgeByPositionConfigFromEntry = GameTile.getTileBadgeByPositionConfigFromEntry
local ApiFetchGameDetails = require(DiscoveryMonolithParent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local ImpressionsTagUtility = require(DiscoveryMonolithParent.Impressions).ImpressionsTagUtility
local OpenGameDetails = require(DiscoveryMonolithParent.GameDetail).OpenGameDetails
local BigGameIconReducer = require(DiscoveryMonolithParent.GameIconRodux).BigGameIcons.BigGameIconReducer
local GameInfosReducer = require(DiscoveryMonolithParent.GameInfosRodux).GameInfosReducer
local DiscoveryTypes = require(DiscoveryMonolithParent.DiscoveryTypes)
local GameCollectionItemTypes = DiscoveryTypes.GameCollectionItemTypes
local RoactNetworking = require(DiscoveryMonolithParent.RoactServiceTags).RoactNetworking
local RoactAppExperiment = require(DiscoveryMonolithParent.RoactAppExperiment)
local AppUserLayers = require(DiscoveryMonolithParent.ExperimentLayers).AppUserLayers
local Modules = DiscoveryMonolith.Modules
local getRatingText = require(Modules.LuaApp.getRatingText)
local AppFeaturedTile = require(Modules.LuaApp.Components.Games.AppFeaturedTile)
local FeaturedContentPanel = require(Modules.LuaApp.Components.Games.FeaturedContentPanel)
local FeaturedStaticPanel = require(Modules.LuaApp.Components.Games.FeaturedStaticPanel)
local GetFFlagShowCreatorNameOnEmphasisSearchTileIXP = require(Modules.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP)
local SharedFlags = require(DiscoveryMonolithParent.SharedFlags)
local FFlagLuaAppUnifyPlayButtonTile = SharedFlags.FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppTwoByOneTileTelemetryFix = SharedFlags.FFlagLuaAppTwoByOneTileTelemetryFix
local FFlagLuaAppGameTileLockedBadge = SharedFlags.FFlagLuaAppGameTileLockedBadge
local GAME_GRID_CHILD_PADDING = DiscoveryTypes.Constants.GAME_GRID_CHILD_PADDING
local v34 = DiscoveryTypes.Constants.GAME_GRID_CHILD_PADDING * 2
local v35 = if not FFlagLuaAppUnifyPlayButtonTile then nil else 6
local v36 = React.PureComponent:extend("AppFeaturedGameTileTwoByTwo")

v36.validateProps = t.strictInterface({
	entry = t.table,
	index = t.optional(t.number),
	layoutOrder = t.optional(t.number),
	reportGameDetailOpened = t.optional(t.callback),
	reportExperienceLaunched = t.optional(t.callback),
	size = t.optional(t.Vector2),
	position = t.optional(t.Vector2),
	source = t.optional(t.string),
	referralSource = t.optional(t.string),
	hasBackground = t.optional(t.boolean),
	hasActionRow = t.optional(t.boolean),
	isDynamic = t.optional(t.boolean),
	impressionsTag = t.optional(t.string),
	launchExperienceEventContext = t.optional(t.string),
	universeId = t.optional(t.string),
	name = t.optional(t.string),
	creatorName = t.optional(t.string),
	placeId = t.optional(t.string),
	totalUpVotes = t.optional(t.number),
	totalDownVotes = t.optional(t.number),
	gameDetail = t.optional(t.table),
	thumbnail = t.optional(t.table),
	openGameDetails = t.callback,
	fetchGameDetails = t.callback,
	navigation = t.any,
	networking = t.callback,
	shouldShowFeaturedTileCreatorName = t.optional(t.boolean)
})

function v36.init(p1) -- line: 87
	-- upvalues: React (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy), AppExperienceActionRow (copy), FFlagLuaAppUnifyPlayButtonTile (copy), v35 (copy), getRatingText (copy), FeaturedContentPanel (copy), FeaturedStaticPanel (copy)
	p1.isMounted = false
	p1.gameTileRef = React.createRef()

	function p1.onActivated() -- line: 92
		-- upvalues: p1 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy)
		if not p1.isMounted then
			return
		end

		local universeId = p1.props.universeId
		local t1 = {
			source = p1.props.source,
			index = p1.props.index,
			onPeekViewClosed = p1.props.onPeekViewClosed,
			experienceJoinData = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else {
				tileType = p1.props.entry and p1.props.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.EmphasisTile,
				nativeAdData = p1.props.entry and p1.props.entry.adId
			}
		}

		p1.props.openGameDetails(universeId, t1, p1.props.navigation)

		local index = p1.props.index
		local reportGameDetailOpened = p1.props.reportGameDetailOpened

		if index and reportGameDetailOpened then
			reportGameDetailOpened(index)
		end

		local networking = p1.props.networking
		local entry = p1.props.entry

		if entry.isSponsored then
			sponsoredGamesRecordClick(networking, entry.adId)
		end
	end
	function p1.renderActionRow() -- line: 129
		-- upvalues: React (copy), AppExperienceActionRow (copy), p1 (copy), FFlagLuaAppUnifyPlayButtonTile (copy), v35 (copy)
		return React.createElement(AppExperienceActionRow, {
			universeId = p1.props.universeId,
			referralSource = p1.props.referralSource,
			launchSource = "FeaturedSearchTile",
			reportExperienceLaunched = p1.props.reportExperienceLaunched,
			openGameDetails = p1.onActivated,
			entry = p1.props.entry,
			launchExperienceEventContext = p1.props.launchExperienceEventContext,
			showButtonText = true,
			width = if not FFlagLuaAppUnifyPlayButtonTile then nil else UDim.new(1, -2 * v35),
			horizontalPadding = if not FFlagLuaAppUnifyPlayButtonTile then nil else v35,
			verticalPadding = if not FFlagLuaAppUnifyPlayButtonTile then nil else v35,
			isUnifiedGameTileEnabled = not not FFlagLuaAppUnifyPlayButtonTile or nil
		})
	end
	function p1.renderBottomPanel() -- line: 146
		-- upvalues: p1 (copy), getRatingText (copy), React (copy), FeaturedContentPanel (copy), FeaturedStaticPanel (copy)
		local entry = p1.props.entry
		local name = p1.props.name
		local totalUpVotes = p1.props.totalUpVotes
		local totalDownVotes = p1.props.totalDownVotes
		local gameDetail = p1.props.gameDetail
		local v79 = gameDetail and (gameDetail.creator and gameDetail.creator.hasVerifiedBadge)
		local v80 = gameDetail and (gameDetail.creator and gameDetail.creator.id)
		local v81 = gameDetail and gameDetail.description or ""
		local shouldShowFeaturedTileCreatorName = p1.props.shouldShowFeaturedTileCreatorName
		local isDynamic = p1.props.isDynamic
		local v84 = if not gameDetail then nil else gameDetail.licenseDescription
		local v85 = if not gameDetail then nil else gameDetail.localizedFiatPrice
		local t2 = {
			hasBackground = p1.props.hasBackground,
			padding = 8,
			title = name,
			creatorName = if not shouldShowFeaturedTileCreatorName then nil else p1.props.creatorName,
			creatorVerified = v79,
			creatorId = v80,
			description = v81,
			licenseDescription = v84,
			paidAccessDescription = v85,
			footerData = {
				rating = getRatingText(totalUpVotes, totalDownVotes),
				playingCount = entry.playerCount
			}
		}

		if isDynamic then
			return React.createElement(FeaturedContentPanel, t2)
		end

		return React.createElement(FeaturedStaticPanel, t2)
	end
end
function v36.didMount(p2) -- line: 186
	-- upvalues: ImpressionsTagUtility (copy)
	p2.isMounted = true
	ImpressionsTagUtility.AddTag(p2.gameTileRef, p2.props.impressionsTag, p2.props.index)

	local networking = p2.props.networking
	local universeId = p2.props.universeId

	p2.props.fetchGameDetails(networking, universeId)
end
function v36.willUnmount(p3) -- line: 196
	-- upvalues: ImpressionsTagUtility (copy)
	p3.isMounted = false
	ImpressionsTagUtility.RemoveTag(p3.gameTileRef, p3.props.impressionsTag, p3.props.index)
end
function v36.didUpdate(p4, p5) -- line: 201
	-- upvalues: ImpressionsTagUtility (copy)
	if p5.impressionsTag ~= p4.props.impressionsTag or p5.index ~= p4.props.index then
		ImpressionsTagUtility.RemoveTag(p4.gameTileRef, p5.impressionsTag, p5.index)
		ImpressionsTagUtility.AddTag(p4.gameTileRef, p4.props.impressionsTag, p4.props.index)
	end
end
function v36.render(p6) -- line: 208
	-- upvalues: GAME_GRID_CHILD_PADDING (copy), v34 (copy), FFlagLuaAppGameTileLockedBadge (copy), getTileBadgeByPositionConfigFromEntry (copy), React (copy), GameTileThumbnailBadges (copy), AppFeaturedTile (copy)
	local layoutOrder = p6.props.layoutOrder
	local size = p6.props.size
	local position = p6.props.position
	local thumbnail = p6.props.thumbnail
	local v51 = thumbnail and thumbnail.url
	local v52 = if not size then nil else size.X
	local v53 = if not size then nil else size.Y
	local v54 = if not size then nil else v52 * 2 + GAME_GRID_CHILD_PADDING
	local v55 = if not size then nil else v53 * 2 + v34
	local hasBackground = p6.props.hasBackground
	local hasActionRow = p6.props.hasActionRow
	local v58 = nil

	if FFlagLuaAppGameTileLockedBadge then
		local v59 = getTileBadgeByPositionConfigFromEntry(p6.props.entry)

		if v59 then
			v58 = React.createElement(GameTileThumbnailBadges, {
				tileBadgesByPosition = v59
			})
		end
	end

	local v60 = React.createElement(AppFeaturedTile, {
		hasBackground = hasBackground,
		hasOutline = hasBackground,
		thumbnail = v51,
		thumbnailOverlay = if not FFlagLuaAppGameTileLockedBadge then nil else v58,
		renderActionRow = if not hasActionRow then nil else p6.renderActionRow,
		renderBottomPanel = p6.renderBottomPanel,
		onActivated = p6.onActivated
	})

	return React.createElement("Frame", {
		Position = if not size or not position then nil else UDim2.fromOffset(position.X, position.Y),
		Size = if not size then UDim2.new(1, 0, 1, 0) else UDim2.new(0, v52, 0, v53),
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		ref = p6.gameTileRef
	}, {
		FeaturedTile = if not size then v60 else React.createElement("Frame", {
			Size = UDim2.new(0, v54, 0, v55),
			Position = UDim2.new(0, 0, 0, -v53 - v34),
			BackgroundTransparency = 1
		}, {
			Tile = v60
		})
	})
end

local v37 = withNavigation((RoactRodux.connect(function(p7, p8) -- line: 266
	-- upvalues: GameInfosReducer (copy), BigGameIconReducer (copy)
	local universeId = p8.entry.universeId
	local v64 = p7.Personalization[GameInfosReducer.key][universeId]

	return {
		universeId = universeId,
		name = v64.name,
		creatorName = v64.creatorName,
		placeId = v64.placeId,
		totalUpVotes = v64.totalUpVotes,
		totalDownVotes = v64.totalDownVotes,
		gameDetail = p7.GameDetails[universeId],
		thumbnail = p7[BigGameIconReducer.key][universeId]
	}
end, function(p9) -- line: 279
	-- upvalues: OpenGameDetails (copy), ApiFetchGameDetails (copy)
	return {
		openGameDetails = function(p10, p11, p12) --[[ openGameDetails ]] -- line: 281
			-- upvalues: p9 (copy), OpenGameDetails (copy)
			p9(OpenGameDetails(p10, p12, p11))
		end,
		fetchGameDetails = function(p13, p14) --[[ fetchGameDetails ]] -- line: 284
			-- upvalues: p9 (copy), ApiFetchGameDetails (copy)
			p9(ApiFetchGameDetails.Fetch(p13, { p14 }))
		end
	}
end)(v36)))
local v38 = RoactServices.connect({
	networking = RoactNetworking
})(v37)

return (RoactAppExperiment.connectUserLayer({ GetFFlagShowCreatorNameOnEmphasisSearchTileIXP() and AppUserLayers.PlayerAppSearchResultsPageUXLayer or nil }, function(p15, _) -- line: 298
	-- upvalues: AppUserLayers (copy)
	return {
		shouldShowFeaturedTileCreatorName = (p15[AppUserLayers.PlayerAppSearchResultsPageUXLayer] or {}).ShouldShowFeaturedTileCreatorName == true
	}
end)(v38))
