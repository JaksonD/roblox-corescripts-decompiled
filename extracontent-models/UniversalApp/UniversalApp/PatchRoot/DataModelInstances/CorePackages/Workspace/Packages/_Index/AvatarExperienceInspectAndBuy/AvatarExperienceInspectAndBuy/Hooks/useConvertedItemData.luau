local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent

require(AvatarExperienceInspectAndBuy.Types)

local AXCommon = require(AvatarExperienceInspectAndBuy.Parent.AXCommon)
local React = require(AvatarExperienceInspectAndBuyParent.React)
local useMemo = React.useMemo
local useCallback = React.useCallback
local RoactUtils = require(AvatarExperienceInspectAndBuyParent.RoactUtils)
local convertAssetInfoToItemData = require(AvatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local convertBundleInfoToItemData = require(AvatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local tutils = require(AvatarExperienceInspectAndBuyParent.tutils)
local PerformFetch = require(AvatarExperienceInspectAndBuyParent.Http).PerformFetch
local ItemTypeEnum = AXCommon.Enums.ItemTypeEnum
local FFlagAXEnableBatchItemDetailsFetchV2 = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXEnableBatchItemDetailsFetchV2
local BatchItemDetailsPerformFetchKey = require(AvatarExperienceInspectAndBuy.Constants).BatchItemDetailsPerformFetchKey

local function getResellableInsances(p1) -- line: 28
	return p1.collectibleResellableInstances
end

return function(p2) --[[ useConvertedItemData ]] -- line: 36
	-- upvalues: useCallback (copy), ItemTypeEnum (copy), FFlagAXEnableBatchItemDetailsFetchV2 (copy), PerformFetch (copy), BatchItemDetailsPerformFetchKey (copy), useSelector (copy), tutils (copy), getResellableInsances (copy), useMemo (copy), convertAssetInfoToItemData (copy), convertBundleInfoToItemData (copy)
	local v19 = if not p2 then nil else p2.id
	local v20 = if not p2 then nil else p2.itemType
	local v21 = useCallback(function(p3) -- line: 40
		-- upvalues: v20 (copy), ItemTypeEnum (copy), v19 (copy)
		if v20 == ItemTypeEnum.Asset then
			return p3.assets[v19]
		end

		if v20 == ItemTypeEnum.Bundle then
			return p3.bundles[v19]
		end

		return nil
	end, {
		v19,
		v20
	})
	local v22 = useCallback(function(p4) -- line: 49
		-- upvalues: FFlagAXEnableBatchItemDetailsFetchV2 (copy), PerformFetch (copy), BatchItemDetailsPerformFetchKey (copy), v19 (copy), v20 (copy), ItemTypeEnum (copy)
		if FFlagAXEnableBatchItemDetailsFetchV2 then
			return PerformFetch.GetStatus(p4, BatchItemDetailsPerformFetchKey)
		end

		if v19 and v20 then
			local v28 = string.format("inspectAndBuy.%d.getItemDetails.%s.%s", p4.storeId, v19, if v20 ~= ItemTypeEnum.Asset then tostring(Enum.AvatarItemType.Bundle) else tostring(Enum.AvatarItemType.Asset))

			return PerformFetch.GetStatus(p4, v28)
		end

		return nil
	end, {
		v19,
		v20
	})
	local v23 = useSelector(v21, tutils.deepEqual)
	local v24 = useSelector(getResellableInsances, tutils.deepEqual)
	local v25 = useSelector(v22, tutils.deepEqual)

	return useMemo(function() -- line: 74
		-- upvalues: v23 (copy), v24 (copy), v20 (copy), ItemTypeEnum (copy), convertAssetInfoToItemData (copy), convertBundleInfoToItemData (copy)
		local v29 = nil

		if v23 and (v23.collectibleItemId ~= nil and v24 ~= nil) then
			v29 = v24[v23.collectibleItemId]
		end

		if v23 then
			if v20 == ItemTypeEnum.Asset then
				return (convertAssetInfoToItemData(v23, v29))
			end

			if v20 == ItemTypeEnum.Bundle then
				return (convertBundleInfoToItemData(v23, v29))
			end
		end

		return nil
	end, {
		v23,
		v24,
		v20
	}), v25
end
