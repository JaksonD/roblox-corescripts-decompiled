local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent

require(Parent.AvatarExperienceCommon)
require(Parent.DataHydration)

local HttpService = game:GetService("HttpService")
local t1 = {
	AllAnimations = "AllAnimation",
	AnimationBundles = "Animation",
	Emotes = "Emotes"
}

return function() --[[ createMapMarketplaceCategoryToCatalogCategory ]] -- line: 27
	-- upvalues: HttpService (copy), t1 (copy)
	local t2 = {}

	local function mapInternal(p1, t3: {[any]: any}, b1: boolean?, t4: {[any]: any}) -- line: 53
		-- upvalues: mapInternal (ref), t2 (copy), HttpService (copy), t1 (copy)
		t4[p1.id] = true

		local t5 = nil

		if p1.subcategories and #p1.subcategories > 0 then
			t5 = {}

			for _, v15 in p1.subcategories do
				if not t4[v15] then
					local v16 = t3[v15]

					if v16 then
						table.insert(t5, mapInternal(v16, t3, true, t4))
					end
				end
			end

			if #t5 == 0 then
				t5 = nil
			end
		end

		t4[p1.id] = nil

		local t6 = {
			Id = p1.id,
			Name = p1.name,
			Title = p1.title,
			LocalizedTitle = p1.title,
			WidgetContext = p1.name
		}
		local id = p1.id
		local v19 = t2[id]

		if v19 then
		else
			v19 = HttpService:GenerateGUID(true)
			t2[id] = v19
		end

		t6.SearchUuid = v19
		t6.TaxonomyUuid = p1.taxonomyId
		t6.AssetTypeIdStrings = p1.assetTypes
		t6.BundleTypes = p1.bundleTypes
		t6.TileType = p1.tileType
		t6.TimeToRefresh = p1.timeToRefresh
		t6.CategoryId = p1.categoryId
		t6.SubcategoryId = p1.subcategoryId
		t6.CameraFocus = p1.cameraFocus
		t6.CameraZoomRadius = p1.cameraZoomRadius
		t6.CanAnimateCameraBasedMood = p1.canAnimateCameraBasedMood
		t6.PageType = t1[p1.name]
		t6.Subcategories = t5
		t6.isSubcategory = not not b1 or nil

		return t6
	end

	return {
		map = function(p2, t7: {[any]: any}, b2: boolean?) --[[ map ]] -- line: 111
			-- upvalues: mapInternal (ref)
			return mapInternal(p2, t7, b2, {})
		end,
		clear = function() --[[ clear ]] -- line: 119
			-- upvalues: t2 (copy)
			table.clear(t2)
		end
	}
end
