local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local React = require(CorePackages.Packages.React)
local Cryo = require(CorePackages.Packages.Cryo)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local UIBlox = require(CorePackages.Packages.UIBlox)
local getUseSelectorDeepEquals = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AvatarExperienceUIKit = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local WidgetHeader = AvatarExperienceUIKit.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKit.WidgetComponents.WidgetLayout
local Grid = AvatarExperienceUIKit.GridComponents.Grid
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXFixSeeAllSpacing = AvatarExperienceFlags.FFlagAXFixSeeAllSpacing
local FFlagAXLookAndFeelBackgrounds = AvatarExperienceFlags.FFlagAXLookAndFeelBackgrounds
local ScrollingAppCarousel = require(CorePackages.Workspace.Packages.AppBlox).ScrollingAppCarousel
local RetrievalStatus = require(Modules.LuaApp.Enum.RetrievalStatus)
local WidgetTileWithImpressionsTagging = require(Modules.AvatarExperience.Common.Components.Widgets.WidgetTileWithImpressionsTagging)

require(Modules.AvatarExperience.Common.Types)

local Constants = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = AvatarExperienceCatalog.WidgetConstants
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local FetchHydratedWidgetContent = require(Modules.AvatarExperience.Catalog.Thunks.FetchHydratedWidgetContent)
local ScreenSizeImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector
local WidgetEventImpressionsReporter = require(Modules.AvatarExperience.Common.Components.Impressions.WidgetEventImpressionsReporter)
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local WidgetLoadableGridView = require(Modules.AvatarExperience.Common.Components.Widgets.WidgetLoadableGridView)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local getContentToHyderate = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getContentToHyderate)
local getWidgetTileFooterProps = require(Modules.AvatarExperience.Common.Components.WidgetList.Utils.getWidgetTileFooterProps)
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local useImpressionsTagger = require(CorePackages.Workspace.Packages.Impressions).useImpressionsTagger
local useStyle = UIBlox.Core.Style.useStyle
local getFooterVisibilityFromItemFooters = AvatarExperienceCatalog.Utils.getFooterVisibilityFromItemFooters
local useTokens = require(CorePackages.Packages.Foundation).Hooks.useTokens
local addUnifiedEventLogging = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local FIntAXCarouselWidgetMaxItems = require(Modules.AvatarExperience.Flags.FIntAXCarouselWidgetMaxItems)
local v45 = game:DefineFastInt("AXCarouselLoadingBuffer", 1)
local GetFFlagAXAnimatedLooksThumbnails = require(Modules.AvatarExperience.Flags.GetFFlagAXAnimatedLooksThumbnails)
local v47 = game:DefineFastFlag("AXCarouselFixMissingAnalytics2", false)
local v48 = game:DefineFastFlag("AXCarouselMoreSeeAllAnalytics", false)
local FFlagAXScrollingCarouselWidgetIndexBugfix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXScrollingCarouselWidgetIndexBugfix
local v50 = game:DefineFastFlag("AXSeeAllTreatmentType", false)
local FFlagAXMoveAllTabToWidgetOnly = AvatarExperienceFlags.FFlagAXMoveAllTabToWidgetOnly
local FFlagAXCatalogCategoriesStoreImprovePerf = AvatarExperienceFlags.FFlagAXCatalogCategoriesStoreImprovePerf
local FFlagAXAddLookTypeEnumForLogging = AvatarExperienceFlags.FFlagAXAddLookTypeEnumForLogging
local v54 = game:DefineFastInt("AXCarouselPeakFraction", 33)
local v55 = game:DefineFastInt("AXCarouselItemsBasedOnFrameSize", 3)
local v56 = v54 / 100
local t1 = {
	leftPosition = 28,
	rightPosition = 15
}
local t2 = {}

