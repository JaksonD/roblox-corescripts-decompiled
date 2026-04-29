local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local AXCommon = require(AvatarExperienceInspectAndBuyParent.AXCommon)
local PriceStatus = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local ItemRestrictions = AXCommon.Enums.ItemRestrictions
local SalesLocationType = AXCommon.Enums.SalesLocationType
local NoPriceStatus = AXCommon.Enums.NoPriceStatus
local FFlagAXPurchaseFromQuantityFirst = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXPurchaseFromQuantityFirst

require(AvatarExperienceInspectAndBuy.Types)

local function gethasReachedQuantityLimitOfLimitedItem(p1) -- line: 72
	-- upvalues: ItemRestrictions (copy)
	local itemRestrictions = p1.itemRestrictions
	local v30 = itemRestrictions and itemRestrictions[ItemRestrictions.Limited]
	local v31 = itemRestrictions and itemRestrictions[ItemRestrictions.LimitedUnique]
	local v32 = itemRestrictions and itemRestrictions[ItemRestrictions.Collectible]

	if not v30 and (not v31 and not v32) then
		return false
	end

	if not p1.collectibleItemDetails then
		return false
	end

	local v33 = p1.isOwned == true
	local v34 = false

	if p1.collectibleItemDetails.quantityLimitPerUser and p1.collectibleItemDetails.resellableCount then
		v34 = p1.collectibleItemDetails.quantityLimitPerUser > 0 and p1.collectibleItemDetails.resellableCount >= p1.collectibleItemDetails.quantityLimitPerUser
	end

	local v35 = p1.collectibleItemDetails.hasResellers or false
	local itemRestrictions2 = p1.itemRestrictions
	local v37 = itemRestrictions2 and itemRestrictions2[ItemRestrictions.Limited]
	local v38 = itemRestrictions2 and itemRestrictions2[ItemRestrictions.LimitedUnique]
	local v39 = itemRestrictions2 and itemRestrictions2[ItemRestrictions.Collectible]
	local v40 = v37 or (v38 or v39)
	local v41 = not (v40 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v40) or (v34 or p1.isOffSale == true)

	return v33 and (v41 and not v35)
