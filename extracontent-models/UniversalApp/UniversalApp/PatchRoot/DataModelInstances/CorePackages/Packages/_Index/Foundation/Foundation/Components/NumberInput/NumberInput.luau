local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local ReactIs = require(FoundationParent.ReactIs)
local ReactUtils = require(FoundationParent.ReactUtils)
local Components = Foundation.Components
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local InputSize = require(Foundation.Enums.InputSize)

require(Foundation.Enums.InputLabelSize)

local InputVariant = require(Foundation.Enums.InputVariant)
local NumberInputControlsVariant = require(Foundation.Enums.NumberInputControlsVariant)
local OnChangeCallbackReason = require(Foundation.Enums.OnChangeCallbackReason)
local Flags = require(Foundation.Utility.Flags)
local Icon = require(Components.Icon)
local InputField = require(Components.InputField)
local InternalTextInput = require(Components.InternalTextInput)

require(Components.Types)

local View = require(Components.View)
local getBindableValue = require(Foundation.Utility.getBindableValue)
local getInputTextSize = require(Foundation.Utility.getInputTextSize)
local joinBindables = require(Foundation.Utility.joinBindables)
local mapBindable = require(Foundation.Utility.mapBindable)
local useTextInputVariants = require(Components.TextInput.useTextInputVariants)
local useTokens = require(Foundation.Providers.Style.useTokens)
local NumberInputControls = require(script.Parent.NumberInputControls)
local useNumberInputVariants = require(script.Parent.useNumberInputVariants)
local calculateNumberInputValueFromPositions = require(script.Parent.calculateNumberInputValueFromPositions)
local t1 = {
	variant = if not Flags.FoundationNumberInputVariant then nil else InputVariant.Standard,
	controlsVariant = NumberInputControlsVariant.Stacked,
	size = InputSize.Large,
	minimum = -1e999,
	maximum = 1e999,
	step = 1,
	precision = 3,
	value = 0,
	formatAsString = function(n1: number) --[[ defaultFormatAsString ]] -- line: 93
		return (tostring(n1))
	end,
	isScrubbable = false,
	testId = "--foundation-number-input"
}

