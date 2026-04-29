local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local AvatarExperienceCatalogParent = AvatarExperienceCatalog.Parent
local React = require(AvatarExperienceCatalogParent.React)
local Foundation = require(AvatarExperienceCatalogParent.Foundation)
local CatalogRowItemCard = require(AvatarExperienceCatalogParent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard
local ItemCardThumbnail = require(AvatarExperienceCatalogParent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local tutils = require(AvatarExperienceCatalogParent.tutils)
local useLocalization = require(AvatarExperienceCatalogParent.Localization).Hooks.useLocalization

require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)

local PurchaseItemsErrorStatusMap = require(AvatarExperienceCatalog.Enums.PurchaseItemsErrorStatusMap)
local Constants = require(AvatarExperienceCatalog.Constants)
local useCheckoutRowItemCardViewModel = require(script.Parent.useCheckoutRowItemCardViewModel)
local AvatarExperienceFlags = require(AvatarExperienceCatalogParent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlags.FFlagAXDurablesForMIS
local FFlagAXBlackbirdRoot = AvatarExperienceFlags.FFlagAXBlackbirdRoot
local WearTimeSelectedOptionInList = require(AvatarExperienceCatalogParent.AvatarExperienceTimedOptions).WearTimeSelectedOptionInList
local ASSET_TYPE_LOCALIZED = Constants.ASSET_TYPE_LOCALIZED
local BUNDLE_TYPE_LOCALIZED = Constants.BUNDLE_TYPE_LOCALIZED
local t1 = {
	[tostring(PurchaseItemsErrorStatusMap.SOLD_OUT)] = "Feature.Catalog.Label.Checkout.SoldOut",
	[tostring(PurchaseItemsErrorStatusMap.ALREADY_OWNED)] = "Feature.Catalog.Label.Owned",
	[tostring(PurchaseItemsErrorStatusMap.EXPERIENCE_LINK)] = "Feature.Catalog.Label.Checkout.InExperienceOnly",
	[tostring(PurchaseItemsErrorStatusMap.QUANTITY_LIMIT_EXCEEDED)] = "Feature.Catalog.Label.Checkout.LimitReached",
	[tostring(PurchaseItemsErrorStatusMap.NOT_AVAILABLE_FOR_PURCHASER)] = "Feature.Catalog.Label.Checkout.Unavailable",
	[tostring(PurchaseItemsErrorStatusMap.NOT_FOR_SALE)] = "Feature.Catalog.Label.Checkout.OffSale",
	[tostring(PurchaseItemsErrorStatusMap.PURCHASER_IS_SELLER)] = "Feature.Catalog.Label.Checkout.Unavailable",
	[tostring(PurchaseItemsErrorStatusMap.PURCHASE_PLACE_INVALID)] = "Feature.Catalog.Label.Checkout.InExperienceOnly",
	[tostring(PurchaseItemsErrorStatusMap.PRICE_MISMATCH)] = "Feature.Catalog.Label.Checkout.PriceChanged",
	Unvailable = "Feature.Catalog.Label.Checkout.Unavailable"
}

return React.memo(function(p1) --[[ CheckoutRowItemCard ]] -- line: 68
	-- upvalues: Foundation (copy), FFlagAXDurablesForMIS (copy), useCheckoutRowItemCardViewModel (copy), useLocalization (copy), ASSET_TYPE_LOCALIZED (copy), BUNDLE_TYPE_LOCALIZED (copy), t1 (copy), React (copy), FFlagAXBlackbirdRoot (copy), PurchaseItemsErrorStatusMap (copy), CatalogRowItemCard (copy), ItemCardThumbnail (copy), WearTimeSelectedOptionInList (copy)
	local v25 = Foundation.Hooks.useTokens()
	local v26 = p1.thumbnailSize or v25.Size.Size_2100
	local selectedTimedOptionPrice = nil
	local setSelectedTimedOptionPrice = nil

	if FFlagAXDurablesForMIS then
		local v29 = useCheckoutRowItemCardViewModel(p1)

		selectedTimedOptionPrice = v29.selectedTimedOptionPrice
		setSelectedTimedOptionPrice = v29.setSelectedTimedOptionPrice
	end

	local v30 = useLocalization(ASSET_TYPE_LOCALIZED)
	local v31 = useLocalization(BUNDLE_TYPE_LOCALIZED)
	local v32 = useLocalization(t1)
	local v33 = p1.itemType ~= Enum.AvatarItemType.Bundle.Name and "Asset" or "BundleThumbnail"
	local v34 = React.useMemo(function() -- line: 87
		-- upvalues: p1 (copy), ASSET_TYPE_LOCALIZED (copy), v30 (copy), BUNDLE_TYPE_LOCALIZED (copy), v31 (copy)
		local itemType = p1.itemType
		local itemSubType = p1.itemSubType

		if itemType == Enum.AvatarItemType.Asset.Name and ASSET_TYPE_LOCALIZED[tostring(itemSubType)] ~= nil then
			return v30[tostring(itemSubType)]
		end

		if itemType == Enum.AvatarItemType.Bundle.Name and BUNDLE_TYPE_LOCALIZED[tostring(itemSubType)] ~= nil then
			return v31[tostring(itemSubType)]
		end

		return ""
	end, {
		v30,
		v31,
		p1.itemType,
		p1.itemSubType
	})
	local v35 = React.useMemo(function() -- line: 100
		-- upvalues: p1 (copy), FFlagAXBlackbirdRoot (copy), PurchaseItemsErrorStatusMap (copy), v25 (copy), v32 (copy), t1 (copy)
		local t2 = {}

		if p1.status == nil then
			table.insert(t2, {
				type = "price",
				price = p1.priceInRobux
			})

			if FFlagAXBlackbirdRoot and p1.discountInformation then
				table.insert(t2, {
					type = "price",
					price = p1.discountInformation.originalPrice,
					strikethrough = true,
					isOriginalPrice = true
				})

				return t2
			end
		else
			if p1.status == PurchaseItemsErrorStatusMap.PRICE_MISMATCH then
				if p1.priceMismatchMetadata then
					table.insert(t2, {
						type = "price",
						price = p1.priceInRobux,
						colorStyle = v25.Color.System.Warning
					})
					table.insert(t2, {
						type = "price",
						price = p1.priceMismatchMetadata.oldPriceInRobux,
						strikethrough = true
					})

					return t2
				end

				table.insert(t2, {
					type = "text",
					text = v32[tostring(PurchaseItemsErrorStatusMap.PRICE_MISMATCH)]
				})

				return t2
			end

			if p1.status == PurchaseItemsErrorStatusMap.ALREADY_OWNED then
				table.insert(t2, {
					type = "text",
					text = v32[tostring(PurchaseItemsErrorStatusMap.ALREADY_OWNED)]
				})

				return t2
			end

			table.insert(t2, {
				type = "text",
				text = if not t1[tostring(p1.status)] then v32.Unvailable else v32[tostring(p1.status)],
				colorStyle = v25.Color.System.Warning
			})
		end

		return t2
	end, {
		p1.priceInRobux,
		p1.status,
		p1.priceMismatchMetadata,
		v32,
		v25,
		if not FFlagAXBlackbirdRoot then nil else p1.discountInformation
	})

	return React.createElement(Foundation.View, {
		tag = "auto-y row size-full-0 gap-small",
		LayoutOrder = p1.LayoutOrder,
		testId = `CheckoutRowItemCard-{ p1.itemId }`
	}, {
		RowItemCardContainer = React.createElement(Foundation.View, {
			tag = "auto-xy fill",
			LayoutOrder = 1
		}, {
			CatalogRowItemCard = React.createElement(CatalogRowItemCard, {
				title = p1.name,
				presentationSlot = React.createElement(ItemCardThumbnail, {
					url = `rbxthumb://type={ v33 }&id={ p1.itemId }&w=150&h=150`
				}),
				onActivated = p1.onActivated,
				creator = {
					name = p1.creatorName,
					verified = p1.creatorVerified
				},
				priceLineContent = v35,
				itemType = p1.itemRestriction,
				itemSubType = v34,
				timedOptions = if not FFlagAXDurablesForMIS then nil else p1.timedOptions,
				expirationTime = if not FFlagAXDurablesForMIS then nil else p1.expirationTime,
				isOwned = if not FFlagAXDurablesForMIS then nil else p1.isOwned,
				onTimedOptionPriceChanged = if not FFlagAXDurablesForMIS then nil else p1.onTimedOptionPriceChanged,
				selectedTimedOptionPrice = if not FFlagAXDurablesForMIS then nil else selectedTimedOptionPrice,
				setSelectedTimedOptionPrice = if not FFlagAXDurablesForMIS then nil else setSelectedTimedOptionPrice,
				selectedTimedOptionIndexInReducer = if not FFlagAXDurablesForMIS then nil else p1.selectedTimedOptionIndexInReducer,
				wearTimeSelectedOptionInList = if not FFlagAXDurablesForMIS then nil else WearTimeSelectedOptionInList,
				headerSize = UDim2.fromOffset(v26, v26),
				footerSize = UDim2.fromScale(0, 1),
				footerAutomaticSize = Enum.AutomaticSize.XY,
				AutomaticSize = Enum.AutomaticSize.XY
			})
		}),
		RightSlot = React.createElement(Foundation.View, {
			tag = "auto-xy anchor-top-right self-center",
			LayoutOrder = 2
		}, {
			RemoveButton = if not p1.onRemove then nil else React.createElement(Foundation.IconButton, {
				icon = "x",
				isCircular = true,
				variant = Foundation.Enums.ButtonVariant.Standard,
				onActivated = p1.onRemove
			})
		})
	})
end, tutils.deepEqual)
