local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local AvatarExperienceCatalogParent = AvatarExperienceCatalog.Parent
local normalize = require(AvatarExperienceCatalogParent.AvatarExperienceCommon).Utils.normalize
local normalizeBoolean = normalize.normalizeBoolean
local normalizeString = normalize.normalizeString
local normalizeNumber = normalize.normalizeNumber
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local convertToPascalCase = require(AvatarExperienceCatalog.Utils.convertToPascalCase)
local ASSET_TYPE_ID_STRING_TO_NAME = require(AvatarExperienceCatalogParent.AvatarExperienceCommon).Constants.ASSET_TYPE_ID_STRING_TO_NAME

require(AvatarExperienceCatalog.Models.CatalogV2SearchItemDetails)

local v10 = game:DefineFastFlag("AXSetTimedOptionDiscountInfoOnSortResults", false)
local t1 = {
	[1] = "BodyParts",
	[2] = "Animations",
	[3] = "Shoes",
	[4] = "DynamicHead"
}

local function normalizeBundledItems(t2: {[any]: any}?) -- line: 42
	-- upvalues: normalizeNumber (copy), normalizeString (copy)
	if typeof(t2) ~= "table" then
		return nil
	end

	local t3 = {}

	for _, v19 in t2 do
		table.insert(t3, {
			Id = normalizeNumber(v19.id),
			Name = normalizeString(v19.name),
			Type = normalizeString(v19.type)
		})
	end

	return t3
end
local function normalizeTimedOptions(p1) -- line: 55
	-- upvalues: normalizeNumber (copy), normalizeBoolean (copy), v10 (copy)
	local t4 = nil

	if p1.timedOptions then
		t4 = {}

		for _, v23 in p1.timedOptions do
			table.insert(t4, {
				days = normalizeNumber(v23.days),
				price = normalizeNumber(v23.price),
				selected = if not v23.selected then nil else normalizeBoolean(v23.selected),
				discountInformation = if not v10 then nil else v23.discountInformation
			})
		end
	end

	return t4
end
local function normalizeItem(p2) -- line: 73
	-- upvalues: ASSET_TYPE_ID_STRING_TO_NAME (copy), t1 (copy), normalizeString (copy), normalizeBundledItems (copy), normalizeBoolean (copy), normalizeNumber (copy), normalizeTimedOptions (copy), convertToPascalCase (copy)
	if type(p2) ~= "table" then
		return nil, "Item must be a table"
	end

	local v25 = if not p2.assetType then nil else ASSET_TYPE_ID_STRING_TO_NAME[tostring(p2.assetType)]
	local v26 = if type(p2.bundleType) ~= "number" then p2.bundleType else t1[p2.bundleType] or tostring(p2.bundleType)
	local t5 = {
		assetType = normalizeString(v25),
		bundleType = normalizeString(v26),
		bundledItems = normalizeBundledItems(p2.bundledItems),
		collectibleItemId = normalizeString(p2.collectibleItemId),
		creatorHasVerifiedBadge = normalizeBoolean(p2.creatorHasVerifiedBadge),
		creatorName = normalizeString(p2.creatorName),
		creatorTargetId = normalizeNumber(p2.creatorTargetId),
		creatorType = normalizeString(p2.creatorType),
		description = normalizeString(p2.description),
		favoriteCount = normalizeNumber(p2.favoriteCount),
		hasResellers = normalizeBoolean(p2.hasResellers),
		id = normalizeNumber(p2.id),
		isRecolorable = normalizeBoolean(p2.isRecolorable),
		itemRestrictions = p2.itemRestrictions or {},
		itemStatus = p2.itemStatus or {},
		itemType = normalizeString(p2.itemType),
		lowestPrice = normalizeNumber(p2.lowestPrice),
		lowestResalePrice = normalizeNumber(p2.lowestResalePrice),
		name = normalizeString(p2.name),
		price = normalizeNumber(p2.price),
		productId = normalizeNumber(p2.productId),
		priceStatus = normalizeString(p2.priceStatus),
		saleLocationType = normalizeString(p2.saleLocationType),
		totalQuantity = normalizeNumber(p2.totalQuantity),
		unitsAvailableForConsumption = normalizeNumber(p2.unitsAvailableForConsumption),
		offSaleDeadline = normalizeString(p2.offSaleDeadline),
		quantityLimitPerUser = normalizeNumber(p2.quantityLimitPerUser),
		isOffSale = normalizeBoolean(p2.isOffSale),
		timedOptions = normalizeTimedOptions(p2)
	}

	return convertToPascalCase(t5), nil
end

return (makeNormalizeTableFn({
	data = function(t6: {[any]: any}) --[[ normalizeItemsData ]] -- line: 125
		-- upvalues: normalizeItem (copy)
		if typeof(t6) ~= "table" then
			return nil, nil
		end

		local t7 = {}
		local t8 = {}

		for v31, v32 in t6 do
			local v33, v34 = normalizeItem(v32)

			table.insert(t8, v34)
			t7[v31] = v33
		end

		local v35 = nil

		if next(t8) then
			v35 = table.concat(t8, " ")
		end

		return t7, v35
	end,
	nextPageCursor = normalizeString
}))
