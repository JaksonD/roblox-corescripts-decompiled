local ParentParent = script.Parent.Parent
local PurchaseError = require(ParentParent.Enums.PurchaseError)
local Promise = require(ParentParent.Promise)
local getAssetInfo = require(ParentParent.Network.getAssetInfo)
local getCreatorStoreProductInfo = require(ParentParent.Network.getCreatorStoreProductInfo)

require(ParentParent.Misc.Constants)

local isCreatorStoreAssetType = require(ParentParent.Utils.isCreatorStoreAssetType)
local getAssetInfoUtil = require(ParentParent.Utils.getAssetInfoUtil)
local getCreatorStoreProductInfoUtil = require(ParentParent.Utils.getCreatorStoreProductInfoUtil)
local getExperienceProductInfoUtil = require(ParentParent.Utils.getExperienceProductInfoUtil)
local handleLooksProductInfoResult = require(ParentParent.Utils.handleLooksProductInfoResult)
local ProductTypeEnum = require(ParentParent.types).ProductTypeEnum
local FFlagEnableUnifiedProductPurchaseFlow = require(ParentParent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(ParentParent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell = require(ParentParent.Flags.FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell)
local GetFFlagDiscountInfoForSubscriptionPurchaseModalLua = require(ParentParent.Parent.SharedFlags).GetFFlagDiscountInfoForSubscriptionPurchaseModalLua
local FFlagRefreshPriceOnRetryAfterUpsell = require(ParentParent.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local FFlagRefreshLookPriceOnRetryAfterUpsell = require(ParentParent.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local getCatalogItemDetails = require(ParentParent.Network.getCatalogItemDetails)
local getResellers = require(ParentParent.Network.getResellers)
local resolveRefreshedExpectedPrice = require(ParentParent.Utils.resolveRefreshedExpectedPrice)
local FFlagFixTimedOptionRefresh = require(ParentParent.Flags.FFlagFixTimedOptionRefresh)
local resolveRefreshedProductInfo = require(ParentParent.Utils.resolveRefreshedProductInfo)

local function fetchRefreshedPrice(p1, p2, p3, t1: {[any]: any}) -- line: 37
	-- upvalues: Promise (copy), getCatalogItemDetails (copy), getResellers (copy), FFlagFixTimedOptionRefresh (copy), resolveRefreshedProductInfo (copy), resolveRefreshedExpectedPrice (copy)
	local collectibleItemId = t1.collectibleItemId
	local collectibleItemInstanceId = t1.collectibleItemInstanceId

	return Promise.all({
		catalogItemDetails = getCatalogItemDetails(p1, p2, p3):catch(function() -- line: 41
			return nil
		end),
		resellersData = if not collectibleItemInstanceId or (collectibleItemInstanceId == "" or (not collectibleItemId or collectibleItemId == "")) then Promise.resolve(nil) else getResellers(p1, collectibleItemId, 10):catch(function() -- line: 48
			return nil
		end)
	}):andThen(function(p4) -- line: 52
		-- upvalues: FFlagFixTimedOptionRefresh (copy), resolveRefreshedProductInfo (copy), collectibleItemInstanceId (copy), t1 (copy), resolveRefreshedExpectedPrice (copy)
		if FFlagFixTimedOptionRefresh then
			return resolveRefreshedProductInfo(p4.catalogItemDetails, p4.resellersData, collectibleItemInstanceId, t1.timedOptionDays)
		end

		return (resolveRefreshedExpectedPrice(p4.catalogItemDetails, p4.resellersData, collectibleItemInstanceId, t1.timedOptionDays))
	end)
end

return function(p5, p6, p7, p8, t2: {[any]: any}?) --[[ getProductInfo ]] -- line: 70
	-- upvalues: getAssetInfo (copy), getAssetInfoUtil (copy), Promise (copy), PurchaseError (copy), isCreatorStoreAssetType (copy), getCreatorStoreProductInfo (copy), getCreatorStoreProductInfoUtil (copy), FFlagRefreshPriceOnRetryAfterUpsell (copy), fetchRefreshedPrice (copy), FFlagFixTimedOptionRefresh (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), ProductTypeEnum (copy), getExperienceProductInfoUtil (copy), FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell (copy), handleLooksProductInfoResult (copy), FFlagRefreshLookPriceOnRetryAfterUpsell (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), GetFFlagDiscountInfoForSubscriptionPurchaseModalLua (copy)
	if p7 == Enum.InfoType.Asset then
		local v35 = getAssetInfo(p5, p6):andThen(function(p9) -- line: 73
			-- upvalues: getAssetInfoUtil (copy), Promise (copy), PurchaseError (copy), isCreatorStoreAssetType (copy), getCreatorStoreProductInfo (copy), p5 (copy), p6 (copy), getCreatorStoreProductInfoUtil (copy), p7 (copy)
			local u38 = nil

			if p9 and (p9.data and p9.data[1]) then
				if not getAssetInfoUtil.isAssetValid(p9.data[1]) then
					return Promise.reject(PurchaseError.UnknownFailureNoItemName)
				end

				u38 = getAssetInfoUtil.fromAsset(p9.data[1])
			end

			local v39 = u38 and u38.type or ""

			if isCreatorStoreAssetType(v39) then
				return getCreatorStoreProductInfo(p5, p6, v39):andThen(function(p10) -- line: 84
					-- upvalues: getCreatorStoreProductInfoUtil (copy), u38 (ref), v39 (copy)
					local v58 = getCreatorStoreProductInfoUtil.fromProduct(p10)

					return {
						AssetId = u38.id,
						AssetType = v39,
						AssetTypeId = u38.typeId,
						Creator = {
							CreatorTargetId = u38.creator.targetId,
							CreatorType = u38.creator.type
						},
						Description = u38.description,
						IsFiatPriced = v58.basePrice and (v58.basePrice.quantity and v58.basePrice.quantity.significand ~= 0),
						IsForSale = v58.purchasable,
						IsPublicDomain = u38.isPublicDomainEnabled,
						Name = u38.name,
						PriceInRobux = 0,
						ProductId = u38.id
					}
				end)
			end

			return p5.getProductInfo(p6, p7):catch(function(_) -- line: 108
				-- upvalues: Promise (copy), PurchaseError (copy)
				return Promise.reject(PurchaseError.UnknownFailureNoItemName)
			end)
		end):catch(function(_) -- line: 113
			-- upvalues: Promise (copy), PurchaseError (copy)
			return Promise.reject(PurchaseError.UnknownFailureNoItemName)
		end)

		if FFlagRefreshPriceOnRetryAfterUpsell and t2 then
			return Promise.all({
				productInfo = v35,
				refreshedPrice = fetchRefreshedPrice(p5, p6, "asset", t2)
			}):andThen(function(p13) -- line: 127
				-- upvalues: FFlagFixTimedOptionRefresh (copy)
				local productInfo = p13.productInfo

				if FFlagFixTimedOptionRefresh then
					local refreshedPrice = p13.refreshedPrice

					if refreshedPrice ~= nil then
						for k, v in pairs(refreshedPrice) do
							productInfo[k] = v
						end

						return productInfo
					end
				elseif p13.refreshedPrice ~= nil then
					productInfo.refreshedExpectedPrice = p13.refreshedPrice
				end

				return productInfo
			end)
		end

		return v35
	end

	if FFlagEnableUnifiedProductPurchaseFlow and p7 == ProductTypeEnum.Experience then
		return p5.getExperienceProductInfo(p6):andThen(function(p14) -- line: 149
			-- upvalues: p8 (copy), getExperienceProductInfoUtil (copy), Promise (copy), PurchaseError (copy)
			if p14 and (p14.data and p14.data[1] and p8.name and p8.imageUrl) then
				local v47 = getExperienceProductInfoUtil.fromProduct(p14.data[1])

				return {
					IsForSale = v47.isForSale,
					PriceInRobux = v47.price,
					ProductId = v47.productId,
					SellerId = v47.sellerId,
					Name = p8.name,
					ImageUrl = p8.imageUrl
				}
			end

			return Promise.reject(PurchaseError.UnknownFailureNoItemName)
		end):catch(function(_) -- line: 169
			-- upvalues: Promise (copy), PurchaseError (copy)
			return Promise.reject(PurchaseError.UnknownFailureNoItemName)
		end)
	end

	if FFlagEnableUnifiedProductPurchaseFlow and p7 == ProductTypeEnum.Look then
		if FFlagUnifiedPurchaseSupportRefetchingLooksAfterUpsell then
			return p5.GetLookDetailsV2ProductInfo(p6):andThen(function(p16) -- line: 176
				-- upvalues: handleLooksProductInfoResult (copy), p8 (copy), Promise (copy), PurchaseError (copy), FFlagRefreshLookPriceOnRetryAfterUpsell (copy)
				local v50 = handleLooksProductInfoResult(p16, p8)

				if not v50 then
					return Promise.reject(PurchaseError.UnknownFailureNoItemName)
				end

				if FFlagRefreshLookPriceOnRetryAfterUpsell then
					v50.refreshedExpectedPrice = v50.PriceInRobux
				end

				return v50
			end):catch(function() -- line: 187
				-- upvalues: Promise (copy), PurchaseError (copy)
				return Promise.reject(PurchaseError.UnknownFailureNoItemName)
			end)
		end

		return Promise.resolve({
			PriceInRobux = p8.expectedPrice,
			IsForSale = true,
			Name = "Looks"
		})
	end

	if FFlagEnableUnifiedPurchaseFlowForDevSubs and p7 == ProductTypeEnum.DeveloperSubscription then
		return p5.getSubscriptionProductInfo(p6):andThen(function(p17) -- line: 199
			-- upvalues: GetFFlagDiscountInfoForSubscriptionPurchaseModalLua (copy), ProductTypeEnum (copy), Promise (copy), PurchaseError (copy)
			if p17 and p17.Name then
				local v52 = GetFFlagDiscountInfoForSubscriptionPurchaseModalLua()
				local v53 = if not v52 then nil else p17.UserBasePriceInRobux
				local v54 = if not v52 then nil else p17.PriceDiscountDetails

				return {
					Name = p17.Name,
					Description = p17.Description,
					IconImageAssetId = p17.IconImageAssetId,
					IsForSale = p17.IsForSale,
					DisplayPrice = p17.DisplayPrice,
					SubscriptionProviderName = p17.SubscriptionProviderName,
					PriceInRobux = p17.PriceInRobux,
					PriceTier = p17.PriceTier,
					ProductType = ProductTypeEnum.DeveloperSubscription,
					UserBasePriceInRobux = v53,
					PriceDiscountDetails = v54
				}
			end

			return Promise.reject(PurchaseError.UnknownFailureNoItemName)
		end):catch(function(_) -- line: 220
			-- upvalues: Promise (copy), PurchaseError (copy)
			return Promise.reject(PurchaseError.UnknownFailureNoItemName)
		end)
	end

	return p5.getProductInfo(p6, p7):catch(function(_) -- line: 224
		-- upvalues: Promise (copy), PurchaseError (copy)
		return Promise.reject(PurchaseError.UnknownFailureNoItemName)
	end)
end
