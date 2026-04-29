local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local Cryo = require(CorePackages.Packages.Cryo)
local tutils = require(CorePackages.Packages.tutils)
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector

require(CorePackages.Workspace.Packages.AppCommonLib)

local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local useTokens = require(CorePackages.Packages.Foundation).Hooks.useTokens
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local useWidgetListInfoViewModel = AvatarExperienceCatalog.Components.ResultsList.useWidgetListInfoViewModel
local WidgetListBreakPointEnum = AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlags.FFlagAXLookAndFeelBackgrounds
local AvatarExperienceCommon2 = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local getIterator = require(Modules.AvatarExperience.Common.Util.getIterator)
local OrganicContentRow = require(Modules.AvatarExperience.Common.Components.OrganicContentRow)
local CatalogGridWidget = require(Modules.AvatarExperience.Common.Components.Widgets.CatalogGridWidget)
local useLocalWidgets = require(Modules.AvatarExperience.Common.Hooks.useLocalWidgets)
local useHandleThumbnailsLoaded = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useHandleThumbnailsLoaded)
local selectFilterCount = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)

require(Modules.AvatarExperience.Common.Components.WidgetList.Types)

local WidgetListResultsHeader = require(Modules.AvatarExperience.Common.Components.WidgetList.Components.WidgetListResultsHeader)
local WidgetListSpacer = require(Modules.AvatarExperience.Common.Components.WidgetList.Components.WidgetListSpacer)
local WidgetListLoadMoreButton = require(Modules.AvatarExperience.Common.Components.WidgetList.Components.WidgetListLoadMoreButton)
local WidgetConstants = AvatarExperienceCatalog.WidgetConstants

require(Modules.AvatarExperience.Catalog.SearchTypes)

local getOrganicResultIdsFromEntries = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getOrganicResultIdsFromEntries)
local getEntriesAsRows = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getEntriesAsRows)
local getWidgetItemIdsFromWidgetInfo = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getWidgetItemIdsFromWidgetInfo)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local useTileLatencyTracker = require(Modules.AvatarExperience.Common.Hooks.TileLatency.useTileLatencyTracker)
local useTileLoadingLatencyInitializer = require(Modules.AvatarExperience.Common.Hooks.TileLatency.useTileLoadingLatencyInitializer)
local useGetHydratedWidgets = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.useGetHydratedWidgets)
local GetFFlagEnableCatalogTileLoadingLatency = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local AXCatalogPerfReduxReductionIXP = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)
local AXRecentlyViewedSearchItemsIXPTest = AvatarExperienceCommon.Experiments.AXRecentlyViewedSearchItemsIXPTest
local v41 = game:DefineFastFlag("AXUseRendererInfoConditionalHookBacktraceError", false)
local GetFFlagEnableDecreaseWidgetPaddingSizing = require(Modules.AvatarExperience.Flags.GetFFlagEnableDecreaseWidgetPaddingSizing)
local GetFIntWidgetPaddingSizing = require(Modules.AvatarExperience.Flags.GetFIntWidgetPaddingSizing)
local Utils = AvatarExperienceCatalog.Utils
local getUseSelectorDeepEquals = AvatarExperienceCommon2.Utils.getUseSelectorDeepEquals
local useGetCurrentCategoryNames = require(Modules.AvatarExperience.Catalog.Hooks.useGetCurrentCategoryNames)
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlags.FFlagAXCatalogCategoriesStoreImprovePerf
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local useSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local FFlagAXPassScreenSizeToWidgetApi = AvatarExperienceFlags.FFlagAXPassScreenSizeToWidgetApi
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlags.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXEnableMilestoneTrackingForAvatarExperience = AvatarExperienceFlags.FFlagAXEnableMilestoneTrackingForAvatarExperience
local WidgetsPercievedTTIManager = require(CorePackages.Workspace.Packages.AvatarExperienceTTIPerformance).WidgetsPercievedTTIManager