local function useItemCarouselWidgetViewModel(t3: {[any]: any}, p1, p2, n1: number?, n2: number?) -- line: 106
	-- upvalues: React (copy), RetrievalStatus (copy), useDispatch (copy), useRoactService (copy), RoactNetworking (copy), getContentToHyderate (copy), WidgetConstants (copy), FetchHydratedWidgetContent (copy), FFlagAXScrollingCarouselWidgetIndexBugfix (copy)
	local v66, v67 = React.useState({
		cardWindowStart = 1,
		cardWindowIndex = 1
	})
	local v68, v69 = React.useState(RetrievalStatus.NotStarted)
	local widgetInfo = t3.widgetInfo
	local widgetConfiguration = t3.widgetConfiguration
	local v72 = useDispatch()
	local v73 = useRoactService(RoactNetworking)
	local v74 = t3.displayAsItemGroupWidget and not t3.widgetFocused
	local v75 = React.useMemo(function() -- line: 126
		-- upvalues: v74 (copy), widgetConfiguration (copy), getContentToHyderate (copy), widgetInfo (copy), p1 (copy), t3 (copy)
		if v74 and (widgetConfiguration and widgetConfiguration.customizedDataMap and widgetConfiguration.customizedDataMap.hydrateOnlyVisibleItems) then
			return getContentToHyderate(widgetInfo, p1, t3.itemsPerRow)
		end

		return getContentToHyderate(widgetInfo, p1)
	end, {
		p1,
		widgetInfo,
		v74,
		t3.itemsPerRow
	})

	React.useEffect(function() -- line: 146
		-- upvalues: widgetInfo (copy), WidgetConstants (copy), v75 (copy), v68 (copy), RetrievalStatus (copy), v69 (copy), v72 (copy), FetchHydratedWidgetContent (copy), v73 (copy)
		if widgetInfo.type ~= WidgetConstants.Types.MySharedAvatarsWidget and (v75 and #v75 > 0 and v68 == RetrievalStatus.NotStarted) then
			v69(RetrievalStatus.Fetching)
			v72(FetchHydratedWidgetContent(v73, v75, widgetInfo.id))
		end
	end, {
		v75,
		widgetInfo,
		v75,
		v68,
		v72,
		v73
	})

	return v66, (React.useCallback(function(p3) -- line: 158
		-- upvalues: n1 (copy), n2 (copy), FFlagAXScrollingCarouselWidgetIndexBugfix (copy), v66 (copy), v67 (copy), p2 (copy)
		if not p3 then
			return
		end

		local CanvasPositionX = p3.CanvasPosition.X
		local v139 = math.max(1, (math.floor(CanvasPositionX / ((n1 or 0) + (n2 or 0)))))
		local v140 = if not FFlagAXScrollingCarouselWidgetIndexBugfix then math.max(0, (math.floor(CanvasPositionX / ((n1 or 0) - (n2 or 0))))) + 1 else math.max(0, (math.floor(CanvasPositionX / ((n1 or 0) + (n2 or 0))))) + 1

		if v139 ~= v66.cardWindowStart or v140 ~= v66.cardWindowIndex then
			v67({
				cardWindowStart = v139,
				cardWindowIndex = v140
			})
			p2.current:fire()
		end
	end, {
		v66,
		n1,
		n2,
		p2
	}))
end
local function useItemCarouselWidgetSizes(n3: number, n4: number, n5: number, n6: number) -- line: 196
	-- upvalues: useTokens (copy)
	local Medium = useTokens().Gap.Medium
	local v84 = n4 + n6
	local v85 = math.floor((n3 - (v84 - 1) * Medium) / v84)
	local v86 = n5 * v85 + (n5 - 1) * Medium

	return {
		itemWidth = v85,
		itemGap = Medium,
		canvasWidth = v86
	}
end

return function(t4: {[any]: any}) --[[ ItemCarouselWidget ]] -- line: 209
	-- upvalues: useStyle (copy), useDesignTokens (copy), FIntAXCarouselWidgetMaxItems (copy), v55 (copy), useItemCarouselWidgetSizes (copy), FFlagAXFixSeeAllSpacing (copy), v56 (copy), v50 (copy), UnifiedEventLogEnums (copy), useRoactService (copy), Analytics (copy), React (copy), Signal (copy), useLocalization (copy), RoactGamepad (copy), useSelector (copy), getUseSelectorDeepEquals (copy), useItemCarouselWidgetViewModel (copy), Constants (copy), getWidgetTileFooterProps (copy), getFooterVisibilityFromItemFooters (copy), v47 (copy), Cryo (copy), FFlagAXAddLookTypeEnumForLogging (copy), WidgetTileWithImpressionsTagging (copy), FFlagAXLookAndFeelBackgrounds (copy), WidgetConstants (copy), GetFFlagAXAnimatedLooksThumbnails (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), Utils (copy), v45 (copy), Grid (copy), ScrollingAppCarousel (copy), t1 (copy), ScreenSizeImpressionsDetector (copy), t2 (copy), WidgetEventImpressionsReporter (copy), FFlagAXMoveAllTabToWidgetOnly (copy), WidgetHeader (copy), useImpressionsTagger (copy), addUnifiedEventLogging (copy), UnifiedEventLogConstants (copy), v48 (copy), HttpService (copy), WidgetLayout (copy), WidgetLoadableGridView (copy)
	local v88 = useStyle()
	local v89 = useDesignTokens()
	local widgetInfo = t4.widgetInfo
	local v91 = widgetInfo.content and #widgetInfo.content or 0
	local v92 = math.min(v91, FIntAXCarouselWidgetMaxItems)
	local v93 = math.min(v91, t4.itemsPerRow * v55 - v55 + 1)
	local n7 = 0
	local v95 = useItemCarouselWidgetSizes(t4.rowWidth or 0, t4.itemsPerRow, v93, if not t4.displayAsItemGroupWidget and (not FFlagAXFixSeeAllSpacing or not t4.widgetFocused) then v56 else 0)
	local u96 = if not v50 then if not t4.displayAsItemGroupWidget then UnifiedEventLogEnums.WidgetUiTreatment.CAROUSEL else UnifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP else if not t4.widgetFocused then if not t4.displayAsItemGroupWidget then UnifiedEventLogEnums.WidgetUiTreatment.CAROUSEL else UnifiedEventLogEnums.WidgetUiTreatment.ITEM_GROUP else UnifiedEventLogEnums.WidgetUiTreatment.WIDGET_SEE_ALL
	local itemGap = v95.itemGap
	local itemWidth = v95.itemWidth
	local canvasWidth = v95.canvasWidth
	local v100 = useRoactService(Analytics)
	local v101 = React.useRef(Signal.new())
	local v102 = "WIDGET_CAROUSEL" .. "_" .. t4.widgetInfo.id
	local widgetConfiguration = t4.widgetConfiguration
	local v104 = widgetInfo and (not not widgetInfo.template and widgetInfo.template.seeAllButton) or t4.widgetFocused
	local v105 = useLocalization({
		widgetTitle = if not widgetInfo or not widgetInfo.template then nil else widgetInfo.template.title,
		widgetDescription = if not widgetInfo or not widgetInfo.template then nil else widgetInfo.template.description
	})
	local v106 = RoactGamepad.useRefCache()
	local v107 = useSelector(function(p4) -- line: 258
		return p4.AvatarExperience.Common.Widgets.HydratedWidgetData
	end, getUseSelectorDeepEquals())
	local v108, v109 = useItemCarouselWidgetViewModel(t4, v107, v101, itemWidth, itemGap)

	React.useEffect(function() -- line: 264
		-- upvalues: v101 (copy)
		v101.current:fire()
	end, {})

	local v110 = React.useRef(nil)

	React.useEffect(function() -- line: 274
		-- upvalues: v110 (copy), Constants (copy), v101 (copy)
		local function scheduleNextTimer() -- line: 275
			-- upvalues: v110 (copy), Constants (copy), v101 (copy), scheduleNextTimer (copy)
			v110.current = task.delay(Constants.ImpressionsDetectionInterval, function() -- line: 276
				-- upvalues: v101 (copy), scheduleNextTimer (copy)
				v101.current:fire()
				scheduleNextTimer()
			end)
		end

		v110.current = task.delay(Constants.ImpressionsDetectionInterval, function() -- line: 276
			-- upvalues: v101 (copy), scheduleNextTimer (copy)
			v101.current:fire()
			scheduleNextTimer()
		end)

		return function() -- line: 284
			-- upvalues: v110 (copy)
			if v110.current then
				task.cancel(v110.current)
				v110.current = nil
			end
		end
	end, {})

	local t5 = {
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, itemGap),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		})
	}
	local v112 = getWidgetTileFooterProps(widgetInfo, widgetConfiguration)
	local creatorNameFooterEnabled = v112.creatorNameFooterEnabled
	local priceFooterEnabled = v112.priceFooterEnabled
	local creatorNameTileFooterEnabled = v112.creatorNameTileFooterEnabled
	local v116 = getFooterVisibilityFromItemFooters(if not t4.widgetInfo then nil else t4.widgetInfo.template.itemFooters)

	local function v117(t6: {[any]: any}, n8: number) -- line: 309
		-- upvalues: v47 (copy), Cryo (copy), t4 (copy), FFlagAXAddLookTypeEnumForLogging (copy), Constants (copy), v107 (copy), widgetInfo (copy), u96 (ref), React (copy), WidgetTileWithImpressionsTagging (copy), itemWidth (copy), n7 (ref), FFlagAXLookAndFeelBackgrounds (copy), WidgetConstants (copy), v106 (copy), creatorNameFooterEnabled (ref), priceFooterEnabled (copy), creatorNameTileFooterEnabled (copy), v116 (copy), v102 (copy), GetFFlagAXAnimatedLooksThumbnails (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy)
		local v145 = if not v47 then nil else Cryo.Dictionary.join(t4.widgetAnalyticsInfo, {
			itemPosition = n8,
			itemId = t6.id,
			itemType = t6.type,
			lookType = if not FFlagAXAddLookTypeEnumForLogging or (t6.type ~= Constants.ItemType.Look or (not v107 or (not v107[Constants.ItemType.Look] or not v107[Constants.ItemType.Look][t6.id]))) then nil else v107[Constants.ItemType.Look][t6.id].lookType,
			themeId = widgetInfo.tagId,
			gridPositionRow = if not t4.widgetFocused or not t6.gridInformation then t4.widgetRow else t6.gridInformation.row,
			gridPositionColumn = if not t4.widgetFocused or not t6.gridInformation then n8 else t6.gridInformation.column,
			uiTreatmentType = u96
		})

		return React.createElement(WidgetTileWithImpressionsTagging, {
			size = UDim2.new(0, itemWidth, 0, n7),
			cardStyle = if not FFlagAXLookAndFeelBackgrounds then nil else widgetInfo.template.cardStyle,
			contentType = t6.type or WidgetConstants.ContentType.Asset,
			tileContentType = widgetInfo.type,
			contentId = t6.id or "",
			index = n8,
			refCache = v106,
			resultsListRef = t4.gridRef,
			itemDetailsPeekViewRefs = t4.itemDetailsPeekViewRefs,
			itemsPerRow = t4.itemsPerRow,
			hideItemName = t4.hideItemName,
			analyticsItemCountPerPage = t4.itemsPerRow,
			creatorNameFooterEnabled = creatorNameFooterEnabled,
			priceFooterEnabled = priceFooterEnabled,
			creatorNameTileFooterEnabled = creatorNameTileFooterEnabled,
			isCreatorNameVisible = v116.isCreatorNameVisible,
			isTitleVisible = v116.isTitleVisible,
			isPriceVisible = v116.isPriceVisible,
			impressionsTag = v102,
			disable3DRendering = if not GetFFlagAXAnimatedLooksThumbnails() then nil else t4.widgetFocused,
			widgetAnalyticsInfo = if not v47 then Cryo.Dictionary.join(t4.widgetAnalyticsInfo, {
				uiTreatmentType = u96
			}) else v145,
			onThumbnailLoaded = t4.onThumbnailLoaded,
			selectedCategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else t4.selectedCategory,
			selectedSubcategory = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else t4.selectedSubcategory,
			selectedCategoryInfo = if not FFlagAXCatalogCategoriesStoreImprovePerf then nil else t4.selectedCategoryInfo
		})
	end

	local t7 = {}

	if v104 then
		for i = 1, v92 do
			table.insert(t7, widgetInfo.content and widgetInfo.content[i] or {})
		end
	end

	local v120 = if not t4.widgetInfo then nil else Utils.isLooksWidget(t4.widgetInfo.type)
	local n9 = 0
	local CatalogItemTile = Constants.ItemTileType.CatalogItemTile

	if v104 then
		n9 = v88.Font.Header2.RelativeSize * v88.Font.BaseSize
		CatalogItemTile = Constants.ItemTileType.CatalogItemTile

		if v120 then
			n9 = v88.Font.SubHeader1.RelativeSize * v88.Font.BaseSize
			CatalogItemTile = Constants.ItemTileType.LookItemTile
		end
	end

	local v123 = Utils.GridItemHeightGetterWithOptions({
		itemTileType = CatalogItemTile,
		fontHeight = n9,
		hideItemName = t4.hideItemName,
		itemCreatorNamesEnabled = creatorNameTileFooterEnabled,
		itemPriceEnabled = priceFooterEnabled,
		isWidgetFocused = t4.widgetFocused
	})
	local v124 = v123(itemWidth)

	if v120 then
		creatorNameFooterEnabled = not not creatorNameFooterEnabled and (creatorNameTileFooterEnabled or false)

		local n10 = 0

		if priceFooterEnabled then
			n10 += v89.Global.Size_175
		end

		if creatorNameFooterEnabled then
			n10 += v89.Global.Size_175
		end

		local _ = v124 + n10

		n7 += n10
	end

	for i = 1, if not t4.displayAsItemGroupWidget then math.min(v93, v108.cardWindowStart + t4.itemsPerRow + v45) else math.min(t4.itemsPerRow, v93) do
		local v128 = widgetInfo.content and widgetInfo.content[i] or {}

		v128.gridInformation = {
			row = 1,
			column = i
		}
		table.insert(t5, v117(v128, i))
	end

	local v129 = if not t4.displayAsItemGroupWidget then React.createElement(ScrollingAppCarousel, {
		items = t5,
		index = math.max(1, (math.min(v108.cardWindowIndex, v93))),
		styleProps = t1,
		itemCount = v93,
		itemWidth = math.max(1, itemWidth),
		itemPadding = itemGap,
		carouselMargin = v89.Global.Space_600,
		carouselHeight = 0,
		canvasWidth = math.max(1, canvasWidth),
		onChangeCanvasPosition = v109,
		onRefCallback = v109,
		shouldExpandToFitContentHeight = true
	}) else React.createElement(Grid, {
		itemsPerRow = t4.itemsPerRow,
		renderItem = function(p5) --[[ renderItem ]] -- line: 439
			-- upvalues: v117 (copy)
			local item = p5.item

			return v117({
				id = item.id,
				type = item.type,
				gridInformation = item.gridInformation
			}, p5.index)
		end,
		getItemId = function(p6) --[[ getItemId ]] -- line: 446
			-- upvalues: t4 (copy)
			return p6.id .. t4.itemsPerRow
		end,
		items = Cryo.List.getRange(widgetInfo.content or {}, 1, (t4.rowCount or 1) * t4.itemsPerRow),
		gapVertical = itemGap,
		gapHorizontal = itemGap,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
	local v130 = React.createElement(ScreenSizeImpressionsDetector, {
		onRequestImpressionsSignal = v101.current,
		onImpressionsDetected = function(p7) --[[ onImpressionsDetected ]] -- line: 472
			-- upvalues: t4 (copy), t2 (copy), widgetInfo (copy), v47 (copy), WidgetEventImpressionsReporter (copy), v100 (copy), Cryo (copy), FFlagAXAddLookTypeEnumForLogging (copy), Constants (copy), v107 (copy), u96 (ref)
			for _, v151 in p7 do
				local v152 = t4.widgetInfo.id .. "_" .. v151

				if not t2[v152] then
					local v153 = widgetInfo.content and widgetInfo.content[v151] or {}

					if v47 then
						WidgetEventImpressionsReporter(v100, Cryo.Dictionary.join(t4.widgetAnalyticsInfo, {
							widgetPosition = t4.widgetRow,
							widgetId = t4.widgetInfo.id,
							itemPosition = v151,
							itemId = v153.id,
							itemType = v153.type,
							lookType = if not FFlagAXAddLookTypeEnumForLogging or (v153.type ~= Constants.ItemType.Look or (not v107 or (not v107[Constants.ItemType.Look] or not v107[Constants.ItemType.Look][v153.id]))) then nil else v107[Constants.ItemType.Look][v153.id].lookType,
							widgetAbsPosition = (t4.widgetRow - 1) * t4.itemsPerRow,
							uiTreatmentType = u96
						}))
					else
						local t8 = {
							widgetPosition = t4.widgetRow,
							widgetId = t4.widgetInfo.id,
							itemPosition = v151,
							itemId = v153.id,
							itemType = v153.type,
							widgetAbsPosition = (t4.widgetRow - 1) * t4.itemsPerRow,
							uiTreatmentType = u96
						}

						WidgetEventImpressionsReporter(v100, t8)
					end

					t2[v152] = true
				end
			end
		end,
		impressionsTag = v102
	})
	local s1 = ""
	local s2 = ""

	if widgetInfo.template then
		s1 = if not widgetInfo.template.title then widgetInfo.template.localizedTitle else v105.widgetTitle
		s2 = if not widgetInfo.template.description then widgetInfo.template.localizedDescription else v105.widgetDescription
	end

	local v133 = nil
	local v134 = React.useRef(nil)
	local v135 = if not FFlagAXMoveAllTabToWidgetOnly then nil else not (s1 or s2)

	if not t4.widgetFocused and not v135 then
		v133 = React.createElement(WidgetHeader, {
			titleText = s1,
			descriptionText = s2,
			LayoutOrder = 1,
			seeAllCallback = if not v104 then nil else t4.requestWidgetAcquireFocus,
			seeAllRef = v134
		})
	end

	local v136 = React.useRef(nil)

	useImpressionsTagger(v136, WidgetConstants.WidgetExposureMetadata.TagName, t4.widgetRow)
	React.useEffect(function() -- line: 543
		-- upvalues: v136 (copy), addUnifiedEventLogging (copy), Cryo (copy), t4 (copy), UnifiedEventLogEnums (copy), u96 (ref), widgetInfo (copy), UnifiedEventLogConstants (copy), v134 (copy), v48 (copy), HttpService (copy), WidgetConstants (copy)
		local v155 = v136 and v136.current

		if v155 then
			addUnifiedEventLogging(v136, Cryo.Dictionary.join(t4.widgetAnalyticsInfo, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.WIDGET_IMPRESSION,
				gridPositionRow = t4.widgetRow,
				gridPositionColumn = 1,
				uiTreatmentType = u96,
				themeId = if not widgetInfo then nil else widgetInfo.tagId
			}), {
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})

			if v134 and v134.current then
				addUnifiedEventLogging(v134, {
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
					requestId = if not v48 then nil else t4.widgetAnalyticsInfo.requestId,
					elementName = "SEE_ALL",
					elementMetadata = if not v48 then nil else HttpService:JSONEncode({
						widget_id = t4.widgetAnalyticsInfo.widgetId,
						widget_type = t4.widgetAnalyticsInfo.widgetType,
						tag_id = if not widgetInfo then nil else widgetInfo.tagId
					}),
					gridPositionRow = t4.widgetRow,
					gridPositionColumn = 1
				}, {
					sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
				})
			end

			if t4.ixpLayerToExpose then
				v155:SetAttribute(WidgetConstants.WidgetExposureMetadata.AttributeKey, t4.ixpLayerToExpose)
			end
		end
	end, { t4.ixpLayerToExpose })

	return React.createElement(WidgetLayout, {
		headerSlot = v133,
		contentSlot = if not t4.widgetFocused then React.createElement(React.Fragment, {}, {
			["Widget_" .. widgetInfo.id] = React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				ref = v136
			}, v129),
			ImpressionsDetector = v130
		}) else React.createElement(WidgetLoadableGridView, {
			widgetInfo = t4.widgetInfo,
			impressionsTag = v102,
			getItemHeight = v123,
			items = t7,
			totalNumItems = v92,
			renderItem = v117,
			getItemMetrics = t4.getItemMetrics,
			itemsPerRow = t4.itemsPerRow
		})
	})
end
