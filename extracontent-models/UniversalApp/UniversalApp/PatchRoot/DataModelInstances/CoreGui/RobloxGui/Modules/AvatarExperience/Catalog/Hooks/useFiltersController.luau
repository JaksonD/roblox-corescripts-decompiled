local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local CreatorFilter = require(Modules.AvatarExperience.Common.Enum.CreatorFilter)
local PriceFilter = require(Modules.AvatarExperience.Common.Enum.PriceFilter)
local SalesTypeFilter = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local UnavailableItemFilter = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local SetSalesTypeFilter = require(Modules.AvatarExperience.Catalog.Actions.SetSalesTypeFilter)
local SetCreatorFilter = require(Modules.AvatarExperience.Catalog.Actions.SetCreatorFilter)
local SetPriceRange = require(Modules.AvatarExperience.Catalog.Actions.SetPriceRange)
local SetUnavailableItemFilter = require(Modules.AvatarExperience.Catalog.Actions.SetUnavailableItemFilter)
local SetWearTimeFilter = require(Modules.AvatarExperience.Catalog.Actions.SetWearTimeFilter)
local FilterUtils = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local WearTimeFilter = AvatarExperienceCommon.Enums.WearTimeFilter
local getUseSelectorDeepEquals = AvatarExperienceCommon.Utils.getUseSelectorDeepEquals
local FFlagMinMaxPriceValidation = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagMinMaxPriceValidation

local function wearTimeFilterChanged(p1, p2) -- line: 91
	return p1 ~= p2
end

return function() --[[ useFiltersController ]] -- line: 96
	-- upvalues: useSelector (copy), FilterUtils (copy), getUseSelectorDeepEquals (copy), React (copy), CreatorFilter (copy), CatalogConstants (copy), PriceFilter (copy), useDispatch (copy), SalesTypeFilter (copy), UnavailableItemFilter (copy), WearTimeFilter (copy), wearTimeFilterChanged (copy), FFlagMinMaxPriceValidation (copy), SetSalesTypeFilter (copy), SetCreatorFilter (copy), SetPriceRange (copy), SetUnavailableItemFilter (copy), SetWearTimeFilter (copy)
	local v27 = useSelector(FilterUtils.selectSalesTypeFilter, getUseSelectorDeepEquals())
	local v28, v29 = React.useState(v27)
	local v30 = useSelector(FilterUtils.selectCreatorFilter, getUseSelectorDeepEquals())
	local v31 = if v30 ~= nil and v30 ~= "" then CreatorFilter.Username else CreatorFilter.AllCreators
	local v32, v33 = React.useState(v31)
	local v34, v35 = React.useState(v30)
	local v36 = useSelector(FilterUtils.selectMinPrice, getUseSelectorDeepEquals())
	local v37 = useSelector(FilterUtils.selectMaxPrice, getUseSelectorDeepEquals())
	local v38 = if not (v36 > CatalogConstants.MinPriceFilter) and not (v37 < CatalogConstants.MaxPriceFilter) then PriceFilter.AnyPrice else PriceFilter.PriceRange
	local v39, v40 = React.useState(v38)
	local v41, v42 = React.useState(v36)
	local v43, v44 = React.useState(v37)
	local v45 = useSelector(FilterUtils.selectUnavailableItemFilter, getUseSelectorDeepEquals())
	local v46, v47 = React.useState(v45)
	local v48 = useSelector(FilterUtils.selectWearTimeFilter, getUseSelectorDeepEquals())
	local v49, v50 = React.useState(v48)
	local v51 = useDispatch()
	local v52 = v28 ~= SalesTypeFilter.All or (v32 ~= CreatorFilter.AllCreators or (v39 ~= PriceFilter.AnyPrice or (v46 ~= UnavailableItemFilter.Hide or v49 ~= WearTimeFilter.All)))
	local v53 = if v32 ~= CreatorFilter.AllCreators then v34 else ""
	local v54 = if v39 ~= PriceFilter.AnyPrice then v41 else CatalogConstants.MinPriceFilter
	local v55 = if v39 ~= PriceFilter.AnyPrice then v43 else CatalogConstants.MaxPriceFilter
	local v56 = v28 ~= v27 or (v53 ~= v30 or (v54 ~= v36 or (v55 ~= v37 or (v46 ~= v45 or wearTimeFilterChanged and v49 ~= v48))))

	if FFlagMinMaxPriceValidation and v55 < v54 then
		v56 = false
	end

	local v57 = React.useCallback(function() -- line: 147
		-- upvalues: v29 (copy), SalesTypeFilter (copy), v33 (copy), CreatorFilter (copy), v40 (copy), PriceFilter (copy), v47 (copy), UnavailableItemFilter (copy), v50 (copy), WearTimeFilter (copy)
		v29(SalesTypeFilter.All)
		v33(CreatorFilter.AllCreators)
		v40(PriceFilter.AnyPrice)
		v47(UnavailableItemFilter.Hide)
		v50(WearTimeFilter.All)
	end)
	local v58 = React.useCallback(function() -- line: 156
		-- upvalues: v51 (copy), SetSalesTypeFilter (copy), v28 (copy), SetCreatorFilter (copy), v53 (copy), SetPriceRange (copy), v54 (copy), v55 (copy), SetUnavailableItemFilter (copy), v46 (copy), SetWearTimeFilter (copy), v49 (copy)
		v51(SetSalesTypeFilter(v28))
		v51(SetCreatorFilter(v53))
		v51(SetPriceRange(v54, v55))
		v51(SetUnavailableItemFilter(v46))
		v51(SetWearTimeFilter(v49))
	end, {
		v28,
		v53,
		v54,
		v55,
		v46,
		v49
	})

	return {
		salesTypeFilter = v28,
		setSalesTypeFilter = v29,
		creatorFilter = v32,
		setCreatorFilter = v33,
		creatorUsername = v34,
		setCreatorUsername = v35,
		priceFilter = v39,
		setPriceFilter = v40,
		minPrice = v41,
		setMinPrice = v42,
		maxPrice = v43,
		setMaxPrice = v44,
		wearTimeFilter = v49,
		setWearTimeFilter = v50,
		unavailableItemFilter = v46,
		setUnavailableItemFilter = v47,
		canReset = v52,
		canApply = v56,
		reset = v57,
		apply = v58
	}
end
