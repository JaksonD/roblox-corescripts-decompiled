local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local useImpressionsTagger = require(CorePackages.Workspace.Packages.Impressions).useImpressionsTagger

require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)

local FFlagAXCatalogCategoriesStoreImprovePerf = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogCategoriesStoreImprovePerf
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogItemCardContainer = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local getUseSelectorDeepEquals = AvatarExperienceCommon.Utils.getUseSelectorDeepEquals
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ItemTypeEnum = AvatarExperienceCommon.Enums.ItemTypeEnum
local Constants = require(Modules.AvatarExperience.Common.Constants)
local useCatalogCategoryImpressionsInfo = require(Modules.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen

return function(t1: {[any]: any}) --[[ WidgetTileWithImpressionsTagging ]] -- line: 56
	-- upvalues: useImpressionsTagger (copy), useSelector (copy), getUseSelectorDeepEquals (copy), ItemTypeEnum (copy), FFlagAXCatalogCategoriesStoreImprovePerf (copy), useCatalogCategoryImpressionsInfo (copy), AvatarScreen (copy), React (copy), RoactGamepad (copy), CatalogItemCardContainer (copy), CatalogConstants (copy), Constants (copy)
	local v17 = t1.refCache[t1.index]

	useImpressionsTagger(v17, t1.impressionsTag, t1.index)

	local contentType = t1.contentType
	local contentId = t1.contentId
	local index = t1.index
	local refCache = t1.refCache
	local v22 = useSelector(function(p1) -- line: 65
		-- upvalues: contentType (copy), contentId (copy)
		local v30 = p1.AvatarExperience.Common.Widgets.HydratedWidgetData[contentType]

		if v30 then
			return v30[tostring(contentId)]
		end

		return nil
	end, getUseSelectorDeepEquals())
	local v23 = v22 and v22.type == ItemTypeEnum.Look
	local v24 = useSelector(function(p2) -- line: 74
		return p2.AvatarExperience.AvatarScene.AvatarRoute.opaque.name
	end, getUseSelectorDeepEquals())
	local v25 = if not FFlagAXCatalogCategoriesStoreImprovePerf then useCatalogCategoryImpressionsInfo(v24 == AvatarScreen.CatalogSearch) else useCatalogCategoryImpressionsInfo(v24 == AvatarScreen.CatalogSearch, t1.selectedCategory, t1.selectedSubcategory, t1.selectedCategoryInfo)
	local impressionsCategory = v25.impressionsCategory
	local impressionsSubcategory = v25.impressionsSubcategory
	local impressionsTaxonomyId = v25.impressionsTaxonomyId

	return React.createElement(RoactGamepad.Focusable.Frame, {
		Size = UDim2.new(t1.size.X, UDim.new()),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		ref = refCache[index],
		NextSelectionRight = if not (index < t1.itemsPerRow) then nil else refCache[index + 1],
		NextSelectionLeft = if not (index > 1) then nil else refCache[index - 1]
	}, {
		WidgetItemTile = React.createElement(CatalogItemCardContainer, {
			itemId = if not v22 then nil else tostring(v22.id),
			itemType = if not v22 then nil else v22.type,
			index = t1.index,
			analyticsItemCountPerPage = t1.analyticsItemCountPerPage,
			analyticsContext = CatalogConstants.AnalyticsContext.Catalog,
			widgetAnalyticsInfo = t1.widgetAnalyticsInfo,
			itemDetailsPeekViewRefs = t1.itemDetailsPeekViewRefs,
			resultsListRef = t1.resultsListRef,
			itemCreatorNamesEnabled = t1.creatorNameFooterEnabled,
			creatorNameTileFooterEnabled = t1.creatorNameTileFooterEnabled,
			cardStyle = t1.cardStyle,
			tileWidth = t1.size.X.Offset,
			onThumbnailLoaded = if not t1.onThumbnailLoaded then nil else t1.onThumbnailLoaded,
			isCreatorNameVisible = t1.isCreatorNameVisible,
			isTitleVisible = t1.isTitleVisible,
			isPriceVisible = t1.isPriceVisible,
			lookData = if not v23 then nil else v22,
			hydratedContent = if v23 then nil else v22,
			tileContentType = t1.tileContentType,
			thumbailAspectRatio = if not v23 then nil else Constants.LookTileAspectRatio,
			thumbnailSize = if not v23 then nil else "w=300&h=450",
			impressionsCategory = impressionsCategory,
			impressionsSubcategory = impressionsSubcategory,
			impressionsTaxonomyId = impressionsTaxonomyId
		})
	})
end