local function getBreakpointFromRowWidth(n1: number?, n2: number?) -- line: 146
	-- upvalues: WidgetListBreakPointEnum (copy)
	local v66 = n2 or 1

	if not n1 then
		return WidgetListBreakPointEnum.Default
	end

	if n1 <= 330 * v66 then
		return WidgetListBreakPointEnum.XSmall
	end

	if n1 <= 570 * v66 then
		return WidgetListBreakPointEnum.Small
	end

	if n1 <= 654 * v66 then
		return WidgetListBreakPointEnum.Medium
	end

	if n1 <= 884 * v66 then
		return WidgetListBreakPointEnum.Large
	end

	if n1 <= 1116 * v66 then
		return WidgetListBreakPointEnum.XLarge
	end

	return WidgetListBreakPointEnum.X2Large
end
local function getRowInfoToInsertWidgets(t1: {[any]: any}, p1, t2: {[any]: any}, s1: string?, n3: number, b1: boolean) -- line: 165
	-- upvalues: tutils (copy)
	local t3 = {}
	local v75 = tutils.fieldCount(p1)

	for _, v77 in t1 do
		local v78 = v77
		local v79 = t2[tostring(v78)]

		if (not s1 or s1 == v79.id) and (v78 <= n3 or not b1) then
			local v80 = v75 + #t3

			if v80 < v78 then
				v78 = v80 + 1
			end

			table.insert(t3, {
				rowNum = v78,
				widgetInfo = v79
			})
		end
	end

	return t3
end
local function separateOrganicContentTemplatesFromWidgets(p2) -- line: 204
	-- upvalues: WidgetConstants (copy)
	local t4 = {}
	local t5 = {}

	for v84, v85 in p2 do
		if v85.type == WidgetConstants.Types.OrganicContent then
			t4[v84] = v85
		else
			t5[v84] = v85
		end
	end

	return t4, t5
end
local function selectSearchesParameters(p3) -- line: 220
	return p3.SearchesParameters
end
local function selectCategoryId(p4) -- line: 224
	return p4.AvatarExperience.Catalog.Categories.categoryId
end
local function selectSubcategoryId(p5) -- line: 228
	return p5.AvatarExperience.Catalog.Categories.subcategoryId
end
local function constructWidgetAnalyticsInfo(p6, n4: number, p7, t6: {[any]: any}, n5: number, p8: ((...any) -> ...any)?) -- line: 232
	-- upvalues: getWidgetItemIdsFromWidgetInfo (copy)
	return {
		requestId = if not p6 then nil else p6.requestId,
		widgetPosition = n4,
		widgetId = if not p6 then nil else p6.id,
		widgetType = if not p6 then nil else p6.type,
		widgetAbsPosition = (n4 - 1) * n5,
		query = if not p7 then nil else p7.searchKeyword,
		organicResultIds = t6,
		widgetItemIds = getWidgetItemIdsFromWidgetInfo(p6, n5),
		handleThumbnailsLoaded = p8
	}
