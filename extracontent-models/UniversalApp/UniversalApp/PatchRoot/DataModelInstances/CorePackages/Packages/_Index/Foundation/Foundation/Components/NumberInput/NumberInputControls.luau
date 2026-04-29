local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local BuilderIcons = require(FoundationParent.BuilderIcons)
local React = require(FoundationParent.React)
local ReactIs = require(FoundationParent.ReactIs)
local useTokens = require(Foundation.Providers.Style.useTokens)
local Components = Foundation.Components
local Flags = require(Foundation.Utility.Flags)
local Constants = require(Foundation.Constants)
local Icon = require(Components.Icon)
local Image = require(Components.Image)

require(Foundation.Components.Types)

local View = require(Components.View)
local blendTransparencies = require(Foundation.Utility.blendTransparencies)
local getDisabledStyle = require(Foundation.Utility.getDisabledStyle)
local mapBindable = require(Foundation.Utility.mapBindable)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local useNumberInputVariants = require(Components.NumberInput.useNumberInputVariants)
local useTextInputVariants = require(Components.TextInput.useTextInputVariants)

require(Foundation.Enums.InputSize)
require(Foundation.Enums.InputVariant)

local NumberInputControlsVariant = require(Foundation.Enums.NumberInputControlsVariant)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)

local function v21(p1) -- line: 63
	-- upvalues: useTokens (copy), React (copy), View (copy), withCommonProps (copy), Flags (copy), ReactIs (copy), mapBindable (copy)
	local v25 = useTokens()
	local uDim = UDim.new(0, v25.Radius.Medium)
	local v27 = React.useMemo(function() -- line: 67
		-- upvalues: uDim (copy), v25 (copy)
		return {
			radius = uDim,
			offset = v25.Size.Size_150,
			borderWidth = v25.Stroke.Thicker
		}
	end, { v25 })

	return React.createElement(View, withCommonProps(p1, {
		onActivated = p1.onActivated,
		isDisabled = (not Flags.FoundationNumberInputBindableValue or not ReactIs.isBinding(p1.isDisabled)) and p1.isDisabled,
		selection = {
			Selectable = if not Flags.FoundationNumberInputBindableValue then not p1.isDisabled else mapBindable(p1.isDisabled, function(p2) -- line: 84
				return not p2
			end)
		},
		cursor = v27,
		padding = p1.padding,
		cornerRadius = uDim,
		tag = p1.tag
	}), p1.children)
