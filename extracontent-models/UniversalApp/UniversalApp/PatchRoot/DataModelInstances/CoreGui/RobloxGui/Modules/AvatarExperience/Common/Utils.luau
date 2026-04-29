local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local LocalizationService = game:GetService("LocalizationService")
local Modules = CoreGui.RobloxGui.Modules
local mutedError = require(Modules.LuaApp.mutedError)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local getSafeAreaSize = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local Cryo = require(CorePackages.Packages.Cryo)
local Dash = require(CorePackages.Packages.Dash)
local tutils = require(CorePackages.Packages.tutils)
local t = require(CorePackages.Packages.t)
local UIBlox = require(CorePackages.Packages.UIBlox)
local TextService = game:GetService("TextService")
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local ItemTileEnums = UIBlox.Tile.ItemTileEnums

require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)

local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local GetAvatarEditorCategories = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local Constants2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlags.FFlagAXCustomizeMakeupSupport
local GetCatalogCategories = require(Modules.AvatarExperience.Catalog.GetCatalogCategories)
local GetCatalogCategoriesFromStore = require(Modules.AvatarExperience.Catalog.GetCatalogCategoriesFromStore)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local Constants3 = require(Modules.LuaApp.Constants)
local memoize = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GetAvatarEditorStructure = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorStructure)
local SortType = require(Modules.AvatarExperience.Common.Enum.SortType)
local SalesTypeFilter = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local WearTimeFilter = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.WearTimeFilter
local UnavailableItemFilter = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)

require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
require(Modules.AvatarExperience.Common.AvatarExperienceState)

local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local Constants4 = require(Modules.AvatarExperience.AccessoryAdjustment.Constants)
local UniversalAppCameraIXPTest = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local FilterUtils = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)

require(Modules.AvatarExperience.Catalog.SearchTypes)
require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)
require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

local InventoryItemAvailability = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemAvailability
local getEmotesCategory = require(Modules.AvatarExperience.Common.getEmotesCategory)

require(Modules.AvatarExperience.Common.Types)

local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local SwitchTab = require(CorePackages.Workspace.Packages.RobloxAppEnums).SwitchTab
local v49 = GuiService:IsTenFootInterface()
local v50 = game:DefineFastString("AXLookWidgetContentType", "SearchToLooksWidget,SearchToCommunityLooksWidget,SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget")
local v51 = game:DefineFastString("AXAvatarWidgetContentType", "SearchToAvatarLooksWidget,PersonalizedAvatarLooksWidget,SortsPersonalizedAvatarLooksWidget,MySharedAvatarsWidget")
local FFlagAXSlotsInventoryLoadableGridView = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsInventoryLoadableGridView
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local v54 = game:DefineFastFlag("AXFixMinMaxPriceFilterError", false)
local GetFFlagAXExtractEmotesCategory = require(Modules.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory)
local GetFFlagAXEnableRecommendationTypeAllInCustomize = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize)
local FFlagAXHttpCatalogV2SearchItemDetails = AvatarExperienceFlags.FFlagAXHttpCatalogV2SearchItemDetails
local FFlagAXMutedErrorLoggingForCategorySelection = AvatarExperienceFlags.FFlagAXMutedErrorLoggingForCategorySelection
local FFlagAXTimedOptionsSalesTypeFilter = AvatarExperienceFlags.FFlagAXTimedOptionsSalesTypeFilter
local FFlagAXRemoveTimedOptionsSalesTypeEnumCheck = AvatarExperienceFlags.FFlagAXRemoveTimedOptionsSalesTypeEnumCheck
local FFlagAXCatalogSearchParamTypes = AvatarExperienceFlags.FFlagAXCatalogSearchParamTypes
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlags.FFlagAXEditorSubcategoryFilters
local FFlagAvatarJointUpgradeInUA = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAvatarJointUpgradeInUA
local FFlagAXFixCatalogSearchZoom = AvatarExperienceFlags.FFlagAXFixCatalogSearchZoom
local FFlagAXAddHDCatalogTab = AvatarExperienceFlags.FFlagAXAddHDCatalogTab
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local v67 = string.split(v50, ",") or {}
local u68 = Cryo.List.map(v67, function(p1) -- line: 129
	return p1:match("^%s*(.*)%s*$")
end)
local v69 = string.split(v51, ",") or {}
local u70 = Cryo.List.map(v69, function(p2) -- line: 136
	return p2:match("^%s*(.*)%s*$")
end)
local t1 = {
	PageType = Constants.PageType.Other,
	RecommendationsType = Constants2.RecommendationsType.None
}
local t2 = {
	PageType = Constants.PageType.Other,
	RecommendationsType = Constants2.RecommendationsType.None,
	CanAnimateCameraBasedMood = true
}
local t3 = {}
local t4 = {}
local t5 = {}
local v76 = memoize(function(t6: {[any]: any}, n1: number, n2: number?) -- line: 182
	-- upvalues: Cryo (copy), Constants (copy)
	local v98 = t6[n1]

	if v98.Subcategories and n2 then
		local v99 = v98.Subcategories[n2]

		if v99 then
			local v100 = Cryo.Dictionary.join(v98, v99)

			v100.AssetTypeIdStrings = v99.AssetTypeIdStrings
			v100.BundleTypes = v99.BundleTypes
			v100.CategoryFilter = v99.CategoryFilter
			v100.Subcategories = v99.Subcategories

			return v100
		end
	end

	if v98.PageType == Constants.PageType.Emotes then
		return Cryo.Dictionary.join(v98, {
			EmoteSlot = n2
		})
	end

	return v98
end)
local v77 = memoize(function(t7: {[any]: any}, s1: string, s2: string?) -- line: 225
	-- upvalues: CatalogUtils (copy), FFlagAXMutedErrorLoggingForCategorySelection (copy), mutedError (copy), Cryo (copy), Constants (copy)
	local v104 = CatalogUtils.extractCategoryById(s1, t7)

	if FFlagAXMutedErrorLoggingForCategorySelection and v104 == nil then
		mutedError("[buildCategoryInfoById] Category not found for categoryId: " .. tostring(s1) .. " and subcategoryId: " .. tostring(s2))
	end

	if v104.Subcategories and s2 then
		local Subcategories = v104.Subcategories
		local v106 = CatalogUtils.extractSubcategoryById(s2, Subcategories)

		if v106 then
			local v107 = Cryo.Dictionary.join(v104, v106)

			v107.AssetTypeIdStrings = v106.AssetTypeIdStrings
			v107.BundleTypes = v106.BundleTypes
			v107.CategoryFilter = v106.CategoryFilter
			v107.Subcategories = v106.Subcategories
			v107.SubcategoriesMap = v106.SubcategoriesMap

			return v107
		end
	end

	if v104.PageType == Constants.PageType.Emotes then
		return Cryo.Dictionary.join(v104, {
			EmoteSlot = s2
		})
	end

	return v104
end)

t3.getCategoryInfo = memoize(function(t8: {[any]: any}, n3: number, n4: number?) -- line: 291
	-- upvalues: t4 (copy), v76 (copy)
	local v117 = string.format("%s.%s.%s", tostring(t8), tostring(n3), (tostring(n4)))
	local v118 = t4[v117]

	if v118 == nil then
		v118 = v76(t8, n3, n4)
		t4[v117] = v118
	end

	return v118
end)
t3.getCategoryInfoById = memoize(function(t9: {[any]: any}, s3: string, s4: string?) -- line: 307
	-- upvalues: t5 (copy), v77 (copy)
	local v122 = string.format("%s.%s.%s", tostring(t9), tostring(s3), (tostring(s4)))
	local v123 = t5[v122]

	if v123 == nil then
		v123 = v77(t9, s3, s4)
		t5[v122] = v123
	end

	return v123
end)
t3.getCatalogCategoryInfo = memoize(function(n5: number, n6: number?) -- line: 319
	-- upvalues: FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesFromStore (copy), GetCatalogCategories (copy), t3 (copy)
	local v126 = if not FFlagAXCatalogCategoriesStore then GetCatalogCategories() else GetCatalogCategoriesFromStore()

	return t3.getCategoryInfo(v126, n5, n6)
end)
t3.getCatalogCategoryInfoById = memoize(function(s5: string, s6: string?) -- line: 328
	-- upvalues: FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesFromStore (copy), GetCatalogCategories (copy), t3 (copy)
	local v129 = if not FFlagAXCatalogCategoriesStore then GetCatalogCategories() else GetCatalogCategoriesFromStore()

	return t3.getCategoryInfoById(v129, s5, s6)
end)
t3.getAvatarEditorCategoryInfo = memoize(function(n7: number, n8: number?) -- line: 337
	-- upvalues: GetAvatarEditorCategories (copy), t3 (copy)
	local v132 = GetAvatarEditorCategories()

	return t3.getCategoryInfo(v132, n7, n8)
end)

