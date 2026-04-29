local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)

require(AvatarExperienceInspectAndBuy.Types)

local FIntBulkPurchaseRequestLimit = require(AvatarExperienceInspectAndBuyParent.SharedFlags).FIntBulkPurchaseRequestLimit
local useSelector = require(AvatarExperienceInspectAndBuyParent.RoactUtils).Hooks.RoactRodux.useSelector
local bulkPurchaseUtils = require(AvatarExperienceInspectAndBuy.Utils.bulkPurchaseUtils)
local buildBulkPurchaseAnalyticsPayload = require(AvatarExperienceInspectAndBuy.Utils.buildBulkPurchaseAnalyticsPayload)
local tutils = require(AvatarExperienceInspectAndBuyParent.tutils)
local ItemTypeEnum = require(AvatarExperienceInspectAndBuyParent.AXCommon).Enums.ItemTypeEnum
local AvatarExperienceFlags = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags)
local FFlagAXFixBulkPurchaseFreeItems = AvatarExperienceFlags.FFlagAXFixBulkPurchaseFreeItems
local FFlagAXEnableIaBTimedOptionsBulkPurchase = AvatarExperienceFlags.FFlagAXEnableIaBTimedOptionsBulkPurchase
local useSignalState = require(AvatarExperienceInspectAndBuyParent.SignalsReact).useSignalState
local useItemSelectionStore = require(AvatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore

require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local function v16(p1) -- line: 47
	return {
		assets = p1.assets,
		bundles = p1.bundles
	}
end
local function v17(p2) -- line: 54
	return p2.collectibleResellableInstances
end

return function(t1: {[any]: any}?, p3) -- line: 58
	-- upvalues: useSelector (copy), v16 (copy), tutils (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), v17 (copy), React (copy), bulkPurchaseUtils (copy), useItemSelectionStore (copy), useSignalState (copy), RobloxReplicatedStorage (copy), ItemTypeEnum (copy), buildBulkPurchaseAnalyticsPayload (copy), FFlagAXFixBulkPurchaseFreeItems (copy), FIntBulkPurchaseRequestLimit (copy)
	local v22 = useSelector(v16, tutils.deepEqual)
	local v23 = if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else useSelector(v17, tutils.deepEqual)
	local v24 = React.useMemo(function() -- line: 64
		-- upvalues: bulkPurchaseUtils (copy), t1 (copy), v22 (copy)
		return bulkPurchaseUtils.getBulkPurchaseEligibleItems(t1, v22)
	end, {
		t1,
		v22
	})
	local v25 = if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else useItemSelectionStore()
	local v26 = if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else useSignalState(v25.getItemDataMap)

	return React.useCallback(function() -- line: 75
		-- upvalues: RobloxReplicatedStorage (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), bulkPurchaseUtils (copy), v24 (copy), v26 (copy), ItemTypeEnum (copy), buildBulkPurchaseAnalyticsPayload (copy), v22 (copy), v23 (copy), p3 (copy)
		coroutine.wrap(function() -- line: 76
			-- upvalues: RobloxReplicatedStorage (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), bulkPurchaseUtils (copy), v24 (copy), v26 (copy), ItemTypeEnum (copy), buildBulkPurchaseAnalyticsPayload (copy), v22 (copy), v23 (copy), p3 (copy)
			local ServerSideBulkPurchaseEvent = RobloxReplicatedStorage:WaitForChild("ServerSideBulkPurchaseEvent", 1e999)

			if FFlagAXEnableIaBTimedOptionsBulkPurchase then
				ServerSideBulkPurchaseEvent:FireServer((bulkPurchaseUtils.buildRequestedItemsWithTimedOptions(v24.requestedItems, v26)))
			else
				ServerSideBulkPurchaseEvent:FireServer(v24.requestedItems)
			end

			for _, v29 in v24.requestedItems do
				local v30 = if v29.itemType ~= Enum.AvatarItemType.Asset.Value then ItemTypeEnum.Bundle else ItemTypeEnum.Asset
				local str = tostring(v29.id)

				if FFlagAXEnableIaBTimedOptionsBulkPurchase then
					local v32 = v26 and v26[str]
					local v33 = buildBulkPurchaseAnalyticsPayload({
						itemId = str,
						itemType = v30,
						assetsMap = v22.assets,
						bundlesMap = v22.bundles,
						collectibleResellableInstances = v23,
						storedData = v32
					})

					if v33 then
						p3.reportPurchaseAttemptUnifiedEvent(v30, str, v33)
					end
				else
					p3.reportPurchaseAttempt(v30, str)
				end
			end
		end)()
	end, {
		v24,
		p3.reportPurchaseAttempt,
		if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else v26,
		if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else v22,
		if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else v23,
		if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else p3.reportPurchaseAttemptUnifiedEvent
	}), React.useMemo(function() -- line: 127
		-- upvalues: FFlagAXFixBulkPurchaseFreeItems (copy), v24 (copy), FIntBulkPurchaseRequestLimit (copy)
		if FFlagAXFixBulkPurchaseFreeItems then
			if v24.requestedItems then
				return #v24.requestedItems <= FIntBulkPurchaseRequestLimit and #v24.requestedItems > 0
			end

			return false
		end

		if v24.requestedItems then
			return #v24.requestedItems <= FIntBulkPurchaseRequestLimit
		end

		return false
	end, { v24 }), v24.totalPrice or 0
end
