local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local RobloxSubscriptionPurchaseAppParent = RobloxSubscriptionPurchaseApp.Parent
local React = require(RobloxSubscriptionPurchaseAppParent.React)
local RobloxPlusUnifiedBuyModalBannerImpression = require(RobloxSubscriptionPurchaseApp.Storage.RobloxPlusUnifiedBuyModalBannerImpression)
local FIntNewBadgeMaximumImpressionCount = require(RobloxSubscriptionPurchaseApp.Flags.FIntNewBadgeMaximumImpressionCount)

return function(p1: ((...any) -> ...any)) --[[ useRobloxPlusUpsellBannerNewBadgeInteraction ]] -- line: 24
	-- upvalues: React (copy), RobloxPlusUnifiedBuyModalBannerImpression (copy), FIntNewBadgeMaximumImpressionCount (copy)
	local v7 = React.useState(function() -- line: 27
		-- upvalues: RobloxPlusUnifiedBuyModalBannerImpression (copy)
		return RobloxPlusUnifiedBuyModalBannerImpression.getImpressionCount()
	end) < FIntNewBadgeMaximumImpressionCount
	local v8 = React.useCallback(function() -- line: 33
		-- upvalues: v7 (copy), RobloxPlusUnifiedBuyModalBannerImpression (copy), p1 (copy)
		if v7 then
			RobloxPlusUnifiedBuyModalBannerImpression.incrementImpressionCount()
		end

		p1()
	end, {
		v7,
		p1
	})

	return {
		shouldShowNewBadge = v7,
		onActivated = v8
	}
end
