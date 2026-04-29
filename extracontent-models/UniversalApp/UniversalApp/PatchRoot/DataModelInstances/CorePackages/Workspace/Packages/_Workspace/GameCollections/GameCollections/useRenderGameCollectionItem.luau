local GameCollections = script:FindFirstAncestor("GameCollections")
local GameCollectionsParent = GameCollections.Parent
local React = require(GameCollectionsParent.React)
local Responsive = require(GameCollectionsParent.Responsive)
local usePreferredInput = Responsive.usePreferredInput
local useBreakpointXOrSmaller = Responsive.useBreakpointXOrSmaller
local GameTile = require(GameCollectionsParent.GameTile)
local GameTileConstants = GameTile.GameTileConstants
local GameTileLayoutType = GameTile.GameTileTypes.GameTileLayoutType
local AppGameTile = GameTile.AppGameTile
local getTileBadgeByPositionConfigFromEntry = GameTile.getTileBadgeByPositionConfigFromEntry
local useTriggerGameTileFeedbackCallbacks = require(GameCollections.useTriggerGameTileFeedbackCallbacks)
local SeeAllTile = require(GameCollections.SeeAllTile)
local useNavigateToGameDetails = require(GameCollectionsParent.GameTile).useNavigateToGameDetails
local GameCollectionItemTypes = require(GameCollectionsParent.DiscoveryTypes).GameCollectionItemTypes

require(GameCollectionsParent.HoldToPlay)
require(GameCollectionsParent.VideoUtils)

