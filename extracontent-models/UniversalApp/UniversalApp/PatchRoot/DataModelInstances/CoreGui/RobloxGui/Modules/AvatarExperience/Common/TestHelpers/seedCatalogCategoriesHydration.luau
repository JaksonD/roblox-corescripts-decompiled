local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local DataHydration = require(CorePackages.Workspace.Packages.DataHydration)
local GetCatalogCategories = require(Modules.AvatarExperience.Catalog.GetCatalogCategories)

local function toMarketplaceData(p1) -- line: 24
	return {
		id = p1.Id,
		name = p1.Name,
		title = p1.Title,
		taxonomyId = p1.TaxonomyUuid,
		assetTypes = p1.AssetTypeIdStrings,
		bundleTypes = p1.BundleTypes,
		tileType = p1.TileType,
		timeToRefresh = p1.TimeToRefresh,
		categoryId = p1.CategoryId,
		subcategoryId = p1.SubcategoryId,
		cameraFocus = p1.CameraFocus,
		cameraZoomRadius = p1.CameraZoomRadius,
		canAnimateCameraBasedMood = p1.CanAnimateCameraBasedMood
	}
end

return function(p2) --[[ seedCatalogCategoriesHydration ]] -- line: 42
	-- upvalues: GetCatalogCategories (copy), DataHydration (copy), toMarketplaceData (copy)
	local v9 = p2 or GetCatalogCategories()
	local v10 = DataHydration.MarketplaceCatalogCategory.getMarketplaceCatalogCategoryStore(false)
	local t1 = {}

	for _, v13 in v9 do
		if v13 and v13.Id then
			t1[v13.Id] = toMarketplaceData(v13)

			if v13.Subcategories then
				local t2 = {}

				for _, v16 in v13.Subcategories do
					if v16 and v16.Id then
						table.insert(t2, v16.Id)
						t1[v16.Id] = toMarketplaceData(v16)
					end
				end

				if #t2 > 0 then
					t1[v13.Id].subcategories = t2
				end
			end
		end
	end

	v10.updateMarketplaceCatalogCategories(t1)
end
