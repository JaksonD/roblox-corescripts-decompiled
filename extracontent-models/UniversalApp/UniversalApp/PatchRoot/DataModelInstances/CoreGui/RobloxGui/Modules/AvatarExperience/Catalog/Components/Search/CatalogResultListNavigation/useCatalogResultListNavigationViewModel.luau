local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local useStyle = require(CorePackages.Packages.UIBlox).Core.Style.useStyle

require(CorePackages.Workspace.Packages.AppCommonLib)

local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local GetFFlagAXEnableCategoryPills = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlags.FFlagAXCatalogSupportDisableFilters
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlags.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXCatalogSearchSupportDisableFilters = AvatarExperienceFlags.FFlagAXCatalogSearchSupportDisableFilters
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev

require(script.Parent.CatalogResultListNavigationView)

return function(t1: {[any]: any}) --[[ useCatalogResultListNavigationViewModel ]] -- line: 58
	-- upvalues: React (copy), useNavigation (copy), useStyle (copy), AvatarScreen (copy), FFlagAXCatalogCategoriesStore (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), GetCatalogCategoriesStore (copy), useSignalState (copy), FFlagAXCatalogSupportDisableFilters (copy), GetFFlagAXEnableCategoryPills (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), Constants (copy), FFlagAXCatalogSearchSupportDisableFilters (copy), useAvatarRoute (copy), CatalogUtils (copy)
	local v23 = React.useRef(nil)
	local v24 = React.useRef(nil)
	local v25 = useNavigation()
	local Theme = useStyle().Theme
	local fromSearch = t1.fromSearch
	local v28 = t1.searchInCatalog and t1.searchInCatalog.items or nil
	local v29 = not not t1.focusedWidget and not not t1.focusedWidget.active
	local v30 = fromSearch
	local v31 = true
	local v32 = fromSearch

	if t1.hidePillBar then
		v30 = false
		v32 = false
	end

	if t1.hideTopBar then
		v31 = false
		v32 = false
		v30 = false
	end

	local searchKeyword = nil
	local routeName = v25.state.routeName

	if routeName == AvatarScreen.CatalogSearch then
		searchKeyword = (v25.getParam("searchParams") or {}).searchKeyword
	end

	local v35 = if not v31 then nil else v23
	local v36 = nil
	local v37 = nil
	local v38 = nil
	local DisableFilters = nil

	if FFlagAXCatalogCategoriesStore then
		if FFlagAXCatalogCategoriesSDUI and not FFlagAXMigrateAllTabToSduiDev then
			local v40 = GetCatalogCategoriesStore.getCatalogCategoriesStore()

			v38 = useSignalState(v40.getCategories)
		end

		local v41 = if not fromSearch then GetCatalogCategoriesStore.getCatalogSelectionStore() else GetCatalogCategoriesStore.getCatalogSearchSelectionStore()

		v36 = useSignalState(v41.selectedCategoryId)
		v37 = useSignalState(v41.selectedSubcategoryId)

		if FFlagAXCatalogSupportDisableFilters then
			DisableFilters = useSignalState(v41.selectedCategoryInfo).DisableFilters
		end
	end

	local v42 = if not GetFFlagAXEnableCategoryPills() and not FFlagAXMoveCatalogFilterToL1Navigation then Constants.MainNavHeight else Constants.CatalogMainNavHeight
	local v43 = v32 and (not v30 and not FFlagAXMoveCatalogFilterToL1Navigation)
	local v44 = nil

	if FFlagAXCatalogSearchSupportDisableFilters then
		v44 = not DisableFilters
	end

	local v45 = true

	if FFlagAXCatalogSupportDisableFilters then
		v45 = not DisableFilters
	end

	local v46 = nil

	if FFlagAXMigrateAllTabToSduiDev then
		local v47 = useAvatarRoute()

		v46 = not v36 and "" or CatalogUtils.getContextForWidgetsById(v47.opaque.name, v36, v37)
	end

	return {
		backgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
		backgroundColor = Theme.BackgroundDefault.Color,
		restorePreviousChildFocus = t1.restorePreviousChildFocus,
		topPanelRef = t1.topPanelRef,
		defaultChildRef = if not v31 then v24 else v23,
		nextSelectionDown = if not t1.hasEntries then nil else t1.gridRef,
		updateHeightBinding = t1.updateHeightBinding,
		showNavBar = v31,
		showTopics = v30,
		showFilterButtonLayout = v43,
		focusedWidgetActive = v29,
		catalogAnalytics = t1.catalogAnalytics,
		axAnalytics = t1.axAnalytics,
		navHeightMain = v42,
		navBarRef = v23,
		navBarNextSelectionDown = if not v30 then nil else v24,
		backToTopSignal = t1.backToTopSignal,
		fromSearch = fromSearch,
		onCategoryOrSubcategoryChange = t1.onCategoryOrSubcategoryChange,
		onCategoryOrSubcategoryChangeById = t1.onCategoryOrSubcategoryChangeById,
		selectedCategoryId = if not FFlagAXCatalogCategoriesStore then nil else v36,
		selectedSubcategoryId = if not FFlagAXCatalogCategoriesStore then nil else v37,
		categories = if not FFlagAXCatalogCategoriesSDUI then nil else v38,
		pillBarRef = v24,
		pillBarNextSelectionUp = v35,
		topicBarItems = v28,
		searchKeyword = searchKeyword,
		showTopicBarFilterButton = v44,
		filterButtonLayoutShowFilterButton = v45,
		filterButtonLayoutNextSelectionUp = v35,
		focusedWidgetTitle = t1.focusedWidget.title,
		focusedWidgetLocalizedTitle = t1.focusedWidget.localizedTitle,
		focusedWidgetLocalizedTooltip = t1.focusedWidget.localizedTooltip,
		showCloseIcon = t1.showCloseIcon,
		searchUuid = t1.searchUuid,
		onCloseFocusedWidget = t1.onCloseFocusedWidget,
		pageIdentifier = if not FFlagAXMigrateAllTabToSduiDev then nil else routeName,
		context = if not FFlagAXMigrateAllTabToSduiDev then nil else v46
	}
end
