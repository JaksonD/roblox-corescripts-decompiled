local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Constants = require(Foundation.Constants)
local Gradient = require(Foundation.Components.Gradient)
local Image = require(Foundation.Components.Image)

require(Foundation.Components.Types)

local View = require(Foundation.Components.View)
local withDefaults = require(Foundation.Utility.withDefaults)
local Sheet = script:FindFirstAncestor("Sheet")
local SheetContext = require(Sheet.SheetContext)
local t1 = {
	height = UDim.new(1, 0),
	sticky = false
}

return React.memo(React.forwardRef(function(t2: {[any]: any}, p1) --[[ SheetFullBleed ]] -- line: 36
	-- upvalues: withDefaults (copy), t1 (copy), React (copy), SheetContext (copy), Image (copy), Gradient (copy), View (copy), Constants (copy)
	local v14 = withDefaults(t2, t1)
	local v15 = React.useContext(SheetContext)
	local setFullBleedHeight = v15.setFullBleedHeight
	local fullBleedHeight = v15.fullBleedHeight
	local innerScrollY = v15.innerScrollY
	local hasHeader = v15.hasHeader
	local hasRadius = v15.hasRadius
	local testId = v15.testId

	assert(setFullBleedHeight and (hasHeader and testId), "SheetFullBleed must be used within a Sheet")
	React.useEffect(function() -- line: 48
		-- upvalues: v14 (copy), hasHeader (copy)
		assert(not (v14.sticky and hasHeader:getValue()), "Sheet.FullBleed with sticky=true is unsupported when used with Sheet.Header")
	end, {
		v14.sticky,
		hasHeader
	})

	local v22 = React.useCallback(function(p2) -- line: 55
		-- upvalues: setFullBleedHeight (copy)
		setFullBleedHeight(p2.AbsoluteSize.Y)
	end, {})

	React.useEffect(function() -- line: 59
		-- upvalues: setFullBleedHeight (copy)
		return function() -- line: 60
			-- upvalues: setFullBleedHeight (copy)
			setFullBleedHeight(0)
		end
	end, {})

	local uDim2 = UDim2.new(1, 0, v14.height.Scale, v14.height.Offset)
	local v24 = nil

	if v14.sticky then
		v24 = uDim2
	elseif innerScrollY and fullBleedHeight then
		v24 = React.joinBindings({
			scrollY = innerScrollY,
			height = fullBleedHeight
		}):map(function(t3: {[any]: any}) -- line: 76
			if t3.height == 0 then
				return UDim2.fromScale(1, 1)
			end

			local v29 = math.max(0, t3.height - t3.scrollY)

			return UDim2.new(1, 0, 0, v29)
		end)
	end

	local t4 = {
		RoundedCorners = if not hasRadius then nil else React.createElement(Image, {
			Image = v14.media,
			imageStyle = v14.mediaStyle,
			backgroundStyle = v14.backgroundStyle,
			aspectRatio = v14.aspectRatio,
			tag = "radius-large",
			Size = uDim2,
			testId = `{ testId }--full-bleed--rounded-corners`,
			ZIndex = 1
		}),
		Image = React.createElement(Image, {
			Image = v14.media,
			imageStyle = v14.mediaStyle,
			backgroundStyle = v14.backgroundStyle,
			aspectRatio = v14.aspectRatio,
			onAbsoluteSizeChanged = if v14.sticky then nil else v22,
			Size = uDim2,
			ZIndex = 0
		}, if not hasRadius then nil else {
			TransparencyGradient = React.createElement(Gradient, {
				fillDirection = Enum.FillDirection.Vertical,
				top = false
			})
		}),
		Content = if not v14.children then nil else React.createElement(View, {
			aspectRatio = v14.aspectRatio,
			Size = uDim2,
			ZIndex = 2
		}, v14.children)
	}
	local v26 = React.createElement(View, {
		Size = v24,
		aspectRatio = if not v14.sticky then nil else v14.aspectRatio,
		LayoutOrder = if not v14.sticky then nil else Constants.MIN_LAYOUT_ORDER,
		ClipsDescendants = true,
		ZIndex = 2,
		testId = `{ testId }--full-bleed`,
		ref = p1
	}, if v14.sticky or not v14.aspectRatio then t4 else React.createElement(View, {
		Size = UDim2.new(1, 0, 0, 9999),
		aspectRatio = v14.aspectRatio
	}, t4))

	if not v14.sticky then
		return React.createElement("Folder", nil, v26)
	end

	return v26
end))
