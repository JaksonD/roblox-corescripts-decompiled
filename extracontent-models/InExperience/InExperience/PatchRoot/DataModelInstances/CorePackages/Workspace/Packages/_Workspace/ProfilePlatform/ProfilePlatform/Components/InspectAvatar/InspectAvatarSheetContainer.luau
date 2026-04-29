local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Dash = require(ProfilePlatformParent.Dash)
local UserLib = require(ProfilePlatformParent.UserLib)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local RobloxAppHooks = require(ProfilePlatformParent.RobloxAppHooks)
local Constants = UserLib.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = UserLib.Utils.getRbxthumbWithTypeSizeAndOptions
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local Constants2 = require(ProfilePlatform.Common.Constants)
local Enums = require(ProfilePlatform.Common.Enums)
local useProfileJsonComponent = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContext = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local useMarketplaceAnalyticsContext = require(ProfilePlatform.Hooks.useMarketplaceAnalyticsContext)
local EventNames = require(ProfilePlatform.Analytics.EventNames)
local useProfileCardWidth = require(ProfilePlatformParent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useProfileFormFactor = require(ProfilePlatform.Hooks.useProfileFormFactor)
local useInspectAvatarData = require(script.Parent.useInspectAvatarData)
local InspectAvatarUtils = require(script.Parent.InspectAvatarUtils)
local InspectAvatarSheet = require(script.Parent.InspectAvatarSheet)

require(ProfilePlatform.Common.Types)

local isItemPurchasable = InspectAvatarUtils.isItemPurchasable
local getPriceStatus = InspectAvatarUtils.getPriceStatus
local PriceStatusEnum = InspectAvatarUtils.PriceStatusEnum

return function(t1: {[any]: any}) --[[ InspectAvatarSheetContainer ]] -- line: 44
	-- upvalues: useProfileWrapperContext (copy), useProfileAnalyticsContext (copy), useMarketplaceAnalyticsContext (copy), RobloxAppHooks (copy), useProfileFormFactor (copy), Enums (copy), useSelector (copy), useProfileCardWidth (copy), useProfileJsonComponent (copy), getRbxthumbWithTypeSizeAndOptions (copy), Constants (copy), Constants2 (copy), useInspectAvatarData (copy), React (copy), isItemPurchasable (copy), Dash (copy), InspectAvatarUtils (copy), getPriceStatus (copy), PriceStatusEnum (copy), EventNames (copy), InspectAvatarSheet (copy)
	local v27 = useProfileWrapperContext()
	local v28 = useProfileAnalyticsContext()
	local v29 = useMarketplaceAnalyticsContext()
	local v30 = RobloxAppHooks.useLocalRobuxBalance()
	local v31 = useProfileFormFactor().formFactor == Enums.ProfileFormFactor.Wide
	local profileId = v27.profileId
	local v33 = useSelector(function(p1) -- line: 54
		return p1.TopBar.statusBarHeight
	end)
	local v34 = useProfileCardWidth()
	local v35 = if not v31 then math.floor(v34 * 0.75) else 400
	local v36 = useProfileJsonComponent(Enums.Components.UserProfileHeader)
	local v37 = v36.names and v36.names.username or ""
	local v38 = getRbxthumbWithTypeSizeAndOptions(profileId, Constants.RbxthumbTypes.Avatar, Constants2.AVATAR_THUMBNAIL_SIZE)
	local v39 = useProfileJsonComponent(Enums.Components.CurrentlyWearing).assets or {}
	local v40 = useInspectAvatarData(v39)
	local displayItems = v40.displayItems
	local v42, v43 = React.useState({})
	local v44 = React.useRef({})

	React.useEffect(function() -- line: 82
		-- upvalues: displayItems (copy), isItemPurchasable (copy), v44 (copy), v43 (copy), Dash (copy)
		if #displayItems == 0 then
			return
		end

		local t2 = {}
		local v55 = false

		for _, v57 in displayItems do
			local id = v57.id

			if isItemPurchasable(v57) and not v44.current[id] then
				v44.current[id] = true
				t2[id] = true
				v55 = true
			end
		end

		if not v55 then
			return
		end

		v43(function(p2) -- line: 99
			-- upvalues: Dash (copy), t2 (copy)
			return Dash.join(p2, t2)
		end)
	end, { displayItems })

	local v45 = React.useCallback(function(s1: string) -- line: 104
		-- upvalues: v43 (copy), Dash (copy)
		v43(function(p3) -- line: 105
			-- upvalues: Dash (copy), s1 (copy)
			return Dash.join(p3, {
				[s1] = not p3[s1]
			})
		end)
	end, {})
	local v46 = React.useMemo(function() -- line: 111
		-- upvalues: displayItems (copy), v42 (copy), isItemPurchasable (copy), InspectAvatarUtils (copy), getPriceStatus (copy), PriceStatusEnum (copy), Enums (copy)
		local t3 = {}
		local n1 = 0
		local n2 = 0
		local t4 = {}
		local t5 = {}
		local t6 = {}
		local t7 = {}

		for _, v68 in displayItems do
			if v68.id then
				local id = v68.id

				if v42[id] and isItemPurchasable(v68) then
					local v70 = InspectAvatarUtils.getEffectivePrice(v68)

					table.insert(t3, {
						collectibleProductId = if getPriceStatus(v68) ~= PriceStatusEnum.PurchaseFromResale or not v68.collectibleItemDetails then v68.collectibleProductId else v68.collectibleItemDetails.collectibleLowestAvailableResaleProductId or v68.collectibleProductId,
						agreedPriceRobux = v70
					})
					n1 += v70
					n2 += 1
					table.insert(t5, id)

					if v68.itemType == Enums.ItemTypes.Bundle then
						table.insert(t6, id)
					end

					if #v68.bundleAssetIds > 0 then
						for _, v72 in v68.bundleAssetIds do
							if not t7[v72] then
								t7[v72] = true
								table.insert(t4, v72)
							end
						end
					else
						local num = tonumber(v68.id)

						if num and not t7[num] then
							t7[num] = true
							table.insert(t4, num)
						end
					end
				end
			end
		end

		return {
			lineItems = t3,
			totalPrice = n1,
			count = n2,
			purchasedWearIds = t4,
			purchasedItemIds = t5,
			purchasedBundleIds = t6
		}
	end, {
		displayItems,
		v42
	})
	local v47 = React.useMemo(function() -- line: 168
		-- upvalues: displayItems (copy)
		local t8 = {}

		for _, v76 in displayItems do
			local num = tonumber(v76.id)
			local num2 = tonumber(v76.itemSubType)

			if num and num2 then
				t8[num] = num2
			end

			if v76.assetsInBundle then
				for _, v80 in v76.assetsInBundle do
					local num3 = tonumber(v80.id)
					local num4 = tonumber(v80.assetType)

					if num3 and num4 then
						t8[num3] = num4
					end
				end
			end
		end

		return t8
	end, { displayItems })
	local v48 = React.useCallback(function() -- line: 190
		-- upvalues: v46 (copy), v40 (copy), t1 (copy), Enums (copy), v47 (copy)
		if #v46.lineItems == 0 or not v40.localUserId then
			return
		end

		t1.navigation.navigate(Enums.Screens.PurchaseConfirmationModal, {
			totalPrice = v46.totalPrice,
			itemCount = v46.count,
			purchasableLineItems = v46.lineItems,
			userId = v40.localUserId,
			purchasedWearIds = v46.purchasedWearIds,
			ownedAssetIds = v40.ownedAssetIds,
			purchasedItemIds = v46.purchasedItemIds,
			purchasedBundleIds = v46.purchasedBundleIds,
			wearTypeMap = v47
		})
	end, {
		v46,
		v40.localUserId,
		v40.ownedAssetIds,
		t1.navigation,
		v47
	})
	local v49 = React.useCallback(function() -- line: 215
		-- upvalues: t1 (copy)
		t1.navigation.pop()
	end, { t1.navigation })
	local v50 = React.useCallback(function() -- line: 219
		-- upvalues: t1 (copy), v27 (copy)
		t1.navigation.pop()
		task.defer(function() -- line: 221
			-- upvalues: v27 (copy)
			v27.navigateTo.previousView(false)
		end)
	end, {
		t1.navigation,
		v27.navigateTo
	})
	local v51 = React.useCallback(function(s2: string, s3: string, n3: number?) -- line: 227
		-- upvalues: v27 (copy), v28 (copy), EventNames (copy), v29 (copy)
		v27.navigateTo.itemOrBundleDetails(s2, s3)
		v28.fireAnalyticsEvent(EventNames.CatalogItemOpened, {
			btnContext = "InspectAvatar",
			btnUnitId = tostring(s2),
			btnSortPosition = tostring(n3)
		})
		v27.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v29, s2, s3, "InspectAvatar", n3)
	end, {
		v27.navigateTo.itemOrBundleDetails,
		v27.externalAnalytics.catalogAnalytics,
		v28,
		v29
	})
	local v52 = v30 ~= nil and v30 < v46.totalPrice

	return React.createElement(InspectAvatarSheet, {
		displayItems = displayItems,
		selectedItems = v42,
		isLoading = v40.isLoading,
		username = v37,
		profileId = profileId,
		avatarThumbnail = v38,
		avatarViewportHeight = v35,
		cardWidth = v34,
		topOffset = if not v31 then v33 else 0,
		purchaseSummary = {
			totalPrice = v46.totalPrice,
			count = v46.count
		},
		hasInsufficientFunds = v52,
		onToggleItem = v45,
		onBuyAll = v48,
		onClose = v49,
		onDismiss = v50,
		openItemDetails = v51
	})
end
