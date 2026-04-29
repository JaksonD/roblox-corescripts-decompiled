return function(p1) --[[ mapCatalogDiscountInfoToPriceDiscountDetails ]] -- line: 1
	if type(p1) ~= "table" or (type(p1.discounts) ~= "table" or #p1.discounts == 0) then
		return nil
	end

	local t1 = {}

	for _, v in ipairs(p1.discounts) do
		table.insert(t1, {
			Type = v.discountCampaign or "",
			AmountInRobux = v.robuxDiscountAmount or 0,
			Percent = v.robuxDiscountPercentage or 0
		})
	end

	return t1
end
