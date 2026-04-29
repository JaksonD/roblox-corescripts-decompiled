local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent

require(SduiCoreSystemParent.ServiceContractsProto)

local tryGetPathFromData = require(SduiCoreSystem.ClientBinding.tryGetPathFromData)
local SduiDataBindingContentType = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)

require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)

local ProtoVariableMapper = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SharedFlags = require(SduiCoreSystemParent.SharedFlags)
local FFlagLuaAppSduiBadgeDetailsComponents = SharedFlags.FFlagLuaAppSduiBadgeDetailsComponents
local FFlagSduiExperienceDetailsSupport = SharedFlags.FFlagSduiExperienceDetailsSupport
local FFlagSduiMarketplaceCatalogCategorySupport = SharedFlags.FFlagSduiMarketplaceCatalogCategorySupport
local FFlagSduiMarketplaceCatalogSortSupport = SharedFlags.FFlagSduiMarketplaceCatalogSortSupport
local FFlagSduiSongHydrationSupport = SharedFlags.FFlagSduiSongHydrationSupport
local t1 = {
	[SduiDataBindingContentType.badge] = { "badge_id" },
	[SduiDataBindingContentType.creator] = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else { "creator_key" },
	[SduiDataBindingContentType.universe] = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else { "universe_id" },
	[SduiDataBindingContentType.ageRecommendation] = if not FFlagSduiExperienceDetailsSupport then nil else { "universe_id" },
	[SduiDataBindingContentType.socialLink] = if not FFlagSduiExperienceDetailsSupport then nil else { "social_link_id" },
	[SduiDataBindingContentType.marketplaceCatalogCategory] = if not FFlagSduiMarketplaceCatalogCategorySupport then nil else { "marketplace_catalog_category_item_id" },
	[SduiDataBindingContentType.song] = if not FFlagSduiSongHydrationSupport then nil else { "song_id" },
	[SduiDataBindingContentType.marketplaceCatalogSort] = if not FFlagSduiMarketplaceCatalogSortSupport then nil else { "catalog_sort_id" },
	[SduiDataBindingContentType.gamePass] = if not FFlagSduiExperienceDetailsSupport then nil else { "game_pass_id" },
	[SduiDataBindingContentType.playability] = if not FFlagSduiExperienceDetailsSupport then nil else { "universe_id" }
}

return function(t2: {[any]: any}, t3: {[any]: any}) --[[ buildDataBindingSourcesForTemplate ]] -- line: 92
	-- upvalues: ProtoVariableMapper (copy), tryGetPathFromData (copy), t1 (copy)
	local t4 = {}

	for _, v17 in t3 do
		local v18 = ProtoVariableMapper.mapHydrationContentTypeToLua(v17.content_type)

		if not v18 then
			error(`Unsupported contentType { v17.content_type }`)
		end

		local v19 = v17.id_binding and (v17.id_binding.kind and v17.id_binding.kind.type)
		local v20 = v17.id_binding and (v17.id_binding.kind and v17.id_binding.kind.value)
		local v21 = nil

		if v19 == "literal" and v20 then
			v21 = v20
		elseif v19 == "input_path" and v20 then
			local parts = string.split(v20, ".")
			local v23, v24 = tryGetPathFromData(t2, parts)

			if v23 and v24 ~= nil then
				v21 = v24
			else
				error(`Unable to resolve path from inputPath: { v20 } in data`)
			end
		else
			local v25 = t1[v18]

			if v25 then
				local v26, v27 = tryGetPathFromData(t2, v25)

				if v26 and v27 ~= nil then
					v21 = v27
				else
					local v28 = table.concat(v25, ",")

					error(`Unable to resolve default path: { v28 } in data for contentType { v18 }`)
				end
			else
				error(`Unable to find default for unknown contentType: { v18 }`)
			end
		end

		t4[if not v17.alias or v17.alias == "" then v18 else v17.alias] = {
			contentType = v18,
			id = v21
		}
	end

	return t4
end
