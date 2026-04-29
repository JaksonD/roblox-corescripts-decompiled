local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)
local Badge = require(AvatarExperienceInspectAndBuy.Components.Common.Badge)
local Enums = Foundation.Enums
local FFlagAXUseStarIconForFavorites = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXUseStarIconForFavorites

return function(t1: {[any]: any}) --[[ ControlBar ]] -- line: 35
	-- upvalues: React (copy), Foundation (copy), Badge (copy), FFlagAXUseStarIconForFavorites (copy), Enums (copy)
	return React.createElement(Foundation.View, {
		tag = "auto-xy row align-x-left align-y-center gap-small",
		LayoutOrder = t1.LayoutOrder
	}, {
		FavoritesBadge = React.createElement(Badge, {
			icon = if not FFlagAXUseStarIconForFavorites then Enums.IconName.Bookmark else Enums.IconName.Star,
			iconVariant = t1.favoritesBadge.iconVariant,
			text = t1.favoritesBadge.text,
			onActivated = t1.favoritesBadge.onActivated,
			LayoutOrder = 1
		}),
		TryOnBadge = if not t1.tryOnBadge then nil else React.createElement(Badge, {
			icon = Enums.IconName.MirrorStanding,
			iconVariant = t1.tryOnBadge.iconVariant,
			text = t1.tryOnBadge.text,
			onActivated = t1.tryOnBadge.onActivated,
			LayoutOrder = 2
		})
	})
end
