local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)
local TwoPanelLabelWithDivider = require(AvatarExperienceInspectAndBuy.Components.Common.TwoPanelLabelWithDivider)
local FFlagAXFixIaBItemMap = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXFixIaBItemMap

return function(t1: {[any]: any}) --[[ ItemInfoLabels ]] -- line: 41
	-- upvalues: React (copy), TwoPanelLabelWithDivider (copy), Foundation (copy), FFlagAXFixIaBItemMap (copy)
	local t2 = {}

	for v9, v10 in t1.itemInfoLabels do
		if v10.isVisible then
			t2[v10.key] = React.createElement(TwoPanelLabelWithDivider, {
				LayoutOrder = v9,
				labelProps = v10.labelProps,
				showDivider = true
			})
		end
	end

	return React.createElement(Foundation.View, {
		tag = "auto-y size-full-0 padding-top-medium col align-x-left align-y-top gap-small",
		LayoutOrder = t1.LayoutOrder or 4
	}, if not FFlagAXFixIaBItemMap then { t2 } else t2)
end
