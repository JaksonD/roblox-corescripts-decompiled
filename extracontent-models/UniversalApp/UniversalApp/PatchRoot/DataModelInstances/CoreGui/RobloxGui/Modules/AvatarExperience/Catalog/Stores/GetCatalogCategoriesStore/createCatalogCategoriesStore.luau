local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local Signals = require(CorePackages.Packages.Signals)
local Modules = CoreGui.RobloxGui.Modules
local mutedError = require(Modules.LuaApp.mutedError)

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

local GetCatalogCategories = require(Modules.AvatarExperience.Catalog.GetCatalogCategories)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local FFlagAXCatalogCategoriesSDUILinks = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUILinks
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev
local v11 = if not FFlagAXMigrateAllTabToSduiDev then nil else require(CorePackages.Workspace.Packages.DataHydration)
local v12 = if not FFlagAXMigrateAllTabToSduiDev then nil else require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Sdui.createMapMarketplaceCategoryToCatalogCategory

return function() --[[ createCatalogCategoriesStore ]] -- line: 48
	-- upvalues: Signals (copy), FFlagAXCatalogCategoriesSDUILinks (copy), FFlagAXMigrateAllTabToSduiDev (copy), v11 (copy), GetCatalogCategories (copy), v12 (copy), mutedError (copy), FFlagAXCatalogCategoriesSDUI (copy)
	local v13, v14 = Signals.createSignal(false)
	local u15 = nil
	local u16 = nil

	if FFlagAXCatalogCategoriesSDUILinks then
		local v17, v18 = Signals.createSignal(nil)

		u15 = v17
		u16 = v18
	end

	local function buildCategoryMap(t1: {[any]: any}) -- line: 61
		local t2 = {}

		for _, v39 in t1 do
			if v39 and v39.Id then
				local Subcategories = v39.Subcategories

				if Subcategories then
					local t3 = {}

					if Subcategories then
						for _, v43 in Subcategories do
							if v43.Id then
								t3[v43.Id] = v43
							end
						end
					end

					v39.SubcategoriesMap = t3
				end

				t2[v39.Id] = v39
			end
		end

		return t2
	end

	local u20 = nil
	local u24, v25, v27

	if FFlagAXMigrateAllTabToSduiDev then
		local v21 = v11.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false)
		local v22 = GetCatalogCategories()[1]
		local v23 = v12()

		u24 = Signals.createComputed(function(p1) -- line: 104
			-- upvalues: v21 (copy), buildCategoryMap (copy), v22 (copy), v23 (copy)
			local v45 = v21.getLastReceivedCategories(p1)

			if not next(v45) then
				return (buildCategoryMap({ v22 }))
			end

			local t4 = {}

			for _, v48 in v45 do
				if v48.subcategories then
					for _, v50 in v48.subcategories do
						t4[v50] = true
					end
				end
			end

			local t5 = {}

			for v52, v53 in v45 do
				if not t4[v52] then
					table.insert(t5, v23.map(v53, v45))
				end
			end

			local v54 = buildCategoryMap(t5)

			if not v54[v22.Id] then
				v54[v22.Id] = v22
			end

			return v54
		end)

		function v25(_) -- line: 148
			-- upvalues: mutedError (copy)
			mutedError("createCatalogCategoriesStore.getCategories called under FFlagAXMigrateAllTabToSduiDev; use `getCategoriesMap` (or `getCategoryOrSubcategory`) instead -- categories are sourced from MarketplaceCatalogCategory hydration.")

			return {}
		end

		local u26 = false

		function v27(_: {[any]: any}) -- line: 164
			-- upvalues: u26 (ref), mutedError (copy)
			if not u26 then
				u26 = true
				mutedError("createCatalogCategoriesStore.setCategories called under FFlagAXMigrateAllTabToSduiDev; categories are sourced from MarketplaceCatalogCategory hydration and this write is ignored.")
			end
		end

		local u28 = true

		u20 = Signals.createEffect(function(p3) -- line: 175
			-- upvalues: v21 (copy), u28 (ref), v23 (copy), v13 (copy), v14 (copy)
			local v58 = v21.getLastReceivedCategories(p3)
			local v59 = next(v58) == nil

			if v59 and not u28 then
				v23.clear()
			end

			u28 = v59

			if not v59 and not v13(false) then
				v14(true)
			end
		end)
	else
		local v29

		v25, v29 = Signals.createSignal(if not FFlagAXCatalogCategoriesSDUI then GetCatalogCategories() else { GetCatalogCategories()[1] })

		local v30, v31 = Signals.createSignal({})

		u24 = v30

		function v27(t7: {[any]: any}) -- line: 201
			-- upvalues: v29 (copy), v31 (copy), buildCategoryMap (copy)
			local v61 = table.clone(t7)

			v29(v61)
			v31((buildCategoryMap(v61)))
		end

		v31((buildCategoryMap(v25(false))))
	end

	local v32 = nil
	local u33 = nil
	local v34 = nil

	if FFlagAXCatalogCategoriesSDUILinks then
		function v32(p4) -- line: 216
			-- upvalues: u16 (ref)
			if u16 then
				u16(p4)
			end
		end
		function u33() -- line: 222
			-- upvalues: u16 (ref)
			if u16 then
				u16(nil)
			end
		end
		function v34(b1: boolean) -- line: 228
			-- upvalues: v14 (copy), u15 (ref), u33 (ref)
			v14(b1)

			if b1 and u15 then
				local v64 = u15(false)

				if v64 then
					if u33 then
						u33()
					end

					return v64
				end
			end

			return nil
		end
	end

	local v35 = nil

	if FFlagAXCatalogCategoriesSDUI then
		function v35(s1: string, s2: string?) -- line: 247
			-- upvalues: u24 (ref)
			local v67 = u24(false)[s1]

			if s2 == nil then
				return v67
			end

			if v67 == nil or v67.SubcategoriesMap == nil then
				return nil
			end

			return v67.SubcategoriesMap[s2]
		end
	end

	return {
		getCategories = v25,
		getCategoriesMap = u24,
		getCategoryOrSubcategory = v35,
		getHasFetchedCategories = v13,
		setCategories = v27,
		setHasFetchedCategories = if not FFlagAXCatalogCategoriesSDUILinks then v14 else v34,
		getPendingDeepLinkAction = u15,
		setPendingDeepLinkAction = v32,
		clearPendingDeepLinkAction = u33,
		dispose = function() --[[ dispose ]] -- line: 265
			-- upvalues: u20 (ref)
			if u20 then
				u20()
				u20 = nil
			end
		end
	}
end