end
local function constructWidgetRenderInfo(t7: {[any]: any}) -- line: 253
	-- upvalues: constructWidgetAnalyticsInfo (copy), React (copy), CatalogGridWidget (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy)
	local function u96() -- line: 255
		-- upvalues: t7 (copy)
		if t7.onWidgetFocusAcquired then
			t7.onWidgetFocusAcquired(t7.widgetInfo)
		end
	end

	local u97 = t7.focusedWidget and t7.widgetInfo.id == t7.focusedWidget
	local previewColumns = t7.widgetInfo.template.previewColumns
	local previewRows = t7.widgetInfo.template.previewRows
	local u100 = constructWidgetAnalyticsInfo(t7.widgetInfo, t7.rowIndex, t7.searchParameters, t7.organicResultIds, previewColumns)

	return {
		key = t7.key,
		render = function(_) -- line: 275
			-- upvalues: React (copy), CatalogGridWidget (copy), t7 (copy), previewColumns (ref), previewRows (ref), u100 (ref), u97 (ref), u96 (ref), FFlagAXCatalogCategoriesStoreImprovePerf (copy)
			return React.createElement(CatalogGridWidget, {
				widgetRow = t7.rowIndex,
				widgetInfo = t7.widgetInfo,
				itemsPerRow = previewColumns,
				rowCount = previewRows,
				rowHeight = t7.itemSize.Y,
				itemSize = t7.itemSize,
				ref = t7.ref,
				NextSelectionUp = t7.nextSelectionUp,
				NextSelectionDown = t7.nextSelectionDown,
				widgetAnalyticsInfo = u100,
				widgetFocused = u97,
				requestWidgetAcquireFocus = u96,
				requestWidgetReleaseFocus = t7.onWidgetFocusReleased,
				itemDetailsPeekViewRefs = t7.itemDetailsPeekViewRefs,
				gridRef = t7.gridRef,
				gamepadNavigationFocusPos = t7.gamepadNavigationFocusPos,
				setGamepadNavigationFocusPos = t7.setGamepadNavigationFocusPos,
				includeBottomDivider = t7.includeBottomDivider,
				widgetConfiguration = t7.widgetConfiguration,
				rowWidth = t7.rowWidth,
				onThumbnailLoaded = t7.onThumbnailLoaded,
				selectedCategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else t7.selectedCategory,
				selectedSubcategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else t7.selectedSubcategory,
				selectedCategoryInfo = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else t7.selectedCategoryInfo
			})
		end
	}
end
local function selectHydratedWidgetData(p10) -- line: 317
	return p10.AvatarExperience.Common.Widgets.HydratedWidgetData
end