local v78 = memoize(function(p3, _, b1: boolean?) -- line: 353
	-- upvalues: Constants (copy)
	local v137 = if not b1 then Constants.ItemTileTitleMaxLines else Constants.CreatorNameItemTileTitleMaxLines
	local v138 = if not b1 then Constants.ItemTilePadding else Constants.CreatorNameItemTilePadding

	return function(p5) -- line: 361
		-- upvalues: v137 (copy), p3 (copy), v138 (copy), b1 (copy)
		local v469 = v137 * p3
		local v470 = v138 * 2
		local v471 = if not (p5 < 100) then not (p5 < 148) and 42 or 36 else 30

		if b1 then
			v471 *= 2
		end

		return p5 + v469 + v470 + v471
	end
end)
local v79 = memoize(function(p6, _, b2: boolean?) -- line: 376
	-- upvalues: Constants (copy)
	local v142 = if not b2 then Constants.ItemTileTitleMaxLines else Constants.CreatorNameItemTileTitleMaxLines
	local v143 = if not b2 then Constants.ItemTilePadding else Constants.CreatorNameItemTilePadding

	return function(p8) -- line: 384
		-- upvalues: Constants (copy), v142 (copy), p6 (copy), v143 (copy), b2 (copy)
		local v473 = p8 / Constants.ItemTileTallAspectRatio
		local v474 = v142 * p6
		local v475 = v143 * 2
		local v476 = if not (p8 < 100) then not (p8 < 148) and 42 or 36 else 30

		if b2 then
			v476 *= 2
		end

		return v473 + v474 + v475 + v476
	end
end)

function t3.isLooksWidget(s7: string?) -- line: 400
	-- upvalues: u68 (ref)
	return table.find(u68, s7) ~= nil
end
function t3.isAvatarLooksWidget(s8: string?) -- line: 409
	-- upvalues: t3 (copy), u70 (ref)
	return t3.isLooksWidget(s8) and table.find(u70, s8) ~= nil
end

local v80 = memoize(function(n9: number, _: boolean?, b4: boolean?, b5: boolean?, b6: boolean?) -- line: 416
	-- upvalues: Constants (copy)
	return function(n10: number) -- line: 423
		-- upvalues: Constants (copy), b4 (copy), b5 (copy), b6 (copy), n9 (copy)
		local v478 = n10 / Constants.LookTileAspectRatio
		local v479 = b4 or b5

		if not b6 then
			v478 += 30
		elseif v479 then
			v478 += 30
		end

		if v479 then
			v478 += 4
		end

		if b4 then
			v478 += n9
		end

		if b5 then
			if b4 then
				v478 += 4
			end

			v478 += n9
		end

		return v478
	end
end)
local v81 = memoize(function(n11: number) -- line: 464
	-- upvalues: Constants (copy)
	return function(n12: number) -- line: 465
		-- upvalues: Constants (copy), n11 (copy)
		local v481 = Constants.ItemTileTitleMaxLines * n11
		local ItemTilePadding = Constants.ItemTilePadding

		return n12 + v481 + ItemTilePadding
	end
end)

local function squareItemHeightGetter(n13: number) -- line: 473
	return n13
end

local v83 = memoize(function(n14: number?) -- line: 477
	-- upvalues: squareItemHeightGetter (copy), FFlagAXSlotsInventoryLoadableGridView (copy), Constants (copy), FFlagAXRootSlotBasedEditorFlag (copy)
	if n14 == nil then
		return squareItemHeightGetter
	end

	return function(n15: number) -- line: 481
		-- upvalues: FFlagAXSlotsInventoryLoadableGridView (copy), Constants (copy), n14 (copy), FFlagAXRootSlotBasedEditorFlag (copy)
		local v484 = if not FFlagAXSlotsInventoryLoadableGridView then Constants.ItemTileTitleMaxLines * n14 else Constants.EditorItemTileTitleMaxLines * n14
		local v485 = if not FFlagAXRootSlotBasedEditorFlag then Constants.ItemTilePadding * 2 else Constants.ItemTilePadding

		return n15 + v484 + v485
	end
end)

function t3.mergeKeywordsAndTopics(s9: string?, s10: string?) -- line: 515
	local v157 = if not s9 then {} else string.split(s9, " ")

	for _, v159 in if not s10 then {} else string.split(s10, " ") do
		if #v159 > 0 and not table.find(v157, v159) then
			table.insert(v157, v159)
		end
	end

	return table.concat(v157, " ")
end

t3.GetCategoryIdsFromNavKey = memoize(function(p9, p10) -- line: 534
	-- upvalues: FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesFromStore (copy), GetCatalogCategories (copy)
	for _, v163 in if not FFlagAXCatalogCategoriesStore then GetCatalogCategories() else GetCatalogCategoriesFromStore() do
		if not v163.NavigationKey then
			continue
		end

		local Id = v163.Id

		if p9 == v163.NavigationKey then
			if v163.Subcategories and p10 then
				for _, v166 in v163.Subcategories do
					if p10 == v166.NavigationKey then
						return Id, v166.Id
					end
				end
			end

			return Id, nil
		end
	end

	return nil, nil
end)
t3.GetAvatarEditorCategoryIdsFromNavKey = memoize(function(s11: string) -- line: 557
	-- upvalues: GetAvatarEditorCategories (copy), FFlagAXEditorSubcategoryFilters (copy)
	for v168, v169 in (GetAvatarEditorCategories()) do
		if s11 == v169.NavigationKey then
			return v168, nil, nil
		end

		if v169.Subcategories then
			for v170, v171 in v169.Subcategories do
				if s11 == v171.NavigationKey then
					return v168, v170, nil
				end

				if FFlagAXEditorSubcategoryFilters and v171.SubcategoryFilters then
					for v172, v173 in v171.SubcategoryFilters do
						if s11 == v173.NavigationKey then
							return v168, v170, v172
						end
					end
				end
			end
		end
	end

	return nil, nil, nil
end)

function t3.GridItemHeightGetter(p11, ...) -- line: 582
	-- upvalues: Constants (copy), v83 (copy), squareItemHeightGetter (copy), v81 (copy), v80 (copy), v78 (copy), v79 (copy)
	if p11 == Constants.ItemTileType.AvatarEditorTile then
		return v83(...)
	end

	if p11 == Constants.ItemTileType.BodyColorButton then
		return squareItemHeightGetter
	end

	if p11 == Constants.ItemTileType.BundleItemTile then
		return v81(...)
	end

	if p11 == Constants.ItemTileType.BundleItemTileNoText then
		return squareItemHeightGetter
	end

	if p11 == Constants.ItemTileType.LookItemTile then
		return v80(...)
	end

	if p11 == Constants.ItemTileType.CatalogItemTile then
		return v78(...)
	end

	if p11 == Constants.ItemTileType.TallCatalogItemTile then
		return v79(...)
	end

	warn("Unknown itemType " .. tostring(p11) .. " in AvatarExperienceUtils.GridItemHeightGetter")

	return squareItemHeightGetter
