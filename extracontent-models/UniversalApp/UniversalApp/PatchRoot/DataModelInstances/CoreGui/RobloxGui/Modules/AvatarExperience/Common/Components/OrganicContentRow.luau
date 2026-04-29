local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local getUseSelectorDeepEquals = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AvatarExperienceUIKit = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit)
local WidgetHeader = AvatarExperienceUIKit.WidgetComponents.WidgetHeader
local WidgetLayout = AvatarExperienceUIKit.WidgetComponents.WidgetLayout
local WidgetListItem = AvatarExperienceUIKit.WidgetComponents.WidgetListItem
local Grid = AvatarExperienceUIKit.GridComponents.Grid
local useTokens = require(CorePackages.Packages.Foundation).Hooks.useTokens
local FFlagAXCatalogCategoriesStoreImprovePerf = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStoreImprovePerf
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local Constants = require(Modules.LuaApp.Constants)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CatalogItemCardContainer = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)

require(Modules.AvatarExperience.Common.Components.WidgetList.Types)

local getFooterVisibilityFromItemFooters = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.getFooterVisibilityFromItemFooters
local useCatalogCategoryImpressionsInfo = require(Modules.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo)
local CatalogTilesLatencyTracker = require(Modules.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker)
local GetFFlagEnableCatalogTileLoadingLatency = require(Modules.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency)
local AXCatalogPerfReduxReductionIXP = require(Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return (React.forwardRef(function(t1: {[any]: any}, p1) -- line: 101
	-- upvalues: RoactGamepad (copy), useNavigation (copy), useSelector (copy), getUseSelectorDeepEquals (copy), useDispatch (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Constants (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), useCatalogCategoryImpressionsInfo (copy), CatalogConstants (copy), AXCatalogPerfReduxReductionIXP (copy), IxpUtils (copy), GetFFlagEnableCatalogTileLoadingLatency (copy), React (copy), CatalogTilesLatencyTracker (copy), Utils (copy), getFooterVisibilityFromItemFooters (copy), useTokens (copy), CatalogItemCardContainer (copy), Grid (copy), WidgetListItem (copy), WidgetLayout (copy), WidgetHeader (copy)
	local v29 = RoactGamepad.useRefCache()
	local v30 = useNavigation()
	local v31 = useSelector(function(p2) -- line: 104
		-- upvalues: t1 (copy)
		return p2.Search.SearchesInCatalog[t1.searchUuid]
	end, getUseSelectorDeepEquals())
	local v32 = useDispatch()
	local v33 = if not FFlagAXMigrateAXToGlobalAutofocus then RoactGamepad.useFocusController() else nil
	local entryRowIndex = t1.entryRowIndex
	local v35 = useSelector(function(p3) -- line: 112
		return p3.AvatarExperience.Common.Widgets.HydratedWidgetData.Look
	end, getUseSelectorDeepEquals())
	local row = t1.row
	local itemsPerRow = t1.itemsPerRow
	local key = v30.state.key
	local v39 = Constants.ImpressionsEvents.AvatarItems .. (not key and "" or string.gsub(key, "[-{}]", ""))
	local v40 = v31 and v31.keyword
	local v41 = if not FFlagAXCatalogCategoriesStoreImprovePerf then useCatalogCategoryImpressionsInfo(t1.fromSearch) else useCatalogCategoryImpressionsInfo(t1.fromSearch, t1.selectedCategory, t1.selectedSubcategory, t1.selectedCategoryInfo)
	local impressionsCategory = v41.impressionsCategory
	local impressionsSubcategory = v41.impressionsSubcategory
	local impressionsTaxonomyId = v41.impressionsTaxonomyId
	local Catalog = CatalogConstants.AnalyticsContext.Catalog

	if t1.fromSearch then
		Catalog = CatalogConstants.AnalyticsContext.CatalogSearch
	end

	local v46 = if not AXCatalogPerfReduxReductionIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXCatalogPerfReduxReductionIXP.EnabledForUser)
	local v47 = if not GetFFlagEnableCatalogTileLoadingLatency() then nil else React.useCallback(function(p4) -- line: 148
		-- upvalues: v46 (copy), t1 (copy), v32 (copy), CatalogTilesLatencyTracker (copy)
		if p4 then
			if v46 and t1.onThumbnailLoaded then
				t1.onThumbnailLoaded(t1.searchUuid, p4)

				return
			end

			v32(CatalogTilesLatencyTracker.AppendThumbnail(t1.searchUuid, p4))
		end
	end, {
		t1.searchUuid,
		if not v46 then nil else t1.onThumbnailLoaded
	})
	local v48 = Utils.getCreatorNameTileFooterEnabled(t1.widgetConfiguration)
	local v49 = getFooterVisibilityFromItemFooters(if not t1.template then nil else t1.template.itemFooters)
	local v50 = useTokens()
	local v51 = React.useCallback(function(p5) -- line: 172
		-- upvalues: t1 (copy)
		if t1.gamepadNavigationFocusPos:getValue().Y ~= t1.entryRowIndex then
			return
		end

		t1.setGamepadNavigationFocusPos(Vector2.new(p5, t1.entryRowIndex))

		if t1.onFocusGained then
			t1.onFocusGained()
		end
	end, {
		t1.gamepadNavigationFocusPos,
		t1.setGamepadNavigationFocusPos,
		t1.entryRowIndex,
		t1.onFocusGained
	})
	local v52 = React.useCallback(function(t2: {[any]: any}) -- line: 189
		-- upvalues: React (copy), RoactGamepad (copy), v29 (copy), itemsPerRow (copy), v51 (copy), CatalogItemCardContainer (copy), Catalog (ref), CatalogConstants (copy), entryRowIndex (copy), t1 (copy), v39 (copy), v40 (copy), impressionsCategory (ref), impressionsSubcategory (ref), impressionsTaxonomyId (ref), v48 (copy), v47 (copy), v49 (copy), v35 (copy)
		local index = t2.index
		local item = t2.item

		return React.createElement(RoactGamepad.Focusable.Frame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ref = v29[index],
			NextSelectionRight = if not (index < itemsPerRow) then nil else v29[index + 1],
			NextSelectionLeft = if not (index > 1) then nil else v29[index - 1],
			onFocusGained = function() --[[ onFocusGained ]] -- line: 200
				-- upvalues: v51 (copy), index (copy)
				v51(index)
			end
		}, {
			CatalogItemCard = React.createElement(CatalogItemCardContainer, {
				analyticsContext = Catalog,
				analyticsItemCountPerPage = CatalogConstants.PageFetchLimit,
				index = (entryRowIndex - 1) * itemsPerRow + index,
				itemType = item.type,
				itemId = item.id,
				adTrackingData = item.encryptedAdTrackingData,
				isSponsoredItem = false,
				cardStyle = t1.cardStyle,
				itemDetailsPeekViewRefs = t1.itemDetailsPeekViewRefs,
				resultsListRef = t1.gridRef,
				impressionsTag = v39,
				impressionsSchema = "defaultItem",
				impressionsGroup = nil,
				impressionsSearch = v40,
				impressionsCategory = impressionsCategory,
				impressionsSubcategory = impressionsSubcategory,
				impressionsTaxonomyId = impressionsTaxonomyId,
				impressionsId = item.id,
				gridInformation = {
					gridPositionRow = t1.catalogRowIndex,
					gridPositionColumn = index
				},
				thumbailAspectRatio = t1.thumbnailAspectRatio,
				thumbnailScaleType = t1.thumbnailScaleType,
				thumbnailSize = if item.type ~= "Look" then t1.thumbnailSize else "w=300&h=450",
				creatorNameTileFooterEnabled = v48,
				onThumbnailLoaded = v47,
				isCreatorNameVisible = v49.isCreatorNameVisible,
				isTitleVisible = v49.isTitleVisible,
				isPriceVisible = v49.isPriceVisible,
				lookData = if item.type ~= "Look" then nil else v35[tostring(item.id)],
				isOrganic = true
			})
		})
	end, {
		itemsPerRow,
		v51,
		Catalog,
		entryRowIndex,
		t1.cardStyle,
		t1.itemDetailsPeekViewRefs,
		t1.gridRef,
		v39,
		v40,
		impressionsCategory,
		impressionsSubcategory,
		"defaultItem",
		nil,
		t1.thumbnailAspectRatio,
		t1.thumbnailScaleType,
		t1.thumbnailSize,
		v48,
		v47,
		v35
	})
	local v53 = React.createElement(Grid, {
		itemsPerRow = itemsPerRow,
		getItemId = function(p6) --[[ getItemId ]] -- line: 266
			return p6.id
		end,
		gapHorizontal = v50.Gap.Medium,
		gapVertical = v50.Gap.Large,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		items = row,
		renderItem = v52
	})

	return React.createElement(WidgetListItem, {
		ref = p1,
		NextSelectionUp = t1.NextSelectionUp,
		NextSelectionDown = t1.NextSelectionDown,
		NextSelectionRight = t1.NextSelectionRight,
		onFocusGained = not FFlagAXMigrateAXToGlobalAutofocus and function() -- line: 283
			-- upvalues: t1 (copy), v29 (copy), row (copy), v33 (copy)
			t1.setGamepadNavigationFocusPos(Vector2.new(t1.gamepadNavigationFocusPos:getValue().X, t1.entryRowIndex))

			local v62 = v29[math.min(t1.gamepadNavigationFocusPos:getValue().X, #row)]

			v33.moveFocusTo(v62)
		end or nil,
		padding = t1.padding,
		horizontalMargin = 0
	}, {
		Widget = React.createElement(WidgetLayout, {
			headerSlot = if not t1.descriptionKey and not t1.titleKey then nil else React.createElement(WidgetHeader, {
				descriptionText = t1.descriptionText,
				descriptionKey = t1.descriptionKey,
				titleKey = t1.titleKey,
				titleText = t1.titleText,
				LayoutOrder = 1
			}),
			contentSlot = v53
		})
	})
end))