return function(vector2: Vector2, n6: number, n7: number, s2: string, t8: {[any]: any}?, b2: boolean?, n8: number, b3: boolean?, n9: number?, n10: number?, s3: string?, p11: ((...any) -> ...any)?, p12: ((...any) -> ...any)?, b4: boolean, t9: {[any]: any}, t10: {[any]: any}, p13, p14: ((...any) -> ...any)?, p15, p16: ((...any) -> ...any), n11: number?, p17, p18, p19: ((...any) -> ...any)?, n12: number?, b5: boolean?) --[[ useRenderInfo ]] -- line: 327
	-- upvalues: React (copy), useTokens (copy), FFlagAXPassScreenSizeToWidgetApi (copy), Utils (copy), useAvatarRoute (copy), AXRecentlyViewedSearchItemsIXPTest (copy), useNavigation (copy), FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesStore (copy), useSignalState (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), useSelector (copy), selectCategoryId (copy), getUseSelectorDeepEquals (copy), selectSubcategoryId (copy), AvatarScreen (copy), WidgetConstants (copy), CatalogUtils (copy), selectSearchesParameters (copy), useWidgetListInfoViewModel (copy), getBreakpointFromRowWidth (copy), separateOrganicContentTemplatesFromWidgets (copy), selectHydratedWidgetData (copy), useGetHydratedWidgets (copy), FFlagAXEnableMilestoneTrackingForAvatarExperience (copy), WidgetsPercievedTTIManager (copy), useGetCurrentCategoryNames (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), useTileLatencyTracker (copy), selectFilterCount (copy), useLocalWidgets (copy), AXCatalogPerfReduxReductionIXP (copy), IxpUtils (copy), v41 (copy), useHandleThumbnailsLoaded (copy), useTileLoadingLatencyInitializer (copy), tutils (copy), getEntriesAsRows (copy), getOrganicResultIdsFromEntries (copy), Cryo (copy), getIterator (copy), FFlagAXLookAndFeelBackgrounds (copy), FFlagAXMoveAllTabToWidgetOnly (copy), GetFFlagEnableDecreaseWidgetPaddingSizing (copy), GetFIntWidgetPaddingSizing (copy), OrganicContentRow (copy), constructWidgetRenderInfo (copy), getRowInfoToInsertWidgets (copy), WidgetListResultsHeader (copy), Constants (copy), WidgetListLoadMoreButton (copy), WidgetListSpacer (copy)
	local v130, v131 = React.useBinding(1)
	local v132, v133 = React.useBinding(Vector2.new(1, 1))
	local v134 = useTokens()
	local v135 = if not FFlagAXPassScreenSizeToWidgetApi then (not v134 or (not v134.Config or (not v134.Config.UI or not v134.Config.UI.Scale))) and 1 or v134.Config.UI.Scale else Utils.getUIScaleFromTokens(v134)
	local v136 = useAvatarRoute()
	local v137 = if not AXRecentlyViewedSearchItemsIXPTest.isEnabled() then nil else useNavigation()
	local u138 = nil
	local u139 = nil
	local u140 = nil
	local v142, v143

	if FFlagAXCatalogCategoriesStore then
		local v141 = GetCatalogCategoriesStore.getCatalogSelectionStore()

		v142 = useSignalState(v141.selectedCategoryId)
		v143 = useSignalState(v141.selectedSubcategoryId)

		if FFlagAXCatalogCategoriesStoreImprovePerf then
			u138 = useSignalState(v141.selectedCategory)
			u139 = useSignalState(v141.selectedSubcategory)
			u140 = useSignalState(v141.selectedCategoryInfo)
		end
	else
		v142 = useSelector(selectCategoryId, getUseSelectorDeepEquals())
		v143 = useSelector(selectSubcategoryId, getUseSelectorDeepEquals())
	end

	local Context = nil

	if v136 and v136.opaque and v136.opaque.name == AvatarScreen.MySharedAvatars then
		Context = WidgetConstants.ContextWidgets.MySharedAvatars.Context
	elseif AXRecentlyViewedSearchItemsIXPTest.isEnabled() and v136 and v136.opaque and v136.opaque.name == AvatarScreen.SearchLandingFocusedWidgetPage then
		local v145 = v137.getParam("widgetType")

		Context = (WidgetConstants.ContextWidgets[v145] or {}).Context
	elseif v142 then
		Context = CatalogUtils.getContextForWidgetsById(v136.opaque.name, v142, v143)
	end

	local v146 = useSelector(selectSearchesParameters, getUseSelectorDeepEquals())[s2]
	local v147 = v146 and v146.searchKeyword ~= nil
	local v148 = if not FFlagAXPassScreenSizeToWidgetApi then useWidgetListInfoViewModel(s2, Context, (getBreakpointFromRowWidth(n12, v135))) else useWidgetListInfoViewModel(s2, Context, Utils.getBreakpointFromRowWidth(n12, v135))
	local widgets = v148.widgets
	local configuration = v148.configuration
	local v151, v152 = separateOrganicContentTemplatesFromWidgets(widgets)
	local v153 = useSelector(selectHydratedWidgetData, getUseSelectorDeepEquals())
	local v154 = useGetHydratedWidgets({
		hydratedWidgetData = v153,
		widgetInfoDetails = widgets,
		selectedWidgetIndex = 1
	})

	if FFlagAXEnableMilestoneTrackingForAvatarExperience and WidgetsPercievedTTIManager then
		local v155 = React.useRef(false)

		React.useEffect(function() -- line: 431
			-- upvalues: v155 (copy), v154 (copy), WidgetsPercievedTTIManager (copy)
			if v155.current then
				return
			end

			if not v154 or next(v154) == nil then
				return
			end

			v155.current = true
			WidgetsPercievedTTIManager.L2.primaryDataReady()
			WidgetsPercievedTTIManager.L3.responseReceived()
			WidgetsPercievedTTIManager.L3.requestFetchHydratedWidgets()
		end, { v154 })
	end

	local v156 = useGetCurrentCategoryNames()

	if GetFFlagEnableCatalogTileLoadingLatency() then
		local v157 = v154 and next(v154) ~= nil

		useTileLatencyTracker(s2, t8, v157)
	end

	local v158 = useSelector(selectFilterCount, getUseSelectorDeepEquals())
	local v159 = useLocalWidgets(s2, b2, b3)
	local v160 = if not AXCatalogPerfReduxReductionIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXCatalogPerfReduxReductionIXP.EnabledForUser)
	local u161 = if not v41 or not AXCatalogPerfReduxReductionIXP.isEnabled() then if not v160 then nil else useHandleThumbnailsLoaded() else useHandleThumbnailsLoaded()
	local v162 = React.useRef(false)
	local v163 = useTileLoadingLatencyInitializer(s2)
	local v164 = if not v162 then nil else v162.current
	local v165 = React.useCallback(function(p20) -- line: 472
		-- upvalues: v162 (copy), v154 (copy), v163 (copy)
		if v162 and (not v162.current and v154 and next(v154) ~= nil) then
			local v168 = next(v154) and select(2, next(v154))

			if v168 then
				for _, v170 in v168 do
					if p20 == tostring(v170.id) then
						v162.current = true
						v163.fireTileLoadingLatencyTracker(v163, true, true)

						return
					end
				end
			end
		end
	end, {
		v154,
		v163
	})

	return (React.useMemo(function() -- line: 494
		-- upvalues: n8 (copy), n6 (ref), configuration (ref), t8 (copy), tutils (copy), getEntriesAsRows (copy), getOrganicResultIdsFromEntries (copy), v146 (copy), Cryo (copy), v147 (copy), Context (ref), v158 (copy), getIterator (copy), v159 (copy), v152 (copy), s3 (copy), t10 (copy), React (copy), s2 (copy), b3 (copy), t9 (copy), p13 (copy), p16 (copy), p15 (copy), p14 (copy), v130 (copy), v131 (copy), v132 (copy), v133 (copy), v151 (copy), FFlagAXLookAndFeelBackgrounds (copy), FFlagAXMoveAllTabToWidgetOnly (copy), widgets (copy), GetFFlagEnableDecreaseWidgetPaddingSizing (copy), v134 (copy), GetFIntWidgetPaddingSizing (copy), v156 (copy), CatalogUtils (copy), OrganicContentRow (copy), vector2 (copy), n11 (copy), p17 (copy), p18 (copy), v160 (copy), u161 (ref), FFlagAXCatalogCategoriesStoreImprovePerf (copy), u138 (ref), u139 (ref), u140 (ref), constructWidgetRenderInfo (copy), n7 (copy), p11 (copy), p12 (copy), n12 (copy), v164 (copy), v165 (copy), getRowInfoToInsertWidgets (copy), b4 (copy), b2 (copy), WidgetListResultsHeader (copy), b5 (copy), n9 (ref), Constants (copy), p19 (copy), WidgetListLoadMoreButton (copy), WidgetListSpacer (copy), n10 (copy)
		local t11 = {}

		for _ = 1, n8 do
			table.insert(t11, {})
		end

		n6 = (not configuration or not configuration.defaultItemGroupTemplate) and 1 or (configuration.defaultItemGroupTemplate.previewColumns or 1)

		local v173 = t8 or t11
		local v174 = math.ceil(tutils.fieldCount(v173) / n6)
		local v175 = getEntriesAsRows(v173, v174, n6)
		local v176 = getOrganicResultIdsFromEntries(v173)
		local v177 = v146 and v146.categoryInfo or {}
		local u178 = not Cryo.isEmpty(v177) and v177.ShowWidgets or v147

		if Context and not v147 then
			u178 = true
		end

		if v158 > 0 then
			u178 = false
		end

		if v147 then
			u178 = Cryo.isEmpty(v177) or v177.ShowWidgets
		end

		local t12 = {}
		local n13 = 1
		local n14 = 1
		local v182 = getIterator(v159)
		local v183 = v182.getNext()

		if not s3 then
			for v184, v185 in v175 do
				while v183 and n13 == v183.row do
					local component = v183.component
					local v187 = n14
					local u188 = t10[v187 - 1]

					if v187 <= 1 then
						u188 = nil
					end

					while u178 and v152 and v152[tostring(n14)] do
						n14 += 1
					end

					t12[n13] = {
						key = "localWidget_" .. v187,
						render = function() --[[ render ]] -- line: 577
							-- upvalues: React (copy), component (copy), s2 (copy), b3 (copy), n6 (ref), t9 (copy), p13 (copy), p16 (copy), p15 (copy), p14 (copy), u188 (ref), t10 (copy), v187 (copy), v130 (copy), v131 (copy), v132 (copy), v133 (copy), configuration (ref)
							return React.createElement(component, {
								searchUuid = s2,
								fromSearch = b3,
								itemsPerRow = n6,
								itemDetailsPeekViewRefs = t9,
								gridRef = p13,
								scrollingFrameRef = p16(),
								requestImpressionsSignal = p15,
								onFocusGained = p14,
								NextSelectionUp = u188,
								NextSelectionDown = t10[v187 + 1],
								ref = t10[v187],
								rowIndex = v187,
								gamepadNavigationColumn = v130,
								setGamepadNavigationColumn = v131,
								gamepadNavigationFocusPos = v132,
								setGamepadNavigationFocusPos = v133,
								widgetConfiguration = configuration
							})
						end
					}
					n13 += 1
					n14 += 1
					v183 = v182.getNext()
				end

				while u178 and v152 and v152[tostring(n14)] do
					n14 += 1
				end

				local v189 = n14
				local u190 = v151[tostring(n14)]

				if FFlagAXLookAndFeelBackgrounds and not u190 then
					u190 = {
						template = if not configuration then {} else configuration.defaultItemGroupTemplate
					}
				end

				if not u178 then
					u190 = nil
				end

				local v191 = if FFlagAXMoveAllTabToWidgetOnly then nil else u190 and (widgets and widgets[tostring(n14 + 1)] == nil)
				local u192 = nil

				if GetFFlagEnableDecreaseWidgetPaddingSizing() then
					local t13 = {
						[32] = v134.Size.Size_800,
						[24] = v134.Size.Size_600,
						[20] = v134.Size.Size_500,
						[16] = v134.Size.Size_400
					}

					u192 = if t13[GetFIntWidgetPaddingSizing()] ~= nil then t13[GetFIntWidgetPaddingSizing()] else v134.Size.Size_800
				end

				if b3 and v156 and v156.catalogSearchCategory == "Avatars" then
					local v194, v195 = CatalogUtils.removeItemFootersFromConfigs(configuration, u190, false, true, false)

					configuration = v194
					u190 = v195
				end

				t12[n13] = {
					key = "organicContentRow_" .. v189,
					render = function(t14: {[any]: any}?) --[[ render ]] -- line: 653
						-- upvalues: React (copy), OrganicContentRow (copy), u190 (ref), configuration (ref), FFlagAXLookAndFeelBackgrounds (copy), s2 (copy), v184 (copy), v191 (copy), GetFFlagEnableDecreaseWidgetPaddingSizing (copy), u192 (ref), v134 (copy), v185 (copy), n6 (ref), vector2 (copy), b3 (copy), t9 (copy), p13 (copy), p14 (copy), v130 (copy), v131 (copy), v132 (copy), v133 (copy), t10 (copy), v189 (copy), n11 (copy), p17 (copy), p18 (copy), v160 (copy), u161 (ref), FFlagAXCatalogCategoriesStoreImprovePerf (copy), u138 (ref), u139 (ref), u140 (ref)
						return React.createElement(OrganicContentRow, {
							template = if not u190 then if not configuration then {} else configuration.defaultItemGroupTemplate else u190.template,
							titleKey = if not u190 then nil else u190.template.title,
							titleText = if not u190 then nil else u190.template.localizedTitle,
							descriptionKey = if not u190 then nil else u190.template.description,
							descriptionText = if not u190 then nil else u190.template.localizedDescription,
							cardStyle = if not FFlagAXLookAndFeelBackgrounds or not u190 then nil else u190.template.cardStyle,
							searchUuid = s2,
							entryRowIndex = v184,
							catalogRowIndex = if not t14 or not t14.index then nil else t14.index - 1,
							padding = if not u190 or v191 then {
								bottom = UDim.new(0, v134.Size.Size_400)
							} else {
								bottom = UDim.new(0, if not GetFFlagEnableDecreaseWidgetPaddingSizing() then v134.Size.Size_800 else u192)
							},
							row = v185,
							itemsPerRow = n6,
							itemSize = vector2,
							fromSearch = b3,
							itemDetailsPeekViewRefs = t9,
							gridRef = p13,
							onFocusGained = p14,
							gamepadNavigationColumn = v130,
							setGamepadNavigationColumn = v131,
							gamepadNavigationFocusPos = v132,
							setGamepadNavigationFocusPos = v133,
							NextSelectionUp = t10[v189 - 1],
							NextSelectionDown = t10[v189 + 1],
							ref = t10[v189],
							thumbnailAspectRatio = n11,
							thumbnailScaleType = p17,
							thumbnailSize = p18,
							widgetConfiguration = configuration,
							onThumbnailLoaded = if not v160 then nil else u161,
							selectedCategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u138,
							selectedSubcategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u139,
							selectedCategoryInfo = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u140
						})
					end
				}
				n13 += 1
				n14 += 1
			end
		end

		if u178 and v152 then
			local t15 = {}

			if Context and v152[Context] and s3 == v152[Context].id then
				local v197 = v152[Context]

				table.insert(t12, 1, (constructWidgetRenderInfo({
					key = "widget_" .. Context,
					ref = t10[Context],
					searchParameters = v146,
					organicResultIds = v176,
					rowIndex = 1,
					widgetInfo = v197,
					widgetsPerRow = n7,
					itemSize = vector2,
					widgetRefCache = t10,
					focusedWidget = s3,
					onWidgetFocusAcquired = p11,
					onWidgetFocusReleased = p12,
					itemDetailsPeekViewRefs = t9,
					gridRef = p13,
					gamepadNavigationFocusPos = v132,
					setGamepadNavigationFocusPos = v133,
					includeBottomDivider = false,
					widgetConfiguration = configuration,
					rowWidth = n12,
					onThumbnailLoaded = if v164 then nil else v165,
					selectedCategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u138,
					selectedSubcategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u139,
					selectedCategoryInfo = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u140
				})))
			end

			for v198, _ in v152 do
				if tonumber(v198) ~= nil then
					table.insert(t15, (tonumber(v198)))
				end
			end

			table.sort(t15)

			local v200 = getRowInfoToInsertWidgets(t15, t12, v152, s3, v174, b4)

			for v201, v202 in v200 do
				local rowNum = v202.rowNum
				local widgetInfo = v202.widgetInfo
				local v205 = v201 < #v200 and v200[v201 + 1].rowNum ~= rowNum + 1
				local v206 = v201 == #v200 and rowNum < #t12

				table.insert(t12, rowNum, (constructWidgetRenderInfo({
					key = "widget_" .. rowNum,
					ref = t10[rowNum],
					nextSelectionUp = t10[rowNum - 1],
					nextSelectionDown = t10[rowNum + 1],
					organicResultIds = v176,
					searchParameters = v146,
					rowIndex = rowNum,
					widgetInfo = widgetInfo,
					widgetsPerRow = n7,
					itemSize = vector2,
					widgetRefCache = t10,
					focusedWidget = s3,
					onWidgetFocusAcquired = p11,
					onWidgetFocusReleased = p12,
					itemDetailsPeekViewRefs = t9,
					gridRef = p13,
					gamepadNavigationFocusPos = v132,
					setGamepadNavigationFocusPos = v133,
					includeBottomDivider = v205 or v206,
					widgetConfiguration = configuration,
					rowWidth = n12,
					onThumbnailLoaded = if v164 then nil else v165,
					selectedCategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u138,
					selectedSubcategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u139,
					selectedCategoryInfo = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else u140
				})))
			end

			if FFlagAXMoveAllTabToWidgetOnly and v183 and #t12 >= 11 then
				local component = v183.component

				table.insert(t12, 11, {
					key = "localWidget_sponsored",
					render = function() --[[ render ]] -- line: 841
						-- upvalues: React (copy), component (copy), s2 (copy), b3 (copy), n6 (ref), t9 (copy), p13 (copy), p16 (copy), p15 (copy), p14 (copy), t10 (copy), v130 (copy), v131 (copy), v132 (copy), v133 (copy), configuration (ref)
						return React.createElement(component, {
							searchUuid = s2,
							fromSearch = b3,
							itemsPerRow = n6,
							itemDetailsPeekViewRefs = t9,
							gridRef = p13,
							scrollingFrameRef = p16(),
							requestImpressionsSignal = p15,
							onFocusGained = p14,
							NextSelectionUp = t10[9],
							NextSelectionDown = t10[11],
							ref = t10[10],
							rowIndex = 10,
							gamepadNavigationColumn = v130,
							setGamepadNavigationColumn = v131,
							gamepadNavigationFocusPos = v132,
							setGamepadNavigationFocusPos = v133,
							widgetConfiguration = configuration
						})
					end
				})
				v182.getNext()
			end
		end

		if b3 and b2 then
			local v208 = s3 ~= nil

			table.insert(t12, 1, {
				key = "header",
				render = function() --[[ render ]] -- line: 873
					-- upvalues: React (copy), WidgetListResultsHeader (copy), s2 (copy), v208 (copy), b5 (copy)
					return React.createElement(WidgetListResultsHeader, {
						searchUuid = s2,
						hideResultsHeader = v208,
						pillBarVisible = b5
					})
				end
			})
		else
			n9 = (n9 or 0) + Constants.WidgetListVerticalMargin
		end

		if p19 then
			local v209 = n14

			table.insert(t12, {
				key = "loadMoreButton_" .. v209,
				render = function() --[[ render ]] -- line: 892
					-- upvalues: React (copy), WidgetListLoadMoreButton (copy), p19 (copy), t10 (copy), v209 (copy)
					return React.createElement(WidgetListLoadMoreButton, {
						onActivated = p19,
						ref = t10[v209],
						NextSelectionUp = t10[v209 - 1]
					})
				end
			})
		end

		if n9 then
			table.insert(t12, 1, {
				key = "topSpacer",
				render = function() --[[ render ]] -- line: 909
					-- upvalues: React (copy), WidgetListSpacer (copy), n9 (ref)
					return React.createElement(WidgetListSpacer, {
						height = n9
					})
				end
			})
		end

		if n10 then
			table.insert(t12, {
				key = "bottomSpacer",
				render = function() --[[ render ]] -- line: 918
					-- upvalues: React (copy), WidgetListSpacer (copy), n10 (copy)
					return React.createElement(WidgetListSpacer, {
						height = n10
					})
				end
			})
		end

		return t12
	end, {
		vector2,
		n6,
		n7,
		s2,
		t8,
		b2,
		n8,
		b3,
		n9,
		n10,
		s3,
		p11,
		p12,
		b4,
		t9,
		t10,
		p13,
		p14,
		p15,
		p16,
		v152,
		v146,
		v147,
		n11,
		p17,
		p18,
		Context,
		p19,
		v134,
		if not (not not v41 and AXCatalogPerfReduxReductionIXP.isEnabled()) and not v160 then nil else u161,
		n12
	}))
end
