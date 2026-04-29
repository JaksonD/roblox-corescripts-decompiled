local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local View = Foundation.View
local FoundationText = Foundation.Text
local Badge = Foundation.Badge
local BadgeVariant = Foundation.Enums.BadgeVariant
local useLocalization = require(Parent.Localization).Hooks.useLocalization

return function(t1: {[any]: any}) --[[ RobloxPlusUpsellBannerCTA ]] -- line: 25
	-- upvalues: useLocalization (copy), React (copy), View (copy), Badge (copy), BadgeVariant (copy), FoundationText (copy)
	local v10 = useLocalization({
		getFreeTrialText = "Feature.RobloxSubscription.Label.FreeTrialText",
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		newBadge = "Feature.Catalog.Label.New"
	})
	local v11 = React.useCallback(function() -- line: 32
		-- upvalues: t1 (copy), v10 (copy)
		if t1.productInfo.isFreeTrial then
			return v10.getFreeTrialText
		end

		return v10.subscribe
	end, {
		t1.productInfo.isFreeTrial,
		v10.getFreeTrialText,
		v10.subscribe
	})

	if t1.shouldShowNewBadge then
		return React.createElement(View, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			tag = "row align-y-center gap-xsmall auto-xy"
		}, {
			NewBadge = React.createElement(Badge, {
				text = v10.newBadge,
				variant = BadgeVariant.Contrast,
				LayoutOrder = 1
			})
		})
	end

	return React.createElement(View, {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		tag = "auto-xy"
	}, {
		SubscribeText = React.createElement(FoundationText, {
			tag = "auto-xy text-body-small content-default",
			Text = "<u>" .. v11() .. "</u>",
			RichText = true
		})
	})
end
