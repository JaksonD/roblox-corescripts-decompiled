local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local RobloxSubscriptionPurchaseAppParent = RobloxSubscriptionPurchaseApp.Parent
local React = require(RobloxSubscriptionPurchaseAppParent.React)
local Foundation = require(RobloxSubscriptionPurchaseAppParent.Foundation)
local View = Foundation.View
local FoundationText = Foundation.Text
local Icon = Foundation.Icon
local IconSize = Foundation.Enums.IconSize
local IconName = Foundation.Enums.IconName
local useTokens = Foundation.Hooks.useTokens
local useLocalization = require(RobloxSubscriptionPurchaseAppParent.Localization).Hooks.useLocalization
local FFlagSupportNewBadgeRobloxPlus = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportNewBadgeRobloxPlus)
local useRobloxPlusUpsellBannerNewBadgeInteraction = require(RobloxSubscriptionPurchaseApp.Hooks.useRobloxPlusUpsellBannerNewBadgeInteraction)
local RobloxPlusUpsellBannerCTA = require(script.Parent.RobloxPlusUpsellBannerCTA)
local v15 = game:DefineFastFlag("BoldBlackbirdUpsellBannerStroke", false)

return function(t1: {[any]: any}) --[[ BlackbirdUpsellBanner ]] -- line: 35
	-- upvalues: useTokens (copy), useLocalization (copy), React (copy), FFlagSupportNewBadgeRobloxPlus (copy), useRobloxPlusUpsellBannerNewBadgeInteraction (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), FoundationText (copy), RobloxPlusUpsellBannerCTA (copy), v15 (copy)
	local v17 = useTokens()
	local v18 = useLocalization({
		bannerText = {
			"Feature.RobloxSubscription.Label.BlackbirdUpsellBanner",
			discountPercentage = t1.productInfo.initialDiscountPercentage or 10
		},
		getFreeTrialText = "Feature.RobloxSubscription.Label.FreeTrialText",
		subscribe = "Feature.RobloxSubscription.Action.Subscribe"
	})
	local v19 = React.useCallback(function() -- line: 47
		-- upvalues: t1 (copy), v18 (copy)
		if t1.productInfo.isFreeTrial then
			return v18.getFreeTrialText
		end

		return v18.subscribe
	end, {
		t1.productInfo.isFreeTrial,
		v18.getFreeTrialText,
		v18.subscribe
	})
	local v20 = nil

	if FFlagSupportNewBadgeRobloxPlus then
		v20 = useRobloxPlusUpsellBannerNewBadgeInteraction(t1.onActivated)
	end

	return React.createElement(View, {
		tag = "size-full-0 auto-y padding-medium",
		onActivated = if not FFlagSupportNewBadgeRobloxPlus then t1.onActivated else v20.onActivated,
		LayoutOrder = t1.LayoutOrder
	}, {
		ContentContainer = React.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, {
			BlackbirdIcon = React.createElement(Icon, {
				style = v17.Color.Content.Emphasis,
				name = IconName.RobloxPlus,
				size = IconSize.Medium,
				LayoutOrder = 1
			}),
			BannerText = React.createElement(FoundationText, {
				Size = UDim2.new(0.7, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextWrapped = true,
				tag = "text-body-small text-align-x-left content-emphasis",
				Text = v18.bannerText,
				LayoutOrder = 2
			})
		}),
		SubscribeText = if FFlagSupportNewBadgeRobloxPlus then nil else React.createElement(FoundationText, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			tag = "auto-xy text-body-small content-default",
			Text = "<u>" .. v19() .. "</u>",
			RichText = true
		}),
		SubscribeCTA = if not FFlagSupportNewBadgeRobloxPlus then nil else React.createElement(RobloxPlusUpsellBannerCTA, {
			productInfo = t1.productInfo,
			shouldShowNewBadge = v20.shouldShowNewBadge
		}),
		UIStroke = React.createElement("UIStroke", {
			Color = v17.Color.Stroke.Default.Color3,
			Transparency = v17.Color.Stroke.Default.Transparency,
			Thickness = if not v15 then v17.Stroke.Standard else v17.Stroke.Thick
		}),
		UICorner = React.createElement("UICorner", {
			CornerRadius = UDim.new(0, v17.Radius.Medium)
		})
	})
end
