local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization

require(Modules.AvatarExperience.Catalog.Hooks.useSortsController)

local useIsGamepad = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local RadioButtonGroup = require(Modules.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup)
local SortAggregationGroup = require(Modules.AvatarExperience.Catalog.Components.Filters.SortAggregationGroup)
local SortType = require(Modules.AvatarExperience.Common.Enum.SortType)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local FilterUtils = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local uDim = UDim.new(0, 12)
local v14 = 6 + Constants.SortAndFiltersSmallRowHeight * 3

return function(t1: {[any]: any}) --[[ Sorts ]] -- line: 45
	-- upvalues: useLocalization (copy), CatalogConstants (copy), SortType (copy), v14 (copy), React (copy), SortAggregationGroup (copy), useIsGamepad (copy), uDim (copy), Focusable (copy), FilterUtils (copy), RadioButtonGroup (copy), Constants (copy)
	local sortsController = t1.sortsController
	local v18 = useLocalization(CatalogConstants.SortTypeLocalization)
	local RecentlyCreated = SortType.RecentlyCreated
	local t2 = {
		{
			text = v18.Relevance,
			id = SortType.Relevance
		},
		{
			text = v18.MostFavorited,
			id = SortType.MostFavorited,
			expandedViewHeight = v14,
			expandedView = React.createElement(SortAggregationGroup, {
				sortAggregation = sortsController.mostFavoritedAggregation,
				setSortAggregation = sortsController.setMostFavoritedAggregation
			})
		},
		{
			text = v18.Bestselling,
			id = SortType.Bestselling,
			expandedViewHeight = v14,
			expandedView = React.createElement(SortAggregationGroup, {
				sortAggregation = sortsController.bestSellingAggregation,
				setSortAggregation = sortsController.setBestSellingAggregation
			})
		},
		{
			text = v18[RecentlyCreated],
			id = RecentlyCreated
		},
		{
			text = v18.PriceLowToHigh,
			id = SortType.PriceLowToHigh
		},
		{
			text = v18.PriceHighToLow,
			id = SortType.PriceHighToLow
		}
	}
	local v21 = useIsGamepad()
	local v22, v23 = React.useBinding(0)

	return React.createElement(Focusable.Frame, {
		Size = v22:map(function(p1) -- line: 89
			-- upvalues: uDim (copy)
			return UDim2.new(1, 0, 0, p1 + uDim.Offset * 2)
		end),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = t1.frameRef,
		NextSelectionUp = t1.NextSelectionUp,
		NextSelectionDown = t1.NextSelectionDown
	}, {
		Layout = React.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = uDim
		}),
		Padding = React.createElement("UIPadding", {
			PaddingTop = uDim,
			PaddingBottom = uDim,
			PaddingLeft = uDim
		}),
		RadioButtonGroupContainer = React.createElement("Frame", {
			Size = v22:map(FilterUtils.mapHeightToSize),
			BackgroundTransparency = 1,
			LayoutOrder = 2
		}, {
			SortRadioButtons = React.createElement(RadioButtonGroup, {
				items = t2,
				itemHeight = Constants.SortAndFiltersRowHeight,
				selectedValue = sortsController.sortType,
				onActivated = function(p2) --[[ onActivated ]] -- line: 117
					-- upvalues: sortsController (copy)
					sortsController.setSortType(p2)
				end,
				useDefaultControlState = v21,
				onHeightChanged = function(n1: number) --[[ onHeightChanged ]] -- line: 81
					-- upvalues: v23 (copy), t1 (copy), uDim (copy)
					v23(n1)

					if t1.onHeightChanged then
						t1.onHeightChanged(n1 + uDim.Offset * 2)
					end
				end
			})
		})
	})
end
