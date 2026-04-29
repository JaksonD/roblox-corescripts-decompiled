local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local useConvertedItemData = require(AvatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local useItemStatusLocalization = require(AvatarExperienceInspectAndBuy.Hooks.useItemStatusLocalization)
local getPriceStatus = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)

require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)

local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)

require(AvatarExperienceInspectAndBuy.Types)

local PriceStatus = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local itemDetailsUtils = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils)
local isCollectible = itemDetailsUtils.isCollectible
local calculatePurchaseStatusForItem = itemDetailsUtils.calculatePurchaseStatusForItem
local getPriceInRobux = itemDetailsUtils.getPriceInRobux
local formatNumber = require(AvatarExperienceInspectAndBuy.Utils.formatNumber)
local AvatarExperienceFlags = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags)
local FFlagAXFormatPDPPriceLabel = AvatarExperienceFlags.FFlagAXFormatPDPPriceLabel
local FFlagAXHideInspectAndBuyPriceIfUnavailable = AvatarExperienceFlags.FFlagAXHideInspectAndBuyPriceIfUnavailable

return function(t1: {[any]: any}) --[[ usePurchaseButtonProps ]] -- line: 43
	-- upvalues: useConvertedItemData (copy), getPriceStatus (copy), useItemStatusLocalization (copy), React (copy), Foundation (copy), PriceStatus (copy), isCollectible (copy), calculatePurchaseStatusForItem (copy), FFlagAXFormatPDPPriceLabel (copy), formatNumber (copy), getPriceInRobux (copy), FFlagAXHideInspectAndBuyPriceIfUnavailable (copy)
	local v18 = useConvertedItemData(t1.selectedItem)
	local v19 = getPriceStatus(v18)
	local v20 = useItemStatusLocalization(v18)
	local v21 = React.useMemo(function() -- line: 49
		-- upvalues: t1 (copy), Foundation (copy)
		return {
			purchaseButtonText = t1.purchaseButtonText,
			onPurchase = t1.onBulkPurchase,
			isDisabled = t1.isDisabled,
			showRobuxIcon = false,
			variant = Foundation.Enums.ButtonVariant.Emphasis
		}
	end, { t1 })
	local v22 = React.useMemo(function() -- line: 60
		-- upvalues: v19 (copy), PriceStatus (copy), v20 (copy), Foundation (copy), v18 (copy), isCollectible (copy), calculatePurchaseStatusForItem (copy), t1 (copy)
		local v23 = v19 == PriceStatus.Free or (v19 == PriceStatus.PurchaseFromRoblox or v19 == PriceStatus.PurchaseFromResale)

		return {
			purchaseButtonText = v20[v19],
			isDisabled = not v23,
			variant = if v23 then Foundation.Enums.ButtonVariant.Emphasis else Foundation.Enums.ButtonVariant.Standard,
			onPurchase = function() --[[ onPurchase ]] -- line: 73
				-- upvalues: v18 (copy), isCollectible (copy), calculatePurchaseStatusForItem (copy), v19 (copy), t1 (copy)
				if v18 then
					local v24 = isCollectible(v18)
					local v25 = calculatePurchaseStatusForItem(v18, v19)

					t1.onPromptPurchase(v18.id, v18.itemType, v25.collectibleItemId, v25.collectibleLowestAvailableResaleProductId, v25.collectibleLowestAvailableResaleItemInstanceId, v25.collectibleLowestResalePrice, v24)
				end
			end
		}
	end, {
		t1,
		v19,
		v18
	})

	if t1.selectedItem then
		return {
			purchaseButtonProps = v22,
			priceLabel = {
				leftLabel = t1.localizedStrings.total or "",
				priceInRobux = if not FFlagAXFormatPDPPriceLabel then tostring(getPriceInRobux(v18, v19)) else formatNumber(getPriceInRobux(v18, v19))
			},
			priceStatus = if not FFlagAXHideInspectAndBuyPriceIfUnavailable then nil else v19
		}
	end

	return {
		purchaseButtonProps = v21,
		priceLabel = {
			leftLabel = t1.localizedStrings.totalItems or "",
			priceInRobux = t1.formattedTotalPrice
		}
	}
end