end
function t3.GridItemHeightGetterWithOptions(t10: {[any]: any}) -- line: 614
	-- upvalues: Constants (copy), v83 (copy), squareItemHeightGetter (copy), v81 (copy), v80 (copy), v78 (copy), v79 (copy)
	local itemTileType = t10.itemTileType

	if itemTileType == Constants.ItemTileType.AvatarEditorTile then
		return v83(t10.fontHeight)
	end

	if itemTileType == Constants.ItemTileType.BodyColorButton then
		return squareItemHeightGetter
	end

	if itemTileType == Constants.ItemTileType.BundleItemTile and t10.fontHeight then
		return v81(t10.fontHeight)
	end

	if itemTileType == Constants.ItemTileType.BundleItemTileNoText then
		return squareItemHeightGetter
	end

	if itemTileType == Constants.ItemTileType.LookItemTile and t10.fontHeight then
		return v80(t10.fontHeight, t10.hideItemName, t10.itemCreatorNamesEnabled, t10.itemPriceEnabled, t10.isWidgetFocused)
	end

	if itemTileType == Constants.ItemTileType.CatalogItemTile then
		return v78(t10.fontHeight, nil, t10.itemCreatorNamesEnabled)
	end

	if itemTileType == Constants.ItemTileType.TallCatalogItemTile then
		return v79(t10.fontHeight, nil, t10.itemCreatorNamesEnabled)
	end

	warn("Unknown itemType " .. tostring(itemTileType) .. " in AvatarExperienceUtils.GridItemHeightGetterWithOptions")

	return squareItemHeightGetter
end
function t3.isAvatarBackground(p12) -- line: 643
	-- upvalues: AvatarScreen (copy)
	return p12 == AvatarScreen.AvatarBackground
