local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local AvatarExperienceCatalogParent = AvatarExperienceCatalog.Parent
local React = require(AvatarExperienceCatalogParent.React)
local tutils = require(AvatarExperienceCatalogParent.tutils)
local mutedError = require(AvatarExperienceCatalogParent.Loggers).mutedError

require(AvatarExperienceCatalogParent.Http)

local RoactUtils = require(AvatarExperienceCatalogParent.RoactUtils)
local SignalsReact = require(AvatarExperienceCatalogParent.SignalsReact)
local AvatarExperienceNavigation = require(AvatarExperienceCatalogParent.AvatarExperienceNavigation)
local AvatarExperienceCommon = require(AvatarExperienceCatalogParent.AvatarExperienceCommon)
local ToastRodux = require(AvatarExperienceCatalogParent.ToastRodux)
local Cryo = require(AvatarExperienceCatalogParent.Cryo)

require(AvatarExperienceCatalog.Components.Checkout.CheckoutPage)

local PurchaseItemsSuccessThunk = require(AvatarExperienceCatalog.State.Thunks.PurchaseItemsSuccessThunk)
local SaveAsAvatarThunk = require(AvatarExperienceCatalog.State.Thunks.SaveAsAvatarThunk)
local SaveAsMakeupLookThunk = require(AvatarExperienceCatalog.State.Thunks.SaveAsMakeupLookThunk)
local SetCurrentToastMessage = ToastRodux.Actions.SetCurrentToastMessage
local SetSelectedTimedOption = require(AvatarExperienceCatalog.State.Actions.SetSelectedTimedOption)
local Constants = AvatarExperienceCommon.Constants

require(AvatarExperienceCatalog.Requests.PurchaseItems.PurchaseItemsTypes)

local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local ToastType = ToastRodux.Enums.ToastType
local AvatarScreenProperties = AvatarExperienceNavigation.AvatarRoute.AvatarScreenProperties
local PurchaseItems = require(AvatarExperienceCatalog.Requests.PurchaseItems)
local avatarLastEquippedStateStore = AvatarExperienceCommon.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local mapPurchaseItemsResponse = require(AvatarExperienceCatalog.Requests.PurchaseItems.mapPurchaseItemsResponse)
local getEquippableAssetsFromTryOnItems = require(AvatarExperienceCatalog.Utils.TryOns.getEquippableAssetsFromTryOnItems)
local getTryOnItemsContainsOnlyMakeupTypes = require(AvatarExperienceCatalog.Utils.TryOns.getTryOnItemsContainsOnlyMakeupTypes)
local getTryOnItemReducerKey = AvatarExperienceCommon.Utils.getTryOnItemReducerKey

require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)

