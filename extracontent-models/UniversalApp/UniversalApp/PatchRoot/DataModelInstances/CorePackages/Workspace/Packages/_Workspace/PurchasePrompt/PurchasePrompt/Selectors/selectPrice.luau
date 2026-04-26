local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchasePromptParent = PurchasePrompt.Parent

require(PurchasePromptParent.IAPExperience)

local FFlagFixResaleDisplayPrice = require(PurchasePrompt.Flags.FFlagFixResaleDisplayPrice)

return function(t1: {[any]: any}) --[[ selectPrice ]] -- line: 22
	-- upvalues: FFlagFixResaleDisplayPrice (copy)
	local productInfo = t1.productInfo
	local v6 = productInfo.price or 0
	local v7 = productInfo.basePrice or v6
	local v8 = productInfo.priceDiscountDetails or {}

	if FFlagFixResaleDisplayPrice and t1.promptRequest then
		local collectibleItemInstanceId = t1.promptRequest.collectibleItemInstanceId

		if collectibleItemInstanceId and collectibleItemInstanceId ~= "" then
			local expectedPrice = t1.promptRequest.expectedPrice

			if expectedPrice ~= nil then
				v6 = expectedPrice
				v7 = expectedPrice
			end
		end
	end

	return {
		priceInRobux = v6,
		basePriceInRobux = v7,
		discounts = v8
	}
end