end
function t3.isAvatarExperienceRoute(p13) -- line: 647
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreen (copy), SwitchTab (copy)
	for _, v180 in if not FFlagUseNavigationSelectors then p13.Navigation.history[#p13.Navigation.history] else Selectors.selectCurrentLegacyRoute(p13) do
		if v180.name == AvatarScreen.AvatarExperienceRoot or v180.name == SwitchTab.AvatarExperienceTab then
			return true
		end
	end

	return false
end
function t3.isRouteInAvatarEditor(p14) -- line: 662
	-- upvalues: AvatarScreen (copy)
	return p14.opaque.name == AvatarScreen.AvatarEditor
end
function t3.didLeaveAvatarEditor(p15, p16) -- line: 671
	-- upvalues: t3 (copy)
	if t3.isRouteInAvatarEditor(p16) and not t3.isRouteInAvatarEditor(p15) then
		return true
	end

	return false
end
function t3.getIsSceneFullViewFromState(p17, p18) -- line: 680
	-- upvalues: FullView (copy)
	local name = p18.opaque.name

	return p17.AvatarExperience.Common.FullView[name] == FullView.SceneFullView
end
function t3.getCatalogCategoryInfoFromState(p19) -- line: 685
	-- upvalues: FFlagAXCatalogCategoriesStore (copy), mutedError (copy), t3 (copy)
	if FFlagAXCatalogCategoriesStore then
		mutedError("getCatalogCategoryInfoFromState is not supported with FFlagAXCatalogCategoriesStore")
	end

	local categoryId = p19.AvatarExperience.Catalog.Categories.categoryId
	local subcategoryId = p19.AvatarExperience.Catalog.Categories.subcategoryId

	return t3.getCatalogCategoryInfoById(categoryId, subcategoryId)
end
function t3.getAvatarEditorCategoryInfoFromState(p20) -- line: 695
	-- upvalues: t3 (copy)
	local category = p20.AvatarExperience.AvatarEditor.Categories.category
	local subcategory = p20.AvatarExperience.AvatarEditor.Categories.subcategory

	return t3.getAvatarEditorCategoryInfo(category, subcategory)
end
function t3.getAvatarEditorSubcategoryFilterFromState(p21) -- line: 703
	-- upvalues: t3 (copy)
	local v194 = t3.getAvatarEditorCategoryInfoFromState(p21)

	if v194.SubcategoryFilters then
		local subcategoryFilter = p21.AvatarExperience.AvatarEditor.Categories.subcategoryFilter

		return v194.SubcategoryFilters[subcategoryFilter]
	end

	return nil
end
function t3.getSelectedAccessoryDescription(p22, p23) -- line: 714
	local v198 = tonumber(p23) or 0

	for _, v200 in p22:GetChildren() do
		if v200:IsA("AccessoryDescription") and v198 == v200.AssetId then
			return v200
		end
	end

	return nil
end
function t3.getAccessoryAdjustmentCategoryInfo(p24) -- line: 729
	-- upvalues: t3 (copy), Constants4 (copy)
	local v202 = p24.AvatarExperience.AccessoryAdjustment.SelectedAccessory or ""
	local CurrentCharacter = p24.AvatarExperience.AvatarScene.Character.CurrentCharacter

	assert(CurrentCharacter, "assert currentCharacter exists")

	local Humanoid = CurrentCharacter:FindFirstChild("Humanoid")

	assert(Humanoid, "assert humanoid exists")

	local HumanoidDescription = Humanoid:FindFirstChild("HumanoidDescription")

	assert(HumanoidDescription, "assert currentCharacter exists")

	local v206 = t3.getSelectedAccessoryDescription(HumanoidDescription, v202)

	if not v206 then
		return
	end

	assert(v206, "assert accessoryDescription exists")

	return Constants4.CameraCategories[v206.AccessoryType]
end
function t3.getCategoryInfoFromState(p25, p26) -- line: 756
	-- upvalues: AvatarScreen (copy), t3 (copy), FFlagAXCatalogCategoriesStore (copy), GetCatalogCategoriesStore (copy), FFlagAXFixCatalogSearchZoom (copy), t1 (copy), GetFFlagAXExtractEmotesCategory (copy), getEmotesCategory (copy), GetAvatarEditorStructure (copy), Constants (copy), IxpUtils (copy), UniversalAppCameraIXPTest (copy), t2 (copy), FFlagAXCustomizeMakeupSupport (copy)
	local name = p26.opaque.name

	if name == AvatarScreen.AvatarEditor then
		return t3.getAvatarEditorCategoryInfoFromState(p25)
	end

	if name == AvatarScreen.Catalog then
		if FFlagAXCatalogCategoriesStore then
			return (GetCatalogCategoriesStore.getCatalogSelectionStore().selectedCategoryInfo(false))
		end

		return t3.getCatalogCategoryInfoFromState(p25)
	end

	if FFlagAXFixCatalogSearchZoom and name == AvatarScreen.CatalogSearch then
		if FFlagAXCatalogCategoriesStore then
			return GetCatalogCategoriesStore.getCatalogSearchSelectionStore().selectedCategoryInfo(false)
		end

		local categoryId = p25.AvatarExperience.Catalog.SearchCategories.categoryId
		local subcategoryId = p25.AvatarExperience.Catalog.SearchCategories.subcategoryId

		if categoryId then
			local v212 = t3.getCatalogCategoryInfoById(categoryId, subcategoryId)

			if v212 then
				return v212
			end
		end

		return t1
	end

	if name == AvatarScreen.ProfilePictureEditorEmotes then
		if GetFFlagAXExtractEmotesCategory() then
			return (getEmotesCategory())
		end

		local v213 = GetAvatarEditorStructure().AssetTypeToCategorySubcategory[Constants.AssetTypeIdStrings.EmoteAnimation]
		local category = v213.category
		local subcategory = v213.subcategory

		return t3.getAvatarEditorCategoryInfo(category, subcategory)
	end

	if name == AvatarScreen.AdjustAccessoryView then
		local v216 = t3.getAccessoryAdjustmentCategoryInfo(p25)

		if v216 then
			return v216
		end

		return t1
	end

	if IxpUtils.readTestVariable(UniversalAppCameraIXPTest.EnabledForUser) and name == AvatarScreen.CatalogSearch then
		return t2
	end

	if name == AvatarScreen.HeadRefinement then
		return Constants.HeadRefinementCameraCategory
	end

	if FFlagAXCustomizeMakeupSupport and name == AvatarScreen.LayeredMakeupSort then
		return Constants.LayeredMakeupCameraCategory
	end

	return t1
end

local t11 = {
	"Torso",
	"RightArm",
	"LeftArm",
	"LeftLeg",
	"RightLeg"
}

function t3.routeIsProfilePictureEditor(p27) -- line: 831
	-- upvalues: AvatarScreen (copy)
	return p27.opaque.name == AvatarScreen.ProfilePictureEditorEmotes or (p27.opaque.name == AvatarScreen.ProfilePictureEditorCamera or p27.opaque.name == AvatarScreen.ProfilePictureEditorFinal)
end
function t3.routeIsPPEStaticImagePage(p28) -- line: 841
	-- upvalues: AvatarScreen (copy)
	return p28.opaque.name == AvatarScreen.ProfilePictureEditorCamera or p28.opaque.name == AvatarScreen.ProfilePictureEditorFinal
end
function t3.isFullyQualifiedCostume(p29) -- line: 846
	-- upvalues: t11 (copy)
	for _, v221 in t11 do
		if p29[v221] == "" or p29[v221] == 0 then
			return false
		end
	end

	return true
end
function t3.shouldShowGradientForScrollingFrame(p30) -- line: 855
	local AbsoluteSize = p30.AbsoluteSize
	local CanvasSize = p30.CanvasSize
	local CanvasPosition = p30.CanvasPosition

	return AbsoluteSize.X < CanvasSize.X.Offset, CanvasPosition.X > 20, CanvasPosition.X + AbsoluteSize.X < CanvasSize.X.Offset - 20
end
function t3.Round(n16: number, n17: number?) -- line: 868
	local v228 = n17 or 1

	return math.floor((n16 + v228 / 2) / v228) * v228
end
function t3.isFetchingDoneOrFailed(p31, p32) -- line: 873
	-- upvalues: RetrievalStatus (copy)
	local v231 = p31 == RetrievalStatus.Done or p31 == RetrievalStatus.Failed
	local v232 = p32 == RetrievalStatus.Done or p32 == RetrievalStatus.Failed

	return not v231 and v232
end
function t3.getDeviceType() -- line: 881
	-- upvalues: UserInputService (copy), Constants (copy)
	local Platform = UserInputService:GetPlatform()

	if Platform == Enum.Platform.Android then
		return Constants.DeviceType.Android
	end

	if Platform == Enum.Platform.IOS then
		return Constants.DeviceType.IOS
	end

	return Constants.DeviceType.Other
end
function t3.getUserOutfitIdFromBundle(p33) -- line: 893
	-- upvalues: Constants (copy)
	for _, v236 in p33.items do
		if v236.type == Constants.ItemType.Outfit then
			return v236.id
		end
	end

	return nil
end
function t3.getUserOutfitIdsFromBundle(p34) -- line: 904
	-- upvalues: Constants (copy)
	local t12 = {}

	if p34.items then
		for _, v240 in p34.items do
			if v240.type == Constants.ItemType.Outfit then
				table.insert(t12, v240.id)
			end
		end
	end

	return t12
end

t3.getBundleInfo = memoize(function(p35, s12: string?) -- line: 919
	if s12 == nil then
		return nil
	end

	local v243 = p35[s12]

	if not v243 then
		return nil
	end

	if v243.receivedCatalogData then
		return v243
	end

	return nil
end)

function t3.getBundleInfoFromState(p36, s13: string?) -- line: 935
	-- upvalues: t3 (copy)
	local BundleInfos = p36.AvatarExperience.Common.BundleInfos

	return t3.getBundleInfo(BundleInfos, s13)
end
function t3.getOutfitInfoFromBundleIdNoState(p37, p38) -- line: 943
	-- upvalues: t3 (copy), tutils (copy), Cryo (copy)
	if not p37 then
		return nil
	end

	assert(p37, "contentId is not nil: silences type checker")

	local v249 = t3.getUserOutfitIdsFromBundle(p37)

	if #v249 < 1 then
		return nil
	end

	local v250 = nil

	for _, v252 in v249 do
		local v253 = p38[v252]

		if not v253 then
			return nil
		end

		if not v250 then
			v250 = tutils.deepCopy(v253)
		else
			v250.assets = Cryo.Dictionary.join(v250.assets, v253.assets)
		end
	end

	return v250
end
function t3.getOutfitInfoFromBundleId(p39, s14: string?) -- line: 978
	-- upvalues: t3 (copy)
	local v256 = t3.getBundleInfoFromState(p39, s14)
	local OutfitInfos = p39.AvatarExperience.AvatarEditor.OutfitInfos

	return t3.getOutfitInfoFromBundleIdNoState(v256, OutfitInfos)
end
function t3.getAllCategoriesStr(p40) -- line: 985
	local s15 = ""
	local n18 = 1

	while true do
		local v261 = "level" .. n18

		if not p40[v261] then
			break
		end

		if n18 ~= 1 then
			s15 ..= "|"
		end

		s15 ..= p40[v261]
		n18 += 1
	end

	return s15
end
function t3.isAnimationAssetType(p41) -- line: 1007
	-- upvalues: Constants (copy)
	return p41 == Constants.AssetTypeIdStrings.ClimbAnimation or (p41 == Constants.AssetTypeIdStrings.FallAnimation or (p41 == Constants.AssetTypeIdStrings.IdleAnimation or (p41 == Constants.AssetTypeIdStrings.JumpAnimation or (p41 == Constants.AssetTypeIdStrings.RunAnimation or (p41 == Constants.AssetTypeIdStrings.SwimAnimation or p41 == Constants.AssetTypeIdStrings.WalkAnimation)))))
end
function t3.getNumElementsWithKeyField(p42) -- line: 1017
	local n19 = 0

	if p42 then
		for _, v266 in p42 do
			if typeof(v266) == "table" and v266.key then
				n19 += 1
			end
		end
	end

	return n19
end
function t3.lerp(n20: number, n21: number, n22: number) -- line: 1029
	return (n21 - n20) * n22 + n20
end
function t3.getTopBarHeightAvatarScene(p43) -- line: 1033
	-- upvalues: DeviceOrientationMode (copy), Constants3 (copy)
	if not p43.TopBar then
		return 0
	end

	if p43.DeviceOrientation == DeviceOrientationMode.Landscape then
		return p43.TopBar.statusBarHeight + Constants3.NAV_BAR_SIZE
	end

	return p43.TopBar.topBarHeight
end
function t3.tableToCamelCaseKeys(p44) -- line: 1047
	-- upvalues: t3 (copy)
	local t13 = {}

	for v273, v274 in p44 do
		local v275 = v273

		if typeof(v273) == "string" then
			v275 = string.lower((string.sub(v273, 1, 1))) .. string.sub(v273, 2)
		end

		local v276 = v274

		if typeof(v274) == "table" then
			v276 = t3.tableToCamelCaseKeys(v274)
		end

		t13[v275] = v276
	end

	return t13
end
function t3.AssetTypeIdStringToEnumValue(p45) -- line: 1068
	-- upvalues: Constants (copy)
	local v278 = Constants.AssetTypeIdStringToName[p45]

	return Enum.AvatarAssetType[v278]
end
function t3.bundleIdToEnum(p46) -- line: 1073
	-- upvalues: Constants (copy)
	local v280 = Constants.BundleTypeIdStringToName[p46]

	return Enum.BundleType[v280]
end
function t3.getSearchKey(p47, s16: string) -- line: 1078
	-- upvalues: FilterUtils (copy), Constants (copy)
	local v283 = FilterUtils.selectSortAndFiltersKey(p47)

	return Constants.SearchCatalogKey .. s16 .. "." .. v283
end

local function v85(p48) -- line: 1083
	-- upvalues: t (copy)
	assert(t.strictInterface({
		searchUuid = t.union(t.number, t.string),
		searchKeyword = t.optional(t.string),
		recordSearchTime = t.optional(t.boolean),
		categoryInfo = t.optional(t.table),
		minPrice = t.optional(t.number),
		maxPrice = t.optional(t.number),
		catalogSort = t.optional(t.string),
		categoryFilter = t.optional(t.enum(Enum.CatalogCategoryFilter)),
		topics = t.optional(t.array(t.string))
	})(p48))
end
local function v86(p49) -- line: 1098
	-- upvalues: t (copy)
	assert(t.strictInterface({
		CatalogSort = t.optional(t.string),
		CatalogSortAggregation = t.optional(t.string),
		PriceRange = t.strictInterface({
			maxPrice = t.number,
			minPrice = t.number
		}),
		SelectedTopics = t.optional(t.array(t.string)),
		SalesTypeFilter = t.optional(t.string),
		CreatorFilter = t.optional(t.string),
		UnavailableItemFilter = t.optional(t.string),
		WearTimeFilter = t.optional(t.string)
	})(p49))
end
local function v87(p50, t14: {[any]: any}?, t15: {[any]: any}?) -- line: 1124
	-- upvalues: Cryo (copy), t3 (copy)
	if t14 ~= nil and #t14 > 0 then
		p50.AssetTypes = Cryo.List.map(t14, function(p51) -- line: 1126
			-- upvalues: t3 (copy)
			return t3.AssetTypeIdStringToEnumValue(p51)
		end)
	end

	if t15 ~= nil and #t15 > 0 then
		p50.BundleTypes = Cryo.List.map(t15, function(p52) -- line: 1133
			-- upvalues: t3 (copy)
			return t3.bundleIdToEnum(p52)
		end)
	end
end
local function hasSortOrFilters(p53) -- line: 1140
	-- upvalues: CatalogConstants (copy), FFlagAXTimedOptionsSalesTypeFilter (copy)
	return p53.SortType ~= Enum.CatalogSortType.Relevance or (p53.CreatorName ~= "" or (p53.SalesTypeFilter ~= Enum.SalesTypeFilter.All or (p53.SearchKeyword ~= "" or (p53.MinPrice > CatalogConstants.MinPriceFilter or (p53.MaxPrice < CatalogConstants.MaxPriceFilter or (p53.IncludeOffSale or game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and (not FFlagAXTimedOptionsSalesTypeFilter and p53.TimedOptionFilter ~= Enum.CatalogTimedOptionFilter.All)))))))
end

if FFlagAXHttpCatalogV2SearchItemDetails then
	function t3.getSearchParamsAsQueryParams(p54, p55) -- line: 1155
		-- upvalues: FFlagAXAddHDCatalogTab (copy), CatalogConstants (copy), hasSortOrFilters (copy)
		local t16 = {
			keyword = p54.SearchKeyword or "",
			limit = p54.Limit
		}

		if FFlagAXAddHDCatalogTab then
			if p55 and p55.CategoryFilter and (CatalogConstants.CategoryFilters[p55.CategoryFilter] == nil or p54.CategoryFilter ~= Enum.CatalogCategoryFilter.None) then
				t16.categoryFilter = p55.CategoryFilter
			end
		elseif p54.CategoryFilter ~= Enum.CatalogCategoryFilter.None and not hasSortOrFilters(p54) then
			t16.categoryFilter = tostring(p54.CategoryFilter.Name)
		end

		t16.sortType = CatalogConstants.SortTypeAPIMap[tostring(p54.SortType.Name)]

		if p54.CreatorName and p54.CreatorName ~= "" then
			t16.creatorName = p54.CreatorName
		end

		if p55 and p55.TaxonomyUuid then
			t16.taxonomy = tostring(p55.TaxonomyUuid)
		else
			if p54.BundleTypes and #p54.BundleTypes > 0 then
				local t17 = {}

				for _, v295 in p54.BundleTypes do
					table.insert(t17, v295.Value)
				end

				t16.bundleTypeIds = t17
			end

			if p54.AssetTypes and #p54.AssetTypes > 0 then
				local t18 = {}

				for _, v298 in p54.AssetTypes do
					table.insert(t18, v298.Value)
				end

				t16.assetTypeIds = t18
			end
		end

		t16.includeNotForSale = p54.IncludeOffSale
		t16.creatorType = "All"

		if p54.MinPrice and p54.MinPrice > CatalogConstants.MinPriceFilter then
			t16.minPrice = p54.MinPrice
		end

		if p54.MaxPrice and p54.MaxPrice < CatalogConstants.MaxPriceFilter then
			t16.maxPrice = p54.MaxPrice
		end

		if p54.SalesTypeFilter and p54.SalesTypeFilter ~= Enum.SalesTypeFilter.All then
			t16.salesTypeFilter = tostring(p54.SalesTypeFilter.Name)
		end

		if p54.SortAggregation and (p54.SortType == Enum.CatalogSortType.MostFavorited or p54.SortType == Enum.CatalogSortType.Bestselling) then
			t16.sortAggregation = tostring(p54.SortAggregation.Name)
		end

		return t16
	end
end

function t3.getSearchParams(p56, p57, b7: boolean?) -- line: 1253
	-- upvalues: v85 (copy), v86 (copy), FFlagAXTimedOptionsSalesTypeFilter (copy), FFlagAXCatalogSearchParamTypes (copy), v87 (copy), CatalogConstants (copy), v54 (copy), UnavailableItemFilter (copy), SalesTypeFilter (copy), FFlagAXRemoveTimedOptionsSalesTypeEnumCheck (copy), mutedError (copy), WearTimeFilter (copy), SortType (copy), hasSortOrFilters (copy)
	v85(p56)
	v86(p57)

	local catalogSearchParams = CatalogSearchParams.new()
	local searchKeyword = nil

	if p56.searchKeyword then
		searchKeyword = p56.searchKeyword
	end

	catalogSearchParams.AssetTypes = {}
	catalogSearchParams.BundleTypes = {}
	catalogSearchParams.IncludeOffSale = false

	if game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") and not FFlagAXTimedOptionsSalesTypeFilter then
		catalogSearchParams.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All
	end

	local v304 = false
	local v305 = if not FFlagAXCatalogSearchParamTypes then p56.topics or p57.SelectedTopics else p57.SelectedTopics

	if v305 and #v305 > 0 then
		v304 = true

		local v306 = table.concat(v305, " ")

		if searchKeyword == nil then
			searchKeyword = v306
		else
			if #searchKeyword > 0 then
				searchKeyword ..= " "
			end

			searchKeyword ..= v306
		end
	end

	if searchKeyword then
		catalogSearchParams.SearchKeyword = searchKeyword
	end

	local n23 = 120

	if not searchKeyword and b7 then
		n23 = 30
	end

	catalogSearchParams.Limit = n23

	if p56.categoryInfo == nil then
		catalogSearchParams.CategoryFilter = if not FFlagAXCatalogSearchParamTypes then p56.categoryFilter or Enum.CatalogCategoryFilter.None else Enum.CatalogCategoryFilter.None
		v87(catalogSearchParams, {}, {})
	else
		local CategoryFilter = p56.categoryInfo.CategoryFilter
		local v309 = CatalogConstants.CategoryFilters[CategoryFilter]

		if v309 == nil or v304 then
			catalogSearchParams.CategoryFilter = Enum.CatalogCategoryFilter.None
		else
			catalogSearchParams.CategoryFilter = v309
		end

		local AssetTypeIdStrings = p56.categoryInfo.AssetTypeIdStrings
		local BundleTypes = p56.categoryInfo.BundleTypes

		v87(catalogSearchParams, AssetTypeIdStrings, BundleTypes)
	end

	local v312 = if not FFlagAXCatalogSearchParamTypes then p56.minPrice or p57.PriceRange.minPrice else p57.PriceRange.minPrice
	local v313 = if not FFlagAXCatalogSearchParamTypes then p56.maxPrice or p57.PriceRange.maxPrice else p57.PriceRange.maxPrice

	if v54 and v312 and v313 and v313 < v312 then
		local v314 = v312

		v312 = v313
		v313 = v314
	end

	if v312 > CatalogConstants.MinPriceFilter then
		catalogSearchParams.MinPrice = v312
	end

	if v313 < CatalogConstants.MaxPriceFilter then
		catalogSearchParams.MaxPrice = v313
	end

	local v315 = if not FFlagAXCatalogSearchParamTypes then p56.catalogSort or p57.CatalogSort else p57.CatalogSort

	catalogSearchParams.SortType = Enum.CatalogSortType[v315]

	if p57.UnavailableItemFilter ~= UnavailableItemFilter.Hide then
		catalogSearchParams.IncludeOffSale = true
	end

	local SalesTypeFilter2 = p57.SalesTypeFilter

	if SalesTypeFilter2 ~= SalesTypeFilter.All then
		if FFlagAXTimedOptionsSalesTypeFilter then
			if not FFlagAXRemoveTimedOptionsSalesTypeEnumCheck then
				local ok = pcall(function() -- line: 1362
					local _ = Enum.SalesTypeFilter.TimedOptions
				end)

				if SalesTypeFilter2 == SalesTypeFilter.TimedOptions and not ok then
					mutedError("Referenced TimeOptions sales type but enum value is not present")
				else
					catalogSearchParams.SalesTypeFilter = Enum.SalesTypeFilter[SalesTypeFilter2]
				end
			else
				catalogSearchParams.SalesTypeFilter = Enum.SalesTypeFilter[SalesTypeFilter2]
			end
		else
			catalogSearchParams.SalesTypeFilter = Enum.SalesTypeFilter[SalesTypeFilter2]
		end
	end

	local CreatorFilter = p57.CreatorFilter

	if CreatorFilter ~= nil and CreatorFilter ~= "" then
		catalogSearchParams.CreatorName = CreatorFilter
	end

	if not FFlagAXTimedOptionsSalesTypeFilter and game:GetEngineFeature("AvatarEditorServiceTimedOptionsSupport") then
		local WearTimeFilter2 = p57.WearTimeFilter

		if WearTimeFilter2 == WearTimeFilter.All then
			catalogSearchParams.TimedOptionFilter = Enum.CatalogTimedOptionFilter.All
		elseif WearTimeFilter2 == WearTimeFilter.TimedOptionsOnly then
			catalogSearchParams.TimedOptionFilter = Enum.CatalogTimedOptionFilter.TimedOptionOnly
		end
	end

	if v315 == SortType.MostFavorited or v315 == SortType.Bestselling then
		catalogSearchParams.SortAggregation = Enum.CatalogSortAggregation[p57.CatalogSortAggregation]
	end

	if hasSortOrFilters(catalogSearchParams) then
		catalogSearchParams.CategoryFilter = Enum.CatalogCategoryFilter.None
	end

	return catalogSearchParams
end
function t3.getWebAssetModelFromEquippedAssets(p58) -- line: 1421
	-- upvalues: Constants (copy)
	local t19 = {}

	for v322, v323 in p58 do
		local v324 = Constants.LayeredAssetTypes[v322] ~= nil

		for v325, v326 in v323 do
			table.insert(t19, {
				id = v325,
				meta = v324 and v326 or nil
			})
		end
	end

	return t19
end
function t3.createHumanoidDescriptionAccessoryInfo(p59, p60, p61) -- line: 1443
	-- upvalues: Constants (copy)
	local num = tonumber(p60)

	assert(num ~= nil, "assetIdAsNumber is not nil. Silence type checker.")

	return {
		AssetId = num,
		Order = p61.order,
		AccessoryType = p61.type or Constants.AssetTypeIdToAccessoryTypeEnum[p59],
		IsLayered = p61.isLayered,
		Position = p61.position,
		Rotation = p61.rotation,
		Scale = p61.scale
	}
end
function t3.createDefaultHumanoidDescriptionAccessoryInfo(p62, p63) -- line: 1465
	-- upvalues: mutedError (copy), Constants (copy)
	local num = tonumber(p63)

	if num == nil then
		mutedError("Called AvatarExperienceUtils.createDefaultHumanoidDescriptionAccessoryInfo with assetId that does not convert to string.")
		num = 0
	end

	assert(num, "assetIdAsNumber is non-nil: Silence type checker")

	return {
		AssetId = num,
		Order = Constants.LayeredClothingOrder[p62],
		AccessoryType = Constants.AssetTypeIdToAccessoryTypeEnum[p62],
		IsLayered = Constants.LayeredAssetTypes[p62] ~= nil
	}
end
function t3.getNewFullViewEnum(p64) -- line: 1490
	-- upvalues: FullView (copy)
	if p64 == FullView.None then
		return FullView.UIFullView
	end

	return FullView.None
end
function t3.getPartCFrame(p65, s17: string) -- line: 1498
	-- upvalues: Constants (copy)
	if p65 and p65:FindFirstChild(s17) then
		return p65[s17].CFrame
	end

	return CFrame.new(Constants.DefaultRigPosition)
end
function t3.getAttachmentCFrame(p66, s18: string, s19: string) -- line: 1506
	-- upvalues: FFlagAvatarJointUpgradeInUA (copy)
	if p66 and p66:FindFirstChild(s18) then
		local v340 = p66[s18]
		local v341 = if not FFlagAvatarJointUpgradeInUA then v340:FindFirstChild(s19) else nil

		if FFlagAvatarJointUpgradeInUA then
			for _, v343 in v340:GetDescendants() do
				if v343:IsA("Attachment") and s19 == v343.Name then
					v341 = v343

					break
				end
			end
		end

		if v341 then
			if FFlagAvatarJointUpgradeInUA then
				return v341.WorldCFrame
			end

			return v340.CFrame * v341.CFrame
		end
	end

	return nil
end
function t3.getRecursiveAttachmentCFrame(p67) -- line: 1530
	local p67CFrame = p67.CFrame
	local p67Parent = p67.Parent

	while p67Parent and p67Parent:IsA("Bone") do
		p67CFrame = p67Parent.CFrame * p67CFrame
		p67Parent = p67Parent.Parent
	end

	return p67CFrame
end
function t3.isLCCategory(p68) -- line: 1545
	-- upvalues: Constants (copy)
	if p68 and p68.AssetTypeIdStrings then
		for _, v349 in p68.AssetTypeIdStrings do
			if Constants.LayeredAssetTypes[v349] ~= nil then
				if Constants.LayeredAssetTypes[v349] == Enum.AccessoryType.Hair then
					return false
				end

				return true
			end
		end
	end

	return false
end
function t3.isShoeBundle(p69) -- line: 1571
	-- upvalues: Constants (copy)
	return p69.bundleType == Constants.BundleTypeIdStrings.Shoes or p69.bundleType == Enum.BundleType.Shoes.Name
end
function t3.isBundleOrLCAsset(p70, p71) -- line: 1583
	-- upvalues: Constants (copy)
	local v353 = p70 == Constants.ItemType.Bundle

	return p70 == Constants.ItemType.Asset and Constants.LayeredAssetTypes[p71] ~= nil or v353
end
function t3.isBoundingBoxVectorSane(p72) -- line: 1595
	return p72.X <= 50000 and (p72.X >= -50000 and (p72.Y <= 50000 and (p72.Y >= -50000 and (p72.Z <= 50000 and p72.Z >= -50000))))
end
function t3.isBoundingBoxCFrameSane(p73) -- line: 1609
	-- upvalues: t3 (copy)
	return t3.isBoundingBoxVectorSane(p73.Position) and t3.isBoundingBoxVectorSane(p73.LookVector)
end
function t3.getAssetIdsWithGeometryFromHumanoidDescription(p74) -- line: 1619
	if p74 == nil then
		return {}
	end

	local t20 = {}

	for _, v359 in (p74:GetAccessories(true)) do
		if v359.AssetId then
			table.insert(t20, v359.AssetId)
		end
	end

	if p74.Torso then
		table.insert(t20, p74.Torso)
	end

	if p74.RightLeg then
		table.insert(t20, p74.RightLeg)
	end

	if p74.RightArm then
		table.insert(t20, p74.RightArm)
	end

	if p74.LeftLeg then
		table.insert(t20, p74.LeftLeg)
	end

	if p74.LeftArm then
		table.insert(t20, p74.LeftArm)
	end

	if p74.Head then
		table.insert(t20, p74.Head)
	end

	return t20
end
function t3.calculateNewAssetIdsWithGeometry(p75, p76) -- line: 1657
	-- upvalues: t3 (copy), Cryo (copy)
	if not p75 or not p76 then
		return {}
	end

	local v362 = t3.getAssetIdsWithGeometryFromHumanoidDescription(p75)
	local v363 = t3.getAssetIdsWithGeometryFromHumanoidDescription(p76)
	local v364 = Cryo.List.toSet(v362)

	return (Cryo.List.filter(v363, function(p77) -- line: 1668
		-- upvalues: v364 (copy)
		return v364[p77] == nil
	end))
end
function t3.getItemIconTypeFromOutfit(p78) -- line: 1674
	-- upvalues: Constants (copy), ItemTileEnums (copy)
	local v366 = p78.outfitType == Constants.OutfitTypes.DynamicHead
	local containsDynamicHead = p78.containsDynamicHead

	if v366 or containsDynamicHead then
		return ItemTileEnums.ItemIconType.DynamicHead
	end

	return nil
end
function t3.getItemStatusStyleFromOutfit(p79) -- line: 1685
	-- upvalues: ItemTileEnums (copy)
	local moderationStatus = p79.moderationStatus

	if moderationStatus == Enum.ModerationStatus.ReviewedRejected then
		return ItemTileEnums.StatusStyle.AlertIcon
	end

	if moderationStatus == Enum.ModerationStatus.NotReviewed then
		return ItemTileEnums.StatusStyle.PendingIcon
	end

	return nil
end
function t3.isModerationPendingOrRejected(p80) -- line: 1696
	return p80 == Enum.ModerationStatus.NotReviewed or p80 == Enum.ModerationStatus.ReviewedRejected
end
function t3.getMessageTypeFromModerationStatus(p81) -- line: 1701
	if not p81 then
		return nil
	end

	if p81 == Enum.ModerationStatus.NotReviewed then
		return "UnavailableItems"
	end

	if p81 == Enum.ModerationStatus.ReviewedRejected then
		return "ItemDidNotMeetRobloxCommunityStandards"
	end

	return nil
end
function t3.getModerationStatusFromAvailabilityStatus(p82) -- line: 1716
	-- upvalues: InventoryItemAvailability (copy)
	if not p82 then
		return nil
	end

	return ({
		[InventoryItemAvailability.Invalid] = Enum.ModerationStatus.Invalid,
		[InventoryItemAvailability.Available] = Enum.ModerationStatus.ReviewedApproved,
		[InventoryItemAvailability.Unavailable] = Enum.ModerationStatus.ReviewedRejected,
		[InventoryItemAvailability.Revoked] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.PartiallyAvailableWithUnavailableSubitems] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.PartiallyAvailableWithExpiredSubitems] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.Expired] = Enum.ModerationStatus.NotApplicable,
		[InventoryItemAvailability.PendingReview] = Enum.ModerationStatus.NotReviewed
	})[p82]