end
local function getIsPurchaseFromResale(p2, b1: boolean?) -- line: 144
	-- upvalues: FFlagAXPurchaseFromQuantityFirst (copy), ItemRestrictions (copy), SalesLocationType (copy)
	if not p2.collectibleItemDetails or not p2.collectibleItemDetails.hasResellers then
		return false
	end

	if FFlagAXPurchaseFromQuantityFirst and b1 then
		local itemRestrictions = p2.itemRestrictions
		local v56 = itemRestrictions and itemRestrictions[ItemRestrictions.Limited]
		local v57 = itemRestrictions and itemRestrictions[ItemRestrictions.LimitedUnique]
		local v58 = itemRestrictions and itemRestrictions[ItemRestrictions.Collectible]
		local v59 = v56 or (v57 or v58)

		return not (v59 and (p2.collectibleItemDetails and (p2.collectibleItemDetails.unitsAvailableForConsumption and p2.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v59)
	end

	local v60 = p2.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p2.saleLocationType == SalesLocationType.MyExperiencesOnly or p2.saleLocationType == SalesLocationType.ExperiencesById)

	if b1 and v60 then
		local itemRestrictions = p2.itemRestrictions
		local v62 = itemRestrictions and itemRestrictions[ItemRestrictions.Limited]
		local v63 = itemRestrictions and itemRestrictions[ItemRestrictions.LimitedUnique]
		local v64 = itemRestrictions and itemRestrictions[ItemRestrictions.Collectible]
		local v65 = v62 or (v63 or v64)

		return not (v65 and (p2.collectibleItemDetails and (p2.collectibleItemDetails.unitsAvailableForConsumption and p2.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v65)
	end

	if p2.collectibleItemDetails and p2.collectibleItemDetails.lowestResalePrice ~= nil and p2.saleLocationType == SalesLocationType.ShopOnly then
		return true
	end

	local v66 = if not p2.priceInRobux or (not p2.collectibleItemDetails or (not p2.collectibleItemDetails.lowestResalePrice or p2.catalogPriceStatus == "Free")) then p2.collectibleItemDetails and p2.collectibleItemDetails.lowestResalePrice ~= nil else p2.collectibleItemDetails.lowestResalePrice < p2.priceInRobux
	local itemRestrictions = p2.itemRestrictions
	local v68 = itemRestrictions and itemRestrictions[ItemRestrictions.Limited]
	local v69 = itemRestrictions and itemRestrictions[ItemRestrictions.LimitedUnique]
	local v70 = itemRestrictions and itemRestrictions[ItemRestrictions.Collectible]
	local v71 = v68 or (v69 or v70)
	local v72 = not (v71 and (p2.collectibleItemDetails and (p2.collectibleItemDetails.unitsAvailableForConsumption and p2.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v71) or p2.isOffSale == true

	return v66 or v72
end

return function(p3, b2: boolean?) --[[ getPriceStatus ]] -- line: 238
	-- upvalues: PriceStatus (copy), gethasReachedQuantityLimitOfLimitedItem (copy), ItemRestrictions (copy), getIsPurchaseFromResale (copy), SalesLocationType (copy), FFlagAXPurchaseFromQuantityFirst (copy), NoPriceStatus (copy)
	if not p3 then
		return PriceStatus.Unavailable
	end

	if gethasReachedQuantityLimitOfLimitedItem(p3) then
		return PriceStatus.QuantityLimitReached
	end

	local isOwned = p3.isOwned
	local itemRestrictions = p3.itemRestrictions
	local v102 = itemRestrictions and itemRestrictions[ItemRestrictions.Limited]
	local v103 = itemRestrictions and itemRestrictions[ItemRestrictions.LimitedUnique]
	local v104 = itemRestrictions and itemRestrictions[ItemRestrictions.Collectible]
	local v105 = not (v102 or (v103 or v104)) and not not p3.isOwned or not not p3.collectibleItemDetails and if p3.collectibleItemDetails.quantityLimitPerUser then p3.collectibleItemDetails.quantityLimitPerUser > 0 and p3.collectibleItemDetails.resellableCount >= p3.collectibleItemDetails.quantityLimitPerUser else false
	local v106 = p3.collectibleItemDetails and p3.collectibleItemDetails.hasResellers
	local itemRestrictions3 = p3.itemRestrictions
	local v108 = itemRestrictions3 and itemRestrictions3[ItemRestrictions.Limited]
	local v109 = itemRestrictions3 and itemRestrictions3[ItemRestrictions.LimitedUnique]
	local v110 = itemRestrictions3 and itemRestrictions3[ItemRestrictions.Collectible]
	local v111 = v108 or (v109 or v110)
	local v112 = not (v111 and (p3.collectibleItemDetails and (p3.collectibleItemDetails.unitsAvailableForConsumption and p3.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v111) or (v105 or p3.isOffSale)

	if isOwned and (v112 and not v106) then
		return PriceStatus.Owned
	end

	local itemRestrictions4 = p3.itemRestrictions
	local v114 = itemRestrictions4 and itemRestrictions4[ItemRestrictions.Limited]
	local v115 = itemRestrictions4 and itemRestrictions4[ItemRestrictions.LimitedUnique]
	local v116 = itemRestrictions4 and itemRestrictions4[ItemRestrictions.Collectible]
	local v117 = v114 or (v115 or v116)
	local v118 = v117 and (p3.collectibleItemDetails and (p3.collectibleItemDetails.unitsAvailableForConsumption and p3.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v117
	local v119 = p3.collectibleItemDetails and p3.collectibleItemDetails.hasResellers

	if not v118 and not v119 then
		return PriceStatus.SoldOut
	end

	if getIsPurchaseFromResale(p3, b2) then
		return PriceStatus.PurchaseFromResale
	end

	local v120

	if p3.isOffSale then
		v120 = false
	else
		local v121 = p3.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p3.saleLocationType == SalesLocationType.MyExperiencesOnly or p3.saleLocationType == SalesLocationType.ExperiencesById)
		local itemRestrictions5 = p3.itemRestrictions
		local v123 = itemRestrictions5 and itemRestrictions5[ItemRestrictions.Limited]
		local v124 = itemRestrictions5 and itemRestrictions5[ItemRestrictions.LimitedUnique]
		local v125 = itemRestrictions5 and itemRestrictions5[ItemRestrictions.Collectible]
		local v126 = v123 or (v124 or v125)
		local v127 = v126 and (p3.collectibleItemDetails and (p3.collectibleItemDetails.unitsAvailableForConsumption and p3.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v126

		v120 = v121 and v127 or not FFlagAXPurchaseFromQuantityFirst and p3.noPriceStatus == NoPriceStatus.InExperience
	end

	if v120 then
		return PriceStatus.InExperienceOnly
	end

	if p3.saleLocationType == SalesLocationType.ShopOnly then
		return PriceStatus.Unavailable
	end

	local v128

	if p3.isOffSale then
		v128 = false
	else
		local v129 = p3.saleLocationType == SalesLocationType.ExperiencesDevApiOnly

		v128 = p3.noPriceStatus == NoPriceStatus.Free or (not v129 and p3.priceInRobux == 0 or p3.catalogPriceStatus == "Free")
	end

	if v128 then
		return PriceStatus.Free
	end

	if not p3.isOffSale and (p3.noPriceStatus ~= NoPriceStatus.OffSale and p3.saleLocationType ~= SalesLocationType.ExperiencesDevApiOnly) then
		return PriceStatus.PurchaseFromRoblox
	end

	if p3.isOffSale or p3.noPriceStatus == NoPriceStatus.OffSale then
		return PriceStatus.OffSale
	end

	return PriceStatus.Unavailable
end
