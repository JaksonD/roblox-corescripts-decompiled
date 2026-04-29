local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)
local Icon = Foundation.Icon
local IconSize = Foundation.Enums.IconSize
local FoundationText = Foundation.Text
local shouldShowPriceLabel = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).shouldShowPriceLabel

require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)

local FFlagAXHideInspectAndBuyPriceIfUnavailable = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXHideInspectAndBuyPriceIfUnavailable

return function(t1: {[any]: any}) --[[ SubheaderLabelPrice ]] -- line: 37
	-- upvalues: FFlagAXHideInspectAndBuyPriceIfUnavailable (copy), React (copy), shouldShowPriceLabel (copy), Foundation (copy), FoundationText (copy), Icon (copy), IconSize (copy)
	local v11 = not FFlagAXHideInspectAndBuyPriceIfUnavailable or React.useMemo(function() -- line: 39
		-- upvalues: shouldShowPriceLabel (copy), t1 (copy)
		return shouldShowPriceLabel(t1.priceStatus)
	end, { t1.priceStatus })

	return React.createElement(Foundation.View, {
		tag = "auto-xy row align-y-center align-x-left gap-xxsmall",
		LayoutOrder = t1.LayoutOrder
	}, {
		LeftSlotLabel = if not t1.subheaderText.leftSlotLabel then nil else React.createElement(FoundationText, {
			tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split",
			LayoutOrder = 1,
			Text = t1.subheaderText.leftSlotLabel
		}),
		Spacer = if not v11 or (not t1.subheaderText.leftSlotLabel or t1.subheaderText.leftSlotLabel == "") then nil else React.createElement(Icon, {
			name = "icons/controls/keys/period",
			size = IconSize.Small,
			LayoutOrder = 2
		}),
		RightSlotLabel = if not v11 or not t1.subheaderText.rightSlotPrice then nil else React.createElement(Foundation.View, {
			tag = "auto-xy row align-y-center align-x-left gap-xxsmall",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 3
		}, {
			Icon = React.createElement(Icon, {
				name = "icons/common/robux",
				size = IconSize.Small,
				LayoutOrder = 1
			}),
			RightSlotLabel = React.createElement(FoundationText, {
				tag = "auto-xy text-align-x-left text-body-large content-default text-truncate-split",
				LayoutOrder = 2,
				Text = t1.subheaderText.rightSlotPrice
			})
		})
	})
end
