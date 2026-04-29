local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local FFlagAXUseNewChevronIcon = require(Parent.AvatarExperienceFlags).FFlagAXUseNewChevronIcon

return function(t1: {[any]: any}) -- line: 21
	-- upvalues: useTokens (copy), React (copy), Foundation (copy), FFlagAXUseNewChevronIcon (copy)
	local v7 = useTokens()

	return React.createElement(Foundation.IconButton, {
		icon = not FFlagAXUseNewChevronIcon and "icons/actions/cycleLeft" or "chevron-large-left",
		Size = t1.Size or UDim2.new(0, v7.Size.Size_1000, 1, 0),
		Position = t1.Position,
		LayoutOrder = 1,
		onActivated = t1.onBackButtonClick or function() -- line: 30
		end
	})
end
