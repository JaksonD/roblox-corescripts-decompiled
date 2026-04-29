local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local ItemTypeEnum = require(AvatarExperienceInspectAndBuyParent.AXCommon).Enums.ItemTypeEnum

require(AvatarExperienceInspectAndBuy.Types)

local convertAssetInfoToItemData = require(AvatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local convertBundleInfoToItemData = require(AvatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local getPriceStatus = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local PriceStatus = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local getPriceInRobux = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux

require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local function createBulkPurchaseRequestItem(p1) -- line: 62
	-- upvalues: ItemTypeEnum (copy)
	return {
		id = p1.id and tonumber(p1.id) or 0,
		itemType = if p1.itemType ~= ItemTypeEnum.Asset then Enum.AvatarItemType.Bundle.Value else Enum.AvatarItemType.Asset.Value
	}
end

return {
	convertAvatarItemToItemData = function(p2, p3) --[[ convertAvatarItemToItemData ]] -- line: 31
		-- upvalues: ItemTypeEnum (copy), convertAssetInfoToItemData (copy), convertBundleInfoToItemData (copy)
		if p2.itemType == ItemTypeEnum.Asset then
			local v12 = p3.assets[p2.id]

			if not v12 then
				return nil
			end

			return convertAssetInfoToItemData(v12)
		end

		if p2.itemType == ItemTypeEnum.Bundle then
			local v13 = p3.bundles[p2.id]

			if not v13 then
				return nil
			end

			return convertBundleInfoToItemData(v13)
		end

		return nil
	end,
	isPurchasableItem = function(p4) --[[ isPurchasableItem ]] -- line: 52
		-- upvalues: PriceStatus (copy)
		return p4 == PriceStatus.Free or (p4 == PriceStatus.PurchaseFromRoblox or p4 == PriceStatus.PurchaseFromResale)
	end,
	createBulkPurchaseRequestItem = createBulkPurchaseRequestItem,
	getBulkPurchaseEligibleItems = function(t1: {[any]: any}?, p5) --[[ getBulkPurchaseEligibleItems ]] -- line: 76
		-- upvalues: ItemTypeEnum (copy), convertAssetInfoToItemData (copy), convertBundleInfoToItemData (copy), getPriceStatus (copy), PriceStatus (copy), createBulkPurchaseRequestItem (copy), getPriceInRobux (copy)
		if not t1 then
			return {
				requestedItems = {},
				totalPrice = 0
			}
		end

		local t2 = {}
		local n1 = 0

		for _, v21 in t1 do
			local v23

			if v21.itemType == ItemTypeEnum.Asset then
				local v22 = p5.assets[v21.id]

				v23 = if v22 then convertAssetInfoToItemData(v22) else nil
			elseif v21.itemType == ItemTypeEnum.Bundle then
				local v24 = p5.bundles[v21.id]

				v23 = if v24 then convertBundleInfoToItemData(v24) else nil
			else
				v23 = nil
			end

			local v25 = getPriceStatus(v23, true)

			if v23 and (v25 == PriceStatus.Free or (v25 == PriceStatus.PurchaseFromRoblox or v25 == PriceStatus.PurchaseFromResale)) then
				table.insert(t2, (createBulkPurchaseRequestItem(v23)))

				local v26 = getPriceInRobux(v23, v25)

				if v26 ~= nil then
					n1 += v26
				end
			end
		end

		return {
			requestedItems = t2,
			totalPrice = n1
		}
	end,
	buildRequestedItemsWithTimedOptions = function(t3: {[any]: any}, p6) --[[ buildRequestedItemsWithTimedOptions ]] -- line: 118
		local t4 = {}

		for _, v31 in t3 do
			local v32 = p6[tostring(v31.id)]
			local t5 = nil

			if v32 and v32.timedOptions then
				for _, v35 in v32.timedOptions do
					if v35.selected and v35.days > 0 then
						t5 = {{
							Type = Enum.PurchaseOption.TimedOption,
							Value = v35.days * 86400
						}}

						break
					end
				end
			end

			table.insert(t4, {
				id = v31.id,
				itemType = v31.itemType,
				PurchaseOptions = t5
			})
		end

		return t4
	end
}
