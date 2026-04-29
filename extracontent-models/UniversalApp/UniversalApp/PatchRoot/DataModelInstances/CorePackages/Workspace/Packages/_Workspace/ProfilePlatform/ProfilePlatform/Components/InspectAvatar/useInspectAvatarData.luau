local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Dash = require(ProfilePlatformParent.Dash)
local Promise = require(ProfilePlatformParent.Promise)
local RobloxAppHooks = require(ProfilePlatformParent.RobloxAppHooks)
local CatalogNetworking = require(ProfilePlatformParent.CatalogNetworking)
local useSignalState = require(ProfilePlatformParent.SignalsReact).useSignalState
local useLocalUserId = RobloxAppHooks.useLocalUserId
local Enums = require(ProfilePlatform.Common.Enums)
local myRoduxNetworkingImpl = require(ProfilePlatform.Networking.myRoduxNetworkingImpl)
local InspectAvatarUtils = require(script.Parent.InspectAvatarUtils)

require(ProfilePlatform.Common.Types)

local PurchaseDetailsStore = CatalogNetworking.PurchaseDetailsStore
local CollectibleProductIdStore = CatalogNetworking.CollectibleProductIdStore
local BundleOwnershipStore = CatalogNetworking.BundleOwnershipStore
local ItemDetailsStore = CatalogNetworking.ItemDetailsStore

local function useLookApiData(t1: {[any]: any}) -- line: 42
	-- upvalues: useSignalState (copy), PurchaseDetailsStore (copy), React (copy), Dash (copy), Enums (copy), myRoduxNetworkingImpl (copy)
	local v20 = useSignalState(PurchaseDetailsStore.getCache)
	local v21, v22 = React.useState({})
	local v23, v24 = React.useState(true)

	React.useEffect(function() -- line: 47
		-- upvalues: t1 (copy), v24 (copy), Dash (copy), Enums (copy), v22 (copy), PurchaseDetailsStore (copy), myRoduxNetworkingImpl (copy)
		if #t1 == 0 then
			v24(false)

			return
		end

		local v38 = Dash.collectArray(t1, function(_, p2) -- line: 52
			-- upvalues: Enums (copy)
			if p2.itemType ~= Enums.ItemTypes.Bundle then
				return {
					id = tonumber(p2.assetId) or p2.assetId
				}
			end

			return nil
		end)

		if #v38 == 0 then
			v24(false)

			return
		end

		v24(true)
		v22({})
		PurchaseDetailsStore.fetchAll(myRoduxNetworkingImpl, v38):andThen(function(p3) -- line: 66
			-- upvalues: Dash (copy), v22 (copy)
			if p3 and (p3.look and p3.look.items) then
				local v98 = Dash.map(p3.look.items, function(p4) -- line: 68
					return (tostring(p4.id))
				end)

				v22(v98)
			end
		end, function(p5) -- line: 73
			warn("[useInspectAvatarData] Failed to fetch purchase details:", (tostring(p5)))
		end):finally(function() -- line: 76
			-- upvalues: v24 (copy)
			v24(false)
		end)
	end, { t1 })

	return {
		responseIds = v21,
		cache = v20,
		isLoading = v23
	}
