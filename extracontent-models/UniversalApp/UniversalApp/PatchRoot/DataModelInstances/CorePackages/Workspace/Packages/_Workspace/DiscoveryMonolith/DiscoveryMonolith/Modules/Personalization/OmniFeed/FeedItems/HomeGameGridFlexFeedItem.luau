local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local DiscoveryMonolithParent = DiscoveryMonolith.Parent
local React = require(DiscoveryMonolithParent.React)
local Cryo = require(DiscoveryMonolithParent.Cryo)
local useSelector = require(DiscoveryMonolithParent.RoactUtils).Hooks.RoactRodux.useSelector
local dependencyArray = require(DiscoveryMonolithParent.RoactUtils).Hooks.dependencyArray
local FormFactor = require(DiscoveryMonolithParent.FormFactor).Enums.FormFactor
local AppPage = require(DiscoveryMonolithParent.RobloxAppEnums).AppPage
local parseBooleanString = require(DiscoveryMonolithParent.DiscoveryUtils).parseBooleanString

require(DiscoveryMonolithParent.GameCollections)

local GameCollectionGrid = require(DiscoveryMonolithParent.GameCollections).GameCollectionGrid
local GameCollectionItemBuilder = require(DiscoveryMonolithParent.GameCollections).GameCollectionItemBuilder
local GameCollectionItemTypes = require(DiscoveryMonolithParent.GameCollections).GameCollectionItemTypes
local PlaceholderGameGrid = require(DiscoveryMonolithParent.GameCollections).PlaceholderGameGrid
local CollectionViews = require(DiscoveryMonolithParent.CollectionViews)
local DiscoveryTypes = require(DiscoveryMonolithParent.DiscoveryTypes)
local OmniFeedConstants = DiscoveryTypes.OmniFeedConstants
local useAppPolicy = require(DiscoveryMonolithParent.UniversalAppPolicy).useAppPolicy

require(DiscoveryMonolithParent.GameTile)

