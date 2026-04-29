local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local AvatarExperienceCatalogParent = AvatarExperienceCatalog.Parent

require(AvatarExperienceCatalogParent.AvatarExperienceRodux)

local DataHydration = require(AvatarExperienceCatalogParent.DataHydration)
local Promise = require(AvatarExperienceCatalogParent.Promise)
local Logging = require(AvatarExperienceCatalogParent.AppCommonLib).Logging

require(AvatarExperienceCatalogParent.Http)
require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

local t1 = {
	Asset = true,
	Bundle = true,
	Look = true
}

local function getSortedEntries(n1: number?) -- line: 42
	-- upvalues: DataHydration (copy)
	local getLastReceivedSorts = DataHydration.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getLastReceivedSorts

	if not getLastReceivedSorts then
		return nil
	end

	local v12 = getLastReceivedSorts(false)

	if not v12 or not next(v12) then
		return nil
	end

	local t2 = {}

	for v14, v15 in v12 do
		table.insert(t2, {
			id = v14,
			data = v15
		})
	end

	table.sort(t2, function(t3: {[any]: any}, t4: {[any]: any}) -- line: 60
		return (t3.data.hydrationPriority or 0) < (t4.data.hydrationPriority or 0)
	end)

	if n1 then
		local t5 = {}

		for i = 1, math.min(#t2, n1) do
			table.insert(t5, t2[i])
		end

		t2 = t5
	end

	return t2
end
local function collectContent(t6: {[any]: any}) -- line: 86
	-- upvalues: t1 (copy)
	local t7 = {}
	local t8 = {}

	for _, v22 in t6 do
		local content = v22.data.content

		if content then
			for i = 1, math.min(v22.data.hydrationCount or #content, #content) do
				local v25 = content[i]
				local str = tostring(v25.type)
				local str2 = tostring(v25.id)

				if t1[str] then
					local v28 = t8[str] or {}

					if not v28[str2] then
						v28[str2] = true
						t8[str] = v28
						table.insert(t7, v25)
					end
				end
			end
		end
	end

	return t7
end
local function buildReduxPayload(t9: {[any]: any}, t10: {[any]: any}) -- line: 131
	local t11 = {}

	for _, v33 in t9 do
		local type = v33.type
		local str = tostring(v33.id)

		if not t11[type] then
			t11[type] = {}
		end

		local v36 = table.clone(v33)

		v36.id = str
		t11[type][str] = v36
	end

	for _, v38 in t10 do
		local type = v38.type
		local str = tostring(v38.id)

		if not t11[type] then
			t11[type] = {}
		end

		if not t11[type][str] then
			t11[type][str] = {
				id = str,
				type = type,
				failedToHydrate = true
			}
		end
	end

	return t11
end

return function(p1: ((...any) -> ...any), p2, p3: ((...any) -> ...any), t12: {[any]: any}, n2: number?) --[[ hydrateCatalogSortEntities ]] -- line: 163
	-- upvalues: getSortedEntries (copy), Promise (copy), collectContent (copy), buildReduxPayload (copy), Logging (copy)
	local v46 = getSortedEntries(n2)

	if not v46 then
		return Promise.resolve()
	end

	local v47 = collectContent(v46)

	if #v47 == 0 then
		return Promise.resolve()
	end

	return t12.HydrateWidgetContent(p2, v47):andThen(function(p4) -- line: 183
		-- upvalues: buildReduxPayload (copy), v47 (copy), p1 (copy), p3 (copy)
		local v51 = if not p4 then nil else p4.responseBody
		local v52 = if not v51 then nil else v51.hydratedContent

		if v52 == nil then
			return
		end

		local v53 = buildReduxPayload(v52, v47)

		p1(p3(v53))
	end):catch(function(p5) -- line: 193
		-- upvalues: Logging (copy)
		Logging.warn("hydrateCatalogSortEntities: HydrateWidgetContent failed: " .. tostring(p5))
	end)
end
