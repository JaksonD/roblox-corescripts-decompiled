local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local AvatarExperienceFlags = require(Parent.AvatarExperienceFlags)
local React = require(Parent.React)
local View = require(Parent.Foundation).View

require(Parent.AvatarExperienceCommon)

local WearTimeListItem = require(script.Parent.WearTimeListItem)
local CombinedFFlagShouldUseLegacyGamepadFocus = AvatarExperienceFlags.CombinedFFlagShouldUseLegacyGamepadFocus

return function(t1: {[any]: any}) --[[ WearTimeList ]] -- line: 22
	-- upvalues: React (copy), WearTimeListItem (copy), CombinedFFlagShouldUseLegacyGamepadFocus (copy), View (copy)
	local t2 = {}

	for v9, v10 in t1.options do
		t2["WearTimeListItem_" .. tostring(v9)] = React.createElement(WearTimeListItem, {
			days = v10.days,
			price = v10.price,
			isActive = v10.selected ~= nil and v10.selected,
			onActivated = if not t1.onOptionActivated then nil else function() -- line: 31
				-- upvalues: t1 (copy), v9 (copy)
				t1.onOptionActivated(v9)
			end,
			LayoutOrder = v9,
			ref = if not CombinedFFlagShouldUseLegacyGamepadFocus or (v9 ~= 1 or not t1.firstItemRef) then nil else t1.firstItemRef
		})
	end

	return React.createElement(View, {
		tag = "col gap-small size-full-0 auto-y padding-small radius-medium stroke-default stroke-thick",
		LayoutOrder = t1.LayoutOrder
	}, t2)
end