end
function t3.assetTypeIdIsAnimationOrEmote(p83) -- line: 1735
	-- upvalues: Constants (copy)
	if not p83 then
		return false
	end

	return Constants.AssetTypeIdToCategory[p83] == Constants.AssetCategories.Animation
end

local v89 = memoize(function(p84) -- line: 1745
	-- upvalues: Constants (copy)
	local v375 = p84 and p84[Constants.AssetTypeIdStrings.MoodAnimation]

	return v375 and next(v375)
end)

function t3.getEquippedMoodAssetId(p85) -- line: 1752
	-- upvalues: v89 (copy)
	local EquippedAssets = p85.AvatarExperience.AvatarEditor.Character.EquippedAssets

	return v89(EquippedAssets)
end
function t3.getAssetIdForPPEPose(p86) -- line: 1757
	-- upvalues: Constants (copy), t3 (copy)
	local AvatarExperience = p86.AvatarExperience

	for _, v381 in p86.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
		if v381.itemType == Constants.ItemType.Asset and t3.assetTypeIdIsAnimationOrEmote(v381.itemSubType) then
			return v381.itemId
		end
	end

	if AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId then
		return AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId
	end

	return nil
end

local v90 = memoize(function(p87) -- line: 1778
	-- upvalues: Constants (copy)
	return p87 and (p87[Constants.AssetTypeIdStrings.Gear] and next(p87[Constants.AssetTypeIdStrings.Gear]))
end)

