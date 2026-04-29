local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Components = Foundation.Components
local Icon = require(Components.Icon)
local IconButton = require(Components.IconButton)
local InputField = require(Components.InputField)
local InternalTextInput = require(Components.InternalTextInput)

require(Foundation.Components.Types)

local View = require(Components.View)
local Flags = require(Foundation.Utility.Flags)
local useTextInputVariants = require(Foundation.Components.TextInput.useTextInputVariants)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local InputSize = require(Foundation.Enums.InputSize)

require(Foundation.Enums.InputVariant)

local getInputTextSize = require(Foundation.Utility.getInputTextSize)

require(Foundation.Enums.ControlState)

local t1 = {
	size = InputSize.Large,
	testId = "--foundation-text-input"
}

return React.memo(React.forwardRef(function(p1, p2) --[[ TextInput ]] -- line: 52
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), useTextInputVariants (copy), Flags (copy), React (copy), InputField (copy), withCommonProps (copy), getInputTextSize (copy), InternalTextInput (copy), View (copy), Icon (copy), IconButton (copy)
	local v20 = withDefaults(p1, t1)
	local v21 = useTokens()
	local v22 = useTextInputVariants(v21, v20.size, if not Flags.FoundationTextInputVariant then nil else v20.variant)

	return React.createElement(InputField, withCommonProps(v20, {
		width = v20.width,
		ref = p2,
		label = v20.label,
		size = getInputTextSize(v20.size),
		isRequired = v20.isRequired,
		isDisabled = if not Flags.FoundationTextInputDisabledField then nil else v20.isDisabled,
		hasError = v20.hasError,
		hint = v20.hint,
		textBoxRef = v20.textBoxRef,
		input = function(p3) --[[ input ]] -- line: 70
			-- upvalues: React (copy), InternalTextInput (copy), v20 (copy), Flags (copy), v22 (copy), View (copy), Icon (copy), IconButton (copy)
			return React.createElement(InternalTextInput, {
				ref = p3,
				hasError = v20.hasError,
				isDisabled = v20.isDisabled,
				hasClearButton = if not Flags.FoundationInternalTextInputClearButton then nil else v20.hasClearButton,
				text = v20.text,
				textInputType = v20.textInputType,
				focusBehavior = if not Flags.FoundationTextInputFocusBehavior then nil else v20.focusBehavior,
				size = v20.size,
				variant = if not Flags.FoundationTextInputVariant then nil else v20.variant,
				horizontalPadding = {
					left = ((if not Flags.FoundationInputVariantsConsolidateContainer then v22.innerContainer else v22.container)).horizontalPadding,
					right = ((if not Flags.FoundationInputVariantsConsolidateContainer then v22.innerContainer else v22.container)).horizontalPadding
				},
				onChanged = v20.onChanged,
				onFocus = v20.onFocusGained,
				onFocusLost = v20.onFocusLost,
				onReturnPressed = v20.onReturnPressed,
				placeholder = v20.placeholder,
				leadingElement = if not v20.leadingIcon then nil else React.createElement(View, {
					tag = "row align-y-center size-0-full auto-x"
				}, React.createElement(Icon, {
					name = v20.leadingIcon,
					style = v22.icon.style,
					size = v22.icon.size
				})),
				trailingElement = if not v20.iconTrailing then nil else React.createElement(View, {
					tag = "row align-y-center size-0-full auto-x"
				}, if type(v20.iconTrailing) ~= "table" or not v20.iconTrailing.onActivated then React.createElement(Icon, {
					name = if type(v20.iconTrailing) ~= "table" then v20.iconTrailing else v20.iconTrailing.name,
					style = v22.icon.style,
					size = v22.icon.size
				}) else React.createElement(IconButton, {
					onActivated = v20.iconTrailing.onActivated,
					isDisabled = v20.isDisabled,
					size = v22.icon.size,
					icon = v20.iconTrailing.name,
					testId = `{ v20.testId }--trailing-icon-button`
				})),
				testId = `{ v20.testId }--internal-text-input`
			})
		end
	}))
end))
