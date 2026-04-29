local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local shouldShowPriceLabel = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).shouldShowPriceLabel
local _ = Foundation.Enums.ButtonVariant

require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)

local FFlagAXHideInspectAndBuyPriceIfUnavailable = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXHideInspectAndBuyPriceIfUnavailable

return function(t1: {[any]: any}) --[[ BuyActionBar ]] -- line: 57
	-- upvalues: useTokens (copy), FFlagAXHideInspectAndBuyPriceIfUnavailable (copy), React (copy), shouldShowPriceLabel (copy), Foundation (copy)
	local v10 = useTokens()
	local v11 = not FFlagAXHideInspectAndBuyPriceIfUnavailable or React.useMemo(function() -- line: 61
		-- upvalues: shouldShowPriceLabel (copy), t1 (copy)
		return shouldShowPriceLabel(t1.priceStatus)
	end, { t1.priceStatus })

	return React.createElement(Foundation.View, {
		tag = "size-full col gap-xsmall align-x-center padding-x-large padding-bottom-medium",
		LayoutOrder = 1
	}, {
		InfoFrame = if not t1.priceLabel then nil else React.createElement(Foundation.View, {
			tag = "size-full-800 row flex-x-between align-y-center gap-small",
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, {
			PriceDescriptionLabel = React.createElement(Foundation.Text, {
				tag = "auto-xy text-title-medium content-emphasis text-truncate-end",
				Text = not v11 and "" or t1.priceLabel.leftLabel,
				LayoutOrder = 1
			}),
			RobuxLabel = if not v11 then nil else React.createElement(Foundation.View, {
				tag = "auto-xy row align-x-left align-y-center gap-xsmall",
				LayoutOrder = 2
			}, {
				PriceText = React.createElement(Foundation.Text, {
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					Text = t1.priceLabel.priceInRobux,
					LayoutOrder = 2
				}),
				Robux = React.createElement(Foundation.Icon, {
					name = "robux",
					style = v10.Color.ActionStandard.Foreground,
					size = Foundation.Enums.IconSize.Small,
					LayoutOrder = 1
				})
			})
		}),
		PurchaseButton = React.createElement(Foundation.Button, {
			size = Foundation.Enums.InputSize.Medium,
			fillBehavior = Foundation.Enums.FillBehavior.Fill,
			width = UDim.new(1, 0),
			text = t1.purchaseButtonProps.purchaseButtonText,
			variant = t1.purchaseButtonProps.variant,
			isDisabled = t1.purchaseButtonProps.isDisabled,
			onActivated = t1.purchaseButtonProps.onPurchase,
			LayoutOrder = 2
		})
	})
end