end
local function useCatalogEnrichment(t2: {[any]: any}, t3: {[any]: any}) -- line: 92
	-- upvalues: useSignalState (copy), ItemDetailsStore (copy), React (copy), CollectibleProductIdStore (copy), BundleOwnershipStore (copy), Enums (copy), myRoduxNetworkingImpl (copy), Promise (copy)
	local v27 = useSignalState(ItemDetailsStore.getCache)
	local v28, v29 = React.useState(true)
	local v30 = useSignalState(CollectibleProductIdStore.getCache)
	local v31 = useSignalState(BundleOwnershipStore.getCache)

	React.useEffect(function() -- line: 100
		-- upvalues: t2 (copy), t3 (copy), v29 (copy), Enums (copy), ItemDetailsStore (copy), myRoduxNetworkingImpl (copy), Promise (copy), BundleOwnershipStore (copy)
		if t2.isLoading then
			return
		end

		if #t3 == 0 then
			v29(false)

			return
		end

		local t4 = {}
		local t5 = {}

		for _, v42 in t3 do
			t4[tostring(v42.assetId)] = v42.itemType or "Asset"

			if v42.itemType == Enums.ItemTypes.Bundle then
				local num = tonumber(v42.assetId)

				if num then
					table.insert(t5, num)
				end
			end
		end

		local t6 = {}
		local t7 = {}

		for _, v47 in t2.responseIds do
			local num = tonumber(v47)

			if num and not t7[v47] then
				t7[v47] = true
				table.insert(t6, {
					id = num,
					itemType = t4[v47] or "Bundle"
				})
			end
		end

		for _, v50 in t3 do
			local str = tostring(v50.assetId)
			local num = tonumber(v50.assetId)

			if num and not t7[str] then
				t7[str] = true
				table.insert(t6, {
					id = num,
					itemType = v50.itemType or "Asset"
				})
			end
		end

		if #t6 == 0 and #t5 == 0 then
			v29(false)

			return
		end

		v29(true)

		local v53 = if not (#t6 > 0) then Promise.resolve() else ItemDetailsStore.fetchAndCache(myRoduxNetworkingImpl, t6)
		local v54 = if not (#t5 > 0) then Promise.resolve() else BundleOwnershipStore.fetchAndCache(myRoduxNetworkingImpl, t5):catch(function(p6) -- line: 159
			warn("[useInspectAvatarData] Failed to fetch bundle ownership:", (tostring(p6)))
		end)

		Promise.all({
			v53,
			v54
		}):andThen(function() -- line: 165
			-- upvalues: v29 (copy)
			v29(false)
		end):catch(function(p7) -- line: 168
			-- upvalues: v29 (copy)
			warn("[useInspectAvatarData] Failed to fetch catalog details:", (tostring(p7)))
			v29(false)
		end)
	end, {
		t2.responseIds,
		t2.isLoading,
		t3
	})
	React.useEffect(function() -- line: 175
		-- upvalues: t3 (copy), v27 (copy), Enums (copy), t2 (copy), CollectibleProductIdStore (copy), myRoduxNetworkingImpl (copy)
		local t8 = {}
		local t9 = {}

		for _, v58 in t3 do
			local v59 = v27[tostring(v58.assetId)]

			if v59 and v59.collectibleItemId then
				local collectibleItemId = v59.collectibleItemId

				if not t9[collectibleItemId] then
					local v61 = v58.itemType == Enums.ItemTypes.Bundle and not v59.isOffSale
					local v62 = v59.hasResellers == true

					if v61 or v62 then
						t9[collectibleItemId] = true
						table.insert(t8, collectibleItemId)
					end
				end
			end
		end

		for _, v64 in t2.responseIds do
			local v65 = v27[v64]

			if v65 and v65.collectibleItemId then
				local collectibleItemId = v65.collectibleItemId

				if not t9[collectibleItemId] and v65.hasResellers == true then
					t9[collectibleItemId] = true
					table.insert(t8, collectibleItemId)
				end
			end
		end

		if #t8 == 0 then
			return
		end

		CollectibleProductIdStore.fetchAndCache(myRoduxNetworkingImpl, t8):catch(function(p8) -- line: 213
			warn("[useInspectAvatarData] Failed to fetch collectible product IDs:", (tostring(p8)))
		end)
	end, {
		v27,
		t3,
		t2.responseIds
	})

	return {
		catalogDetails = v27,
		isCatalogLoading = v28,
		ownershipCache = v31,
		collectibleCache = v30
	}
end

return function(t10: {[any]: any}) --[[ useInspectAvatarData ]] -- line: 229
	-- upvalues: useLocalUserId (copy), useLookApiData (copy), useCatalogEnrichment (copy), React (copy), InspectAvatarUtils (copy)
	local v33 = useLocalUserId()
	local v34 = useLookApiData(t10)
	local v35 = useCatalogEnrichment(v34, t10)
	local v36 = React.useMemo(function() -- line: 235
		-- upvalues: t10 (copy), InspectAvatarUtils (copy), v34 (copy), v35 (copy)
		if #t10 == 0 then
			return {}
		end

		local t11 = {}

		for _, v69 in t10 do
			t11[tostring(v69.assetId)] = true
		end

		local v70 = InspectAvatarUtils.collectBundleComponentIds(v34.responseIds, v34.cache)
		local t12 = {}
		local t13 = {}

		for _, v74 in v34.responseIds do
			local v75 = v34.cache[v74]

			if v75 then
				t13[v74] = true

				if v75.assetsInBundle or not v70[v74] then
					local v76 = v35.catalogDetails[v74]

					if v76 then
						local v77 = nil

						if v76.collectibleItemId then
							local v78 = v35.collectibleCache[v76.collectibleItemId]

							v77 = if not v78 then nil else v78.resaleProductId
						end

						table.insert(t12, InspectAvatarUtils.buildItemData(v76, v75, t11, nil, nil, v77))
					end
				end
			end
		end

		for _, v80 in t10 do
			local str = tostring(v80.assetId)

			if not t13[str] and not v70[str] then
				local v82 = v35.catalogDetails[str]

				if v82 then
					local productId = nil
					local resaleProductId = nil

					if v82.collectibleItemId then
						local v85 = v35.collectibleCache[v82.collectibleItemId]

						if v85 then
							productId = v85.productId
							resaleProductId = v85.resaleProductId
						end
					end

					local v86 = v35.ownershipCache[str]

					table.insert(t12, InspectAvatarUtils.buildItemData(v82, nil, t11, productId, v86, resaleProductId))
				end
			end
		end

		return InspectAvatarUtils.sortDisplayItems(t12)
	end, {
		v34.responseIds,
		v34.cache,
		t10,
		v35.catalogDetails,
		v35.collectibleCache,
		v35.ownershipCache
	})
	local v37 = React.useMemo(function() -- line: 316
		-- upvalues: v36 (copy), InspectAvatarUtils (copy)
		local t14 = {}
		local t15 = {}

		for _, v90 in v36 do
			if v90.isOwned then
				if #v90.bundleAssetIds > 0 then
					for _, v92 in v90.bundleAssetIds do
						if not t15[v92] then
							t15[v92] = true
							table.insert(t14, v92)
						end
					end
				else
					local num = tonumber(v90.id)
					local v94 = if not v90.itemSubType then nil else tonumber(v90.itemSubType)

					if num and ((not v94 or InspectAvatarUtils.isWearableAssetType(v94)) and not t15[num]) then
						t15[num] = true
						table.insert(t14, num)
					end
				end
			end
		end

		return t14
	end, { v36 })

	return {
		displayItems = v36,
		ownedAssetIds = v37,
		localUserId = v33,
		isLoading = v34.isLoading or v35.isCatalogLoading
	}
end