function t3.getEquippedToolId(p88) -- line: 1785
	-- upvalues: v90 (copy)
	local EquippedAssets = p88.AvatarExperience.AvatarEditor.Character.EquippedAssets

	return v90(EquippedAssets)
end
function t3.getNextPageCursorKey(s20: string, b8: boolean, p89) -- line: 1794
	if b8 then
		return s20 .. (p89 or "")
	end

	return s20
end
function t3.getPerformFetchKey(s21: string, b9: boolean, p90) -- line: 1810
	-- upvalues: Constants (copy)
	if b9 then
		return Constants.OutfitsKey .. s21 .. (p90 or "")
	end

	return Constants.UserInventoryKey .. s21
end
function t3.getCurrentScreenIgnoreItemDetails(p91) -- line: 1826
	-- upvalues: AvatarScreen (copy)
	local name = p91.current.name

	if name == AvatarScreen.ItemDetails or (name == AvatarScreen.LookDetails or name == AvatarScreen.OutfitDetails) then
		name = p91.opaque.name
	end

	return name
end
function t3.getLargestPossibleOneLineTextSize(p92, p93, p94, n24: number) -- line: 1845
	-- upvalues: TextService (copy)
	local v397 = n24 - 1
	local vector2 = Vector2.new(v397, 100000)

	while p93 > 1 do
		local TextSize = TextService:GetTextSize(p92, p93, p94.Font, vector2)

		if TextSize.Y <= p93 + 1 then
			return Vector2.new(math.ceil(TextSize.X), (math.ceil(TextSize.Y))), p93
		end

		p93 -= 1
	end

	return nil, nil
