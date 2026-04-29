local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local Cryo = require(CorePackages.Packages.Cryo)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local Constants = require(Modules.AvatarExperience.Common.Constants)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)

require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
require(Modules.AvatarExperience.Common.Reducers.Looks)
require(Modules.AvatarExperience.Common.Types)
require(Modules.AvatarExperience.Common.Reducers.CollectiblesItemInfo)
require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellersInstances)
require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellableInstances)

local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXBlackbirdRoot = AvatarExperienceFlags.FFlagAXBlackbirdRoot
local v10 = game:DefineFastFlag("HideLookDiscountPercentWithIneligibleItems", false)
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local t1 = {
	getItemInfo = function(s1: string, p1, p2, s2: string?) -- line: 32
		-- upvalues: Constants (copy)
		if not p2 or not s2 then
			return nil
		end

		local v18 = p2[s2]

		if not v18 then
			return nil
		end

		if p1 == Constants.ItemType.Asset then
			return v18.lookAssetInfos[s1]
		end

		if p1 == Constants.ItemType.Bundle then
			local lookBundleInfos = v18.lookBundleInfos

			if lookBundleInfos then
				return lookBundleInfos[s1]
			end

			return nil
		end

		return nil
	end
}

function t1.getOwnedTryOnItems(p3, p4, s3: string?) -- line: 61
	-- upvalues: t1 (copy)
	local t2 = {}

	for v24, v25 in p3 do
		if v25.selectedInTryOnManager then
			local v26 = t1.getItemInfo(v25.itemId, v25.itemType, p4, s3)

			if v26 and v26.quantityOwned > 0 then
				t2[v24] = v25
			end
		end
	end

	return t2
end
function t1.getPriceForItem(p5, p6, p7, p8, n1: number?) -- line: 84
	-- upvalues: CatalogUtils (copy)
	local priceInRobux = p5.priceInRobux

	if n1 and p5.timedOptions then
		local v33 = p5.timedOptions[n1]

		if v33 then
			priceInRobux = v33.price
		end
	end

	if p5.collectibleItemId then
		local v34 = CatalogUtils.findCheapestCollectiblePurchaseInfoV2(p5.collectibleItemId, CatalogUtils.IsResellable(p5), p6, p7, p8)

		if v34.price then
			priceInRobux = v34.price
		end
	end

	return priceInRobux
end

if FFlagAXMISEnableMultiShopping then
	function t1.getBottomBarInfoMIS(p9, p10, p11, p12, p13, s4: string?, p14) -- line: 119
		-- upvalues: FFlagAXBlackbirdRoot (copy), v10 (copy), t1 (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), Cryo (copy)
		local n2 = 0
		local n3 = 0
		local n4 = 0
		local n5 = 0
		local v46 = false
		local t3 = {}
		local v48 = false
		local v49 = false

		if not s4 then
			local v50 = nil
			local v51 = if not FFlagAXBlackbirdRoot then nil else n5

			if v10 then
				return n4, n2, n3, v46, v50, v51, false
			end

			return n4, n2, n3, v46, v50, v51, nil
		end

		for _, v53 in p9 do
			n2 += 1

			local v54 = t1.getItemInfo(v53.id, v53.itemType, p13, s4)

			if not v54 then
				if not v46 then
					v46 = true
				end
			elseif not v54 or not v54.quantityOwned or not (v54.quantityOwned > 0) then
				local selectedTimedOptionIndex = nil
				local v56 = nil

				if p14 then
					for _, v58 in p14 do
						if v58.itemId == v53.id and v58.itemType == v53.itemType then
							v56 = v58
							selectedTimedOptionIndex = v58.selectedTimedOptionIndex

							break
						end
					end
				end

				local v59 = t1.getPriceForItem(v54, p10, p11, p12, selectedTimedOptionIndex)

				if v59 ~= nil then
					n4 += v59
					n3 += 1

					if FFlagAXBlackbirdRoot then
						local v60 = if not v54 or not v54.discountInformation then v59 else v54.discountInformation.originalPrice
						local v61 = FIntBlackbirdUpsellMaxPriceForDiscountInclusive
						local v62 = v60 <= FIntBlackbirdUpsellMinPriceForDiscountInclusive or v61 ~= 0 and v61 <= v60

						if v54 and v54.discountInformation and not v62 then
							v48 = true
						else
							v49 = true
						end

						n5 = if not v54 or not v54.discountInformation then n5 + v59 else n5 + v54.discountInformation.originalPrice
					end

					if v56 then
						t3[v53.id] = Cryo.Dictionary.join(v56, {
							expectedPrice = v59
						})
					end
				end
			end
		end

		local v63 = if not FFlagAXBlackbirdRoot then nil else n5

		if v10 then
			return n4, n2, n3, v46, t3, v63, v48 and v49
		end

		return n4, n2, n3, v46, t3, v63, nil
	end
	function t1.getOwnedItemsInLook(t4: {[any]: any}, p15, s5: string?) -- line: 238
		-- upvalues: t1 (copy)
		local t5 = {}

		for v68, v69 in t4 do
			local v70 = if not v69.itemType then nil else t1.getItemInfo(v69.id, v69.itemType, p15, s5)

			if v70 and v70.quantityOwned > 0 then
				t5[v68] = v69
			end
		end

		return t5
	end
end

return t1
