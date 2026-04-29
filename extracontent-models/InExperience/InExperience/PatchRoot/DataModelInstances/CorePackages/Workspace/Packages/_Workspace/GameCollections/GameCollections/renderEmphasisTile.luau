local Parent = script:FindFirstAncestor("GameCollections").Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local React = require(Parent.React)
local EmphasisGameTile = require(Parent.GameTile).EmphasisGameTile

require(Parent.VideoUtils)

local v7 = React.memo(function(t1: {[any]: any}) -- line: 50
	-- upvalues: React (copy), EmphasisGameTile (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy)
	return React.createElement(EmphasisGameTile, {
		size = t1.item.sizeOverride,
		index = t1.index,
		layoutOrder = t1.index,
		selectionOrder = t1.selectionOrder,
		isDisabled = t1.isDisabled,
		onSelectionGained = t1.onHoldableFocused,
		onSelectionLost = t1.onHoldableUnfocused,
		entry = t1.item,
		topicId = t1.topicId,
		source = t1.source,
		referralSource = t1.referralSource,
		playerCountStyle = t1.playerCountStyle,
		hideGameStats = t1.hideGameStats,
		gameTileLayoutType = t1.gameTileLayoutType,
		useHoverTile = t1.hoverTileEnabled,
		isContained = t1.isContained,
		reportGameDetailOpened = t1.reportGameDetailOpened,
		reportExperienceLaunched = t1.reportExperienceLaunched,
		launchExperienceEventContext = t1.launchExperienceEventContext,
		onPeekViewClosed = t1.onPeekViewClosed,
		navigateToGameDetails = t1.navigateToGameDetails,
		impressionsTag = t1.impressionsTag,
		textSizeOffset = t1.textSizeOffset,
		showDescription = t1.item.showDescription,
		zIndex = t1.zIndex,
		onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t1.onTileImageLoaded,
		videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else t1.videoPlaybackContext
	})
end)

return function(t2: {[any]: any}) -- line: 83
	-- upvalues: React (copy), v7 (copy), GameCollectionItemTypes (copy)
	return React.createElement(v7, t2), GameCollectionItemTypes.GameCollectionItemType.EmphasisTile
end
