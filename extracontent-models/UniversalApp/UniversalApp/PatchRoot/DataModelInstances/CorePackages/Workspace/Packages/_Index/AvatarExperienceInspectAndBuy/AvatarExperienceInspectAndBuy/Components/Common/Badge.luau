local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local IconSize = Foundation.Enums.IconSize

return function(t1: {[any]: any}) --[[ Badge ]] -- line: 32
	-- upvalues: useTokens (copy), React (copy), Foundation (copy), IconSize (copy)
	local v7 = useTokens()

	return React.createElement(Foundation.View, {
		tag = "auto-xy row align-x-center align-y-center bg-surface-300 radius-circle padding-small gap-xsmall",
		BorderSizePixel = 0,
		LayoutOrder = t1.LayoutOrder,
		Text = "",
		onActivated = t1.onActivated
	}, {
		Icon = React.createElement(Foundation.Icon, {
			name = t1.icon,
			variant = t1.iconVariant,
			size = IconSize.Medium,
			style = v7.Color.Content.Default,
			LayoutOrder = 1
		}),
		Text = if not t1.text then nil else React.createElement(Foundation.Text, {
			tag = "text-caption-large content-emphasis text-align-x-left auto-xy text-truncate-none",
			Text = t1.text,
			textStyle = v7.Color.Content.Default,
			LayoutOrder = 2
		})
	})
end
