local Parent = script:FindFirstAncestor("GameCollections").Parent
local React = require(Parent.React)
local useRoactService = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local gamePlayIntent = require(Parent.DiscoveryAnalytics).Events.gamePlayIntent
local reportGameAttributionError = require(Parent.DiscoveryAnalytics).Events.reportGameAttributionError
local mutedError = require(Parent.Loggers).mutedError
local useStore = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local GameSortLoadSource = require(Parent.DiscoveryAvailability).GameSortLoadSource
local feedScroll = require(Parent.ScrollTelemetry).feedScroll
local calculateRowPositionFields = require(Parent.UnifiedLogging).calculateRowPositionFields
local Cryo = require(Parent.Cryo)
local FFlagLuaAppLogGameAttributionError = require(Parent.SharedFlags).FFlagLuaAppLogGameAttributionError
local FFlagLuaAppGameDetailsAttributionFix = require(Parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local FFlagLuaAppEnableHomepageTwoByOneTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile
local FFlagLuaAppAddSubIdToHomeEvents = require(Parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local FFlagLuaAppTwoByOneTileTelemetryFix = require(Parent.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix
local FFlagLuaAppLogOmniAnalyticsData = require(Parent.SharedFlags).FFlagLuaAppLogOmniAnalyticsData
local t1 = {}
local v23 = if not FFlagLuaAppLogGameAttributionError then nil else {
	GameDetail = "GameDetail",
	PlayIntent = "PlayIntent"
}

return function(p1, b1: boolean, n1: number, s1: string, t2: {[any]: any}?, t3: {[any]: any}?, n2: number, n3: number?) --[[ useGameSortAnalytics ]] -- line: 89
	-- upvalues: useStore (copy), useRoactService (copy), RoactAnalyticsCommonGameEvents (copy), AppEventIngestService (copy), AppPage (copy), GameSortLoadSource (copy), FFlagLuaAppAddSubIdToHomeEvents (copy), FFlagLuaAppLogOmniAnalyticsData (copy), React (copy), FFlagLuaAppGameDetailsAttributionFix (copy), reportGameAttributionError (copy), v23 (copy), mutedError (copy), calculateRowPositionFields (copy), Cryo (copy), t1 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), FFlagLuaAppLogGameAttributionError (copy), gamePlayIntent (copy), feedScroll (copy)
	local v42 = useStore()
	local v43 = useRoactService(RoactAnalyticsCommonGameEvents)
	local v44 = useRoactService(AppEventIngestService)
	local v45 = s1 == AppPage.SearchPage
	local v46 = if p1 == nil then nil else if not b1 and not v45 then p1.gameSetTypeId else p1.topicId
	local v47 = if b1 or p1 == nil then nil else p1.gameSetTargetId
	local v48 = if b1 or not p1 then nil else p1.appliedFilters
	local v49 = if s1 ~= AppPage.Home or (not p1 or not p1.topicId) then nil else GameSortLoadSource.getSortLoadSource(p1.topicId)
	local v50 = if not FFlagLuaAppAddSubIdToHomeEvents or not p1 then nil else p1.sortSubId
	local v51 = if not FFlagLuaAppLogOmniAnalyticsData or not p1 then nil else p1.analyticsData

	return React.useCallback(function(n4: number?, s2: string?, p2) -- line: 119
		-- upvalues: FFlagLuaAppGameDetailsAttributionFix (copy), t3 (copy), reportGameAttributionError (copy), s1 (copy), v23 (copy), v46 (copy), v47 (copy), n1 (copy), mutedError (copy), calculateRowPositionFields (copy), n2 (copy), n3 (copy), FFlagLuaAppLogOmniAnalyticsData (copy), v51 (copy), Cryo (copy), t1 (copy), v43 (copy), v48 (copy), v49 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), FFlagLuaAppAddSubIdToHomeEvents (copy), v50 (copy)
		if FFlagLuaAppGameDetailsAttributionFix then
			local v55 = nil
			local v56

			if n4 and t3 then
				v55 = t3[n4]
				v56 = not v55 or s2 ~= v55.universeId
			else
				v56 = true
			end

			if v56 then
				reportGameAttributionError(s1, {
					errorType = v23.GameDetail,
					clickedUniverseId = s2,
					universeId = if not v55 then nil else v55.universeId,
					gameSetTypeId = v46,
					gameSetTargetId = v47,
					sortIndex = n1,
					sortEntryIndex = n4 or nil
				})
			end
		end

		if n4 ~= nil and t3 ~= nil then
			local v57 = t3[n4]

			if not v57 then
				mutedError("reportGameDetailOpened requires a valid entry")
			end

			local v58 = calculateRowPositionFields(n4, n2, n3)
			local v61

			if FFlagLuaAppLogOmniAnalyticsData then
				local v59 = v51
				local analyticsData = v57.analyticsData

				if not v59 and not analyticsData then
					v61 = nil
				else
					local v62 = Cryo.Dictionary.join(v59 or t1, analyticsData or t1)

					v61 = if not next(v62) then nil else v62
				end
			else
				v61 = nil
			end

			v43.reportOpenGameDetailWithId(v57.placeIdOverride or v57.placeId, v46, v47, n1, n4, #t3, v57.isSponsored, v57.adId, v57.universeId, s1, s2, v48, v57.topicContentsIndex or n4, nil, v58.positionInRow, v58.rowInSort, v58.rowOnPage, nil, v49, if not FFlagLuaAppTwoByOneTileTelemetryFix then if not FFlagLuaAppEnableHomepageTwoByOneTile then nil else p2 else v57.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile, if not FFlagLuaAppAddSubIdToHomeEvents then nil else v50, if not FFlagLuaAppLogOmniAnalyticsData then nil else v61)
		end
	end, {
		v43,
		n1,
		s1,
		v46,
		v47,
		t3,
		n2,
		n3,
		v49,
		if not FFlagLuaAppAddSubIdToHomeEvents then nil else v50,
		if not FFlagLuaAppLogOmniAnalyticsData then nil else v51
	}), React.useCallback(function(p3, s3: string?, _: string?, s5: string, n5: number?) -- line: 202
		-- upvalues: FFlagLuaAppLogGameAttributionError (copy), t3 (copy), reportGameAttributionError (copy), v23 (copy), v46 (copy), v47 (copy), n1 (copy), calculateRowPositionFields (copy), n2 (copy), n3 (copy), FFlagLuaAppLogOmniAnalyticsData (copy), v51 (copy), Cryo (copy), t1 (copy), gamePlayIntent (copy), v44 (copy), v48 (copy), s1 (copy), v49 (copy), FFlagLuaAppAddSubIdToHomeEvents (copy), v50 (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), GameCollectionItemTypes (copy)
		if FFlagLuaAppLogGameAttributionError then
			local v68 = nil
			local v69

			if n5 and t3 then
				v68 = t3[n5]
				v69 = not v68 or v68.universeId ~= p3.universeId
			else
				v69 = true
			end

			if v69 then
				reportGameAttributionError(s5, {
					errorType = v23.PlayIntent,
					clickedUniverseId = p3.universeId,
					universeId = if not v68 then nil else v68.universeId,
					gameSetTypeId = v46,
					gameSetTargetId = v47,
					sortIndex = n1,
					sortEntryIndex = n5 or nil
				})
			end
		end

		local v70 = calculateRowPositionFields(n5, n2, n3)
		local v73

		if FFlagLuaAppLogOmniAnalyticsData then
			local v71 = v51
			local analyticsData = p3.analyticsData

			if not v71 and not analyticsData then
				v73 = nil
			else
				local v74 = Cryo.Dictionary.join(v71 or t1, analyticsData or t1)

				v73 = if not next(v74) then nil else v74
			end
		else
			v73 = nil
		end

		gamePlayIntent(v44, s5, {
			placeId = p3.placeIdOverride or p3.placeId,
			rootPlaceId = tonumber(p3.placeId),
			universeId = p3.universeId,
			sortIndex = tostring(n1),
			sortEntryIndex = if not n5 then nil else tostring(n5),
			referralSource = s3,
			gameSetTypeId = v46,
			gameSetTargetId = v47,
			appliedFilters = v48,
			topicDataPosition = p3.topicContentsIndex or n5,
			nativeAdData = p3.adId,
			pageName = s1,
			positionInRow = v70.positionInRow,
			rowNumber = v70.rowInSort,
			feedRowNumber = v70.rowOnPage,
			loadSource = v49,
			launchData = p3.launchDataOverride,
			sortSubId = if not FFlagLuaAppAddSubIdToHomeEvents then nil else v50,
			tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else p3.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile,
			analyticsData = if not FFlagLuaAppLogOmniAnalyticsData then nil else v73
		})
	end, {
		n1,
		v44,
		v46,
		v47,
		if not FFlagLuaAppLogGameAttributionError then nil else t3,
		s1,
		n2,
		n3,
		v49,
		if not FFlagLuaAppAddSubIdToHomeEvents then nil else v50,
		if not FFlagLuaAppLogOmniAnalyticsData then nil else v51
	}), React.useCallback(function() -- line: 279
		-- upvalues: v43 (copy), v46 (copy), v47 (copy), n1 (copy)
		v43.reportSeeAllWithId(v46, v47, n1)
	end, {
		v43,
		v46,
		v47,
		n1
	}), (React.useCallback(function(n6: number, n7: number, n8: number) -- line: 292
		-- upvalues: t2 (copy), mutedError (copy), v42 (copy), n1 (copy), v46 (copy), v47 (copy), feedScroll (copy), v44 (copy), s1 (copy)
		if t2 and t2.current ~= nil then
			local ScrollingDirection = t2.current.ScrollingDirection
			local n9 = 0

			if ScrollingDirection == Enum.ScrollingDirection.X then
				n9 = t2.current.AbsoluteSize.X
			elseif ScrollingDirection == Enum.ScrollingDirection.Y then
				n9 = t2.current.AbsoluteSize.Y
			else
				mutedError(`Direction { ScrollingDirection.Name } is an unsupported option for feedScroll event`)
			end

			local ScreenSize = v42:getState().ScreenSize
			local t4 = {
				distance = n6,
				screenSizeX = ScreenSize.X,
				screenSizeY = ScreenSize.Y,
				scrollAreaSize = n9,
				scrollDepth = if not (n9 > 0) then nil else n6 / n9,
				startDepth = if not (n9 > 0) then nil else n8 / n9,
				startPos = n8,
				scrollDuration = n7,
				sortPos = n1,
				gameSetTypeId = v46,
				gameSetTargetId = v47
			}

			feedScroll(v44, s1, ScrollingDirection, t4)
		end
	end, {
		v44,
		n1,
		s1,
		t2,
		v46,
		v47,
		v42
	}))
end
