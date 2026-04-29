local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent

require(ProfilePlatform.Common.AssetInfo)
require(ProfilePlatformParent.CatalogNetworking)

local AvatarExperienceInspectAndBuy = require(ProfilePlatformParent.AvatarExperienceInspectAndBuy)
local getPriceStatusInShop = AvatarExperienceInspectAndBuy.Utils.getPriceStatusInShop
local PriceStatus = AvatarExperienceInspectAndBuy.Enums.PriceStatus

require(ProfilePlatform.Common.Types)

local SalesLocationType = require(ProfilePlatformParent.AvatarExperienceCommon).Enums.SalesLocationType
local t1 = {
	[61] = true,
	[60] = true,
	[55] = true,
	[56] = true,
	[57] = true,
	[58] = true,
	[59] = true,
	[48] = true,
	[9] = true
}
local t2 = {}

for _, v10 in Enum.AvatarAssetType:GetEnumItems() do
	if not t1[v10.Value] then
		t2[v10.Value] = true
	end
end

local function buildCollectibleItemDetails(p1, p2, s1: string?) -- line: 147
	local t3 = nil

	if p1.hasResellers or (p1.unitsAvailableForConsumption or (p1.totalQuantity or (p1.lowestResalePrice or p2 and p2.quantityOwned))) then
		t3 = {
			hasResellers = p1.hasResellers,
			unitsAvailableForConsumption = p1.unitsAvailableForConsumption,
			totalQuantity = p1.totalQuantity,
			lowestResalePrice = p1.lowestResalePrice,
			resellableCount = if not p2 then nil else p2.quantityOwned,
			collectibleLowestAvailableResaleProductId = s1
		}
	end

	return t3
end
local function buildAssetsInBundle(p3, p4) -- line: 173
	local v47 = nil

	if p4 and p4.assetsInBundle then
		local t4 = {}

		for _, v50 in p4.assetsInBundle do
			table.insert(t4, {
				id = tostring(v50.id),
				assetType = tostring(v50.assetType),
				isIncluded = v50.isIncluded
			})
		end

		return t4
	end

	if p3.bundledItems then
		local t5 = {}

		for _, v53 in p3.bundledItems do
			if v53.type == "Asset" and v53.assetType then
				table.insert(t5, {
					id = tostring(v53.id),
					assetType = tostring(v53.assetType)
				})
			end
		end

		if #t5 > 0 then
			v47 = t5
		end
	end

	return v47
end
local function computeBundleParts(p5, p6, t6: {[any]: any}) -- line: 204
	-- upvalues: t2 (copy)
	local n1 = 0
	local t7 = {}

	if p6 and p6.assetsInBundle then
		for _, v60 in p6.assetsInBundle do
			if t6[tostring(v60.id)] then
				n1 += 1

				if t2[v60.assetType] == true then
					table.insert(t7, v60.id)
				end
			end
		end

		return n1, t7
	end

	if p5.bundledItems then
		for _, v62 in p5.bundledItems do
			if v62.type == "Asset" then
				n1 += 1

				if v62.assetType and t2[v62.assetType] == true then
					table.insert(t7, v62.id)
				end
			end
		end
	end

	return n1, t7
end

