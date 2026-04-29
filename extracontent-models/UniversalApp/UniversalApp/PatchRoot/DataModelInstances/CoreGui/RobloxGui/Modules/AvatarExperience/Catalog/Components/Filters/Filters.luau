local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local FilterUtils = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local FilterSubsection = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterSubsection)
local CreatorFilter = require(Modules.AvatarExperience.Common.Enum.CreatorFilter)
local PriceFilter = require(Modules.AvatarExperience.Common.Enum.PriceFilter)
local SalesTypeFilter = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local UnavailableItemFilter = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local WearTimeFilter = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.WearTimeFilter
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization

require(Modules.AvatarExperience.Catalog.Hooks.useFiltersController)

local FilterTextBox = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterTextBox)
local PriceRangeInput = require(Modules.AvatarExperience.Catalog.Components.Filters.PriceRangeInput)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local v17 = game:DefineFastFlag("AXDurablesFilters", false)
local FFlagAXTimedOptionsSalesTypeFilter = AvatarExperienceFlags.FFlagAXTimedOptionsSalesTypeFilter
local Focusable = RoactGamepad.Focusable
local uDim = UDim.new(0, 20)
local uDim2 = UDim.new(0, 12)

return function(t1: {[any]: any}) --[[ Filters ]] -- line: 43
	-- upvalues: RoactGamepad (copy), useLocalization (copy), FFlagAXTimedOptionsSalesTypeFilter (copy), React (copy), v17 (copy), uDim2 (copy), uDim (copy), Focusable (copy), FilterUtils (copy), FilterSubsection (copy), SalesTypeFilter (copy), CreatorFilter (copy), FilterTextBox (copy), WearTimeFilter (copy), PriceFilter (copy), Constants (copy), PriceRangeInput (copy), UnavailableItemFilter (copy)
	local v23 = RoactGamepad.useRefCache()
	local filtersController = t1.filtersController
	local v25 = useLocalization({
		salesType = "Feature.Catalog.Label.Filter.SalesType",
		all = "Feature.Avatar.Heading.All",
		limited = "Feature.Catalog.Label.Limited",
		premium = "Feature.Catalog.Label.Premium",
		timedOptions = if not FFlagAXTimedOptionsSalesTypeFilter then nil else "Feature.Durables.Filter.Title",
		creator = "Feature.Catalog.Label.Filter.Creator",
		allCreators = "Feature.Catalog.LabelAllCreators",
		username = "Feature.Catalog.Label.Username",
		creatorName = "Feature.Catalog.Label.CreatorName",
		price = "Feature.Catalog.Label.Price",
		anyPrice = "Feature.Catalog.LabelAnyPrice",
		priceRange = "Feature.Catalog.Label.PriceRange",
		unavailableItems = "Feature.Catalog.Label.Filter.UnavailableItems",
		show = "Feature.Catalog.Label.Filter.Show",
		hide = "Feature.Catalog.Label.Filter.Hide",
		wearTimeTitle = "Feature.Durables.Filter.Title",
		wearTimeAll = "Feature.Durables.Filter.All",
		wearTimeTimedOptionsOnly = "Feature.Durables.Filter.TimedOptions"
	})
	local v26, v27 = React.useBinding(0)
	local v28 = RoactGamepad.useRefCache()

	local function updateTotalHeight() -- line: 77
		-- upvalues: v17 (copy), v28 (copy), uDim2 (copy), uDim (copy), v27 (copy), t1 (copy)
		local v30 = not v17 and 0 or (v28.WearTime.current or 0)
		local v31 = uDim2.Offset * 2 + uDim.Offset * 3 + (v28.SalesType.current or 0) + (v28.Creator.current or 0) + v30 + (v28.Price.current or 0) + (v28.UnavailableItems.current or 0)

		v27(v31)

		if t1.onHeightChanged then
			t1.onHeightChanged(v31)
		end
	end

	return React.createElement(Focusable.Frame, {
		Size = v26:map(FilterUtils.mapHeightToSize),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = t1.frameRef,
		NextSelectionUp = t1.NextSelectionUp,
		NextSelectionDown = t1.NextSelectionDown,
		defaultChild = v23.SalesType,
		restorePreviousChildFocus = true
	}, {
		Layout = React.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = uDim
		}),
		Padding = React.createElement("UIPadding", {
			PaddingTop = uDim2,
			PaddingBottom = uDim2,
			PaddingLeft = uDim2
		}),
		SalesType = React.createElement(FilterSubsection, {
			LayoutOrder = 1,
			title = v25.salesType,
			items = if not FFlagAXTimedOptionsSalesTypeFilter then {
				{
					text = v25.all,
					id = SalesTypeFilter.All
				},
				{
					text = v25.limited,
					id = SalesTypeFilter.Collectibles
				}
			} else {
				{
					text = v25.all,
					id = SalesTypeFilter.All
				},
				{
					text = v25.limited,
					id = SalesTypeFilter.Collectibles
				},
				{
					text = v25.timedOptions,
					id = SalesTypeFilter.TimedOptions
				}
			},
			selectedValue = filtersController.salesTypeFilter,
			setSelectedValue = filtersController.setSalesTypeFilter,
			frameRef = v23.SalesType,
			NextSelectionDown = v23.Creator,
			onHeightChanged = function(n1: number) --[[ onHeightChanged ]] -- line: 135
				-- upvalues: v28 (copy), updateTotalHeight (copy)
				v28.SalesType.current = n1
				updateTotalHeight()
			end
		}),
		Creator = React.createElement(FilterSubsection, {
			LayoutOrder = 2,
			title = v25.creator,
			items = {
				{
					text = v25.allCreators,
					id = CreatorFilter.AllCreators
				},
				{
					id = CreatorFilter.Username,
					customView = React.createElement(FilterTextBox, {
						text = filtersController.creatorUsername,
						placeholderText = v25.creatorName,
						onTextChanged = filtersController.setCreatorUsername,
						onFocused = function() --[[ onFocused ]] -- line: 151
							-- upvalues: filtersController (copy), CreatorFilter (copy)
							filtersController.setCreatorFilter(CreatorFilter.Username)
						end
					})
				}
			},
			selectedValue = filtersController.creatorFilter,
			setSelectedValue = filtersController.setCreatorFilter,
			frameRef = v23.Creator,
			NextSelectionUp = v23.SalesType,
			NextSelectionDown = v23.Price,
			onHeightChanged = function(n2: number) --[[ onHeightChanged ]] -- line: 162
				-- upvalues: v28 (copy), updateTotalHeight (copy)
				v28.Creator.current = n2
				updateTotalHeight()
			end
		}),
		WearTime = if not v17 then nil else React.createElement(FilterSubsection, {
			LayoutOrder = 3,
			selectionMode = "single",
			title = v25.wearTimeTitle,
			items = {
				{
					text = v25.wearTimeAll,
					id = WearTimeFilter.All
				},
				{
					text = v25.wearTimeTimedOptionsOnly,
					id = WearTimeFilter.TimedOptionsOnly
				}
			},
			selectedValue = filtersController.wearTimeFilter,
			setSelectedValue = filtersController.setWearTimeFilter,
			frameRef = v23.WearTime,
			NextSelectionUp = v23.Creator,
			NextSelectionDown = v23.Price,
			onHeightChanged = function(n3: number) --[[ onHeightChanged ]] -- line: 181
				-- upvalues: v28 (copy), updateTotalHeight (copy)
				v28.WearTime.current = n3
				updateTotalHeight()
			end
		}),
		Price = React.createElement(FilterSubsection, {
			LayoutOrder = not v17 and 3 or 4,
			title = v25.price,
			items = {
				{
					text = v25.anyPrice,
					id = PriceFilter.AnyPrice
				},
				{
					text = v25.priceRange,
					id = PriceFilter.PriceRange,
					expandedViewHeight = Constants.SortAndFiltersRowHeight,
					expandedView = React.createElement(PriceRangeInput, {
						minPrice = filtersController.minPrice,
						maxPrice = filtersController.maxPrice,
						setMinPrice = filtersController.setMinPrice,
						setMaxPrice = filtersController.setMaxPrice,
						onFocused = function() --[[ onFocused ]] -- line: 201
							-- upvalues: filtersController (copy), PriceFilter (copy)
							filtersController.setPriceFilter(PriceFilter.PriceRange)
						end
					})
				}
			},
			selectedValue = filtersController.priceFilter,
			setSelectedValue = filtersController.setPriceFilter,
			frameRef = v23.Price,
			NextSelectionUp = v23.Creator,
			NextSelectionDown = v23.UnavailableItems,
			onHeightChanged = function(n4: number) --[[ onHeightChanged ]] -- line: 212
				-- upvalues: v28 (copy), updateTotalHeight (copy)
				v28.Price.current = n4
				updateTotalHeight()
			end
		}),
		UnavailableItems = React.createElement(FilterSubsection, {
			LayoutOrder = not v17 and 4 or 5,
			title = v25.unavailableItems,
			items = {
				{
					text = v25.hide,
					id = UnavailableItemFilter.Hide
				},
				{
					text = v25.show,
					id = UnavailableItemFilter.Show
				}
			},
			selectedValue = filtersController.unavailableItemFilter,
			setSelectedValue = filtersController.setUnavailableItemFilter,
			frameRef = v23.UnavailableItems,
			NextSelectionUp = v23.Price,
			onHeightChanged = function(n5: number) --[[ onHeightChanged ]] -- line: 228
				-- upvalues: v28 (copy), updateTotalHeight (copy)
				v28.UnavailableItems.current = n5
				updateTotalHeight()
			end
		})
	})
end