end
function t3.selectSceneSize(p95) -- line: 1881
	-- upvalues: DeviceOrientationMode (copy), getSafeAreaSize (copy), Constants (copy)
	local GlobalGuiInset = p95.GlobalGuiInset
	local v402 = p95.DeviceOrientation == DeviceOrientationMode.Portrait
	local ScreenSize = p95.ScreenSize
	local YOffset = getSafeAreaSize(ScreenSize, GlobalGuiInset).Y.Offset
	local bottom = GlobalGuiInset.bottom
	local v406 = ScreenSize.Y - bottom
	local v407 = YOffset * Constants.PortraitSceneHeight
	local v408 = v402 and v407 or v406
	local v409 = ScreenSize.X * Constants.LandscapeSceneWidth

	return v408, v402 and ScreenSize.X or v409
end

t3.getColor3Difference = memoize(function(color3: Color3, color3_2: Color3) -- line: 1901
	return (math.sqrt((color3.R - color3_2.R) * (color3.R - color3_2.R) + (color3.G - color3_2.G) * (color3.G - color3_2.G) + (color3.B - color3_2.B) * (color3.B - color3_2.B)))
end)
t3.bodyColorToBodyColor3 = memoize(function(n25: number?) -- line: 1905
	if n25 then
		return BrickColor.new(n25).Color
	end

	return nil
end)
t3.bodyPartForSkinColoringIdToBodyColorId = {
	headColor3 = "headColorId",
	torsoColor3 = "torsoColorId",
	rightArmColor3 = "rightArmColorId",
	rightLegColor3 = "rightLegColorId",
	leftArmColor3 = "leftArmColorId",
	leftLegColor3 = "leftLegColorId"
}
t3.bodyColorIdToBodyPartForSkinColoringId = {}