local getGameTileCollectionItemSize = require(DiscoveryMonolithParent.GameTile).getGameTileCollectionItemSize
local useUiModeInfo = require(DiscoveryMonolithParent.RobloxAppHooks).useUiModeInfo
local UiMode = require(DiscoveryMonolithParent.RobloxAppEnums).UiMode
local TopicContentsReducer = require(DiscoveryMonolithParent.TopicContentsRodux).TopicContentsReducer
local getSduiFeedStore = require(DiscoveryMonolithParent.ServerDrivenUi).getSduiFeedStore
local Signals = require(DiscoveryMonolithParent.Signals)
local SignalsReact = require(DiscoveryMonolithParent.SignalsReact)
local LoggingProtocol = require(DiscoveryMonolithParent.LoggingProtocol)
local default = LoggingProtocol.default
local DiscoveryEventErrorLogger = require(DiscoveryMonolithParent.DiscoveryUtils).DiscoveryEventErrorLogger
local Modules = DiscoveryMonolith.Modules
local useUpdateFeedItemRenderedRows = require(Modules.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows)
local useGridFlexFeedItemBounds = require(Modules.Personalization.OmniFeed.useGridFlexFeedItemBounds)
local OmniFeedProps = require(Modules.Personalization.OmniFeed.OmniFeedProps)
local v32 = game:DefineFastInt("GameGridFlexFeedItemTileNumPerFeed", 30)
local FIntLuaAppDelayImpressionsMaxUpdates = require(DiscoveryMonolithParent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local v34 = game:DefineFastFlag("FixPlaceholderGameGrid", false)
local FFlagLuaAppRfySignalApportioning = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppRfySignalApportioning
local FFlagLuaAppRfySignalApportioningIxp = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppRfySignalApportioningIxp
local FFlagLuaAppEnableWhyThisAdModal = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal
local FFlagLuaAppFixHomeGridPlaceholderFlowIssues = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppFixHomeGridPlaceholderFlowIssues
local v39 = game:DefineFastFlag("LuaAppAddPlaceholderRecoveryCounter", false)
local FFlagLuaAppEnableHomepageTwoByOneTile = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile
local FFlagLuaAppEnableSponsoredReportAd = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppAddRequestIdToRfySignalApportioning = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local FFlagLuaAppSupportAdRatingFooter = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppSupportAdRatingFooter
local FFlagLuaAppSupportAdRatingFooterExperiment = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment
local FFlagLuaAppCompositionSupport = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppCompositionSupport
local FFlagLuaAppCompositionAlways = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = require(DiscoveryMonolithParent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagRemoveDependencyArrayAntipattern = require(DiscoveryMonolithParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local GAME_CAROUSEL_SIDE_COMPACT_PADDING = DiscoveryTypes.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAME_CAROUSEL_SIDE_WIDE_PADDING = DiscoveryTypes.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING
local v52 = if not FFlagLuaAppEnableHomepageTwoByOneTile then nil else {}
local u53 = not FFlagLuaAppRfySignalApportioning and nil
local u54 = not FFlagLuaAppRfySignalApportioning and nil

return function(t1: {[any]: any}) -- line: 90
	-- upvalues: OmniFeedProps (copy), OmniFeedConstants (copy), parseBooleanString (copy), FFlagLuaAppRfySignalApportioningIxp (copy), FFlagLuaAppEnableWhyThisAdModal (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppSupportAdRatingFooter (copy), FFlagLuaAppSupportAdRatingFooterExperiment (copy), FFlagLuaAppRfySignalApportioning (copy), FFlagLuaAppCompositionAlways (copy), FFlagLuaAppCompositionSupport (copy), AppPage (copy), getGameTileCollectionItemSize (copy), CollectionViews (copy), getSduiFeedStore (copy), React (copy), SignalsReact (copy), useAppPolicy (copy), useUiModeInfo (copy), UiMode (copy), useSelector (copy), TopicContentsReducer (copy), v32 (copy), useGridFlexFeedItemBounds (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), v52 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), Signals (copy), DiscoveryEventErrorLogger (copy), Cryo (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), GameCollectionItemTypes (copy), GameCollectionItemBuilder (copy), useUpdateFeedItemRenderedRows (copy), FFlagLuaAppFixHomeGridPlaceholderFlowIssues (copy), u53 (ref), default (copy), LoggingProtocol (copy), v39 (copy), u54 (ref), GameCollectionGrid (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FormFactor (copy), GAME_CAROUSEL_SIDE_COMPACT_PADDING (copy), GAME_CAROUSEL_SIDE_WIDE_PADDING (copy), FIntLuaAppDelayImpressionsMaxUpdates (copy), FFlagLuaAppHomeTouchAutoplay (copy), PlaceholderGameGrid (copy), v34 (copy)
	local verticalScrollingFrameRef = t1[OmniFeedProps.key].verticalScrollingFrameRef
	local v57 = nil
	local v58 = nil
	local v59 = nil
	local v60 = nil
	local s1 = "Narrow"
	local v62 = nil
	local v63 = nil
	local v64 = nil
	local v65 = nil
	local v66 = nil
	local v67 = nil
	local v68 = nil
	local v69 = nil
	local v70 = nil
	local v71 = nil
	local v72 = nil
	local v73 = nil

	if t1.topicLayoutData then
		v59 = t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]

		if v59 then
			if v59 == OmniFeedConstants.ComponentTypeDataKeys.EventTile then
				s1 = "Event"
			elseif v59 == OmniFeedConstants.ComponentTypeDataKeys.GridTile then
				s1 = "Wide"
			end

			v57 = s1 == "Wide" or s1 == "Event"
		end

		v58 = t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PlayerCountStyle]
		v60 = t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PlayButtonStyle]
		v62 = parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HideTileMetadata])
		v63 = parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HideTileTitle])
		v64 = parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ContainedTile])
		v65 = parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableExplicitFeedback])
		v66 = if not FFlagLuaAppRfySignalApportioningIxp then nil else parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableSignalApportioning])
		v67 = if not FFlagLuaAppEnableWhyThisAdModal then nil else t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.SponsoredUserCohort]
		v68 = parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableSponsoredFeedback])
		v69 = if not FFlagLuaAppEnableSponsoredReportAd then nil else parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableReportAd])
		v70 = if not FFlagLuaAppSupportAdRatingFooter then nil else parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.IsSponsoredRatingFooterAllowed])

		if FFlagLuaAppSupportAdRatingFooterExperiment then
			v71 = t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.SponsoredFooterAdLabelText]
			v72 = parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.SponsoredFooterAdLabelFirst])
			v73 = parseBooleanString(t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.SponsoredFooterIncludeRatingContent])
		end
	end

	local v74 = nil

	if t1.topicLayoutData then
		local v75 = t1.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.IsSponsoredFooterAllowed]

		v74 = v75 ~= nil and v75 == "true"
	end

	local v76 = FFlagLuaAppRfySignalApportioning and (not FFlagLuaAppRfySignalApportioningIxp or v66)
	local appPage = t1[OmniFeedProps.key].appPage
	local v78 = not not FFlagLuaAppCompositionAlways or if not FFlagLuaAppCompositionSupport then nil else t1[OmniFeedProps.key].appCompositionEnabled

	assert(appPage == AppPage.Home, "component only supports the Home Page")

	local feedItemStartRow = t1[OmniFeedProps.key].feedItemStartRow
	local topicId = t1.topicId
	local feedItemPosition = t1[OmniFeedProps.key].feedItemPosition
	local sortIndex = t1.sortIndex
	local v83 = t1.topicName or ""
	local numberOfRows = t1.numberOfRows
	local v85 = if not FFlagLuaAppRfySignalApportioning then nil else t1[OmniFeedProps.key].sduiContext
	local u86 = nil
	local v87 = nil

	if FFlagLuaAppCompositionSupport then
		u86 = getGameTileCollectionItemSize(s1)
		v87 = CollectionViews.useCollectionLayout(u86)
	end

	local v88 = if not FFlagLuaAppRfySignalApportioning then nil else getSduiFeedStore(appPage)
	local u89 = nil
	local v90 = nil

	if not FFlagLuaAppCompositionAlways then
		if FFlagLuaAppRfySignalApportioning then
			if not FFlagLuaAppCompositionSupport then
				u86 = getGameTileCollectionItemSize(s1)
			end

			local v91 = React.useCallback(function(p1) -- line: 207
				-- upvalues: v85 (copy), u86 (ref)
				return v85.getPageLayoutConfig(u86)(p1).numColumns
			end, {
				u86,
				v85.getPageLayoutConfig
			})

			u89 = SignalsReact.useSignalState(v91)
		else
			local v92

			v92, v90 = React.useState(1)
			u89 = v92
		end
	end

	if v78 then
		u89 = v87.itemsPerRow
	end

	local v93 = useAppPolicy(function(p2) -- line: 220
		return p2.useGridPageLayout()
	end)

	if useUiModeInfo().uiMode ~= UiMode.TenFoot then
	end

	if v93 then
	end

	local v94 = useSelector(function(p3) -- line: 228
		return p3.FormFactor
	end)
	local v95 = useSelector(function(p4) -- line: 232
		-- upvalues: TopicContentsReducer (copy)
		return p4.Personalization[TopicContentsReducer.key]
	end)
	local v96 = useSelector(function(p5) -- line: 236
		-- upvalues: appPage (copy)
		local v111 = p5.OmniRecommendations[appPage]

		if v111 then
			return v111.sorts
		end

		return {}
	end)
	local v97 = if not numberOfRows or not (numberOfRows > 0) then math.floor(v32 / u89) else numberOfRows
	local v98 = if not FFlagLuaAppRfySignalApportioning or FFlagLuaAppRfySignalApportioningIxp then useGridFlexFeedItemBounds(t1.topicId, feedItemPosition, u89, v97, if not FFlagLuaAppEnableHomepageTwoByOneTile then nil else v95 and (not not v95[topicId] and v95[topicId].entries) or v52) else nil
	local v99 = nil

	if FFlagLuaAppRfySignalApportioning then
		local u100 = v97 or 99999

		if u100 == -1 then
			u100 = 99999
		end

		React.useEffect(function() -- line: 268
			-- upvalues: u89 (ref), u100 (ref), v88 (copy), t1 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy)
			local v112 = u89 * u100

			v88.updateApportioningCapacity(t1.topicId, t1.sortIndex, v112, if not FFlagLuaAppAddRequestIdToRfySignalApportioning then nil else t1.recommendationsRequestId)
		end, {
			u89,
			u100,
			t1.topicId,
			t1.sortIndex,
			v88,
			if not FFlagLuaAppAddRequestIdToRfySignalApportioning then nil else t1.recommendationsRequestId
		})

		local v101 = React.useMemo(function() -- line: 288
			-- upvalues: Signals (copy), v88 (copy), t1 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), DiscoveryEventErrorLogger (copy), Cryo (copy)
			return Signals.createComputed(function(p6) -- line: 289
				-- upvalues: v88 (copy), t1 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), DiscoveryEventErrorLogger (copy), Cryo (copy)
				local v128 = v88.getApportionedItems(t1.topicId, t1.sortIndex, (if not FFlagLuaAppAddRequestIdToRfySignalApportioning then nil else t1.recommendationsRequestId))(p6)

				if not v128 then
					return nil
				end

				local v129 = v88.getSingleGridApportioningMetadata(t1.topicId, t1.sortIndex, (if not FFlagLuaAppAddRequestIdToRfySignalApportioning then nil else t1.recommendationsRequestId))(p6)
				local v130 = v129 and v129.startingItemIndex

				if not v130 and #v128 > 0 then
					DiscoveryEventErrorLogger.reportError("HomeGameGridRenderingWithMissingStartingItemIndex", "Starting item index not found in apportioning data for topicId {props.topicId} and sortIndex {props.sortIndex}, defaulting to 1", {
						topicId = t1.topicId,
						sortIndex = t1.sortIndex
					})
				end

				local t2 = {}

				for v132, v133 in v128 do
					table.insert(t2, (Cryo.Dictionary.join(v133, {
						topicContentsIndex = (v130 or 1) + v132 - 1
					})))
				end

				return t2
			end)
		end, {
			v88,
			t1.topicId,
			t1.sortIndex,
			if not FFlagLuaAppAddRequestIdToRfySignalApportioning then nil else t1.recommendationsRequestId
		})

		v99 = SignalsReact.useSignalState(v101)
	end

	local v102 = if not FFlagLuaAppRfySignalApportioning or FFlagLuaAppRfySignalApportioningIxp then React.useMemo(function() -- line: 339
		-- upvalues: topicId (copy), v95 (copy), FFlagLuaAppEnableHomepageTwoByOneTile (copy), v98 (copy), Cryo (copy)
		local v113 = nil

		if topicId then
			v113 = v95 and v95[topicId] or nil
		end

		local v114 = v113 and v113.entries or {}

		if v113 and v113.hasMoreRows then
			warn(`HomeGameGridFlexFeedItem may need to fetch more metadata for topicId { topicId }`)
		end

		local t3 = {}

		if FFlagLuaAppEnableHomepageTwoByOneTile then
			local v116 = v98 and v98.entryIndices
			local v117 = v98 and v98.firstIndex or 1

			if v116 then
				for i, v in ipairs(v116) do
					local v120 = v114[v]

					if v120 then
						table.insert(t3, Cryo.Dictionary.join(v120, {
							topicContentsIndex = v117 + i - 1
						}))
					end
				end

				return t3
			end
		else
			local v121 = v98 and v98.firstIndex or nil

			if v121 ~= nil then
				local v122 = v121 + (v98 and v98.numberOfTiles or 0)

				while v121 <= #v114 and v121 < v122 do
					table.insert(t3, (Cryo.Dictionary.join(v114[v121], {
						topicContentsIndex = v121
					})))
					v121 += 1
				end
			end
		end

		return t3
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(topicId, v95, v96, v98) else {
		topicId,
		v95,
		v96,
		v98
	}) else nil
	local v104

	if FFlagLuaAppEnableHomepageTwoByOneTile then
		local v103 = if not v76 then v102 else v99

		v104 = React.useMemo(function() -- line: 393
			-- upvalues: v103 (copy), GameCollectionItemTypes (copy), GameCollectionItemBuilder (copy), u89 (ref), appPage (copy), sortIndex (copy), topicId (copy)
			if not v103 then
				return v103
			end

			local t4 = {}
			local t5 = {}

			for v125, v126 in v103 do
				if v126.componentType == GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile then
					t4[v125] = {
						colSpan = 2,
						rowSpan = 1,
						alignmentType = v126.alignmentType,
						minRowPadding = tonumber(v126.minRowPadding) or 0
					}
					t5[v125] = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
				end
			end

			return GameCollectionItemBuilder.BuildCollectionEntries(v103, u89, t4, t5, nil, appPage, sortIndex, topicId)
		end, {
			v103,
			u89,
			appPage,
			sortIndex,
			topicId
		})
	else
		v104 = if not v76 then v102 else v99
	end

	local v105 = nil

	if v76 and v104 or not v76 and v98 then
		v105 = math.ceil(#v104 / u89)
	end

	useUpdateFeedItemRenderedRows(appPage, nil, feedItemPosition, if not FFlagLuaAppFixHomeGridPlaceholderFlowIssues then v105 else v105 or -1)

	if (not v76 or v104) and #v104 > 0 then
		if FFlagLuaAppRfySignalApportioning and u53 then
			default:logRobloxTelemetryCounter({
				eventName = "HomeGameGridReturnedGridAfterNil",
				backends = { LoggingProtocol.TelemetryBackends.Counter }
			}, 1, {
				experimentTreatment = if v66 ~= true then v66 ~= false and "not_in_experiment" or "control" else "signal_apportioning_treatment"
			})
			u53 = false
		end

		if v39 and u54 then
			default:logRobloxTelemetryCounter({
				eventName = "HomeGameGridReturnedGridAfterPlaceholder",
				backends = { LoggingProtocol.TelemetryBackends.Counter }
			}, 1, {
				experimentTreatment = if v66 ~= true then v66 ~= false and "not_in_experiment" or "control" else "signal_apportioning_treatment"
			})
			u54 = false
		end

		return React.createElement(GameCollectionGrid, {
			entries = v104,
			title = v83,
			friendFooterEnabled = true,
			sortIndex = sortIndex,
			gameSortId = topicId,
			pageContext = appPage,
			onTileImageLoaded = if not FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then nil else t1[OmniFeedProps.key].onTileImageLoaded,
			scrollViewPositionChangedSignal = t1[OmniFeedProps.key].scrollViewPositionChangedSignal,
			onItemsPerRowChanged = if not v78 then v90 else nil,
			useGridTiles = v57,
			playerCountStyle = v58,
			isSponsoredFooterAllowed = v74,
			componentType = v59,
			gameTileLayoutType = s1,
			gridSupportAllowed = true,
			isHoverSupportEnabled = true,
			verticalScrollingFrameRef = verticalScrollingFrameRef,
			startRow = feedItemStartRow,
			maxNumRows = if not numberOfRows or not (numberOfRows > 0) then nil else numberOfRows,
			playButtonStyle = v60,
			sideMargin = if not v78 then if v94 ~= FormFactor.COMPACT then GAME_CAROUSEL_SIDE_WIDE_PADDING else GAME_CAROUSEL_SIDE_COMPACT_PADDING else nil,
			appCompositionEnabled = if not FFlagLuaAppCompositionSupport then nil else v78,
			shouldHideTileMetadata = v62,
			shouldHideTileTitle = v63,
			containedTile = v64,
			numUpdatesToDelayImpressions = FIntLuaAppDelayImpressionsMaxUpdates,
			selectionOrderBase = t1[OmniFeedProps.key].selectionOrderBase,
			enableExplicitFeedback = v65,
			sponsoredUserCohort = if not FFlagLuaAppEnableWhyThisAdModal then nil else v67,
			enableSponsoredFeedback = v68,
			enableReportAd = if not FFlagLuaAppEnableSponsoredReportAd then nil else v69,
			isSponsoredRatingFooterAllowed = if not FFlagLuaAppSupportAdRatingFooter then nil else v70,
			sponsoredFooterAdLabelText = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else v71,
			sponsoredFooterAdLabelFirst = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else v72,
			sponsoredFooterIncludeRatingContent = if not FFlagLuaAppSupportAdRatingFooterExperiment then nil else v73,
			videoPlaybackContext = if not FFlagLuaAppHomeTouchAutoplay then nil else t1[OmniFeedProps.key].videoPlaybackContext
		})
	end

	if v76 and v104 == nil or not v76 and v98 == nil then
		if FFlagLuaAppRfySignalApportioning and not u54 then
			default:logRobloxTelemetryCounter({
				eventName = "HomeGameGridReturnedPlaceholder",
				backends = { LoggingProtocol.TelemetryBackends.Counter }
			}, 1, {
				experimentTreatment = if v66 ~= true then v66 ~= false and "not_in_experiment" or "control" else "signal_apportioning_treatment"
			})
			u54 = true
		end

		return (React.createElement(PlaceholderGameGrid, {
			title = v83,
			onItemsPerRowChanged = if not v78 then v90 else nil,
			appCompositionEnabled = if not FFlagLuaAppCompositionSupport then nil else v78,
			useGridTiles = v57,
			componentType = v59,
			gameTileLayoutType = s1,
			gridSupportAllowed = true,
			isHoverSupportEnabled = true,
			numRows = if not v34 then numberOfRows or 0 else v97,
			sideMargin = if not v78 then if v94 ~= FormFactor.COMPACT then GAME_CAROUSEL_SIDE_WIDE_PADDING else GAME_CAROUSEL_SIDE_COMPACT_PADDING else nil,
			verticalScrollingFrameRef = verticalScrollingFrameRef,
			shouldHideTileMetadata = v62,
			shouldHideTileTitle = v63,
			containedTile = v64
		}))
	end

	if FFlagLuaAppRfySignalApportioning and not u53 then
		default:logRobloxTelemetryCounter({
			eventName = "HomeGameGridReturnedNil",
			backends = { LoggingProtocol.TelemetryBackends.Counter }
		}, 1, {
			experimentTreatment = if v66 ~= true then v66 ~= false and "not_in_experiment" or "control" else "signal_apportioning_treatment"
		})
		u53 = true
	end

	return nil
end
