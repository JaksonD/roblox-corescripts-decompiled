local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Components = Foundation.Components
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local InputSize = require(Foundation.Enums.InputSize)

require(Foundation.Enums.InputLabelSize)

local NumberInputControlsVariant = require(Foundation.Enums.NumberInputControlsVariant)
local OnChangeCallbackReason = require(Foundation.Enums.OnChangeCallbackReason)
local Icon = require(Components.Icon)
local InputField = require(Components.InputField)
local InternalTextInput = require(Components.InternalTextInput)

require(Components.Types)

local View = require(Components.View)
local getInputTextSize = require(Foundation.Utility.getInputTextSize)
local useTextInputVariants = require(Components.TextInput.useTextInputVariants)
local useTokens = require(Foundation.Providers.Style.useTokens)
local NumberInputControls = require(script.Parent.NumberInputControls)
local useNumberInputVariants = require(script.Parent.useNumberInputVariants)
local calculateNumberInputValueFromPositions = require(script.Parent.calculateNumberInputValueFromPositions)
local t1 = {
	controlsVariant = NumberInputControlsVariant.Stacked,
	size = InputSize.Large,
	minimum = -1e999,
	maximum = 1e999,
	step = 1,
	precision = 3,
	value = 0,
	formatAsString = function(n1: number) --[[ defaultFormatAsString ]] -- line: 80
		return (tostring(n1))
	end,
	isScrubbable = false,
	testId = "--foundation-number-input"
}