for k, v in pairs(t3.bodyPartForSkinColoringIdToBodyColorId) do
	t3.bodyColorIdToBodyPartForSkinColoringId[v] = k
end

t3.convertBodyColor3sToHexes = memoize(function(p96) -- line: 1938
	local t21 = {}

	for k, v in pairs(p96) do
		t21[k] = v:ToHex()
	end

	return t21
end)
t3.convertBodyColor3HexesToColor3s = memoize(function(p97) -- line: 1956
	local t22 = {}

	for k, v in pairs(p97) do
		t22[k] = Color3.fromHex(v)
	end

	return t22
end)

function t3.isAvatarSceneButtonsVisible(p98, b10: boolean, b11: boolean, b12: boolean, p99) -- line: 1965
	-- upvalues: AvatarScreenProperties (copy)
	local v426 = (AvatarScreenProperties[p98.opaque.name] or {}).refinementButtonVisible and (not b11 and not b12)

	if p99 then
		return v426 and p99.state.key == p98.opaque.key
	end

	return v426 and b10
end
function t3.isUserCameraEligible() -- line: 1988
	-- upvalues: Cryo (copy), Players (copy), v49 (copy)
	local CameraDevices = game:GetService("VideoCaptureService"):GetCameraDevices()
	local v428 = Cryo.isEmpty(CameraDevices)

	assert(Players ~= nil, "Players should always be defined")

	return not (v428 or v49)
end
function t3.getUserId(p100) -- line: 1997
	if p100.LocalUserId then
		return p100.LocalUserId
	end

	if p100.RobloxUser and p100.RobloxUser.rbxuid then
		return (tostring(p100.RobloxUser.rbxuid))
	end

	return nil
end
function t3.isItemSelectable(p101) -- line: 2009
	if p101 == nil then
		return false
	end

	local noPriceStatus = p101.noPriceStatus

	if noPriceStatus == nil or noPriceStatus == "Free" then
		return true
	end

	if noPriceStatus == "Unavailable" then
		return false
	end

	if p101.quantityOwned > 0 then
		return true
	end

	return false
end
function t3.isTryingOnClassicFace(p102) -- line: 2027
	-- upvalues: Dash (copy), Constants (copy)
	return Dash.some(p102, function(p103) -- line: 2028
		-- upvalues: Constants (copy)
		return p103.itemType == "Asset" and p103.itemSubType == Constants.AssetTypeIdStrings.Face
	end)
end
function t3.isTryingOnDynamicHead(p104) -- line: 2033
	-- upvalues: Dash (copy), Constants (copy)
	return Dash.some(p104, function(p105) -- line: 2034
		-- upvalues: Constants (copy)
		return p105.itemType == "Bundle" and p105.itemSubType == Constants.BundleTypeIdStrings.DynamicHead
	end)
end

t3.getRecommendedAssetTypeIdStringFromCategoryInfo = memoize(function(p106) -- line: 2044
	if p106.RecommendedAssetTypeIdString then
		return p106.RecommendedAssetTypeIdString
	end

	if p106.AssetTypeIdStrings and #p106.AssetTypeIdStrings == 1 then
		return p106.AssetTypeIdStrings[1]
	end

	return nil
end)
t3.getRecommendedKey = memoize(function(p107) -- line: 2058
	-- upvalues: Constants2 (copy), t3 (copy), mutedError (copy), Constants (copy), GetFFlagAXEnableRecommendationTypeAllInCustomize (copy)
	if p107.RecommendationsType == Constants2.RecommendationsType.Asset then
		local v436 = t3.getRecommendedAssetTypeIdStringFromCategoryInfo(p107)

		if not v436 then
			mutedError("called getRecommendedKey with a category with no assetTypeIdString")

			return Constants.AssetTypeIdStrings.Hat
		end

		return v436
	end

	if p107.RecommendationsType == Constants2.RecommendationsType.BodyParts then
		return Constants2.RecommendationsType.BodyParts
	end

	if p107.RecommendationsType == Constants2.RecommendationsType.AvatarAnimations then
		return Constants2.RecommendationsType.AvatarAnimations
	end

	if p107.RecommendationsType == Constants2.RecommendationsType.Shoes then
		return Constants2.RecommendationsType.Shoes
	end

	if p107.RecommendationsType == Constants2.RecommendationsType.DynamicHeads then
		return Constants2.RecommendationsType.DynamicHeads
	end

	if GetFFlagAXEnableRecommendationTypeAllInCustomize() and p107.RecommendationsType == Constants2.RecommendationsType.All then
		return Constants2.RecommendationsType.All
	end

	return Constants2.RecommendationsType.None
end)
t3.getCategoryInfoByName = memoize(function(t23: {[any]: any}, s22: string, s23: string?) -- line: 2091
	-- upvalues: t3 (copy)
	local v440 = nil
	local v441 = nil

	for v442, v443 in t23 do
		if s22 == v443.Name then
			v440 = v442

			if not s23 or not v443.Subcategories then
				break
			end

			for v444, v445 in v443.Subcategories do
				if s23 == v445.Name then
					v441 = v444

					break
				end
			end

			assert(v441 ~= nil, "Could not find subcategory with name " .. s23)

			break
		end
	end

	assert(v440 ~= nil, "Could not find category with name  " .. s22)

	return (t3.getCategoryInfo(t23, v440, v441))
end)
t3.getAssetIdFromContent = memoize(function(s24: string?) -- line: 2117
	if s24 == nil then
		return nil
	end

	assert(s24, "contentId is not nil: silences type checker")

	local match = string.match(s24, ".*?id=([0-9]+)")

	if match then
		return match
	end

	return string.match(s24, "rbxassetid://([0-9]+)")
end)
t3.sortOutfitTryOnItemsByRecency = memoize(function(p108, b13: boolean) -- line: 2132
	local t24 = {}

	for _, v452 in p108 do
		table.insert(t24, v452)
	end

	table.sort(t24, function(p109, p110) -- line: 2139
		-- upvalues: b13 (copy)
		if p109.itemRecency and p110.itemRecency then
			if b13 then
				return p109.itemRecency > p110.itemRecency
			end

			return p109.itemRecency < p110.itemRecency
		end

		return false
	end)

	return t24
end)

function t3.fuzzyEq(n26: number, n27: number, n28: number?) -- line: 2154
	return (n28 or 0.001) > math.abs(n26 - n27)
end
function t3.getCreatorNameTileFooterEnabled(p111) -- line: 2159
	return p111 and (p111.customizedDataMap and p111.customizedDataMap.creatorNameTileFooterEnabled == "true")
end
function t3.translateString(s25: string, t25: {[any]: any}?) -- line: 2173
	-- upvalues: LocalizationService (copy), Localization (copy), mutedError (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local v460 = Localization.new(RobloxLocaleId)

	v460:SetLocale(RobloxLocaleId)

	local ok, result = pcall(function() -- line: 2178
		-- upvalues: v460 (copy), s25 (copy), t25 (copy)
		return v460:Format(s25, t25)
	end)

	if ok then
		return result
	end

	mutedError("Failed to translate string with key: " .. s25)

	return ""
end
function t3.resolveEditorCategory(s26: string) -- line: 2196
	-- upvalues: GetAvatarEditorCategories (copy)
	for _, v465 in (GetAvatarEditorCategories()) do
		if s26 == v465.Id then
			return v465.Category, nil
		end

		if v465.Subcategories then
			for _, v467 in v465.Subcategories do
				if s26 == v467.Id then
					return v465.Category, v467.Subcategory
				end
			end
		end
	end

	return nil, nil
end

return t3
