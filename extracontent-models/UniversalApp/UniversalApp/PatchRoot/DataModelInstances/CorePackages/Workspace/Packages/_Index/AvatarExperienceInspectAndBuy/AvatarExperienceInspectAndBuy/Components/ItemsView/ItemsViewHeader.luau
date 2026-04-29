local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local ViewType = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local BackButton = require(AvatarExperienceInspectAndBuy.Components.Common.BackButton)

require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)

local SubheaderLabelPrice = require(AvatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)

require(AvatarExperienceInspectAndBuy.Types)

return function(t1: {[any]: any}) --[[ ItemsViewHeader ]] -- line: 50
	-- upvalues: useTokens (copy), ViewType (copy), React (copy), Foundation (copy), BackButton (copy), SubheaderLabelPrice (copy)
	local v10 = useTokens()
	local v11 = t1.view == ViewType.WideLandscape
	local v12 = t1.view == ViewType.Compact

	return React.createElement(Foundation.View, {
		Size = UDim2.new(1, 0, 0, t1.headerHeight)
	}, {
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, if not v11 and not v12 then v10.Margin.Large * 2 else v10.Padding.Medium),
			HorizontalFlex = if v11 then nil else Enum.UIFlexAlignment.SpaceBetween
		}),
		UIPadding = if not t1.padding then nil else React.createElement("UIPadding", {
			PaddingLeft = t1.padding.left,
			PaddingRight = t1.padding.right,
			PaddingTop = t1.padding.top,
			PaddingBottom = t1.padding.bottom
		}),
		BackButton = if not v11 then nil else React.createElement(BackButton, {
			onBackButtonClick = t1.onBackButtonClick,
			Position = UDim2.new(0, v10.Padding.Small, 0, v10.Padding.Small)
		}),
		HeaderTextAndSubheader = React.createElement(Foundation.View, {
			BackgroundTransparency = 1,
			tag = "size-0-full auto-x col align-y-center",
			LayoutOrder = 2
		}, {
			HeaderText = React.createElement(Foundation.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
				Text = t1.headerText
			}),
			SubheaderText = if not t1.subheaderText or (v11 or v12) then nil else React.createElement(SubheaderLabelPrice, {
				subheaderText = t1.subheaderText,
				LayoutOrder = 2
			})
		}),
		BuyButton = if v11 or v12 then nil else React.createElement(Foundation.Button, {
			size = Foundation.Enums.InputSize.Medium,
			width = if not v12 then UDim.new(0, v10.Size.Size_3000) else UDim.new(0, v10.Size.Size_2100),
			LayoutOrder = 3,
			text = t1.purchaseButtonProps.purchaseButtonText,
			variant = Foundation.Enums.ButtonVariant.Emphasis,
			isDisabled = t1.purchaseButtonProps.isDisabled,
			onActivated = t1.purchaseButtonProps.onPurchase
		})
	})
end
