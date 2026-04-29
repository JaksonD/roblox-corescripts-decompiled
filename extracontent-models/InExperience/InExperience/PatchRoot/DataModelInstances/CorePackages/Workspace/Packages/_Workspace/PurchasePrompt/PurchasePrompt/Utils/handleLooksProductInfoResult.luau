local Parent = script:FindFirstAncestor("PurchasePrompt").Parent

require(script.Parent.Parent.types)

local SharedFlags = require(Parent.SharedFlags)
local FFlagHideLookDiscountPercentWithIneligibleItems = require(script.Parent.Parent.Flags.FFlagHideLookDiscountPercentWithIneligibleItems)
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = SharedFlags.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = SharedFlags.FIntBlackbirdUpsellMaxPriceForDiscountInclusive

return function(p1, t1: {[any]: any}) --[[ handleLooksProductInfoResult ]] -- line: 27
	-- upvalues: FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), FFlagHideLookDiscountPercentWithIneligibleItems (copy)
	if not p1 or (not p1.look or not p1.look.items) then
		return nil
	end

	local look = p1.look
	local v9 = t1 or {}
	local t2 = {}

	for _, v in ipairs(v9.excludedAssetIds or {}) do
		t2[tostring(v)] = true
	end

	local t3 = {}

	for _, v in ipairs(v9.excludedBundleIds or {}) do
		t3[tostring(v)] = true
	end

	local t4 = {}

	for _, v in ipairs(v9.timedOptions or {}) do
		t4[v.itemType .. ":" .. tostring(v.itemId)] = v.days
	end

	local n1 = 0
	local n2 = 0
	local t5 = {}
	local v22 = false
	local v23 = false

	for _, v in ipairs(look.items) do
		local str = tostring(v.id)

		if (v.itemType ~= "Asset" or not t2[str]) and (v.itemType ~= "Bundle" or not t3[str]) then
			local v27 = t4[v.itemType .. ":" .. str]
			local v28 = nil
			local discountInformation = nil

			if v27 and v.timedOptions then
				local v30 = false

				for _, v2 in ipairs(v.timedOptions) do
					if v27 == v2.days then
						v28 = v2.price or 0
						discountInformation = v2.discountInformation
						v30 = true

						break
					end
				end

				if not v30 then
					v28 = v.priceInRobux or 0
					discountInformation = v.discountInformation
				end
			else
				v28 = v.priceInRobux or 0
				discountInformation = v.discountInformation
			end

			n1 += v28

			local v33 = if not discountInformation then v28 else discountInformation.originalPrice or v28
			local v34 = FIntBlackbirdUpsellMaxPriceForDiscountInclusive
			local v35 = v33 <= FIntBlackbirdUpsellMinPriceForDiscountInclusive or v34 ~= 0 and v34 <= v33

			if discountInformation and not v35 then
				v22 = true
			else
				v23 = true
			end

			if discountInformation then
				n2 += discountInformation.originalPrice or v28

				for _, v3 in ipairs(discountInformation.discounts or {}) do
					local discountCampaign = v3.discountCampaign

					if discountCampaign then
						t5[discountCampaign] = (t5[discountCampaign] or 0) + (v3.robuxDiscountAmount or 0)
					end
				end
			else
				n2 += v28
			end
		end
	end

	local v39 = FFlagHideLookDiscountPercentWithIneligibleItems and (v22 and v23)
	local t6 = {}

	if n2 > 0 then
		for k, v in pairs(t5) do
			if v > 0 then
				table.insert(t6, {
					Type = k,
					AmountInRobux = v,
					Percent = if not v39 then math.round(v / n2 * 100) else 0
				})
			end
		end
	end

	return {
		PriceInRobux = n1,
		UserBasePriceInRobux = n2,
		PriceDiscountDetails = t6,
		IsForSale = true,
		Name = "Looks"
	}
end
