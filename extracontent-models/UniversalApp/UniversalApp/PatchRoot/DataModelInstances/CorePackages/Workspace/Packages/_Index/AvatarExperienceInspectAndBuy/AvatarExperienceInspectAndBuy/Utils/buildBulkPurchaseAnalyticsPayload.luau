local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent

require(AvatarExperienceInspectAndBuy.Types)

local ItemTypeEnum = require(AvatarExperienceInspectAndBuyParent.AXCommon).Enums.ItemTypeEnum

require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local convertAssetInfoToItemData = require(AvatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local convertBundleInfoToItemData = require(AvatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local getPriceStatus = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)

require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)

local getPriceInRobux = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux

return function(t1: {[any]: any}) --[[ buildBulkPurchaseAnalyticsPayload ]] -- line: 47
	-- upvalues: ItemTypeEnum (copy), convertAssetInfoToItemData (copy), getPriceStatus (copy), getPriceInRobux (copy), convertBundleInfoToItemData (copy)
	local itemId = t1.itemId
	local collectibleResellableInstances = t1.collectibleResellableInstances
	local storedData = t1.storedData
	local days = nil
	local v17, assetTypeId

	if t1.itemType == ItemTypeEnum.Asset then
		local v13 = t1.assetsMap and t1.assetsMap[itemId]

		if not v13 then
			return nil
		end

		local v14 = if not v13.collectibleItemId or not collectibleResellableInstances then nil else collectibleResellableInstances[v13.collectibleItemId]
		local v15 = convertAssetInfoToItemData(v13, v14)
		local v16 = getPriceStatus(v15, true)

		v17 = getPriceInRobux(v15, v16)
		assetTypeId = v13.assetTypeId

		if storedData and storedData.timedOptions then
			for _, v20 in storedData.timedOptions do
				if v20.selected then
					days = v20.days
					v17 = v20.price

					return {
						itemSubType = assetTypeId,
						timedOptionDays = days,
						price = v17
					}
				end
			end
		end
	else
		local v21 = t1.bundlesMap and t1.bundlesMap[itemId]

		if not v21 then
			return nil
		end

		local v22 = if not v21.collectibleItemId or not collectibleResellableInstances then nil else collectibleResellableInstances[v21.collectibleItemId]
		local v23 = convertBundleInfoToItemData(v21, v22)
		local v24 = getPriceStatus(v23, true)

		v17 = getPriceInRobux(v23, v24)
		assetTypeId = if not v23 then nil else v23.itemSubType
	end

	return {
		itemSubType = assetTypeId,
		timedOptionDays = days,
		price = v17
	}
end