return {
	isWearableAssetType = function(n2: number) --[[ isWearableAssetType ]] -- line: 49
		-- upvalues: t2 (copy)
		return t2[n2] == true
	end,
	expandBundleToAssetIds = function(p7) --[[ expandBundleToAssetIds ]] -- line: 53
		local t8 = {}

		if p7.bundledItems then
			for _, v19 in p7.bundledItems do
				if v19.type == "Asset" then
					table.insert(t8, v19.id)
				end
			end
		end

		return t8
	end,
	collectBundleComponentIds = function(t9: {[any]: any}, t10: {[any]: any}) --[[ collectBundleComponentIds ]] -- line: 69
		local t11 = {}

		for _, v24 in t9 do
			local v25 = t10[v24]

			if v25 and v25.assetsInBundle then
				for _, v27 in v25.assetsInBundle do
					t11[tostring(v27.id)] = true
				end
			end
		end

		return t11
	end,
	buildItemData = function(p8, p9, t12: {[any]: any}, s2: string?, b1: boolean?, s3: string?) --[[ buildItemData ]] -- line: 240
		-- upvalues: computeBundleParts (copy), SalesLocationType (copy), buildCollectibleItemDetails (copy), buildAssetsInBundle (copy)
		local v70 = p8.assetType or p8.bundleType
		local v71, v72 = computeBundleParts(p8, p9, t12)
		local v73 = p8.itemType or "Asset"
		local t13 = {
			id = tostring(p8.id),
			name = p8.name,
			itemType = v73,
			itemSubType = if not v70 then nil else tostring(v70),
			priceInRobux = p8.price,
			creator = {
				creatorId = tostring(p8.creatorTargetId or ""),
				creatorName = p8.creatorName,
				creatorHasVerifiedBadge = p8.creatorHasVerifiedBadge
			},
			saleLocationType = if p8.saleLocationType ~= SalesLocationType.ShopOnly then p8.saleLocationType else SalesLocationType.ShopAndAllExperiences,
			isOffSale = p8.isOffSale,
			isOwned = if not p9 or p9.quantityOwned == nil then if b1 == nil then p8.owned == true else b1 else p9.quantityOwned > 0,
			noPriceStatus = if not p9 then nil else p9.noPriceStatus,
			catalogPriceStatus = p8.priceStatus,
			collectibleItemId = p8.collectibleItemId
		}
		local itemRestrictions = p8.itemRestrictions
		local v76

		if not itemRestrictions or #itemRestrictions == 0 then
			v76 = nil
		else
			v76 = {}

			for _, v78 in itemRestrictions do
				v76[v78] = true
			end
		end

		t13.itemRestrictions = v76
		t13.collectibleItemDetails = buildCollectibleItemDetails(p8, p9, s3)
		t13.assetsInBundle = buildAssetsInBundle(p8, p9)
		t13.collectibleProductId = if not p9 then s2 else p9.collectibleProductId
		t13.bundlePartsCount = v71
		t13.bundleAssetIds = v72
		t13.taxonomyName = if not p8.taxonomy or not (#p8.taxonomy > 0) then nil else p8.taxonomy[1].taxonomyName

		return t13
	end,
	isPurchasableStatus = function(s4: string) --[[ isPurchasableStatus ]] -- line: 85
		-- upvalues: PriceStatus (copy)
		return s4 == PriceStatus.Free or (s4 == PriceStatus.PurchaseFromRoblox or s4 == PriceStatus.PurchaseFromResale)
	end,
	isItemPurchasable = function(p10) --[[ isItemPurchasable ]] -- line: 91
		-- upvalues: getPriceStatusInShop (copy), PriceStatus (copy)
		if p10.isOwned then
			return false
		end

		local v30 = getPriceStatusInShop(p10)

		return (v30 == PriceStatus.Free or (v30 == PriceStatus.PurchaseFromRoblox or v30 == PriceStatus.PurchaseFromResale)) and p10.collectibleProductId ~= nil
	end,
	getEffectivePrice = function(p11) --[[ getEffectivePrice ]] -- line: 98
		-- upvalues: getPriceStatusInShop (copy), PriceStatus (copy)
		if getPriceStatusInShop(p11) == PriceStatus.PurchaseFromResale then
			if p11.collectibleItemDetails then
				return p11.collectibleItemDetails.lowestResalePrice or 0
			end

			return 0
		end

		return p11.priceInRobux or 0
	end,
	sortDisplayItems = function(t14: {[any]: any}) --[[ sortDisplayItems ]] -- line: 279
		-- upvalues: getPriceStatusInShop (copy), PriceStatus (copy)
		table.sort(t14, function(p12, p13) -- line: 280
			-- upvalues: getPriceStatusInShop (copy), PriceStatus (copy)
			local v82 = getPriceStatusInShop(p12)
			local v83 = if not (v82 == PriceStatus.Free or (v82 == PriceStatus.PurchaseFromRoblox or v82 == PriceStatus.PurchaseFromResale)) then v82 ~= PriceStatus.Owned and v82 ~= PriceStatus.QuantityLimitReached and 2 or 1 else 0
			local v84 = getPriceStatusInShop(p13)

			return v83 < if not (v84 == PriceStatus.Free or (v84 == PriceStatus.PurchaseFromRoblox or v84 == PriceStatus.PurchaseFromResale)) then v84 ~= PriceStatus.Owned and v84 ~= PriceStatus.QuantityLimitReached and 2 or 1 else 0
		end)

		return t14
	end,
	getPriceStatus = function(p14) --[[ getPriceStatusForProfile ]] -- line: 45
		-- upvalues: getPriceStatusInShop (copy)
		return getPriceStatusInShop(p14)
	end,
	PriceStatusEnum = PriceStatus
}