local FFlagLuaAppGameTileLockedBadge = require(GameCollectionsParent.SharedFlags).FFlagLuaAppGameTileLockedBadge
local FFlagLuaAppGameTileInteractionFeedback = require(GameCollectionsParent.SharedFlags).FFlagLuaAppGameTileInteractionFeedback
local FFlagLuaAppGameTileWideVideoThumbnail = require(GameCollectionsParent.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail
local FFlagLuaAppEnableWhyThisAdModal = require(GameCollectionsParent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppEnableSponsoredReportAd = require(GameCollectionsParent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppEnableHomepageTwoByOneTile = require(GameCollectionsParent.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile
local FFlagLuaAppSupportSponsoredExplicitFeedback = require(GameCollectionsParent.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppSupportAdRatingFooter = require(GameCollectionsParent.SharedFlags).FFlagLuaAppSupportAdRatingFooter
local FFlagSduiServerCompat = require(GameCollectionsParent.SharedFlags).FFlagSduiServerCompat
local FFlagLuaAppSupportAdRatingFooterExperiment = require(GameCollectionsParent.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(GameCollectionsParent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppNarrowTileSmallerFooterFont = require(GameCollectionsParent.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont
local FFlagLuaAppNarrowTileHideRating = require(GameCollectionsParent.SharedFlags).FFlagLuaAppNarrowTileHideRating
local FFlagLuaAppNarrowTileHidePlayerCount = require(GameCollectionsParent.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount
local FFlagLuaAppHomeTouchAutoplay = require(GameCollectionsParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local GameCollectionItemType = GameCollectionItemTypes.GameCollectionItemType

return function(p1, b1: boolean?, p2, b2: boolean?, b3: boolean?, s1: string, b4: boolean?, p3: ((...any) -> ...any), p4: ((...any) -> ...any), s2: string?, s3: string?, s4: string?, p5: ((...any) -> ...any)?, s5: string?, n1: number?, b5: boolean?, s6: string?, b6: boolean?, b7: boolean?, b8: boolean?, p6, p7, p8, n2: number?, n3: number?, b9: boolean?, b10: boolean?, p9, p10: ((...any) -> ...any)?, n4: number?, b11: boolean?, t1: {[any]: any}?, p11: ((...any) -> ...any)?, s7: string?, s8: string?, b12: boolean?, b13: boolean?, n5: number?, b14: boolean?, s9: string?, b15: boolean?, b16: boolean?, p12: ((...any) -> ...any)?, b17: boolean?, b18: boolean?, b19: boolean?, p13) --[[ useRenderGameCollectionItem ]] -- line: 48
	-- upvalues: usePreferredInput (copy), useNavigateToGameDetails (copy), FFlagLuaAppGameTileInteractionFeedback (copy), useTriggerGameTileFeedbackCallbacks (copy), Responsive (copy), useBreakpointXOrSmaller (copy), FFlagLuaAppNarrowTileHideRating (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), GameTileConstants (copy), GameTileLayoutType (copy), React (copy), SeeAllTile (copy), FFlagSduiServerCompat (copy), GameCollectionItemType (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy), FFlagLuaAppGameTileLockedBadge (copy), getTileBadgeByPositionConfigFromEntry (copy), AppGameTile (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppSupportAdRatingFooter (copy), FFlagLuaAppSupportAdRatingFooterExperiment (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy)
	local v79 = usePreferredInput()
	local v80 = useNavigateToGameDetails()
	local u81 = nil
	local u82 = nil

	if FFlagLuaAppGameTileInteractionFeedback then
		local v83, v84 = useTriggerGameTileFeedbackCallbacks()

		u81 = v83
		u82 = v84
	end

	local v85 = b4 and v79 == Responsive.Input.Pointer
	local v86 = p2 == "Wide" or p2 == "Event"
	local v87 = useBreakpointXOrSmaller(Responsive.Keys.Small)
	local v88 = useBreakpointXOrSmaller(Responsive.Keys.XSmall)
	local v89 = FFlagLuaAppNarrowTileHideRating and b18 or FFlagLuaAppNarrowTileHidePlayerCount and b19
	local u90 = if not (v87 and (n2 > 0 and not v89)) then GameTileConstants.TileTextLines[p2 or GameTileLayoutType.Narrow].metadataTextLines else GameTileConstants.TileTextLines[p2 or GameTileLayoutType.Narrow].largeMetadataTextLines

	return (React.useCallback(function(p14, n6: number, p15, n7: number?) -- line: 177
		-- upvalues: n1 (copy), p5 (copy), React (copy), SeeAllTile (copy), FFlagSduiServerCompat (copy), GameCollectionItemType (copy), p8 (copy), t1 (copy), n4 (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), n5 (copy), p6 (copy), p7 (copy), s5 (copy), s4 (copy), s3 (copy), p1 (copy), b5 (copy), p2 (copy), v85 (copy), b6 (copy), p3 (copy), p4 (copy), s2 (copy), p10 (copy), v80 (copy), s1 (copy), n2 (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), s7 (copy), p11 (copy), s8 (copy), b12 (copy), b13 (copy), b11 (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), p12 (copy), FFlagLuaAppHomeTouchAutoplay (copy), p13 (copy), FFlagLuaAppGameTileLockedBadge (copy), getTileBadgeByPositionConfigFromEntry (copy), AppGameTile (copy), b2 (copy), b3 (copy), v86 (copy), b1 (copy), s6 (copy), b7 (copy), b8 (copy), FFlagLuaAppGameTileInteractionFeedback (copy), u81 (ref), u82 (ref), n3 (copy), u90 (ref), b9 (copy), b10 (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), p9 (copy), v88 (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppSupportAdRatingFooter (copy), b14 (copy), FFlagLuaAppSupportAdRatingFooterExperiment (copy), s9 (copy), b15 (copy), b16 (copy), FFlagLuaAppNarrowTileSmallerFooterFont (copy), b17 (copy), FFlagLuaAppNarrowTileHideRating (copy), b18 (copy), FFlagLuaAppNarrowTileHidePlayerCount (copy), b19 (copy)
		if n1 and (n6 == n1 and p5) then
			return React.createElement(SeeAllTile, {
				onActivated = p5,
				Size = if FFlagSduiServerCompat then nil else p15,
				size = if not FFlagSduiServerCompat then nil else p15,
				LayoutOrder = if FFlagSduiServerCompat then nil else n6,
				layoutOrder = if not FFlagSduiServerCompat then nil else n6
			}), GameCollectionItemType.SeeAllTile
		end

		local v95 = nil

		if p8 then
			v95 = p8(n6)
		end

		local v96 = t1 and t1[p14.universeId]
		local v97 = if not n4 then nil else n4 + n6

		if p14.customRenderFunction then
			return p14.customRenderFunction({
				item = p14,
				index = n6,
				itemSize = p15,
				rowNum = n7,
				zIndex = if not FFlagLuaAppEnableHomepageTwoByOneTile then nil else -n6,
				maxItemIndex = if not FFlagLuaAppEnableHomepageTwoByOneTile then nil else n5,
				selectionOrder = v97,
				isDisabled = v95,
				onSelectionGained = p6,
				onSelectionLost = p7,
				topicId = s5,
				source = s4,
				referralSource = s3,
				playerCountStyle = p1,
				hideGameStats = b5,
				gameTileLayoutType = p2,
				hoverTileEnabled = v85,
				isContained = b6,
				reportGameDetailOpened = p3,
				reportExperienceLaunched = p4,
				launchExperienceEventContext = s2,
				onPeekViewClosed = p10,
				navigateToGameDetails = v80,
				impressionsTag = s1,
				textSizeOffset = n2,
				appPage = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else s7,
				setGameHidden = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else p11,
				isHidden = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else v96,
				sponsoredUserCohort = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else s8,
				enableSponsoredFeedback = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else b12,
				enableReportAd = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else b13,
				enableExplicitFeedback = if not FFlagLuaAppSupportSponsoredExplicitFeedback then nil else b11,
				onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone or (not p12 or v96) then nil else p12,
				videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else p13
			})
		end

		local v98 = nil

		if FFlagLuaAppGameTileLockedBadge then
			v98 = getTileBadgeByPositionConfigFromEntry(p14)
		elseif p14.badgePosition and p14.badgeAnalyticsId and p14.badgeType and (p14.badgeText or p14.badgeIcon) then
			v98 = {
				[p14.badgePosition] = {{
					analyticsId = p14.badgeAnalyticsId,
					tileBadgeType = p14.badgeType,
					text = p14.badgeText,
					icons = if not p14.badgeIcon then nil else { p14.badgeIcon },
					tileBadgeComponentType = p14.badgeComponentType
				}}
			}
		end

		return React.createElement(AppGameTile, {
			Size = p15,
			entry = p14,
			layoutOrder = n6,
			ZIndex = -n6,
			reportGameDetailOpened = p3,
			reportExperienceLaunched = p4,
			index = n6,
			friendFooterEnabled = b2,
			showFriendActivity = b3,
			impressionsTag = s1,
			useGridTile = v86,
			playerCountStyle = p1,
			isSponsoredFooterAllowed = b1,
			gameTileLayoutType = p2,
			useHoverTile = v85,
			topicId = s5,
			launchExperienceEventContext = s2,
			referralSource = s3,
			source = s4,
			rowNum = n7,
			navigateToGameDetails = v80,
			hideGameStats = b5,
			playButtonStyle = s6,
			isContained = b6,
			hideTitle = b7,
			hideMetadata = b8,
			onGuiStateChanged = if not FFlagLuaAppGameTileInteractionFeedback then nil else u81,
			onActivated = if not FFlagLuaAppGameTileInteractionFeedback then nil else u82,
			isDisabled = v95,
			onSelectionGained = p6,
			onSelectionLost = p7,
			textSizeOffset = n2,
			contentTextLineCount = n3,
			metadataTextLineCount = u90,
			useExperienceTileMetadata = b9,
			forceHideAgeRatings = b10,
			videoAnalytics = if not FFlagLuaAppGameTileWideVideoThumbnail then nil else p9,
			onPeekViewClosed = p10,
			SelectionOrder = v97,
			enableExplicitFeedback = b11,
			setGameHidden = p11,
			appPage = s7,
			isHidden = v96,
			isNarrowScreenXSmall = v88,
			sponsoredUserCohort = if not FFlagLuaAppEnableWhyThisAdModal then nil else s8,
			enableSponsoredFeedback = b12,
			enableReportAd = if not FFlagLuaAppEnableSponsoredReportAd then nil else b13,
			isSponsoredRatingFooterAllowed = if not FFlagLuaAppSupportAdRatingFooter then nil else b14,
			sponsoredFooterAdLabelText = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else s9,
			sponsoredFooterAdLabelFirst = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else b15,
			sponsoredFooterIncludeRatingContent = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else b16,
			badgeOverride = v98,
			onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone or (not p12 or v96) then nil else p12,
			compactMetadataFormat = if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else b17,
			hideRating = if not FFlagLuaAppNarrowTileHideRating then nil else b18,
			hidePlayerCount = if not FFlagLuaAppNarrowTileHidePlayerCount then nil else b19,
			videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else p13
		}), GameCollectionItemType.GameTile
	end, {
		v86,
		b2,
		b5,
		b3,
		s1,
		p1,
		b1,
		p2,
		s5,
		p3,
		p4,
		p5,
		s2,
		s4,
		s3,
		n1,
		v85,
		s6,
		b6,
		b7,
		b8,
		n2,
		if not FFlagLuaAppGameTileInteractionFeedback then nil else u81,
		if not FFlagLuaAppGameTileInteractionFeedback then nil else u82,
		p6,
		p7,
		p8,
		n3,
		b9,
		b10,
		if not FFlagLuaAppGameTileWideVideoThumbnail then nil else p9,
		p10,
		n4,
		u90,
		b11,
		t1,
		p11,
		s7,
		v88,
		if not FFlagLuaAppEnableWhyThisAdModal then nil else s8,
		b12,
		if not FFlagLuaAppEnableSponsoredReportAd then nil else b13,
		v80,
		if not FFlagLuaAppSupportAdRatingFooter then nil else b14,
		if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else s9,
		if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else b15,
		if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else b16,
		if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else p12,
		if not FFlagLuaAppNarrowTileSmallerFooterFont then nil else b17,
		if not FFlagLuaAppNarrowTileHideRating then nil else b18,
		if not FFlagLuaAppNarrowTileHidePlayerCount then nil else b19,
		if not FFlagLuaAppHomeTouchAutoplay then nil else p13
	}))
end
