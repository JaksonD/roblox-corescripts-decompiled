local CorePackages = game:GetService("CorePackages")
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local Dash = require(CorePackages.Packages.Dash)
local FFlagAXEnableIaBTimedOptionsBulkPurchase = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local ParentParent = script.Parent.Parent
local MockId = require(ParentParent.MockId)
local Constants = require(ParentParent.Constants)

require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)

local ItemRestrictions = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemRestrictions
local GetFFlagIBEnableCollectiblesSystemSupport = require(ParentParent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local FFlagAXParseAdditionalItemDetailsFromCatalog = require(ParentParent.Flags.FFlagAXParseAdditionalItemDetailsFromCatalog)
local FFlagIBV2Attribution = SharedFlags.FFlagIBV2Attribution
local t1 = {
	new = function() --[[ new ]] -- line: 63
		return {}
	end
}

function t1.mock() -- line: 69
	-- upvalues: t1 (copy), MockId (copy), GetFFlagIBEnableCollectiblesSystemSupport (copy)
	local v14 = t1.new()

	v14.name = ""
	v14.assetId = MockId()
	v14.assetTypeId = ""
	v14.creatorId = ""
	v14.creatorName = ""
	v14.creatorHasVerifiedBadge = false
	v14.owned = false
	v14.isForSale = false
	v14.description = ""
	v14.price = ""
	v14.productId = ""
	v14.isLimited = false
	v14.isLimitedUnique = not GetFFlagIBEnableCollectiblesSystemSupport() and nil
	v14.collectibleIsLimited = not GetFFlagIBEnableCollectiblesSystemSupport() and nil
	v14.bundlesAssetIsIn = {}
	v14.parentBundleId = nil
	v14.numFavorites = 0
	v14.minimumMembershipLevel = 0
	v14.collectibleItemId = ""
	v14.collectibleProductId = ""
	v14.collectibleLowestResalePrice = 0
	v14.collectibleLowestAvailableResaleProductId = ""
	v14.collectibleLowestAvailableResaleItemInstanceId = ""
	v14.collectibleQuantityLimitPerUser = 0
	v14.remaining = 0
	v14.creatingUniverseId = nil

	return v14
end
function t1.fromBulkPurchaseResult(p1, p2) -- line: 111
	-- upvalues: t1 (copy), ItemRestrictions (copy)
	local v17 = t1.new()
	local v18 = if not p2 or not p2.itemRestrictions then {} else p2.itemRestrictions

	v17.resellableCount = (not p2 or not p2.resellableCount) and 0 or p2.resellableCount

	if p1.status == Enum.MarketplaceItemPurchaseStatus.Success and p1.type == Enum.MarketplaceProductType.AvatarAsset then
		v17.owned = true

		if v18[ItemRestrictions.Collectible] or v18[ItemRestrictions.Limited] or v18[ItemRestrictions.LimitedUnique] then
			v17.resellableCount = v17.resellableCount + 1
		end
	end

	return v17
end
function t1.fromAvatarPreviewItem(p3) -- line: 133
	-- upvalues: t1 (copy)
	local v20 = t1.new()

	v20.name = p3.name
	v20.description = p3.description
	v20.price = p3.priceInRobux
	v20.productId = tostring(p3.productId)
	v20.collectibleItemId = p3.collectibleItemId
	v20.owned = p3.quantityOwned > 0
	v20.resellableCount = p3.quantityOwned
	v20.creatorId = tostring(p3.creator.id)
	v20.creatorName = p3.creator.name
	v20.creatorHasVerifiedBadge = p3.creator.hasVerifiedBadge
	v20.assetId = tostring(p3.id)
	v20.assetTypeId = tostring(p3.assetType)
	v20.productId = tostring(p3.productId)
	v20.isForSale = p3.isPurchasable
	v20.noPriceStatus = p3.noPriceStatus
	v20.meta = p3.meta

	if p3.itemRestrictions then
		local t2 = {}

		for _, v23 in p3.itemRestrictions do
			t2[v23] = true
		end

		v20.itemRestrictions = t2
	end

	return v20
end
function t1.fromGetProductInfo(p4) -- line: 164
	-- upvalues: t1 (copy), Constants (copy), GetFFlagIBEnableCollectiblesSystemSupport (copy)
	local v25 = t1.new()

	v25.name = p4.Name
	v25.description = p4.Description
	v25.price = p4.PriceInRobux
	v25.productType = p4.ProductType
	v25.remaining = p4.Remaining
	v25.creatorId = tostring(p4.Creator.Id)
	v25.creatorName = p4.Creator.Name
	v25.assetId = tostring(p4.AssetId)
	v25.assetTypeId = tostring(p4.AssetTypeId)
	v25.productId = tostring(p4.ProductId)
	v25.isForSale = p4.IsForSale
	v25.canBeSoldInThisGame = p4.CanBeSoldInThisGame
	v25.saleLocation = p4.SaleLocation
	v25.remaining = p4.Remaining or 0

	if v25.productType == Constants.ProductType.CollectibleItem then
		v25.collectibleItemId = p4.CollectibleItemId or ""
		v25.collectibleProductId = p4.CollectibleProductId or ""

		if p4.CollectiblesItemDetails then
			v25.collectibleLowestResalePrice = p4.CollectiblesItemDetails.CollectibleLowestResalePrice or 0
			v25.collectibleLowestAvailableResaleProductId = p4.CollectiblesItemDetails.CollectibleLowestAvailableResaleProductId or ""
			v25.collectibleLowestAvailableResaleItemInstanceId = p4.CollectiblesItemDetails.CollectibleLowestAvailableResaleItemInstanceId or ""
			v25.collectibleQuantityLimitPerUser = p4.CollectiblesItemDetails.CollectibleQuantityLimitPerUser or 0
			v25.collectibleIsLimited = p4.CollectiblesItemDetails.IsLimited
		end
	end

	v25.creatorHasVerifiedBadge = p4.Creator.HasVerifiedBadge

	if GetFFlagIBEnableCollectiblesSystemSupport() then
		v25.isLimited = p4.IsLimited
		v25.isLimitedUnique = p4.IsLimitedUnique

		return v25
	end

	v25.isLimited = p4.IsLimited or p4.IsLimitedUnique

	return v25
end
function t1.fromHumanoidDescription(p5) -- line: 209
	-- upvalues: t1 (copy)
	local v27 = t1.new()

	v27.assetId = tostring(p5)

	return v27
end
function t1.fromHumanoidDescriptionAccessory(p6) -- line: 217
	-- upvalues: t1 (copy)
	local v29 = t1.new()

	v29.assetId = tostring(p6.AssetId)
	v29.meta = {}
	v29.meta.position = {
		x = math.round(p6.Position.X * 100) / 100,
		y = math.round(p6.Position.Y * 100) / 100,
		z = math.round(p6.Position.Z * 100) / 100
	}
	v29.meta.rotation = {
		x = math.round(p6.Rotation.X * 100) / 100,
		y = math.round(p6.Rotation.Y * 100) / 100,
		z = math.round(p6.Rotation.Z * 100) / 100
	}
	v29.meta.scale = {
		x = math.round(p6.Scale.X * 100) / 100,
		y = math.round(p6.Scale.Y * 100) / 100,
		z = math.round(p6.Scale.Z * 100) / 100
	}

	if p6.IsLayered then
		v29.meta.order = p6.Order
	end

	return v29
end
function t1.fromGetAssetBundles(p7, p8) -- line: 247
	-- upvalues: t1 (copy)
	local v32 = t1.new()

	v32.assetId = tostring(p7)
	v32.bundlesAssetIsIn = p8

	return v32
end
function t1.fromGetFavoriteForAsset(s1: string, b1: boolean) -- line: 257
	-- upvalues: t1 (copy)
	local v35 = t1.new()

	v35.assetId = tostring(s1)
	v35.isFavorited = b1

	return v35
end
function t1.fromBundleInfo(p9, p10) -- line: 264
	-- upvalues: t1 (copy), Constants (copy)
	local v38 = t1.new()

	v38.assetId = tostring(p9)
	v38.parentBundleId = p10.bundleId
	v38.bundlesAssetIsIn = { p10.bundleId }
	v38.collectibleItemId = p10.collectibleItemId
	v38.collectibleProductId = p10.collectibleProductId
	v38.collectibleLowestResalePrice = p10.collectibleLowestResalePrice
	v38.collectibleLowestAvailableResaleProductId = p10.collectibleLowestAvailableResaleProductId
	v38.collectibleLowestAvailableResaleItemInstanceId = p10.collectibleLowestAvailableResaleItemInstanceId
	v38.collectibleQuantityLimitPerUser = p10.collectibleQuantityLimitPerUser
	v38.collectibleIsLimited = p10.collectibleIsLimited
	v38.isForSale = p10.isForSale
	v38.remaining = p10.remaining
	v38.owned = p10.owned

	if not v38.collectibleIsLimited then
		v38.isForSale = v38.isForSale and not v38.owned
	end

	v38.description = p10.description or ""
	v38.productType = Constants.ProductType.CollectibleItem

	if p10.price then
		v38.price = p10.price
	end

	return v38
end
function t1.fromGetAssetFavoriteCount(p11, p12) -- line: 306
	-- upvalues: t1 (copy)
	local v41 = t1.new()

	v41.assetId = tostring(p11)
	v41.numFavorites = p12

	return v41
end
function t1.fromGetEconomyProductInfo(p13, p14, p15, p16, p17) -- line: 315
	-- upvalues: t1 (copy)
	local v47 = t1.new()

	v47.assetId = tostring(p13.assetId)
	v47.owned = p14

	if p15 then
		v47.price = p15
	end

	v47.isForSale = p16
	v47.premiumPricing = p17

	return v47
end
function t1.fromGetItemDetailsV2(p18) -- line: 329
	-- upvalues: t1 (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy)
	local v49 = t1.new()

	v49.assetId = tostring(p18.id)
	v49.isForSale = p18.isPurchasable
	v49.price = p18.price or 0
	v49.hasResellers = p18.hasResellers
	v49.collectibleItemId = p18.collectibleItemId

	local t3 = {}

	if p18.itemRestrictions then
		for _, v52 in p18.itemRestrictions do
			t3[v52] = true
		end

		v49.itemRestrictions = t3
	end

	v49.saleLocationType = p18.saleLocationType
	v49.remaining = p18.unitsAvailableForConsumption
	v49.collectibleTotalQuantity = p18.totalQuantity
	v49.collectibleLowestResalePrice = p18.lowestResalePrice
	v49.isOffSale = p18.isOffSale
	v49.saleLocationType = p18.saleLocationType
	v49.numFavorites = p18.favoriteCount
	v49.catalogPriceStatus = p18.priceStatus

	if FFlagAXEnableIaBTimedOptionsBulkPurchase then
		v49.timedOptions = p18.timedOptions
	end

	return v49
end
function t1.fromGetItemDetails(p19) -- line: 362
	-- upvalues: t1 (copy), FFlagAXParseAdditionalItemDetailsFromCatalog (copy), FFlagIBV2Attribution (copy)
	local v54 = t1.new()

	v54.assetId = tostring(p19.Id)
	v54.owned = p19.Owned
	v54.isForSale = p19.IsPurchasable
	v54.price = p19.Price or 0
	v54.hasResellers = p19.HasResellers
	v54.collectibleItemId = p19.CollectibleItemId

	if FFlagAXParseAdditionalItemDetailsFromCatalog then
		local t4 = {}

		if p19.ItemRestrictions then
			for _, v57 in p19.ItemRestrictions do
				t4[v57] = true
			end

			v54.itemRestrictions = t4
		end

		v54.saleLocationType = p19.SaleLocationType
		v54.remaining = p19.UnitsAvailableForConsumption
		v54.collectibleTotalQuantity = p19.TotalQuantity
		v54.collectibleLowestResalePrice = p19.LowestResalePrice
		v54.isOffSale = p19.IsOffSale
		v54.saleLocationType = p19.SaleLocationType
		v54.numFavorites = p19.FavoriteCount
		v54.catalogPriceStatus = p19.PriceStatus
	end

	if FFlagIBV2Attribution then
		v54.creatingUniverseId = p19.CreatingUniverseId
	end

	return v54
end
function t1.fromPurchaseSuccess(p20) -- line: 398
	-- upvalues: t1 (copy)
	local v59 = t1.new()

	v59.assetId = tostring(p20)
	v59.owned = true

	return v59
end
function t1.fromGetVersionInfo(p21, p22) -- line: 411
	-- upvalues: t1 (copy)
	local v62 = t1.new()

	v62.assetId = tostring(p21)
	v62.creatingUniverseId = if not p22.creatingUniverseId then nil else tostring(p22.creatingUniverseId)

	return v62
end
function t1.getSaleDetailsForCollectibles(p23) -- line: 422
	-- upvalues: Dash (copy), Constants (copy)
	local v64 = Dash.joinDeep({}, p23)
	local saleLocation = p23.saleLocation

	if p23.productType == Constants.ProductType.CollectibleItem then
		local v66 = saleLocation and saleLocation.SaleLocationType ~= Constants.SaleLocationType.ShopOnly
		local v67 = saleLocation and saleLocation.SaleLocationType ~= Constants.SaleLocationType.ShopAndExperiencesById
		local v68 = saleLocation and (saleLocation.SaleLocationType == Constants.SaleLocationType.ShopAndExperiencesById and (type(saleLocation.UniverseIds) == "table" and table.find(saleLocation.UniverseIds, game.GameId) ~= nil))
		local v69 = saleLocation and saleLocation.SaleLocationType ~= Constants.SaleLocationType.ExperiencesDevApiOnly

		v64.isForSale = p23.isForSale and (p23.canBeSoldInThisGame and (v66 and ((v67 or v68) and v69)))

		if not p23.collectibleIsLimited then
			v64.isForSale = v64.isForSale and not v64.owned

			return v64
		end
	else
		v64.isForSale = p23.isForSale and p23.canBeSoldInThisGame

		if p23.canBeSoldInThisGame == nil then
			v64.isForSale = p23.isForSale
		end
	end

	return v64
end

return t1