return React.memo(React.forwardRef(function(p1, p2) --[[ NumberInput ]] -- line: 111
	-- upvalues: withDefaults (copy), t1 (copy), Flags (copy), InputVariant (copy), useTokens (copy), useTextInputVariants (copy), useNumberInputVariants (copy), React (copy), ReactUtils (copy), mapBindable (copy), getBindableValue (copy), OnChangeCallbackReason (copy), NumberInputControls (copy), NumberInputControlsVariant (copy), calculateNumberInputValueFromPositions (copy), ReactIs (copy), InputField (copy), withCommonProps (copy), getInputTextSize (copy), InternalTextInput (copy), joinBindables (copy), View (copy), Icon (copy)
	local v34 = withDefaults(p1, t1)

	if Flags.FoundationNumberInputVariant and v34.variant == nil then
		v34.variant = InputVariant.Standard
	end

	local v35 = useTokens()
	local v36 = useTextInputVariants(v35, v34.size, if not Flags.FoundationNumberInputVariant then nil else v34.variant)
	local v37 = useNumberInputVariants(v35, v34.size, v34.controlsVariant)
	local v38 = React.useRef(nil)
	local v39 = ReactUtils.useComposedRef(v38, v34.textBoxRef)
	local v40 = React.useRef(nil)
	local v41 = React.useCallback(function() -- line: 156
		-- upvalues: v38 (copy)
		if v38.current then
			return (v38.current.getIsFocused())
		end

		return false
	end, {})
	local v42, v43 = React.useState(false)
	local v44 = v34.hasError or v42
	local controlsVariant = v34.controlsVariant
	local v46 = React.useCallback(function(n2: number) -- line: 164
		-- upvalues: v34 (copy)
		return (math.clamp(n2, v34.minimum, v34.maximum))
	end, {
		v34.minimum,
		v34.maximum
	})
	local v47 = React.useCallback(function(n3: number, p3: ((...any) -> ...any)) -- line: 168
		-- upvalues: v34 (copy)
		return p3(n3 / v34.step) * v34.step
	end, { v34.step })
	local v48 = React.useMemo(function() -- line: 172
		-- upvalues: Flags (copy), mapBindable (copy), v34 (copy), v47 (copy), v46 (copy)
		if Flags.FoundationNumberInputBindableValue then
			return mapBindable(v34.value, function(p4) -- line: 174
				-- upvalues: v34 (copy), v47 (copy), v46 (copy)
				local v114 = 10 ^ (v34.precision or 0)
				local v115 = math.floor(p4 * v114 + 0.5) / v114
				local v116 = p4 + v34.step
				local v117 = 10 ^ (v34.precision or 0)
				local v118 = math.floor(v116 * v117 + 0.5) / v117
				local v119 = v47(p4, math.ceil)
				local v120 = 10 ^ (v34.precision or 0)
				local v121 = math.floor(v119 * v120 + 0.5) / v120

				if v115 ~= v121 then
					v118 = v121
				end

				return v46(v118)
			end)
		end

		local value = v34.value
		local v75 = 10 ^ (v34.precision or 0)
		local v76 = math.floor(value * v75 + 0.5) / v75
		local v77 = v34.value + v34.step
		local v78 = 10 ^ (v34.precision or 0)
		local v79 = math.floor(v77 * v78 + 0.5) / v78
		local v80 = v47(v34.value, math.ceil)
		local v81 = 10 ^ (v34.precision or 0)
		local v82 = math.floor(v80 * v81 + 0.5) / v81

		if v76 ~= v82 then
			v79 = v82
		end

		return v46(v79)
	end, {
		v34.value,
		v34.step,
		v34.precision,
		v46,
		v47
	})
	local v49 = React.useMemo(function() -- line: 194
		-- upvalues: Flags (copy), mapBindable (copy), v34 (copy), v47 (copy), v46 (copy)
		if Flags.FoundationNumberInputBindableValue then
			return mapBindable(v34.value, function(p5) -- line: 196
				-- upvalues: v34 (copy), v47 (copy), v46 (copy)
				local v123 = 10 ^ (v34.precision or 0)
				local v124 = math.floor(p5 * v123 + 0.5) / v123
				local v125 = p5 - v34.step
				local v126 = 10 ^ (v34.precision or 0)
				local v127 = math.floor(v125 * v126 + 0.5) / v126
				local v128 = v47(p5, math.floor)
				local v129 = 10 ^ (v34.precision or 0)
				local v130 = math.floor(v128 * v129 + 0.5) / v129

				if v124 ~= v130 then
					v127 = v130
				end

				return v46(v127)
			end)
		end

		local value = v34.value
		local v84 = 10 ^ (v34.precision or 0)
		local v85 = math.floor(value * v84 + 0.5) / v84
		local v86 = v34.value - v34.step
		local v87 = 10 ^ (v34.precision or 0)
		local v88 = math.floor(v86 * v87 + 0.5) / v87
		local v89 = v47(v34.value, math.floor)
		local v90 = 10 ^ (v34.precision or 0)
		local v91 = math.floor(v89 * v90 + 0.5) / v90

		if v85 ~= v91 then
			v88 = v91
		end

		return v46(v88)
	end, {
		v34.value,
		v34.step,
		v34.precision,
		v46,
		v47
	})
	local v50 = React.useMemo(function() -- line: 216
		-- upvalues: Flags (copy), mapBindable (copy), v34 (copy)
		if Flags.FoundationNumberInputBindableValue then
			return (mapBindable(v34.value, function(p6) -- line: 218
				-- upvalues: v34 (copy)
				return v34.isDisabled or p6 == v34.maximum
			end))
		end

		return v34.isDisabled or v34.value == v34.maximum
	end, {
		v34.isDisabled,
		v34.value,
		v34.maximum
	})
	local v51 = React.useMemo(function() -- line: 224
		-- upvalues: Flags (copy), mapBindable (copy), v34 (copy)
		if Flags.FoundationNumberInputBindableValue then
			return (mapBindable(v34.value, function(p7) -- line: 226
				-- upvalues: v34 (copy)
				return v34.isDisabled or p7 == v34.minimum
			end))
		end

		return v34.isDisabled or v34.value == v34.minimum
	end, {
		v34.isDisabled,
		v34.value,
		v34.minimum
	})
	local v52 = React.useCallback(function(n4: number) -- line: 232
		-- upvalues: v34 (copy)
		local v93 = math.clamp(n4, v34.minimum, v34.maximum)
		local v94 = 10 ^ (v34.precision or 0)

		return math.floor(v93 * v94 + 0.5) / v94
	end, {
		v34.minimum,
		v34.maximum,
		v34.precision
	})
	local v53, v54 = React.useBinding(v34.formatAsString(v52(if not Flags.FoundationNumberInputBindableValue then v34.value else getBindableValue(v34.value))))
	local v55 = if not v34.width then UDim.new(0, v37.container.width) else v34.width
	local v56 = if Flags.FoundationNumberInputBindableValue then nil else React.useMemo(function() -- line: 253
		-- upvalues: v34 (copy), v46 (copy)
		if v34.value and (v34.maximum and v34.minimum) then
			local v95 = v46(v34.value)

			if v34.maximum == v34.minimum then
				return 1
			end

			return (v95 - v34.minimum) / (v34.maximum - v34.minimum)
		end

		return 0
	end, {
		v34.value,
		v34.maximum,
		v34.minimum,
		v46
	})
	local v57 = React.useCallback(function() -- line: 266
		-- upvalues: v54 (copy), Flags (copy), getBindableValue (copy), v34 (copy)
		v54((tostring(if not Flags.FoundationNumberInputBindableValue then v34.value else getBindableValue(v34.value))))

		if v34.onFocusGained then
			v34.onFocusGained()
		end
	end, {
		v34.onFocusGained,
		v34.value
	})
	local v58 = React.useCallback(function(n5: number, p8) -- line: 280
		-- upvalues: v52 (copy), v54 (copy), v41 (copy), v34 (copy)
		local v98 = v52(n5)

		v54(if not v41() then v34.formatAsString(v98) else tostring(v98))
		v34.onChanged(v98, p8)
	end, {
		v34.onChanged,
		v34.formatAsString,
		v52,
		v41
	})
	local v59 = React.useCallback(function(p9) -- line: 286
		-- upvalues: v43 (copy), v58 (copy), Flags (copy), getBindableValue (copy), v34 (copy), OnChangeCallbackReason (copy)
		v43(false)
		v58(if not Flags.FoundationNumberInputBindableValue then v34.value else getBindableValue(v34.value), OnChangeCallbackReason.FocusLost)

		if v34.onFocusLost then
			v34.onFocusLost(p9)
		end
	end, {
		v58,
		v34.onFocusLost,
		v34.value,
		v52
	})
	local v60 = React.useCallback(function(p10) -- line: 298
		-- upvalues: v54 (copy), v41 (copy), v43 (copy), v34 (copy), OnChangeCallbackReason (copy)
		v54(p10)

		if not v41() then
			return
		end

		local num = tonumber(p10)

		if num == nil then
			v43(true)

			return
		end

		v43(false)
		v34.onChanged(num, OnChangeCallbackReason.Keyboard)
	end, {
		v41,
		v34.onChanged
	})
	local v61 = React.useCallback(function() -- line: 314
		-- upvalues: Flags (copy), getBindableValue (copy), v50 (copy), v58 (copy), v48 (copy), OnChangeCallbackReason (copy)
		if if not Flags.FoundationNumberInputBindableValue then v50 else getBindableValue(v50) then
			return
		end

		v58(if not Flags.FoundationNumberInputBindableValue then v48 else getBindableValue(v48), OnChangeCallbackReason.Activate)
	end, {
		v50,
		v48,
		v58
	})
	local v62 = React.useCallback(function() -- line: 324
		-- upvalues: Flags (copy), getBindableValue (copy), v51 (copy), v58 (copy), v49 (copy), OnChangeCallbackReason (copy)
		if if not Flags.FoundationNumberInputBindableValue then v51 else getBindableValue(v51) then
			return
		end

		v58(if not Flags.FoundationNumberInputBindableValue then v49 else getBindableValue(v49), OnChangeCallbackReason.Activate)
	end, {
		v51,
		v49,
		v58
	})
	local v63 = React.createElement(NumberInputControls, {
		variant = if not Flags.FoundationNumberInputVariant then nil else v34.variant,
		controlsVariant = controlsVariant,
		size = v34.size,
		increment = {
			isDisabled = v50,
			onClick = v61
		},
		decrement = {
			isDisabled = v51,
			onClick = v62
		},
		testId = v34.testId
	})
	local v64 = React.useMemo(function() -- line: 350
		-- upvalues: controlsVariant (copy), NumberInputControlsVariant (copy), v37 (copy), v35 (copy)
		if controlsVariant == NumberInputControlsVariant.Split then
			return UDim.new(0, 2 * v37.splitButton.size + 2 * v35.Gap.XSmall)
		end

		return UDim.new()
	end, {
		v35,
		controlsVariant,
		v37.splitButton.size,
		v35.Gap.XSmall
	})
	local v65 = React.useCallback(function(_, vector2: Vector2) -- line: 360
		-- upvalues: v34 (copy), v40 (copy), Flags (copy), getBindableValue (copy)
		local value = v34.value

		if value then
			v40.current = {
				position = vector2.X,
				value = if not Flags.FoundationNumberInputBindableValue then value else getBindableValue(value)
			}
		end
	end, { v34.value })
	local v66 = React.useCallback(function(_, vector2: Vector2) -- line: 370
		-- upvalues: v40 (copy), calculateNumberInputValueFromPositions (copy), v34 (copy), v58 (copy), OnChangeCallbackReason (copy)
		if v40.current then
			local v107 = calculateNumberInputValueFromPositions(v40.current.value, v40.current.position, vector2.X, v34.step)

			v58(v107, OnChangeCallbackReason.Drag)
		end
	end, {
		v58,
		v34.step,
		v52
	})
	local v67 = React.useCallback(function() -- line: 382
		-- upvalues: v40 (copy)
		if v40.current then
			v40.current = nil
		end
	end, {})
	local Shift_300Transparency = v35.Color.Shift.Shift_300.Transparency
	local Shift_100Transparency = v35.Color.Shift.Shift_100.Transparency
	local v70 = React.useMemo(function() -- line: 391
		-- upvalues: Flags (copy), mapBindable (copy), v34 (copy), v46 (copy), Shift_100Transparency (copy), Shift_300Transparency (copy), v56 (copy)
		if Flags.FoundationNumberInputBindableValue then
			return mapBindable(v34.value, function(p13) -- line: 393
				-- upvalues: v34 (copy), v46 (copy), Shift_100Transparency (copy), Shift_300Transparency (copy)
				local n6 = 0

				if p13 and (v34.maximum and v34.minimum) then
					local v135 = v46(p13)

					n6 = if v34.maximum ~= v34.minimum then (v135 - v34.minimum) / (v34.maximum - v34.minimum) else 1
				end

				if n6 == 0 then
					return NumberSequence.new(Shift_100Transparency)
				end

				if n6 == 1 then
					return NumberSequence.new(Shift_300Transparency)
				end

				if n6 > 0 or n6 < 1 then
					local t2 = {
						NumberSequenceKeypoint.new(0, Shift_300Transparency),
						NumberSequenceKeypoint.new(n6, Shift_300Transparency),
						NumberSequenceKeypoint.new(math.min(n6 + 0.001, 1), Shift_100Transparency)
					}

					if n6 < 0.999 then
						table.insert(t2, NumberSequenceKeypoint.new(1, Shift_100Transparency))
					end

					return NumberSequence.new(t2)
				end

				return NumberSequence.new(Shift_100Transparency)
			end)
		end

		if v56 == 0 then
			return NumberSequence.new(Shift_100Transparency)
		end

		if v56 == 1 then
			return NumberSequence.new(Shift_300Transparency)
		end

		if v56 > 0 or v56 < 1 then
			local t3 = {
				NumberSequenceKeypoint.new(0, Shift_300Transparency),
				NumberSequenceKeypoint.new(v56, Shift_300Transparency),
				NumberSequenceKeypoint.new(math.min(v56 + 0.001, 1), Shift_100Transparency)
			}

			if v56 < 0.999 then
				table.insert(t3, NumberSequenceKeypoint.new(1, Shift_100Transparency))
			end

			return NumberSequence.new(t3)
		end

		return NumberSequence.new(Shift_100Transparency)
	end, {
		Shift_300Transparency,
		Shift_100Transparency,
		v34.value,
		v46,
		v34.maximum,
		v34.minimum,
		if not Flags.FoundationNumberInputBindableValue then v56 else nil
	})

	React.useEffect(function() -- line: 459
		-- upvalues: Flags (copy), ReactIs (copy), v34 (copy), v41 (copy), v54 (copy), v52 (copy)
		local v109 = Flags.FoundationNumberInputBindableValue and ReactIs.isBinding(v34.value)

		if not v41() and not v109 then
			v54(v34.formatAsString(v52(v34.value)))
		end
	end, {
		v34.value,
		v34.formatAsString,
		v52,
		v41
	})

	return React.createElement(InputField, withCommonProps(v34, {
		width = v55,
		ref = p2,
		hasError = v44,
		label = v34.label,
		size = getInputTextSize(v34.size),
		isRequired = v34.isRequired,
		isDisabled = if not Flags.FoundationNumberInputDisabledField then nil else v34.isDisabled,
		hint = v34.hint,
		textBoxRef = v39,
		input = function(p14) --[[ input ]] -- line: 478
			-- upvalues: controlsVariant (copy), NumberInputControlsVariant (copy), React (copy), InternalTextInput (copy), Flags (copy), joinBindables (copy), v53 (copy), v34 (copy), v41 (copy), v52 (copy), v44 (copy), v36 (copy), v60 (copy), v59 (copy), v57 (copy), v65 (copy), v66 (copy), v67 (copy), v70 (copy), v35 (copy), v63 (copy), View (copy), Icon (copy), v55 (copy), v64 (copy)
			local v111 = controlsVariant == NumberInputControlsVariant.Split
			local v112 = React.createElement(InternalTextInput, {
				text = if not Flags.FoundationNumberInputBindableValue then v53:map(function(p15) -- line: 493
					-- upvalues: v41 (copy), v34 (copy), v52 (copy)
					if v41() then
						return p15
					end

					return v34.formatAsString(v52(v34.value))
				end) else joinBindables({
					text = v53,
					value = v34.value
				}, function(p16) -- line: 486
					-- upvalues: v41 (copy), v34 (copy), v52 (copy)
					if v41() then
						return p16.text
					end

					return v34.formatAsString(v52(p16.value))
				end),
				hasError = v44,
				variant = if not Flags.FoundationNumberInputVariant then nil else v34.variant,
				size = v34.size,
				horizontalPadding = {
					left = ((if not Flags.FoundationInputVariantsConsolidateContainer then v36.innerContainer else v36.container)).horizontalPadding
				},
				onChanged = v60,
				onFocusLost = v59,
				onFocus = v57,
				onDragStarted = if not v34.isScrubbable then nil else v65,
				onDrag = if not v34.isScrubbable then nil else v66,
				onDragEnded = if not v34.isScrubbable then nil else v67,
				onReturnPressed = v34.onReturnPressed,
				ref = p14,
				backgroundGradient = if not v34.isScrubbable or not v70 then nil else React.createElement("UIGradient", {
					Color = ColorSequence.new(v35.Color.Shift.Shift_300.Color3),
					Transparency = v70,
					Rotation = 0
				}),
				trailingElement = if controlsVariant ~= NumberInputControlsVariant.Stacked then nil else v63,
				leadingElement = if not v34.leadingIcon then nil else React.createElement(View, {
					tag = "row align-y-center size-0-full auto-x"
				}, React.createElement(Icon, {
					name = v34.leadingIcon,
					style = v36.icon.style,
					size = v36.icon.size
				})),
				isDisabled = v34.isDisabled,
				testId = `{ v34.testId }--field`
			})

			if v111 then
				return (React.createElement(View, {
					Size = UDim2.fromOffset(v55.Offset - v64.Offset, 0),
					tag = "row align-y-center gap-xsmall auto-y"
				}, {
					InputField = v112,
					Controls = if not v111 then nil else v63
				}))
			end

			return v112
		end
	}))
end))
