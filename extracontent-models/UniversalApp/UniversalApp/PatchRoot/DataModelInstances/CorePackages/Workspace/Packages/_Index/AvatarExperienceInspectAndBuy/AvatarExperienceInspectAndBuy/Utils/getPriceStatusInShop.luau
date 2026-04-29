local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local AXCommon = require(AvatarExperienceInspectAndBuyParent.AXCommon)
local PriceStatus = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local ItemRestrictions = AXCommon.Enums.ItemRestrictions
local SalesLocationType = AXCommon.Enums.SalesLocationType
local NoPriceStatus = AXCommon.Enums.NoPriceStatus

require(AvatarExperienceInspectAndBuy.Types)

local function getIsPurchaseFromResale(p1) -- line: 81
	-- upvalues: ItemRestrictions (copy)
	if not p1.collectibleItemDetails or not p1.collectibleItemDetails.hasResellers then
		return false
	end

	local v49 = if not p1.priceInRobux or (not p1.collectibleItemDetails or (not p1.collectibleItemDetails.lowestResalePrice or p1.catalogPriceStatus == "Free")) then p1.collectibleItemDetails and p1.collectibleItemDetails.lowestResalePrice ~= nil else p1.collectibleItemDetails.lowestResalePrice < p1.priceInRobux
	local itemRestrictions = p1.itemRestrictions
	local v51 = itemRestrictions and itemRestrictions[ItemRestrictions.Limited]
	local v52 = itemRestrictions and itemRestrictions[ItemRestrictions.LimitedUnique]
	local v53 = itemRestrictions and itemRestrictions[ItemRestrictions.Collectible]
	local v54 = v51 or (v52 or v53)
	local v55 = not (v54 and (p1.collectibleItemDetails and (p1.collectibleItemDetails.unitsAvailableForConsumption and p1.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v54) or p1.isOffSale == true

	return v49 or v55
end

return function(p2) --[[ getPriceStatusInShop ]] -- line: 124
	-- upvalues: PriceStatus (copy), ItemRestrictions (copy), getIsPurchaseFromResale (copy), SalesLocationType (copy), NoPriceStatus (copy)
	if not p2 then
		return PriceStatus.Unavailable
	end

	local isOwned = p2.isOwned
	local itemRestrictions = p2.itemRestrictions
	local v71 = itemRestrictions and itemRestrictions[ItemRestrictions.Limited]
	local v72 = itemRestrictions and itemRestrictions[ItemRestrictions.LimitedUnique]
	local v73 = itemRestrictions and itemRestrictions[ItemRestrictions.Collectible]
	local v74 = not (v71 or (v72 or v73)) and not not p2.isOwned or not not p2.collectibleItemDetails and if p2.collectibleItemDetails.quantityLimitPerUser then p2.collectibleItemDetails.quantityLimitPerUser > 0 and p2.collectibleItemDetails.resellableCount >= p2.collectibleItemDetails.quantityLimitPerUser else false
	local v75 = p2.collectibleItemDetails and p2.collectibleItemDetails.hasResellers
	local itemRestrictions2 = p2.itemRestrictions
	local v77 = itemRestrictions2 and itemRestrictions2[ItemRestrictions.Limited]
	local v78 = itemRestrictions2 and itemRestrictions2[ItemRestrictions.LimitedUnique]
	local v79 = itemRestrictions2 and itemRestrictions2[ItemRestrictions.Collectible]
	local v80 = v77 or (v78 or v79)
	local v81 = not (v80 and (p2.collectibleItemDetails and (p2.collectibleItemDetails.unitsAvailableForConsumption and p2.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v80) or (v74 or p2.isOffSale)

	if isOwned and (v81 and not v75) then
		return PriceStatus.Owned
	end

	local itemRestrictions3 = p2.itemRestrictions
	local v83 = itemRestrictions3 and itemRestrictions3[ItemRestrictions.Limited]
	local v84 = itemRestrictions3 and itemRestrictions3[ItemRestrictions.LimitedUnique]
	local v85 = itemRestrictions3 and itemRestrictions3[ItemRestrictions.Collectible]
	local v86 = v83 or (v84 or v85)
	local v87 = v86 and (p2.collectibleItemDetails and (p2.collectibleItemDetails.unitsAvailableForConsumption and p2.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v86
	local v88 = p2.collectibleItemDetails and p2.collectibleItemDetails.hasResellers

	if not v87 and not v88 then
		return PriceStatus.SoldOut
	end

	if getIsPurchaseFromResale(p2) then
		return PriceStatus.PurchaseFromResale
	end

	local v89

	if p2.isOffSale then
		v89 = false
	else
		local v90 = p2.saleLocationType == SalesLocationType.ExperiencesDevApiOnly or (p2.saleLocationType == SalesLocationType.MyExperiencesOnly or p2.saleLocationType == SalesLocationType.ExperiencesById)
		local itemRestrictions4 = p2.itemRestrictions
		local v92 = itemRestrictions4 and itemRestrictions4[ItemRestrictions.Limited]
		local v93 = itemRestrictions4 and itemRestrictions4[ItemRestrictions.LimitedUnique]
		local v94 = itemRestrictions4 and itemRestrictions4[ItemRestrictions.Collectible]
		local v95 = v92 or (v93 or v94)
		local v96 = v95 and (p2.collectibleItemDetails and (p2.collectibleItemDetails.unitsAvailableForConsumption and p2.collectibleItemDetails.unitsAvailableForConsumption > 0)) or not v95

		v89 = v90 and v96
	end

	if v89 then
		return PriceStatus.InExperienceOnly
	end

	local v97

	if p2.isOffSale then
		v97 = false
	else
		local v98 = p2.saleLocationType == SalesLocationType.ExperiencesDevApiOnly

		v97 = p2.noPriceStatus == NoPriceStatus.Free or (not v98 and p2.priceInRobux == 0 or p2.catalogPriceStatus == "Free")
	end

	if v97 then
		return PriceStatus.Free
	end

	if not p2.isOffSale and (p2.noPriceStatus ~= NoPriceStatus.OffSale and p2.saleLocationType ~= SalesLocationType.ExperiencesDevApiOnly) then
		return PriceStatus.PurchaseFromRoblox
	end

	return PriceStatus.Unavailable
end