local getIsInsufficientRobuxError = require(AvatarExperienceCatalog.Requests.PurchaseItems.getIsInsufficientRobuxError)
local useAXCatalogStoreContext = require(AvatarExperienceCatalog.Context.useAXCatalogStoreContext)
local useSignalState = SignalsReact.useSignalState
local useNetworking = AvatarExperienceCommon.Hooks.useNetworking
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useAppPolicy = require(AvatarExperienceCatalogParent.UniversalAppPolicy).useAppPolicy
local useNavigation = require(AvatarExperienceCatalogParent.Navigation).useNavigation
local useNavigationFocus = require(AvatarExperienceCatalogParent.Navigation).useNavigationFocus
local useLocalization = require(AvatarExperienceCatalogParent.Localization).Hooks.useLocalization
local LocalizationRoactContext = require(AvatarExperienceCatalogParent.Localization).LocalizationRoactContext
local AvatarExperienceAnalytics = require(AvatarExperienceCatalogParent.AvatarExperienceAnalytics)
local sendUnifiedEventForDeferredAction = AvatarExperienceAnalytics.sendUnifiedEventForDeferredAction
local sendUnifiedEventsForMultiItemShopping = AvatarExperienceAnalytics.sendUnifiedEventsForMultiItemShopping
local getUnifiedEventsForMIS = AvatarExperienceAnalytics.Utils.getUnifiedEventsForMIS
local UnifiedEventLogEnums = AvatarExperienceAnalytics.UnifiedEventLogEnums
local CartIdService = AvatarExperienceAnalytics.Lib.CartIdService
local AvatarExperienceFlags = require(AvatarExperienceCatalogParent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlags.FFlagAXDurablesForMIS
local FFlagAXBlackbirdRoot = AvatarExperienceFlags.FFlagAXBlackbirdRoot
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlags.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlags.FFlagAXCatalogMakeupSupport
local FFlagAXFixAvatarLooksSaveWithMakeupItems = AvatarExperienceFlags.FFlagAXFixAvatarLooksSaveWithMakeupItems
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlags.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlags.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXMISSaveWearFix = AvatarExperienceFlags.FFlagAXMISSaveWearFix

local function selectTryOnLookId(p1) -- line: 73
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end

local u55 = nil

if FFlagAXCatalogMakeupSupport then
	function u55(p2) -- line: 79
		return p2.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId
	end
end

local u56 = nil
local u57 = nil

if FFlagAXMISEnableMultiShoppingUnifiedEvents then
	function u56(p3) -- line: 86
		return p3.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end
	function u57(p4) -- line: 90
		return p4.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
	end
end

local function selectAvatarSceneLooks(p5) -- line: 95
	return p5.AvatarExperience.AvatarScene.Looks
end
local function selectTryOnItems(p6) -- line: 99
	return p6.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end
local function selectTryOnBodyColor3s(p7) -- line: 103
	return p7.AvatarExperience.AvatarScene.OutfitTryOn.BodyColor3s
end
local function selectTryOnBodyScales(p8) -- line: 107
	return p8.AvatarExperience.AvatarScene.OutfitTryOn.Scale
end
local function selectTryOnBodyPartColorRangeIds(p9) -- line: 111
	return p9.AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds
end
local function selectLocalUserId(p10) -- line: 127
	return p10.LocalUserId
end
local function selectShouldTryOnWithoutEquippedItems(p11) -- line: 131
	return p11.AvatarExperience.AvatarScene.OutfitTryOn.ShouldTryOnWithoutEquippedItems
end
local function selectUserRobux(p12) -- line: 135
	local LocalUserId = p12.LocalUserId

	if not LocalUserId or not p12.UserRobux then
		return nil
	end

	return p12.UserRobux[LocalUserId]
end
local function selectItemInfoForTryOnItems(p13) -- line: 147
	-- upvalues: Constants (copy), FFlagAXDurablesForMIS (copy)
	local TryOnItems = p13.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local v85 = p13.AvatarExperience.Common.AssetInfos or {}
	local v86 = p13.AvatarExperience.Common.BundleInfos or {}
	local v87 = p13.AvatarExperience.Common.Collectibles or {}
	local t1 = {}

	for _, v90 in TryOnItems do
		if v90.itemId == Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
			table.insert(t1, {
				itemId = v90.itemId,
				itemType = v90.itemType,
				itemData = v90.itemData,
				collectibleItemId = v90.itemId,
				ordering = v90.itemRecency
			})
		else
			local v91 = if v90.itemType ~= Enum.AvatarItemType.Asset.Name then v86[v90.itemId] else v85[v90.itemId]
			local v92 = if not v91 then nil else v91.collectibleItemId
			local v93 = if not v92 or not v87.CollectiblesItemInfo then nil else v87.CollectiblesItemInfo[v92]

			if v91 and v92 and v93 then
				local v94 = if not v87.CollectiblesResellableInstances then nil else v87.CollectiblesResellableInstances[v92]

				table.insert(t1, {
					itemId = v90.itemId,
					itemType = v90.itemType,
					itemData = v91,
					collectibleItemId = v92,
					ordering = v90.itemRecency,
					collectibleItemInfo = v93,
					resellableInstances = v94,
					selectedTimedOptionIndex = if not FFlagAXDurablesForMIS then nil else v90.selectedTimedOptionIndex
				})
			end
		end
	end

	return t1
end

return function(t2: {[any]: any}) --[[ useCheckoutPageViewModel ]] -- line: 220
	-- upvalues: useAXCatalogStoreContext (copy), useNavigation (copy), useAvatarRoute (copy), useNetworking (copy), useDispatch (copy), useSignalState (copy), React (copy), useSelector (copy), selectTryOnItems (copy), tutils (copy), selectTryOnBodyColor3s (copy), selectTryOnBodyScales (copy), selectTryOnBodyPartColorRangeIds (copy), selectTryOnLookId (copy), FFlagAXCatalogMakeupSupport (copy), u55 (ref), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), u56 (ref), u57 (ref), selectAvatarSceneLooks (copy), selectItemInfoForTryOnItems (copy), selectShouldTryOnWithoutEquippedItems (copy), selectLocalUserId (copy), selectUserRobux (copy), useLocalization (copy), LocalizationRoactContext (copy), useAppPolicy (copy), FFlagAXEnableExpiredUserLookCheckout (copy), useNavigationFocus (copy), AvatarScreen (copy), Cryo (copy), Constants (copy), UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), CartIdService (copy), FFlagAXDurablesForMIS (copy), SetSelectedTimedOption (copy), ToastType (copy), SetCurrentToastMessage (copy), getTryOnItemsContainsOnlyMakeupTypes (copy), FFlagAXMISSaveWearFix (copy), SaveAsMakeupLookThunk (copy), SaveAsAvatarThunk (copy), getTryOnItemReducerKey (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), getEquippableAssetsFromTryOnItems (copy), FFlagAXFixAvatarLooksSaveWithMakeupItems (copy), PurchaseItemsSuccessThunk (copy), AvatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), mutedError (copy), PurchaseItems (copy), mapPurchaseItemsResponse (copy), getIsInsufficientRobuxError (copy), FFlagAXBlackbirdRoot (copy)
	local shoppingCartStore = useAXCatalogStoreContext().shoppingCartStore
	local v97 = useNavigation()
	local v98 = useAvatarRoute()
	local v99 = useNetworking()
	local v100 = useDispatch()
	local v101 = useSignalState(shoppingCartStore.getItems)
	local v102 = useSignalState(shoppingCartStore.getCanPurchase)
	local v103 = useSignalState(shoppingCartStore.getPurchasableItemsTotalPriceInRobux)
	local v104 = useSignalState(shoppingCartStore.getPurchasableItemsTotalOriginalPriceInRobux)
	local v105 = useSignalState(shoppingCartStore.getErroredItemCount)
	local v106, v107 = React.useState(true)
	local v108, v109 = React.useState(false)
	local v110, v111 = React.useState(false)
	local v112 = useSelector(selectTryOnItems, tutils.deepEqual)
	local v113 = useSelector(selectTryOnBodyColor3s, tutils.deepEqual)
	local v114 = useSelector(selectTryOnBodyScales, tutils.deepEqual)
	local v115 = useSelector(selectTryOnBodyPartColorRangeIds, tutils.deepEqual)
	local v116 = useSelector(selectTryOnLookId)
	local v117 = if not FFlagAXCatalogMakeupSupport then nil else useSelector(u55)
	local v118 = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else useSelector(u56)
	local v119 = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else useSelector(u57)
	local v120 = useSelector(selectAvatarSceneLooks, tutils.deepEqual)
	local v121 = useSelector(selectItemInfoForTryOnItems, tutils.deepEqual)
	local v122 = useSelector(selectShouldTryOnWithoutEquippedItems)
	local v123 = useSelector(selectLocalUserId)
	local v124 = useSelector(selectUserRobux)
	local v125 = useLocalization({
		purchaseFailedTitle = "Feature.Catalog.Title.Checkout.PurchaseFailedSingular",
		purchaseFailedTitlePlural = {
			"Feature.Catalog.Title.Checkout.PurchaseFailedPlural",
			count = #v101
		},
		purchaseFailedUnknownError = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseFailedButton = "Feature.Avatar.Action.GotIt",
		characterSavedHeading = "Feature.Avatar.Heading.LooksAvatarSaved",
		characterSavedMsg = "Feature.Avatar.Message.LooksAvatarSaved"
	})
	local v126 = React.useContext(LocalizationRoactContext)
	local v127 = useAppPolicy(function(p14) -- line: 270
		return p14.getDisableResellingCollectiblesForCompliance()
	end)
	local v128 = React.useRef(false)
	local u129 = nil

	if FFlagAXEnableExpiredUserLookCheckout then
		u129 = React.useRef(false)
	end

	local v130 = useNavigationFocus()

	React.useEffect(function() -- line: 290
		-- upvalues: t2 (copy), v124 (copy)
		if t2.fetchUserRobux and not v124 then
			t2.fetchUserRobux()
		end
	end, {})
	React.useEffect(function() -- line: 298
		-- upvalues: v130 (copy), v128 (copy), t2 (copy)
		if v130 and (v128.current and t2.fetchUserRobux) then
			t2.fetchUserRobux()
			v128.current = false
		end
	end, {
		v130,
		t2.fetchUserRobux
	})
	React.useLayoutEffect(function() -- line: 307
		-- upvalues: shoppingCartStore (copy), v121 (copy), v127 (copy), FFlagAXEnableExpiredUserLookCheckout (copy), v98 (copy), AvatarScreen (copy), v97 (copy), u129 (ref)
		shoppingCartStore.syncFromTryOns(v121, v127)

		local v147 = if not FFlagAXEnableExpiredUserLookCheckout then nil else v98 and (v98.current and v98.current.name)

		if FFlagAXEnableExpiredUserLookCheckout then
			if v121 and #v121 <= 0 then
				if v147 == AvatarScreen.Checkout then
					v97.goBack()

					return
				end

				if v147 == AvatarScreen.ExpiredUserLookCheckout and not u129.current then
					v97.pop(2)

					return
				end
			end
		elseif v121 and #v121 <= 0 then
			v97.goBack()
		end
	end, {
		shoppingCartStore,
		v121,
		v127,
		v97,
		if not FFlagAXEnableExpiredUserLookCheckout then nil else v98
	})

	local v131 = React.useMemo(function() -- line: 345
		-- upvalues: v101 (copy), Cryo (copy), Constants (copy), t2 (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), CartIdService (copy), FFlagAXDurablesForMIS (copy), shoppingCartStore (copy), v100 (copy), SetSelectedTimedOption (copy)
		local t3 = {}

		for _, v150 in v101 do
			table.insert(t3, Cryo.Dictionary.join(v150, {
				onActivated = function() --[[ onActivated ]] -- line: 351
					-- upvalues: v150 (copy), Constants (copy), t2 (copy)
					if v150.itemId == Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
						return
					end

					if t2.onOpenItemDetailsPage then
						t2.onOpenItemDetailsPage(v150.itemId, v150.itemType, v150.itemSubType)
					end
				end,
				onRemove = function() --[[ onRemove ]] -- line: 360
					-- upvalues: t2 (copy), v150 (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), CartIdService (copy)
					if t2.onRemoveItem then
						t2.onRemoveItem(v150.itemId, v150.itemType)

						if FFlagAXMISEnableMultiShoppingUnifiedEvents then
							local ASSET = nil

							if v150.itemType == "Asset" then
								ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
							elseif v150.itemType == "Bundle" then
								ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
							end

							sendUnifiedEventForDeferredAction({
								action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED,
								cartId = CartIdService.getCartId(),
								itemId = v150.itemId,
								itemType = ASSET,
								assetType = if v150.itemType ~= "Asset" then nil else v150.itemSubType,
								bundleType = if v150.itemType ~= "Asset" then v150.itemSubType else nil
							})
						end
					end
				end,
				onTimedOptionPriceChanged = if not FFlagAXDurablesForMIS then nil else function(n1: number, n2: number?) -- line: 384
					-- upvalues: shoppingCartStore (copy), v150 (copy), Cryo (copy), v100 (copy), SetSelectedTimedOption (copy)
					if shoppingCartStore.updateItemPrice then
						if v150.timedOptions then
							local v189 = Cryo.List.findWhere(v150.timedOptions, function(p15) -- line: 389
								-- upvalues: n2 (copy)
								return p15.days == n2
							end) or #v150.timedOptions

							v100(SetSelectedTimedOption({
								itemId = v150.itemId,
								itemType = v150.itemType,
								selectedTimedOptionIndex = v189
							}))
						end

						shoppingCartStore.updateItemPrice(v150.itemId, v150.itemType, n1, n2)
					end
				end
			}))
		end

		return t3
	end, {
		v101,
		t2.onOpenItemDetailsPage,
		t2.onRemoveItem,
		if not FFlagAXDurablesForMIS then nil else shoppingCartStore,
		if not FFlagAXDurablesForMIS then nil else v100
	})
	local v132 = React.useMemo(function() -- line: 424
		-- upvalues: v98 (copy), FFlagAXEnableExpiredUserLookCheckout (copy), AvatarScreen (copy)
		local v151 = v98 and (v98.current and v98.current.name)

		if FFlagAXEnableExpiredUserLookCheckout then
			return v151 == AvatarScreen.ExpiredUserLookCheckout or v151 == AvatarScreen.Checkout
		end

		return v151 == AvatarScreen.Checkout
	end, { v98 })
	local v133 = if not FFlagAXEnableExpiredUserLookCheckout then nil else React.useMemo(function() -- line: 434
		-- upvalues: v98 (copy), AvatarScreen (copy)
		return (v98 and (v98.current and v98.current.name)) == AvatarScreen.ExpiredUserLookCheckout
	end, { v98 })
	local v134 = React.useCallback(function(s1: string, s2: string, _: string) -- line: 440
		-- upvalues: t2 (copy)
		if t2.onRemoveItem then
			t2.onRemoveItem(s1, s2)
		end
	end, {
		t2.onRemoveItem,
		v112,
		v97
	})
	local v135 = React.useCallback(function(s4: string, s5: string, s6: string) -- line: 446
		-- upvalues: t2 (copy)
		if t2.onOpenItemDetailsPage then
			t2.onOpenItemDetailsPage(s4, s5, s6)
		end
	end, { t2.onOpenItemDetailsPage })
	local v136 = React.useCallback(function() -- line: 452
		-- upvalues: v97 (copy), AvatarScreen (copy)
		v97.navigate(AvatarScreen.CartUnavailableItemsPrompt)
	end, { v97 })
	local v137 = React.useCallback(function() -- line: 456
		-- upvalues: v107 (copy), v106 (copy)
		v107(not v106)
	end, { v106 })
	local v138 = React.useCallback(function() -- line: 460
		-- upvalues: v109 (copy), v108 (copy)
		v109(not v108)
	end, { v108 })
	local v139 = React.useCallback(function() -- line: 464
		-- upvalues: v101 (copy), Constants (copy), FFlagAXDurablesForMIS (copy)
		local t4 = {}

		for _, v160 in v101 do
			if v160.itemId ~= Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
				table.insert(t4, {
					agreedPriceRobux = v160.priceInRobux,
					collectibleProductId = v160.collectibleProductId,
					rentalOption = if not FFlagAXDurablesForMIS or (not v160.selectedTimedOptionDays or not (v160.selectedTimedOptionDays > 0)) then nil else {
						durationDays = v160.selectedTimedOptionDays
					}
				})
			end
		end

		return t4
	end, { v101 })
	local v140 = React.useCallback(function() -- line: 487
		-- upvalues: v125 (copy), ToastType (copy), v100 (copy), SetCurrentToastMessage (copy)
		local t5 = {
			isLocalized = true,
			toastMessage = v125.characterSavedHeading,
			toastSubMessage = v125.characterSavedMsg,
			toastType = ToastType.SuccessConfirmation
		}

		v100(SetCurrentToastMessage(t5))
	end, {
		v100,
		v125
	})
	local v141 = React.useCallback(function(p16) -- line: 497
		-- upvalues: FFlagAXCatalogMakeupSupport (copy), getTryOnItemsContainsOnlyMakeupTypes (copy), v120 (copy), v117 (copy), v116 (copy), FFlagAXMISSaveWearFix (copy), v100 (copy), SaveAsMakeupLookThunk (copy), v99 (copy), t2 (copy), SaveAsAvatarThunk (copy), v140 (copy)
		if FFlagAXCatalogMakeupSupport then
			local v163 = getTryOnItemsContainsOnlyMakeupTypes(p16)
			local v164 = not v163 and "Avatar" or "Makeup"

			if v120 and v120[v117] and v120[v117].name then
				v164 = v120[v117].name
			end

			if v120 and v120[v116] and v120[v116].name then
				v164 = v120[v116].name
			end

			if v163 then
				if FFlagAXMISSaveWearFix then
					v100(SaveAsMakeupLookThunk(v99, v164, p16, nil, t2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn))

					return
				end

				v100(SaveAsMakeupLookThunk(v99, v164, p16))

				return
			end

			v100(SaveAsAvatarThunk(v164, t2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p16, v140))

			return
		end

		local s7 = "Avatar"

		if v120 and v120[v116] and v120[v116].name then
			s7 = v120[v116].name
		end

		v100(SaveAsAvatarThunk(s7, t2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn, p16, v140))
	end, {
		v100,
		v140,
		t2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn,
		v120,
		v116,
		if not FFlagAXCatalogMakeupSupport then nil else v99,
		if not FFlagAXCatalogMakeupSupport then nil else v117
	})
	local v142 = React.useCallback(function(p17) -- line: 562
		-- upvalues: shoppingCartStore (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), v120 (copy), v116 (copy), v117 (copy), t2 (copy), v100 (copy), SetCurrentToastMessage (copy), v126 (copy), ToastType (copy), getTryOnItemReducerKey (copy), v112 (copy), v108 (copy), v141 (copy), FFlagAXMISSaveWearFix (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), avatarLastEquippedStateStore (copy), v106 (copy), getEquippableAssetsFromTryOnItems (copy), FFlagAXFixAvatarLooksSaveWithMakeupItems (copy), PurchaseItemsSuccessThunk (copy), v122 (copy), v113 (copy), v114 (copy), v115 (copy), v98 (copy), FFlagAXEnableExpiredUserLookCheckout (copy), AvatarScreen (copy), u129 (ref), v97 (copy)
		local v167 = shoppingCartStore.updateCartFromPurchaseResponse(p17)
		local boughtItems = v167.boughtItems
		local equippableItems = v167.equippableItems
		local needDataRefeshItems = v167.needDataRefeshItems
		local v171 = nil
		local v172 = nil

		if FFlagAXMISEnableMultiShoppingUnifiedEvents then
			v171 = v120[v116]

			if v171 ~= nil then
				v171 = table.clone(v171)
				v171.itemId = v116
			end

			v172 = v120[v117]

			if v172 ~= nil then
				v172 = table.clone(v172)
				v172.itemId = v117
			end
		end

		for _, v174 in needDataRefeshItems do
			if t2.fetchItemData then
				t2.fetchItemData(v174.itemId, v174.itemType)
			end
		end

		v100(SetCurrentToastMessage({
			toastMessage = v126:Format("Feature.Catalog.Title.Checkout.ItemsPurchased", {
				count = #boughtItems
			}),
			isLocalized = true,
			toastType = ToastType.InformationMessage
		}))

		local t6 = {}

		for _, v177 in equippableItems do
			local v178 = v112[getTryOnItemReducerKey(v177.itemId, v177.itemType)]

			if v178 then
				table.insert(t6, v178)
			end
		end

		if v108 then
			v141(t6)
		end

		if not FFlagAXMISSaveWearFix then
			for _, v180 in equippableItems do
				if t2.onRemoveItem then
					t2.onRemoveItem(v180.itemId, v180.itemType)
				end
			end
		end

		local t7 = {}

		if not FFlagAXMISSaveWearFix and FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
			avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
		end

		if v106 then
			t7 = getEquippableAssetsFromTryOnItems(t6)
		end

		local v182 = if not FFlagAXFixAvatarLooksSaveWithMakeupItems then nil else v117 ~= nil

		v100(PurchaseItemsSuccessThunk(boughtItems, t7, v122, v113, v114, v115, t6, t2.getBundleOutfitInfoFromProvidedTryOns, if not FFlagAXFixAvatarLooksSaveWithMakeupItems then nil else v182, if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v171, if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v172, if not FFlagAXMISSaveWearFix then nil else t2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn))

		if FFlagAXMISSaveWearFix then
			for _, v184 in equippableItems do
				if t2.onRemoveItem then
					t2.onRemoveItem(v184.itemId, v184.itemType)
				end
			end

			if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
				avatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
			end
		end

		if t2.fetchOutfits then
			local v185 = v98 and (v98.current and v98.current.name)

			if FFlagAXEnableExpiredUserLookCheckout and v185 == AvatarScreen.ExpiredUserLookCheckout then
				u129.current = true
				t2.fetchOutfits(function() -- line: 681
					-- upvalues: u129 (ref), v97 (copy)
					u129.current = false
					v97.pop(2)
				end)

				return
			end

			t2.fetchOutfits()
		end
	end, {
		v100,
		shoppingCartStore.updateCartFromPurchaseResponse,
		v106,
		v108,
		v113,
		v114,
		v115,
		v112,
		v122,
		v141,
		t2.onRemoveItem,
		t2.fetchItemData,
		t2.fetchOutfits,
		t2.getBundleOutfitInfoFromProvidedTryOns,
		if not FFlagAXEnableExpiredUserLookCheckout then nil else v98,
		if not FFlagAXEnableExpiredUserLookCheckout then nil else v97,
		if not FFlagAXFixAvatarLooksSaveWithMakeupItems then nil else v117,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v116,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v120,
		if not FFlagAXMISSaveWearFix then nil else t2.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn
	})
	local v143 = React.useCallback(function() -- line: 718
		-- upvalues: v97 (copy), AvatarScreen (copy), v128 (copy)
		v97.navigate(AvatarScreen.InsufficientRobuxPrompt)
		v128.current = true
	end, { v97 })
	local v144 = React.useCallback(function() -- line: 725
		-- upvalues: v111 (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), v120 (copy), v116 (copy), v117 (copy), v118 (copy), v119 (copy), v98 (copy), AvatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), v101 (copy), v112 (copy), UnifiedEventLogEnums (copy), mutedError (copy), PurchaseItems (copy), v99 (copy), v123 (copy), v139 (copy), mapPurchaseItemsResponse (copy), v142 (copy), t2 (copy), getIsInsufficientRobuxError (copy), v143 (copy), v97 (copy), AvatarScreen (copy), v125 (copy)
		v111(true)

		if FFlagAXMISEnableMultiShoppingUnifiedEvents and not pcall(function() -- line: 729
			-- upvalues: v120 (copy), v116 (copy), v117 (copy), v118 (copy), v119 (copy), v98 (copy), AvatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), v101 (copy), v112 (copy), UnifiedEventLogEnums (copy)
			local v190 = v120[v116]

			if v190 ~= nil then
				v190 = table.clone(v190)
				v190.itemId = v116
			end

			local v191 = v120[v117]

			if v191 ~= nil then
				v191 = table.clone(v191)
				v191.itemId = v117
			end

			if v190 then
				v190.isOrganicLook = v118 == nil
			end

			if v191 then
				v191.isOrganicLook = v119 == nil
			end

			local v192 = AvatarScreenProperties[v98 and (v98.current and v98.current.name)]
			local v193 = if not v192 or not v192.analyticsData then nil else v192.analyticsData.unifiedLoggingSurface

			sendUnifiedEventsForMultiItemShopping(getUnifiedEventsForMIS(v101, v112, v190, v191, UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT), v193)
		end) then
			mutedError("Failed to send unified events for multi-item shopping purchase attempt")
		end

		PurchaseItems({
			networkImpl = v99,
			userId = v123,
			lookId = v116,
			makeupLookId = if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v117,
			lineItems = v139()
		}):andThen(function(p18) -- line: 783
			-- upvalues: mapPurchaseItemsResponse (copy), v142 (copy), t2 (copy)
			if p18.isJSONValid and p18.responseCode == 200 then
				local responseBody = p18.responseBody
				local v196 = mapPurchaseItemsResponse(responseBody)

				v142(v196)

				if t2.fetchUserRobux then
					t2.fetchUserRobux()
				end
			end
		end):catch(function(p19) -- line: 794
			-- upvalues: getIsInsufficientRobuxError (copy), v143 (copy), v97 (copy), AvatarScreen (copy), v101 (copy), v125 (copy)
			if getIsInsufficientRobuxError(p19) then
				v143()

				return
			end

			v97.navigate(AvatarScreen.GenericPrompt, {
				titleText = if #v101 ~= 1 then v125.purchaseFailedTitlePlural else v125.purchaseFailedTitle,
				bodyText = v125.purchaseFailedUnknownError,
				buttonText = v125.purchaseFailedButton
			})
		end):finally(function() -- line: 807
			-- upvalues: v111 (copy)
			v111(false)
		end)
	end, {
		v139,
		v123,
		v99,
		v143,
		t2.fetchUserRobux,
		v142,
		v101,
		v125,
		v97,
		v116,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v117,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v120,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v112,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v118,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v119,
		if not FFlagAXMISEnableMultiShoppingUnifiedEvents then nil else v98
	})
	local v145 = React.useCallback(function() -- line: 831
		-- upvalues: v124 (copy), v103 (copy), v143 (copy), v144 (copy)
		if v124 and v124 < v103 then
			v143()

			return
		end

		v144()
	end, {
		v124,
		v103,
		v144,
		v143
	})

	return {
		canPurchase = v102,
		cartItems = v131,
		erroredItemCount = v105,
		isPurchasing = v110,
		isVisible = v132,
		hideBuyOptions = if not FFlagAXEnableExpiredUserLookCheckout then nil else v133,
		isWearAfterPurchaseChecked = v106,
		isAddToMyAvatarsChecked = v108,
		onCheckoutButtonActivated = v145,
		onOpenItemDetailsPage = v135,
		onRemoveItem = v134,
		onUnavailableButtonActivated = v136,
		onWearAfterPurchaseToggle = v137,
		onAddToMyAvatarsToggle = v138,
		purchasableItemsTotalPriceInRobux = v103,
		purchasableItemsTotalOriginalPriceInRobux = if not FFlagAXBlackbirdRoot then nil else v104
	}
end
