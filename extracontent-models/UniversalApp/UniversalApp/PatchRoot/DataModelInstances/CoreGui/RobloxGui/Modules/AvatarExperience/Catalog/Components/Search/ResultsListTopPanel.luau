local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)

require(CorePackages.Workspace.Packages.AppCommonLib)

local Focusable = RoactGamepad.Focusable
local useStyle = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local FilterButtonLayout = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterButtonLayout)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local CatalogTopicBar = require(Modules.AvatarExperience.Catalog.Components.CatalogTopicBar)
local CatalogNavigation = require(Modules.AvatarExperience.Catalog.Components.NavBar.CatalogNavigation)
local FocusedWidgetTopContent = require(Modules.AvatarExperience.Common.Components.Widgets.FocusedWidgetTopContent)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local GetFFlagAXEnableCategoryPills = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlags.FFlagAXCatalogSupportDisableFilters
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlags.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXCatalogSearchSupportDisableFilters = AvatarExperienceFlags.FFlagAXCatalogSearchSupportDisableFilters
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local useSignalState = require(CorePackages.Packages.SignalsReact).useSignalState

return function(t1: {[any]: any}) --[[ ResultsListTopPanel ]] -- line: 56
	-- upvalues: React (copy), useNavigation (copy), useStyle (copy), AvatarScreen (copy), FFlagAXCatalogCategoriesStore (copy), FFlagAXCatalogCategoriesSDUI (copy), GetCatalogCategoriesStore (copy), useSignalState (copy), FFlagAXCatalogSupportDisableFilters (copy), Roact (copy), Focusable (copy), CatalogNavigation (copy), GetFFlagAXEnableCategoryPills (copy), FFlagAXMoveCatalogFilterToL1Navigation (copy), Constants (copy), CatalogTopicBar (copy), FFlagAXCatalogSearchSupportDisableFilters (copy), FilterButtonLayout (copy), FocusedWidgetTopContent (copy)
	local v26 = React.useRef(nil)
	local v27 = React.useRef(nil)
	local v28 = useNavigation()
	local fromSearch = t1.fromSearch
	local catalogAnalytics = t1.catalogAnalytics
	local axAnalytics = t1.axAnalytics
	local searchInCatalog = t1.searchInCatalog
	local v33 = searchInCatalog and searchInCatalog.items or nil
	local Theme = useStyle().Theme
	local fromSearch2 = t1.fromSearch
	local v36 = React.useMemo(function() -- line: 71
		-- upvalues: v28 (copy), AvatarScreen (copy)
		if v28.state.routeName == AvatarScreen.CatalogSearch then
			return (v28.getParam("searchParams") or {}).searchKeyword
		end

		return nil
	end, { v28 })
	local v37 = true
	local v38 = fromSearch
	local hideTopBar = t1.hideTopBar
	local active = t1.focusedWidget.active

	if t1.hidePillBar then
		fromSearch2 = false
		v38 = false
	end

	if hideTopBar then
		v37 = false
		v38 = false
		fromSearch2 = false
	end

	local v41 = if not v37 then nil else v26
	local v42 = nil
	local v43 = nil
	local v44 = nil
	local DisableFilters = nil

	if FFlagAXCatalogCategoriesStore then
		if FFlagAXCatalogCategoriesSDUI then
			local v46 = GetCatalogCategoriesStore.getCatalogCategoriesStore()

			v44 = useSignalState(v46.getCategories)
		end

		local v47 = if not t1.fromSearch then GetCatalogCategoriesStore.getCatalogSelectionStore() else GetCatalogCategoriesStore.getCatalogSearchSelectionStore()

		v42 = useSignalState(v47.selectedCategoryId)
		v43 = useSignalState(v47.selectedSubcategoryId)

		if FFlagAXCatalogSupportDisableFilters then
			DisableFilters = useSignalState(v47.selectedCategoryInfo).DisableFilters
		end
	end

	return Roact.createElement(Focusable.Frame, {
		BackgroundTransparency = Theme.BackgroundDefault.Transparency or 1,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		restorePreviousChildFocus = t1.restorePreviousChildFocus,
		ref = t1.topPanelRef,
		defaultChild = if not v37 then v27 else v26,
		NextSelectionDown = if not t1.hasEntries then nil else t1.gridRef,
		[Roact.Change.AbsoluteSize] = function(p1) -- line: 142
			-- upvalues: t1 (copy)
			t1.updateHeightBinding(p1.AbsoluteSize.Y)
		end
	}, {
		ListLayout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		NavBar = if not v37 then nil else Roact.createElement(CatalogNavigation, {
			analytics = catalogAnalytics,
			axAnalytics = axAnalytics,
			layoutOrderMain = 1,
			layoutOrderSub = 2,
			navHeightMain = if not GetFFlagAXEnableCategoryPills() and not FFlagAXMoveCatalogFilterToL1Navigation then Constants.MainNavHeight else Constants.CatalogMainNavHeight,
			navHeightSub = Constants.SubNavHeight,
			navBarRef = v26,
			NextSelectionDown = if not fromSearch2 then nil else v27,
			backToTopSignal = t1.backToTopSignal,
			showingTopics = fromSearch2,
			fromSearch = fromSearch,
			onCategoryOrSubcategoryChange = t1.onCategoryOrSubcategoryChange,
			onCategoryOrSubcategoryChangeById = t1.onCategoryOrSubcategoryChangeById,
			selectedCategoryId = if not FFlagAXCatalogCategoriesStore then nil else v42,
			selectedSubcategoryId = if not FFlagAXCatalogCategoriesStore then nil else v43,
			categories = if not FFlagAXCatalogCategoriesSDUI then nil else v44
		}),
		PillBar = if not fromSearch2 then if not v38 or FFlagAXMoveCatalogFilterToL1Navigation then nil else Roact.createElement(FilterButtonLayout, {
			height = Constants.PillBarHeight,
			isContentEmpty = true,
			layoutOrder = 3,
			showFilterButton = not FFlagAXCatalogSupportDisableFilters or not DisableFilters,
			layoutRef = v27,
			NextSelectionUp = v41
		}) else Roact.createElement(CatalogTopicBar, {
			layoutOrder = 3,
			NextSelectionUp = v41,
			frameRef = v27,
			items = v33,
			searchKeyword = v36,
			showFilterButton = if not FFlagAXCatalogSearchSupportDisableFilters then nil else not DisableFilters
		}),
		FocusedWidgetBar = if not active then nil else React.createElement(FocusedWidgetTopContent, {
			active = active,
			focusedWidgetTitle = t1.focusedWidget.title,
			focusedWidgetLocalizedTitle = t1.focusedWidget.localizedTitle,
			focusedWidgetLocalizedTooltip = t1.focusedWidget.localizedTooltip,
			showCloseIcon = t1.showCloseIcon,
			searchUuid = t1.searchUuid,
			layoutOrder = 4,
			onClose = t1.onCloseFocusedWidget
		})
	})
end
