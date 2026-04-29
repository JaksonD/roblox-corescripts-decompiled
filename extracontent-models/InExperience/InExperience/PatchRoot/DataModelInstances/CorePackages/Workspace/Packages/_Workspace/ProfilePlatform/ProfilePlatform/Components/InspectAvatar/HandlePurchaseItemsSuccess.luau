local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local SetCurrentToastMessage = require(ProfilePlatformParent.ToastRodux).Actions.SetCurrentToastMessage
local CatalogNetworking = require(ProfilePlatformParent.CatalogNetworking)
local PurchaseDetailsStore = CatalogNetworking.PurchaseDetailsStore
local BundleOwnershipStore = CatalogNetworking.BundleOwnershipStore

require(ProfilePlatform.Contexts.ProfileWrapperContext)

local function buildEquippableAssets(t1: {[any]: any}, t2: {[any]: any}, t3: {[any]: any}) -- line: 57
	local t4 = {}
	local t5 = {}

	local function append(t6: {[any]: any}) -- line: 65
		-- upvalues: t5 (copy), t3 (copy), t4 (copy)
		for _, v32 in t6 do
			if not t5[v32] then
				local v33 = t3[v32]

				if v33 then
					t5[v32] = true
					table.insert(t4, {
						assetTypeId = tostring(v33),
						assetId = tostring(v32)
					})
				end
			end
		end
	end

	append(t1)
	append(t2)

	return t4
end
local function parseLineItems(t7: {[any]: any}) -- line: 88
	local t8 = {}
	local t9 = {}
	local n1 = 0

	for _, v20 in t7 do
		if v20.status == "SUCCEEDED" then
			if v20.bundleId then
				table.insert(t9, (tostring(v20.bundleId)))
				table.insert(t8, (tostring(v20.bundleId)))
			elseif v20.assetId then
				table.insert(t8, (tostring(v20.assetId)))
			end
		else
			n1 += 1
		end
	end

	return t8, t9, n1
end

return function(t10: {[any]: any}) --[[ HandlePurchaseItemsSuccess ]] -- line: 109
	-- upvalues: parseLineItems (copy), PurchaseDetailsStore (copy), BundleOwnershipStore (copy), buildEquippableAssets (copy), SetCurrentToastMessage (copy)
	local v22 = t10.result and t10.result.responseBody
	local v23 = v22 and v22.fulfillmentGroups
	local v24 = v23 and (not not v23[1] and v23[1].lineItems) or {}
	local v25, v26, v27 = parseLineItems(v24)

	PurchaseDetailsStore.markItemsOwned(v25)

	if #v26 > 0 then
		BundleOwnershipStore.markOwned(v26)
	end

	if t10.isWearAfterPurchaseChecked and t10.profileWrapperContext.postPurchase then
		local v28 = buildEquippableAssets(t10.purchasedWearIds, t10.ownedAssetIds, t10.wearTypeMap)

		if #v28 > 0 then
			if t10.avatarSaveContext and t10.avatarSaveContext.autoSaveNextNewSaveData then
				t10.avatarSaveContext.autoSaveNextNewSaveData()
			end

			t10.profileWrapperContext.postPurchase.wearAfterPurchase(v28)
		end
	end

	local v29 = if v27 ~= 0 then {
		toastMessage = t10.localized.purchasePartialFailure,
		isLocalized = true,
		toastType = "PurchaseMessage"
	} else {
		toastMessage = if #v25 ~= 1 then t10.localized.purchaseSuccessPlural else t10.localized.purchaseSuccessSingular,
		isLocalized = true,
		toastType = "PurchaseMessage"
	}

	t10.dispatch(SetCurrentToastMessage(v29))
end
