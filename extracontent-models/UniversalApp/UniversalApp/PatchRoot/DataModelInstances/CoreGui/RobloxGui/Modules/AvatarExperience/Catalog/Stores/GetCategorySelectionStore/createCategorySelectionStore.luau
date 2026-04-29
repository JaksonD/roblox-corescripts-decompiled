local CorePackages = game:GetService("CorePackages")
local Signals = require(CorePackages.Packages.Signals)
local createSignal = Signals.createSignal
local createComputed = Signals.createComputed
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local mutedError = require(Modules.LuaApp.mutedError)

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore.createCatalogCategoriesStore)

local Constants = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local FFlagAXInferCategorySelection = AvatarExperienceFlags.FFlagAXInferCategorySelection
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev

return function(p1) --[[ createCategorySelectionStore ]] -- line: 42
	-- upvalues: FFlagAXMigrateAllTabToSduiDev (copy), Constants (copy), FFlagAXCatalogCategoriesSDUI (copy), createSignal (copy), createComputed (copy), FFlagAXInferCategorySelection (copy), mutedError (copy)
	local DefaultCatalogCategoryId = nil

	if FFlagAXMigrateAllTabToSduiDev then
		DefaultCatalogCategoryId = Constants.DefaultCatalogCategoryId
	elseif FFlagAXCatalogCategoriesSDUI then
		local v14 = p1.getCategories(false)

		DefaultCatalogCategoryId = #v14 > 0 and v14[1].Id or Constants.DefaultCatalogCategoryId
	end

	local v15, v16 = createSignal({
		categoryId = if not FFlagAXCatalogCategoriesSDUI then Constants.DefaultCatalogCategoryId else DefaultCatalogCategoryId,
		subcategoryId = nil
	})
	local v17 = createComputed(function(p2) -- line: 56
		-- upvalues: v15 (copy), FFlagAXMigrateAllTabToSduiDev (copy), p1 (copy), Constants (copy)
		local categoryId = v15(p2).categoryId

		if FFlagAXMigrateAllTabToSduiDev and not p1.getCategoriesMap(p2)[categoryId] then
			return Constants.DefaultCatalogCategoryId
		end

		return categoryId
	end)
	local v18 = createComputed(function(p3) -- line: 67
		-- upvalues: v15 (copy)
		return v15(p3).subcategoryId
	end)
	local v19 = createComputed(function(p4) -- line: 71
		-- upvalues: v17 (copy), Constants (copy), p1 (copy)
		local v26 = v17(p4)

		if v26 == nil then
			v26 = Constants.DefaultCatalogCategoryId
		end

		return p1.getCategoriesMap(p4)[v26]
	end)
	local v20 = createComputed(function(p5) -- line: 82
		-- upvalues: v18 (copy), v19 (copy)
		local v28 = v18(p5)

		if v28 == nil then
			return nil
		end

		local v29 = v19(p5)

		if v29 == nil then
			return nil
		end

		local Subcategories = v29.Subcategories

		if Subcategories ~= nil then
			for _, v32 in Subcategories do
				if v28 == v32.Id then
					return v32
				end
			end
		end

		return nil
	end)
	local v21 = createComputed(function(p6) -- line: 105
		-- upvalues: v20 (copy), v19 (copy)
		local v34 = v20(p6)

		if v34 then
			return v34
		end

		return v19(p6)
	end)

	return {
		selectedCategoryId = v17,
		selectedCategory = v19,
		selectedSubcategoryId = v18,
		selectedSubcategory = v20,
		selectedCategoryInfo = v21,
		changeCategory = function(s1: string?, s2: string?) --[[ changeCategory ]] -- line: 116
			-- upvalues: FFlagAXInferCategorySelection (copy), mutedError (copy), p1 (copy), v16 (copy), FFlagAXMigrateAllTabToSduiDev (copy), v19 (copy)
			if FFlagAXInferCategorySelection then
				if s2 == nil then
					if s1 == nil then
						mutedError("[Category Selection Store] changeCategory received both categoryId and subcategoryId as nil")

						return false
					end

					if not p1.getCategoriesMap(false)[s1] then
						return false
					end

					v16({
						categoryId = s1,
						subcategoryId = nil
					})

					return true
				end

				local v37 = nil

				if s1 ~= nil then
					v37 = p1.getCategoriesMap(false)[s1]
				elseif FFlagAXMigrateAllTabToSduiDev then
					for _, v39 in (p1.getCategoriesMap(false)) do
						if v39 and v39.SubcategoriesMap and v39.SubcategoriesMap[s2] then
							v37 = v39

							break
						end
					end
				else
					for _, v41 in (p1.getCategories(false)) do
						if v41 and v41.SubcategoriesMap and v41.SubcategoriesMap[s2] then
							v37 = v41

							break
						end
					end
				end

				if not v37 then
					return false
				end

				local v42 = false
				local Subcategories = v37.Subcategories

				if Subcategories ~= nil then
					for _, v45 in Subcategories do
						if s2 == v45.Id then
							v42 = true

							break
						end
					end
				end

				if not v42 then
					return false
				end

				v16({
					categoryId = v37.Id,
					subcategoryId = s2
				})

				return true
			end

			local v46

			if s1 ~= nil then
				v46 = p1.getCategoriesMap(false)[s1]

				if not v46 then
					return false
				end
			else
				v46 = v19(false)
			end

			if s2 ~= nil then
				if v46 == nil then
					return false
				end

				local v47 = false
				local Subcategories = v46.Subcategories

				if Subcategories ~= nil then
					for _, v50 in Subcategories do
						if s2 == v50.Id then
							v47 = true

							break
						end
					end
				end

				if not v47 then
					return false
				end
			end

			v16({
				categoryId = v46.Id,
				subcategoryId = s2
			})

			return true
		end
	}
end