return React.memo(React.forwardRef(function(p1, p2) --[[ NumberInput ]] -- line: 97
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), useTextInputVariants (copy), useNumberInputVariants (copy), React (copy), OnChangeCallbackReason (copy), NumberInputControls (copy), NumberInputControlsVariant (copy), calculateNumberInputValueFromPositions (copy), InputField (copy), withCommonProps (copy), getInputTextSize (copy), InternalTextInput (copy), View (copy), Icon (copy)
	local v27 = withDefaults(p1, t1)
	local v28 = useTokens()
	local v29 = useTextInputVariants(v28, v27.size)
	local v30 = useNumberInputVariants(v28, v27.size, v27.controlsVariant)
	local v31, v32 = React.useState(false)
	local v33 = React.useRef(nil)
	local v34, v35 = React.useState(false)
	local v36 = v27.hasError or v34
	local controlsVariant = v27.controlsVariant
	local v38 = React.useCallback(function(n2: number) -- line: 136
		-- upvalues: v27 (copy)
		return (math.clamp(n2, v27.minimum, v27.maximum))
	end, {
		v27.minimum,
		v27.maximum
	})
	local v39 = React.useCallback(function(n3: number, p3: ((...any) -> ...any)) -- line: 140
		-- upvalues: v27 (copy)
		return p3(n3 / v27.step) * v27.step
	end, { v27.step })
	local u40 = nil
	local u41 = nil
	local u42 = nil
	local u43 = nil

	if not v31 then
		local value = v27.value
		local v45 = 10 ^ (v27.precision or 0)
		local v46 = math.floor(value * v45 + 0.5) / v45
		local v47 = v27.value + v27.step
		local v48 = 10 ^ (v27.precision or 0)
		local v49 = math.floor(v47 * v48 + 0.5) / v48
		local v50 = v27.value - v27.step
		local v51 = 10 ^ (v27.precision or 0)
		local v52 = math.floor(v50 * v51 + 0.5) / v51
		local v53 = v39(v27.value, math.ceil)
		local v54 = 10 ^ (v27.precision or 0)
		local v55 = math.floor(v53 * v54 + 0.5) / v54
		local v56 = v39(v27.value, math.floor)
		local v57 = 10 ^ (v27.precision or 0)
		local v58 = math.floor(v56 * v57 + 0.5) / v57

		if v46 ~= v55 then
			v49 = v55
		end

		if v46 ~= v58 then
			v52 = v58
		end

		u42 = v38(v49)
		u43 = v38(v52)
		u40 = v27.value == v27.maximum
		u41 = v27.value == v27.minimum
	end

	local v61

	if v27.value then
		local value = v27.value
		local v60 = 10 ^ (v27.precision or 0)

		v61 = math.floor(value * v60 + 0.5) / v60
	else
		v61 = 0
	end

	local v62 = if not v31 then v27.formatAsString(v61) else tostring(v27.value)
	local v63 = React.useRef(v62)

	v63.current = tostring(v27.value)

	local v64 = if not v27.width then UDim.new(0, v30.container.width) else v27.width
	local v65 = React.useMemo(function() -- line: 178
		-- upvalues: v27 (copy), v38 (copy)
		if v27.value and (v27.maximum and v27.minimum) then
			local v82 = v38(v27.value)

			if v27.maximum == v27.minimum then
				return 1
			end

			return (v82 - v27.minimum) / (v27.maximum - v27.minimum)
		end

		return 0
	end, {
		v27.value,
		v27.maximum,
		v27.minimum
	})
	local v66 = React.useCallback(function() -- line: 190
		-- upvalues: v32 (copy), v27 (copy)
		v32(true)

		if v27.onFocusGained then
			v27.onFocusGained()
		end
	end, {
		v32,
		v27.onFocusGained
	})
	local v67 = React.useCallback(function(p4) -- line: 198
		-- upvalues: v32 (copy), v35 (copy), v27 (copy), OnChangeCallbackReason (copy)
		v32(false)
		v35(false)

		local v84 = math.clamp(v27.value, v27.minimum, v27.maximum)
		local onChanged = v27.onChanged
		local v86 = 10 ^ (v27.precision or 0)

		onChanged(math.floor(v84 * v86 + 0.5) / v86, OnChangeCallbackReason.FocusLost)

		if v27.onFocusLost then
			v27.onFocusLost(p4)
		end
	end, {
		v32,
		v27.onChanged,
		v27.onFocusLost,
		v27.maximum,
		v27.minimum,
		v27.precision,
		v27.value
	})
	local v68 = React.useCallback(function(p5) -- line: 210
		-- upvalues: v31 (copy), v35 (copy), v27 (copy), OnChangeCallbackReason (copy)
		if not v31 then
			return
		end

		local num = tonumber(p5)

		if num == nil then
			v35(true)

			return
		end

		v35(false)
		v27.onChanged(num, OnChangeCallbackReason.Keyboard)
	end, {
		v31,
		v27.onChanged
	})
	local v69 = React.useCallback(function() -- line: 225
		-- upvalues: v27 (copy), u40 (ref), u42 (ref), OnChangeCallbackReason (copy)
		if v27.isDisabled or u40 then
			return
		end

		v27.onChanged(u42, OnChangeCallbackReason.Activate)
	end, {
		v27.isDisabled,
		u40,
		u42,
		v27.onChanged
	})
	local v70 = React.useCallback(function() -- line: 232
		-- upvalues: v27 (copy), u41 (ref), u43 (ref), OnChangeCallbackReason (copy)
		if v27.isDisabled or u41 then
			return
		end

		v27.onChanged(u43, OnChangeCallbackReason.Activate)
	end, {
		v27.isDisabled,
		u41,
		u43,
		v27.onChanged
	})
	local v71 = React.createElement(NumberInputControls, {
		variant = nil,
		controlsVariant = controlsVariant,
		size = v27.size,
		increment = {
			isDisabled = v27.isDisabled or u40,
			onClick = v69
		},
		decrement = {
			isDisabled = v27.isDisabled or u41,
			onClick = v70
		},
		testId = v27.testId
	})
	local v72 = React.useMemo(function() -- line: 254
		-- upvalues: controlsVariant (copy), NumberInputControlsVariant (copy), v30 (copy), v28 (copy)
		if controlsVariant == NumberInputControlsVariant.Split then
			return UDim.new(0, 2 * v30.splitButton.size + 2 * v28.Gap.XSmall)
		end

		return UDim.new()
	end, {
		v28,
		controlsVariant
	})
	local v73 = React.useCallback(function(_, vector2: Vector2) -- line: 262
		-- upvalues: v63 (copy), v33 (copy)
		local num = tonumber(v63.current)

		if num then
			v33.current = {
				position = vector2.X,
				value = num
			}
		end
	end, {})
	local v74 = React.useCallback(function(_, vector2: Vector2) -- line: 269
		-- upvalues: v33 (copy), calculateNumberInputValueFromPositions (copy), v27 (copy), OnChangeCallbackReason (copy)
		if v33.current then
			local v94 = calculateNumberInputValueFromPositions(v33.current.value, v33.current.position, vector2.X, v27.step)
			local v95 = 10 ^ (v27.precision or 0)
			local v96 = math.clamp(math.floor(v94 * v95 + 0.5) / v95, v27.minimum, v27.maximum)

			v27.onChanged(v96, OnChangeCallbackReason.Drag)
		end
	end, { v27.onChanged })
	local v75 = React.useCallback(function() -- line: 282
		-- upvalues: v33 (copy)
		if v33.current then
			v33.current = nil
		end
	end, {})
	local Shift_300Transparency = v28.Color.Shift.Shift_300.Transparency
	local Shift_100Transparency = v28.Color.Shift.Shift_100.Transparency
	local v78 = React.useMemo(function() -- line: 290
		-- upvalues: v65 (copy), Shift_100Transparency (copy), Shift_300Transparency (copy)
		if v65 == 0 then
			return NumberSequence.new(Shift_100Transparency)
		end

		if v65 == 1 then
			return NumberSequence.new(Shift_300Transparency)
		end

		if v65 > 0 or v65 < 1 then
			local t2 = {
				NumberSequenceKeypoint.new(0, Shift_300Transparency),
				NumberSequenceKeypoint.new(v65, Shift_300Transparency),
				NumberSequenceKeypoint.new(math.min(v65 + 0.001, 1), Shift_100Transparency)
			}

			if v65 < 0.999 then
				table.insert(t2, NumberSequenceKeypoint.new(1, Shift_100Transparency))
			end

			return NumberSequence.new(t2)
		end

		return NumberSequence.new(Shift_100Transparency)
	end, {
		v65,
		Shift_300Transparency,
		Shift_100Transparency
	})

	return React.createElement(InputField, withCommonProps(v27, {
		width = v64,
		ref = p2,
		hasError = v36,
		label = v27.label,
		size = getInputTextSize(v27.size),
		isRequired = v27.isRequired,
		hint = v27.hint,
		textBoxRef = v27.textBoxRef,
		input = function(p8) --[[ input ]] -- line: 321
			-- upvalues: controlsVariant (copy), NumberInputControlsVariant (copy), React (copy), InternalTextInput (copy), v62 (copy), v36 (copy), v27 (copy), v29 (copy), v68 (copy), v67 (copy), v66 (copy), v73 (copy), v74 (copy), v75 (copy), v78 (copy), v28 (copy), v71 (copy), View (copy), Icon (copy), v64 (copy), v72 (copy)
			local v99 = controlsVariant == NumberInputControlsVariant.Split
			local v100 = React.createElement(InternalTextInput, {
				text = v62,
				hasError = v36,
				size = v27.size,
				horizontalPadding = {
					left = v29.innerContainer.horizontalPadding
				},
				onChanged = v68,
				onFocusLost = v67,
				onFocus = v66,
				onDragStarted = if not v27.isScrubbable then nil else v73,
				onDrag = if not v27.isScrubbable then nil else v74,
				onDragEnded = if not v27.isScrubbable then nil else v75,
				onReturnPressed = v27.onReturnPressed,
				ref = p8,
				backgroundGradient = if not v27.isScrubbable or not v78 then nil else React.createElement("UIGradient", {
					Color = ColorSequence.new(v28.Color.Shift.Shift_300.Color3),
					Transparency = v78,
					Rotation = 0
				}),
				trailingElement = if controlsVariant ~= NumberInputControlsVariant.Stacked then nil else v71,
				leadingElement = if not v27.leadingIcon then nil else React.createElement(View, {
					tag = "row align-y-center size-0-full auto-x"
				}, React.createElement(Icon, {
					name = v27.leadingIcon,
					style = v29.icon.style,
					size = v29.icon.size
				})),
				isDisabled = v27.isDisabled,
				testId = `{ v27.testId }--field`
			})

			if v99 then
				return (React.createElement(View, {
					Size = UDim2.fromOffset(v64.Offset - v72.Offset, 0),
					tag = "row align-y-center gap-xsmall auto-y"
				}, {
					InputField = v100,
					Controls = if not v99 then nil else v71
				}))
			end

			return v100
		end
	}))
end))
