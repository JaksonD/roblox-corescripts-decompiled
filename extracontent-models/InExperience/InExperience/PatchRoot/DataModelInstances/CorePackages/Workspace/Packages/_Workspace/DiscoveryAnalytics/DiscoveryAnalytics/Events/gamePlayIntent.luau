local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local TelemetryService = game:GetService("TelemetryService")
local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local DiscoveryAnalyticsParent = DiscoveryAnalytics.Parent
local Cryo = require(DiscoveryAnalyticsParent.Cryo)
local t = require(DiscoveryAnalyticsParent.t)
local DiscoveryEventErrorLogger = require(DiscoveryAnalyticsParent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagEnableInGameExitModalNextUpUi = require(DiscoveryAnalyticsParent.SharedFlags).FFlagEnableInGameExitModalNextUpUi
local FFlagLuaAppGamePlayIntentEventMobileAdsId = require(DiscoveryAnalyticsParent.SharedFlags).FFlagLuaAppGamePlayIntentEventMobileAdsId
local FFlagTraversalHistoryDiscoveryTelemetry = require(DiscoveryAnalyticsParent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local FFlagLuaAppEnableCustomSpawnSearch = require(DiscoveryAnalyticsParent.SharedFlags).FFlagLuaAppEnableCustomSpawnSearch
local FFlagLuaAppAddSubIdToHomeEvents = require(DiscoveryAnalyticsParent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local FFlagLuaAppTwoByOneTileTelemetryFix = require(DiscoveryAnalyticsParent.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix
local FFlagLuaAppLogOmniAnalyticsData = require(DiscoveryAnalyticsParent.SharedFlags).FFlagLuaAppLogOmniAnalyticsData
local FFlagLuaAppMigrateGameEventsTelemetryService = require(DiscoveryAnalyticsParent.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService
local FFlagLuaAppGameEventsTelemetryServiceShadowTraffic = require(DiscoveryAnalyticsParent.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic
local v18 = game:DefineFastInt("LuaAppGamePlayIntentEventThrottlingHundredthsPercent", 10000)
local v19 = game:DefineFastInt("LuaAppGamePlayIntentShadowThrottlingHundredthsPercent", 10000)
local Constants = require(DiscoveryAnalytics.Constants)
local t1 = nil

if FFlagLuaAppMigrateGameEventsTelemetryService then
	t1 = {
		eventName = "gamePlayIntent",
		backends = { "EventIngest" },
		throttlingPercentage = v18,
		lastUpdated = {
			26,
			2,
			4
		},
		description = "Fires when the user clicks on a Play Button"
	}
end

local t2 = nil

if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
	t2 = {
		eventName = "gamePlayIntentShadow",
		backends = { "EventIngest" },
		throttlingPercentage = v19,
		lastUpdated = {
			26,
			3,
			4
		},
		description = "Shadow traffic for gamePlayIntent event recovery percentage"
	}
end

local v23 = t.strictInterface({
	placeId = t.union(t.string, t.number),
	rootPlaceId = t.union(t.number, t.string),
	referralSource = t.optional(t.string),
	sortIndex = t.optional(t.string),
	sortEntryIndex = t.optional(t.string),
	gameSetTypeId = t.optional(t.string),
	gameSetTargetId = t.optional(t.number),
	linkId = t.optional(t.union(t.string, t.number)),
	linkType = t.optional(t.string),
	linkStatus = t.optional(t.string),
	conversationId = t.optional(t.union(t.number, t.string)),
	joinAttemptId = t.optional(t.string),
	uid = t.optional(t.string),
	launchData = t.optional(t.string)
})
local v24 = t.strictInterface({
	placeId = t.union(t.string, t.number),
	rootPlaceId = t.union(t.number, t.string),
	referralSource = t.optional(t.string),
	universeId = t.string,
	launchData = t.optional(t.string),
	tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t.optional(t.string),
	nativeAdData = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t.optional(t.string)
})
local v25 = t.strictInterface({
	placeId = t.string,
	rootPlaceId = t.number,
	universeId = t.string,
	referralSource = t.optional(t.string),
	sortIndex = t.string,
	sortEntryIndex = t.string,
	gameSetTypeId = t.optional(t.string),
	gameSetTargetId = t.optional(t.number),
	appliedFilters = t.optional(t.string),
	topicDataPosition = t.optional(t.number),
	nativeAdData = t.optional(t.string),
	pageName = t.optional(t.string),
	positionInRow = t.optional(t.number),
	rowNumber = t.optional(t.number),
	feedRowNumber = t.optional(t.number),
	heroUnitId = t.optional(t.string),
	loadSource = t.optional(t.string),
	launchData = t.optional(t.string),
	sortSubId = if not FFlagLuaAppAddSubIdToHomeEvents then nil else t.optional(t.string),
	tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t.string,
	analyticsData = if not FFlagLuaAppLogOmniAnalyticsData then nil else t.optional(t.table)
})
local v26 = t.strictInterface({
	placeId = t.string,
	rootPlaceId = t.number,
	universeId = t.string,
	sortEntryIndex = t.string,
	gameSetTypeId = t.string,
	sortIndex = t.number,
	rowOnPage = t.optional(t.number),
	topicDataPosition = t.optional(t.number),
	nativeAdData = t.optional(t.string),
	pageName = t.optional(t.string),
	launchData = if not FFlagLuaAppEnableCustomSpawnSearch then nil else t.optional(t.string),
	tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t.string
})
local v27 = t.strictInterface({
	placeId = t.string,
	rootPlaceId = t.number,
	joinAttemptId = t.optional(t.string),
	friendId = t.string
})
local v28 = t.strictInterface({
	placeId = t.string,
	rootPlaceId = t.number,
	joinAttemptId = t.optional(t.string),
	friendId = t.string
})
local v29 = t.strictInterface({
	placeId = t.string,
	rootPlaceId = t.number,
	joinAttemptId = t.optional(t.string),
	conversationId = t.optional(t.string)
})
local v30 = t.strictInterface({
	placeId = t.union(t.string, t.number),
	rootPlaceId = t.union(t.number, t.string),
	linkId = t.string,
	linkType = t.string,
	linkStatus = t.string,
	joinAttemptId = t.optional(t.string)
})
local v31 = t.strictInterface({
	friendId = t.string,
	pageName = t.string,
	placeId = t.optional(t.string),
	rootPlaceId = t.optional(t.string),
	joinAttemptId = t.string
})
local v32 = t.strictInterface({
	placeId = t.string,
	rootPlaceId = t.number,
	universeId = t.string,
	referralSource = t.string,
	sortIndex = t.string,
	sortEntryIndex = t.string,
	gameSetTypeId = t.string,
	gameSetTargetId = t.optional(t.number),
	topicDataPosition = t.optional(t.number),
	nativeAdData = t.optional(t.string),
	pageName = t.optional(t.string),
	tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else t.string
})
local v33 = if not FFlagEnableInGameExitModalNextUpUi then nil else t.strictInterface({
	placeId = t.string,
	rootPlaceId = t.number,
	universeId = t.string,
	sortEntryIndex = t.string,
	gameSetTypeId = t.string,
	joinAttemptId = t.string
})
local v34 = if not FFlagTraversalHistoryDiscoveryTelemetry then nil else t.strictInterface({
	placeId = t.string,
	universeId = t.string,
	sortEntryIndex = t.string
})
local t3 = {
	PlayButton = v24,
	[Constants.Context.ExperienceTile] = v25,
	[Constants.Context.SearchExperienceTile] = v26,
	[Constants.Context.PeopleListInHomePage] = v27,
	[Constants.Context.GamePlayIntentInPlacesList] = v28,
	shareLinks = v30,
	PlayGameFromPlayTogether = v23,
	PlayGameFromLinkCard = v29,
	[Constants.Context.PlayerContextualMenu] = v31,
	[Constants.Context.HoldToPlayLauncher] = v32,
	[Constants.Context.InExpHistoryTile] = if not FFlagTraversalHistoryDiscoveryTelemetry then nil else v34,
	InGameExitPage = if not FFlagEnableInGameExitModalNextUpUi then nil else v33
}

return function(p1, s1: string, p2) -- line: 214
	-- upvalues: t3 (copy), DiscoveryEventErrorLogger (copy), FFlagLuaAppLogOmniAnalyticsData (copy), HttpService (copy), FFlagLuaAppGamePlayIntentEventMobileAdsId (copy), AppStorageService (copy), FFlagLuaAppMigrateGameEventsTelemetryService (copy), FFlagLuaAppAddSubIdToHomeEvents (copy), FFlagLuaAppTwoByOneTileTelemetryFix (copy), Cryo (copy), TelemetryService (copy), t1 (ref), FFlagLuaAppGameEventsTelemetryServiceShadowTraffic (copy), t2 (ref)
	if t3[s1] ~= nil then
		local v41, v42 = t3[s1](p2)

		if not v41 then
			DiscoveryEventErrorLogger.reportError("GamePlayIntentInvalidInterface", v42)
		end
	else
		DiscoveryEventErrorLogger.reportError("GamePlayIntentMissingInterface", `Missing interface for eventContext { s1 } to type check gamePlayIntent event parameters`, {
			eventContext = s1
		})
	end

	local v43 = if not FFlagLuaAppLogOmniAnalyticsData then nil else p2.analyticsData

	if not p2.interactionUuid then
		p2.interactionUuid = HttpService:GenerateGUID(false)
	end

	if not p2.contentType then
		p2.contentType = "Game"
	end

	if not p2.actionType then
		p2.actionType = "PlayButtonClick"
	end

	if FFlagLuaAppGamePlayIntentEventMobileAdsId then
		local Item = AppStorageService:GetItem("MobileAdvertisingId")

		if Item and Item ~= "" then
			p2.mobileAdvertisingId = Item
		end
	end

	if FFlagLuaAppMigrateGameEventsTelemetryService then
		local t4 = {
			placeId = p2.placeId,
			rootPlaceId = p2.rootPlaceId,
			universeId = p2.universeId,
			referralSource = p2.referralSource,
			sortIndex = p2.sortIndex,
			sortEntryIndex = p2.sortEntryIndex,
			gameSetTypeId = p2.gameSetTypeId,
			gameSetTargetId = p2.gameSetTargetId,
			linkId = p2.linkId,
			linkType = p2.linkType,
			linkStatus = p2.linkStatus,
			conversationId = p2.conversationId,
			joinAttemptId = p2.joinAttemptId,
			friendId = p2.friendId,
			pageName = p2.pageName,
			rowOnPage = p2.rowOnPage,
			appliedFilters = p2.appliedFilters,
			topicDataPosition = p2.topicDataPosition,
			nativeAdData = p2.nativeAdData,
			interactionUuid = p2.interactionUuid,
			contentType = p2.contentType,
			actionType = p2.actionType,
			positionInRow = p2.positionInRow,
			rowNumber = p2.rowNumber,
			feedRowNumber = p2.feedRowNumber,
			heroUnitId = p2.heroUnitId,
			mobileAdvertisingId = if not FFlagLuaAppGamePlayIntentEventMobileAdsId then nil else p2.mobileAdvertisingId,
			loadSource = p2.loadSource,
			launchData = if not p2.launchData then nil else p2.launchData,
			sortSubId = if not FFlagLuaAppAddSubIdToHomeEvents then nil else p2.sortSubId,
			tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else p2.tileType
		}

		if FFlagLuaAppLogOmniAnalyticsData and v43 then
			t4 = Cryo.Dictionary.join(v43, t4)
		end

		TelemetryService:LogEvent(t1, {
			eventContext = s1,
			standardizedFields = {
				"addSessionInfo",
				"addSessionId",
				"addOSInfo"
			},
			customFields = t4
		})
	else
		local t5 = {
			placeId = p2.placeId,
			rootPlaceId = p2.rootPlaceId,
			universeId = p2.universeId,
			referralSource = p2.referralSource,
			sortIndex = p2.sortIndex,
			sortEntryIndex = p2.sortEntryIndex,
			gameSetTypeId = p2.gameSetTypeId,
			gameSetTargetId = p2.gameSetTargetId,
			linkId = p2.linkId,
			linkType = p2.linkType,
			linkStatus = p2.linkStatus,
			conversationId = p2.conversationId,
			joinAttemptId = p2.joinAttemptId,
			friendId = p2.friendId,
			pageName = p2.pageName,
			rowOnPage = p2.rowOnPage,
			appliedFilters = p2.appliedFilters,
			topicDataPosition = p2.topicDataPosition,
			nativeAdData = p2.nativeAdData,
			interactionUuid = p2.interactionUuid,
			contentType = p2.contentType,
			actionType = p2.actionType,
			positionInRow = p2.positionInRow,
			rowNumber = p2.rowNumber,
			feedRowNumber = p2.feedRowNumber,
			heroUnitId = p2.heroUnitId,
			mobileAdvertisingId = if not FFlagLuaAppGamePlayIntentEventMobileAdsId then nil else p2.mobileAdvertisingId,
			loadSource = p2.loadSource,
			launchData = if not p2.launchData then nil else p2.launchData,
			sortSubId = if not FFlagLuaAppAddSubIdToHomeEvents then nil else p2.sortSubId,
			tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else p2.tileType
		}

		if FFlagLuaAppLogOmniAnalyticsData and v43 then
			t5 = Cryo.Dictionary.join(v43, t5)
		end

		p1:sendEventDeferred(s1, "gamePlayIntent", t5)
	end

	if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
		TelemetryService:LogEvent(t2, {
			eventContext = s1,
			standardizedFields = {
				"addSessionInfo",
				"addSessionId",
				"addOSInfo"
			},
			customFields = {
				placeId = p2.placeId,
				rootPlaceId = p2.rootPlaceId,
				universeId = p2.universeId,
				referralSource = p2.referralSource,
				sortIndex = p2.sortIndex,
				sortEntryIndex = p2.sortEntryIndex,
				gameSetTypeId = p2.gameSetTypeId,
				gameSetTargetId = p2.gameSetTargetId,
				linkId = p2.linkId,
				linkType = p2.linkType,
				linkStatus = p2.linkStatus,
				conversationId = p2.conversationId,
				joinAttemptId = p2.joinAttemptId,
				friendId = p2.friendId,
				pageName = p2.pageName,
				rowOnPage = p2.rowOnPage,
				appliedFilters = p2.appliedFilters,
				topicDataPosition = p2.topicDataPosition,
				nativeAdData = p2.nativeAdData,
				interactionUuid = p2.interactionUuid,
				contentType = p2.contentType,
				actionType = p2.actionType,
				positionInRow = p2.positionInRow,
				rowNumber = p2.rowNumber,
				feedRowNumber = p2.feedRowNumber,
				heroUnitId = p2.heroUnitId,
				mobileAdvertisingId = if not FFlagLuaAppGamePlayIntentEventMobileAdsId then nil else p2.mobileAdvertisingId,
				loadSource = p2.loadSource,
				launchData = if not p2.launchData then nil else p2.launchData,
				sortSubId = if not FFlagLuaAppAddSubIdToHomeEvents then nil else p2.sortSubId,
				tileType = if not FFlagLuaAppTwoByOneTileTelemetryFix then nil else p2.tileType
			}
		})
	end
end