end
local function SplitControls(t1: {[any]: any}) -- line: 100
	-- upvalues: useTokens (copy), useNumberInputVariants (copy), useTextInputVariants (copy), Flags (copy), React (copy), getDisabledStyle (copy), mapBindable (copy), blendTransparencies (copy), Constants (copy), View (copy), ReactIs (copy), StateLayerAffordance (copy), Icon (copy), BuilderIcons (copy)
	local v29 = useTokens()
	local v30 = useNumberInputVariants(v29, t1.size, t1.controlsVariant)
	local v31 = useTextInputVariants(v29, t1.size, if not Flags.FoundationNumberInputVariant then nil else t1.variant)
	local v32 = if not Flags.FoundationInputVariantsConsolidateContainer then v31.outerView else v31.container
	local v33 = math.ceil(v29.Stroke.Standard) * 2
	local uDim2 = UDim2.fromOffset(v30.splitButton.size - v33, v30.splitButton.size - v33)
	local v35 = if not Flags.FoundationNumberInputVariant then nil else React.useCallback(function(b1: boolean) -- line: 121
		-- upvalues: v32 (copy), getDisabledStyle (copy)
		if v32.bgStyle then
			return (getDisabledStyle(v32.bgStyle, b1))
		end

		return nil
	end, { v32.bgStyle })
	local v36 = if not Flags.FoundationNumberInputVariant then nil else React.useCallback(function(p3) -- line: 129
		-- upvalues: v32 (copy), Flags (copy), mapBindable (copy), blendTransparencies (copy), Constants (copy)
		if v32.strokeStyle and v32.strokeThickness then
			return {
				Color = v32.strokeStyle.Color3,
				Transparency = if not Flags.FoundationNumberInputBindableValue then if not p3 then v32.strokeStyle.Transparency else blendTransparencies(v32.strokeStyle.Transparency, Constants.DISABLED_TRANSPARENCY) else mapBindable(p3, function(p4) -- line: 134
					-- upvalues: blendTransparencies (copy), v32 (copy), Constants (copy)
					if p4 then
						return (blendTransparencies(v32.strokeStyle.Transparency, Constants.DISABLED_TRANSPARENCY))
					end

					return v32.strokeStyle.Transparency
				end),
				Thickness = v32.strokeThickness,
				BorderStrokePosition = Enum.BorderStrokePosition.Inner
			}
		end

		return nil
	end, {
		v32.strokeStyle,
		v32.strokeThickness
	})

	return React.createElement(React.Fragment, {}, {
		ControlIncrement = React.createElement(View, {
			onActivated = t1.increment.onClick,
			isDisabled = (not Flags.FoundationNumberInputBindableValue or not ReactIs.isBinding(t1.increment.isDisabled)) and t1.increment.isDisabled,
			stateLayer = if not Flags.FoundationNumberInputBindableValue then nil else {
				affordance = mapBindable(t1.increment.isDisabled, function(p5) -- line: 163
					-- upvalues: StateLayerAffordance (copy)
					if p5 then
						return StateLayerAffordance.None
					end

					return StateLayerAffordance.Background
				end)
			},
			padding = v30.button.padding,
			Size = uDim2,
			backgroundStyle = if not Flags.FoundationNumberInputBindableValue then if not Flags.FoundationNumberInputVariant then getDisabledStyle(v29.Color.Shift.Shift_100, t1.increment.isDisabled) else v35(t1.increment.isDisabled) else mapBindable(t1.increment.isDisabled, function(p6) -- line: 171
				-- upvalues: Flags (copy), v35 (copy), getDisabledStyle (copy), v29 (copy)
				if Flags.FoundationNumberInputVariant then
					return (v35(p6))
				end

				return (getDisabledStyle(v29.Color.Shift.Shift_100, p6))
			end),
			stroke = if not Flags.FoundationNumberInputVariant then {
				Color = v29.Color.Stroke.Emphasis.Color3,
				Transparency = if not Flags.FoundationNumberInputBindableValue then math.lerp(v29.Color.Stroke.Emphasis.Transparency, 1, not t1.increment.isDisabled and 0 or Constants.DISABLED_TRANSPARENCY) else mapBindable(t1.increment.isDisabled, function(p7) -- line: 187
					-- upvalues: v29 (copy), Constants (copy)
					return (math.lerp(v29.Color.Stroke.Emphasis.Transparency, 1, not p7 and 0 or Constants.DISABLED_TRANSPARENCY))
				end),
				Thickness = v29.Stroke.Standard
			} else v36(t1.increment.isDisabled),
			tag = v30.splitButton.tag,
			LayoutOrder = 1,
			GroupTransparency = if Flags.FoundationNumberInputBindableValue or not t1.increment.isDisabled then nil else Constants.DISABLED_TRANSPARENCY,
			testId = `{ t1.testId }--increment`
		}, {
			Icon = React.createElement(Icon, {
				name = BuilderIcons.Icon.PlusSmall,
				size = t1.size,
				style = if not Flags.FoundationNumberInputBindableValue then nil else mapBindable(t1.increment.isDisabled, function(p8) -- line: 212
					-- upvalues: Constants (copy)
					return {
						Color3 = nil,
						Transparency = if not p8 then nil else Constants.DISABLED_TRANSPARENCY
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{ t1.testId }--increment-icon`
			})
		}),
		ControlDecrement = React.createElement(View, {
			onActivated = t1.decrement.onClick,
			isDisabled = (not Flags.FoundationNumberInputBindableValue or not ReactIs.isBinding(t1.decrement.isDisabled)) and t1.decrement.isDisabled,
			stateLayer = if not Flags.FoundationNumberInputBindableValue then nil else {
				affordance = mapBindable(t1.decrement.isDisabled, function(p9) -- line: 232
					-- upvalues: StateLayerAffordance (copy)
					if p9 then
						return StateLayerAffordance.None
					end

					return StateLayerAffordance.Background
				end)
			},
			padding = v30.button.padding,
			Size = uDim2,
			backgroundStyle = if not Flags.FoundationNumberInputBindableValue then if not Flags.FoundationNumberInputVariant then getDisabledStyle(v29.Color.Shift.Shift_100, t1.decrement.isDisabled) else v35(t1.decrement.isDisabled) else mapBindable(t1.decrement.isDisabled, function(p10) -- line: 240
				-- upvalues: Flags (copy), v35 (copy), getDisabledStyle (copy), v29 (copy)
				if Flags.FoundationNumberInputVariant then
					return (v35(p10))
				end

				return (getDisabledStyle(v29.Color.Shift.Shift_100, p10))
			end),
			stroke = if not Flags.FoundationNumberInputVariant then {
				Color = v29.Color.Stroke.Emphasis.Color3,
				Transparency = if not Flags.FoundationNumberInputBindableValue then math.lerp(v29.Color.Stroke.Emphasis.Transparency, 1, not t1.decrement.isDisabled and 0 or Constants.DISABLED_TRANSPARENCY) else mapBindable(t1.decrement.isDisabled, function(p11) -- line: 256
					-- upvalues: v29 (copy), Constants (copy)
					return (math.lerp(v29.Color.Stroke.Emphasis.Transparency, 1, not p11 and 0 or Constants.DISABLED_TRANSPARENCY))
				end),
				Thickness = v29.Stroke.Standard
			} else v36(t1.decrement.isDisabled),
			tag = v30.splitButton.tag,
			LayoutOrder = -1,
			GroupTransparency = if Flags.FoundationNumberInputBindableValue or not t1.decrement.isDisabled then nil else Constants.DISABLED_TRANSPARENCY,
			testId = `{ t1.testId }--decrement`
		}, {
			Icon = React.createElement(Icon, {
				name = BuilderIcons.Icon.MinusSmall,
				size = t1.size,
				style = if not Flags.FoundationNumberInputBindableValue then nil else mapBindable(t1.decrement.isDisabled, function(p12) -- line: 281
					-- upvalues: Constants (copy)
					return {
						Color3 = nil,
						Transparency = if not p12 then nil else Constants.DISABLED_TRANSPARENCY
					}
				end),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				testId = `{ t1.testId }--decrement-icon`
			})
		})
	})
end
local function StackedControls(t2: {[any]: any}) -- line: 296
	-- upvalues: useTokens (copy), useNumberInputVariants (copy), React (copy), Flags (copy), mapBindable (copy), Constants (copy), View (copy), v21 (copy), ReactIs (copy), Image (copy)
	local v38 = useTokens()
	local v39 = useNumberInputVariants(v38, t2.size, t2.controlsVariant)
	local v40 = React.useMemo(function() -- line: 300
		-- upvalues: Flags (copy), mapBindable (copy), t2 (copy), v38 (copy), Constants (copy)
		if Flags.FoundationNumberInputBindableValue then
			return (mapBindable(t2.increment.isDisabled, function(p13) -- line: 302
				-- upvalues: v38 (copy), Constants (copy)
				return {
					Color3 = v38.Color.Stroke.Emphasis.Color3,
					Transparency = not p13 and 0 or Constants.DISABLED_TRANSPARENCY
				}
			end))
		end

		return {
			Color3 = v38.Color.Stroke.Emphasis.Color3,
			Transparency = not t2.increment.isDisabled and 0 or Constants.DISABLED_TRANSPARENCY
		}
	end, {
		v38,
		t2.increment.isDisabled
	})
	local v41 = React.useMemo(function() -- line: 314
		-- upvalues: Flags (copy), mapBindable (copy), t2 (copy), v38 (copy), Constants (copy)
		if Flags.FoundationNumberInputBindableValue then
			return (mapBindable(t2.decrement.isDisabled, function(p14) -- line: 316
				-- upvalues: v38 (copy), Constants (copy)
				return {
					Color3 = v38.Color.Stroke.Emphasis.Color3,
					Transparency = not p14 and 0 or Constants.DISABLED_TRANSPARENCY
				}
			end))
		end

		return {
			Color3 = v38.Color.Stroke.Emphasis.Color3,
			Transparency = not t2.decrement.isDisabled and 0 or Constants.DISABLED_TRANSPARENCY
		}
	end, {
		v38,
		t2.decrement.isDisabled
	})

	return React.createElement(View, {
		tag = "col",
		Size = UDim2.new(0, v39.button.width, 1, 0),
		LayoutOrder = t2.LayoutOrder
	}, {
		ControlIncrement = React.createElement(v21, {
			onActivated = t2.increment.onClick,
			isDisabled = (not Flags.FoundationNumberInputBindableValue or not ReactIs.isBinding(t2.increment.isDisabled)) and t2.increment.isDisabled,
			padding = v39.button.padding,
			tag = v39.upButton.tag,
			testId = `{ t2.testId }--increment`
		}, {
			Icon = React.createElement(Image, {
				Image = "component_assets/triangleUp_16",
				imageStyle = v40,
				tag = v39.icon.tag,
				testId = `{ t2.testId }--increment-icon`
			})
		}),
		ControlDecrement = React.createElement(v21, {
			tag = v39.downButton.tag,
			onActivated = t2.decrement.onClick,
			isDisabled = (not Flags.FoundationNumberInputBindableValue or not ReactIs.isBinding(t2.decrement.isDisabled)) and t2.decrement.isDisabled,
			padding = v39.button.padding,
			testId = `{ t2.testId }--decrement`
		}, {
			Icon = React.createElement(Image, {
				Image = "component_assets/triangleDown_16",
				imageStyle = v41,
				tag = v39.icon.tag,
				testId = `{ t2.testId }--decrement-icon`
			})
		})
	})
end

return function(t3: {[any]: any}) --[[ NumberInputControls ]] -- line: 370
	-- upvalues: NumberInputControlsVariant (copy), React (copy), StackedControls (copy), SplitControls (copy)
	if t3.controlsVariant == NumberInputControlsVariant.Stacked then
		return React.createElement(StackedControls, t3)
	end

	return React.createElement(SplitControls, t3)
end
