local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)
local React = require(FoundationParent.React)

require(Foundation.Components.Types)

local View = require(Foundation.Components.View)

require(Foundation.Enums.ControlState)

local InputSize = require(Foundation.Enums.InputSize)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local useAnimatedHighlight = require(Foundation.Utility.useAnimatedHighlight)
local withDefaults = require(Foundation.Utility.withDefaults)
local Segment = require(script.Parent.Segment)
local useSegmentedControlVariants = require(script.Parent.useSegmentedControlVariants)
local t1 = {
	size = InputSize.Medium,
	testId = "--foundation-segmented-control",
	ZIndex = 1
}

return React.memo(React.forwardRef(function(p1, p2) --[[ SegmentedControl ]] -- line: 40
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), useSegmentedControlVariants (copy), React (copy), useAnimatedHighlight (copy), View (copy), withCommonProps (copy), Dash (copy), Segment (copy)
	local v16 = withDefaults(p1, t1)
	local v17 = useTokens()
	local v18 = useSegmentedControlVariants(v17, v16.size)
	local u19 = React.useRef(nil)
	local v20 = React.useMemo(function() -- line: 56
		-- upvalues: v16 (copy), React (copy)
		local t2 = {}

		for _, v33 in v16.segments do
			t2[v33.id] = v33.ref or React.createRef()
		end

		return t2
	end, { v16.segments })
	local v21 = useAnimatedHighlight(v16.value, p2 or u19, v20)
	local activeItemHeight = v21.activeItemHeight
	local highlightPosition = v21.highlightPosition
	local highlightWidth = v21.highlightWidth
	local v25, v26 = React.useBinding(Vector2.new(0, 0))
	local u27 = v26
	local u28 = React.useCallback(function(p3) -- line: 69
		-- upvalues: u27 (ref)
		u27(p3.AbsoluteSize)
	end, { v18.container.tag })
	local v29 = React.useCallback(function(p4) -- line: 73
		-- upvalues: v16 (copy), u28 (ref)
		if v16.onAbsoluteSizeChanged then
			v16.onAbsoluteSizeChanged(p4)
		end

		u28(p4)
	end, {
		v16.onAbsoluteSizeChanged,
		u28
	})
	local u30 = React.useCallback(function(t3: {[any]: any}) -- line: 80
		-- upvalues: v20 (copy), v16 (copy)
		local n1 = 0

		if t3.current then
			local current = v20[v16.value].current

			if current then
				n1 = current.AbsolutePosition.Y - t3.current.AbsolutePosition.Y
			end
		end

		return n1
	end, { v16.value })

	return React.createElement(View, {
		Size = v25:map(function(vector2: Vector2) -- line: 94
			return UDim2.fromOffset(vector2.X, vector2.Y)
		end),
		testId = "--foundation-segmented-control-container"
	}, {
		SegmentsContainer = React.createElement(View, withDefaults(withCommonProps(v16, {
			tag = v18.container.tag,
			ref = p2 or u19,
			testId = "--foundation-segmented-control"
		}), {
			onAbsoluteSizeChanged = v29
		}), Dash.map(v16.segments, function(p5, n2: number) -- line: 111
			-- upvalues: React (copy), Segment (copy), v16 (copy), v20 (copy)
			local v42 = (n2 - 1) * 2 + 1

			return React.createElement(React.Fragment, {
				key = tostring(p5.id)
			}, {
				Segment = React.createElement(Segment, {
					id = p5.id,
					size = v16.size,
					text = p5.text,
					icon = p5.icon,
					isActive = p5.id == v16.value,
					onActivated = v16.onActivated,
					LayoutOrder = v42,
					testId = `{ v16.testId }--segment-{ p5.id }`,
					ref = v20[p5.id]
				})
			})
		end)),
		Overlay = React.createElement(View, {
			backgroundStyle = v17.Color.Shift.Shift_400,
			tag = v18.segment.tag,
			Size = React.joinBindings({
				highlightWidth,
				activeItemHeight
			}):map(function(p6) -- line: 133
				return UDim2.fromOffset(p6[1], p6[2])
			end),
			Position = highlightPosition:map(function(n3: number) -- line: 136
				-- upvalues: u30 (ref), p2 (copy), u19 (ref)
				local v45 = u30(p2 or u19)

				return UDim2.fromOffset(n3, v45)
			end),
			ZIndex = v16.ZIndex + 1,
			testId = "--foundation-segmented-control--animated-overlay"
		})
	})
end))
