local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommon.Enums.CatalogCategories
local selectSearchKeyword = AvatarExperienceCommon.State.Selectors.selectSearchKeyword
local useGetSelectedCategoryAndSubcategoryId = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local selectFilterCount = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local t1 = {
	[CatalogCategories.Recommended:rawValue()] = true
}

return function() --[[ useResultsAreSduiEnabled ]] -- line: 31
	-- upvalues: useGetSelectedCategoryAndSubcategoryId (copy), useSelector (copy), selectSearchKeyword (copy), selectFilterCount (copy), t1 (copy)
	local v10, _ = useGetSelectedCategoryAndSubcategoryId()
	local v12 = useSelector(selectSearchKeyword)
	local v13 = useSelector(selectFilterCount)

	return v10 ~= nil and (t1[v10] == true and ((v12 == nil or v12 == "") and v13 == 0))
end
