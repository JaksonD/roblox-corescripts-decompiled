local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)
local Otter = require(FoundationParent.Otter)
local React = require(FoundationParent.React)
local ReactOtter = require(FoundationParent.ReactOtter)
local ControlState = require(Foundation.Enums.ControlState)
local Flags = require(Foundation.Utility.Flags)
local IconButton = require(Foundation.Components.IconButton)
local InputSize = require(Foundation.Enums.InputSize)
local ScrollView = require(Foundation.Components.ScrollView)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)

require(Foundation.Components.Types)

local View = require(Foundation.Components.View)
local Visibility = require(Foundation.Enums.Visibility)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.8, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local numberSequence2 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.2, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function OverflowButton(p1) -- line: 35
	-- upvalues: React (copy), View (copy), withCommonProps (copy), IconButton (copy), InputSize (copy)
	return React.createElement(View, withCommonProps(p1, {
		tag = `col align-y-center size-0-full auto-x bg-surface-0 { p1.tag }`
	}), {
		UIGradient = React.createElement("UIGradient", {
			Transparency = p1.gradient
		}),
		Button = React.createElement(IconButton, {
			onActivated = p1.onActivated,
			size = if p1.size ~= InputSize.Large and p1.size ~= InputSize.Medium then InputSize.XSmall else InputSize.Small,
			icon = {
				name = p1.icon
			}
		})
	})
end

return function(p2) --[[ OverflowScrollContainer ]] -- line: 72
	-- upvalues: React (copy), Flags (copy), ReactOtter (copy), Dash (copy), Otter (copy), ControlState (copy), View (copy), withCommonProps (copy), ScrollView (copy), StateLayerAffordance (copy), Visibility (copy), OverflowButton (copy), numberSequence (copy), numberSequence2 (copy)
	local v21, v22 = React.useBinding(false)
	local v23, v24 = React.useBinding(false)
	local u25 = nil
	local u26 = nil

	if Flags.FoundationTabsNavArrowsOnlyOnHover then
		local v27, v28 = React.useState(false)

		u25 = v27
		u26 = v28
	end

	local v29 = React.useRef(nil)
	local v30 = ReactOtter.useMotor(0, function(p3) -- line: 80
		-- upvalues: v29 (copy)
		local current = v29.current

		if not current then
			return
		end

		current.CanvasPosition = Vector2.new(p3, 0)
	end)
	local v31 = React.useCallback(Dash.throttle(function(p4) -- line: 89
		-- upvalues: v22 (copy), v24 (copy)
		if p4.AbsoluteWindowSize.X == 0 then
			return
		end

		v22(p4.AbsoluteWindowSize.X + p4.CanvasPosition.X < p4.AbsoluteCanvasSize.X - 1)
		v24(p4.CanvasPosition.X ~= 0)
	end, 0.2), {})
	local v32 = React.useCallback(function(n1: number) -- line: 102
		-- upvalues: v29 (copy), v30 (copy), Otter (copy)
		local current = v29.current

		if not current then
			return
		end

		v30(Otter.ease(current.CanvasPosition.X + n1, {
			duration = 0.2,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, {})

	React.useEffect(function() -- line: 116
		-- upvalues: v29 (copy), v31 (copy)
		if v29.current then
			v31(v29.current)
		end
	end, {})

	local v33 = React.useCallback(function() -- line: 122
		-- upvalues: v32 (copy)
		v32(-90)
	end, { v32 })
	local v34 = React.useCallback(function() -- line: 126
		-- upvalues: v32 (copy)
		v32(90)
	end, { v32 })
	local v35 = if not Flags.FoundationTabsNavArrowsOnlyOnHover then nil else React.useCallback(function(p5) -- line: 131
		-- upvalues: u26 (ref), ControlState (copy)
		u26(p5 == ControlState.Hover)
	end, {})

	return React.createElement(View, withCommonProps(p2, {
		tag = "size-full-0 auto-y"
	}), {
		Scroll = React.createElement(ScrollView, {
			LayoutOrder = 1,
			tag = {
				["size-full-0 auto-y"] = Flags.FoundationTabsNavArrowsOnlyOnHover,
				["size-full"] = not Flags.FoundationTabsNavArrowsOnlyOnHover
			},
			onStateChanged = if not Flags.FoundationTabsNavArrowsOnlyOnHover then nil else v35,
			stateLayer = if not Flags.FoundationTabsNavArrowsOnlyOnHover then nil else {
				affordance = StateLayerAffordance.None
			},
			onCanvasPositionChanged = v31,
			onAbsoluteWindowSizeChanged = v31,
			scrollingFrameRef = v29,
			selection = if not Flags.FoundationTabsDisableScrollSelection then nil else {
				Selectable = false
			},
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = Visibility.None
			},
			testId = if not Flags.FoundationTabsNavArrowsOnlyOnHover then nil else `{ p2.testId }--scroll`
		}, p2.children),
		OverflowStart = React.createElement(OverflowButton, {
			LayoutOrder = 3,
			Position = UDim2.fromScale(0, 0),
			size = p2.size,
			isStart = true,
			ZIndex = 2,
			Visible = if not Flags.FoundationTabsNavArrowsOnlyOnHover then v23 else v23:map(function(p6) -- line: 172
				-- upvalues: u25 (ref)
				return u25 and p6
			end),
			onActivated = v33,
			gradient = numberSequence,
			tag = "padding-right-small",
			icon = "chevron-large-left",
			testId = `{ p2.testId }--overflow-start`
		}),
		OverflowEnd = React.createElement(OverflowButton, {
			LayoutOrder = 4,
			Position = UDim2.fromScale(1, 0),
			size = p2.size,
			ZIndex = 2,
			Visible = if not Flags.FoundationTabsNavArrowsOnlyOnHover then v21 else v21:map(function(p7) -- line: 188
				-- upvalues: u25 (ref)
				return u25 and p7
			end),
			onActivated = v34,
			gradient = numberSequence2,
			tag = "anchor-top-right padding-left-small",
			icon = "chevron-large-right",
			testId = `{ p2.testId }--overflow-end`
		})
	})
end
