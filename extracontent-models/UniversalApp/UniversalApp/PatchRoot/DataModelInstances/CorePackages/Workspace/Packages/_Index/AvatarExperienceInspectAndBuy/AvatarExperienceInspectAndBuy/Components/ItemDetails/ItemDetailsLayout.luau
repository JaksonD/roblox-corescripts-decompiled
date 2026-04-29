local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)
local ItemDetailsView = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ItemDetailsView)
local BuyActionBarLayout = require(AvatarExperienceInspectAndBuy.Components.ItemsView.BuyActionBarLayout)

require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)

local useTokens = Foundation.Hooks.useTokens
local ViewType = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local Cryo = require(AvatarExperienceInspectAndBuyParent.Cryo)

return function(t1: {[any]: any}) --[[ ItemDetailsLayout ]] -- line: 21
	-- upvalues: useTokens (copy), React (copy), Cryo (copy), ViewType (copy), Foundation (copy), ItemDetailsView (copy), BuyActionBarLayout (copy)
	local v11 = useTokens()
	local Size_2700 = v11.Size.Size_2700
	local v13 = React.useMemo(function() -- line: 27
		-- upvalues: Cryo (copy), t1 (copy), Size_2700 (copy)
		return Cryo.Dictionary.join(t1.itemDetailsViewProps, {
			buyActionBarOffset = Size_2700
		})
	end, {
		t1.itemDetailsViewProps,
		Size_2700
	})
	local v14 = t1.view == ViewType.Compact

	return React.createElement(Foundation.View, {
		tag = "size-full"
	}, {
		ItemDetailsView = React.createElement(ItemDetailsView, v13),
		BuyActionBarLayout = if not v14 then nil else React.createElement(BuyActionBarLayout, {
			buyActionBarProps = t1.buyActionBarProps,
			enableTopBorder = true,
			ZIndex = 2,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			padding = UDim.new(0, v11.Padding.Medium),
			Size = UDim2.new(1, 0, 0, Size_2700)
		})
	})
end
