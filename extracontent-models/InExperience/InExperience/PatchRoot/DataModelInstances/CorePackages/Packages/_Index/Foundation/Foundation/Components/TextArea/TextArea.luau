local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Components = Foundation.Components
local InputField = require(Components.InputField)
local InternalTextInput = require(Components.InternalTextInput)

require(Foundation.Components.Types)

local Flags = require(Foundation.Utility.Flags)
local useTextInputVariants = require(Components.TextInput.useTextInputVariants)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local InputSize = require(Foundation.Enums.InputSize)

require(Foundation.Enums.InputVariant)
require(Foundation.Enums.ControlState)

local t1 = {
	size = InputSize.Medium,
	numLines = 3,
	testId = "--foundation-text-area"
}

return React.memo(React.forwardRef(function(p1, p2) --[[ TextArea ]] -- line: 39
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), useTextInputVariants (copy), Flags (copy), React (copy), InputField (copy), withCommonProps (copy), InternalTextInput (copy)
	local v16 = withDefaults(p1, t1)
	local v17 = useTokens()
	local v18 = useTextInputVariants(v17, v16.size, if not Flags.FoundationTextAreaVariant then nil else v16.variant)

	return React.createElement(InputField, withCommonProps(v16, {
		width = if not v16.width then nil else v16.width,
		label = v16.label,
		hint = v16.hint,
		hasError = v16.hasError,
		isDisabled = v16.isDisabled,
		isRequired = v16.isRequired,
		input = function(p3) --[[ input ]] -- line: 54
			-- upvalues: React (copy), InternalTextInput (copy), v16 (copy), Flags (copy), v18 (copy), v17 (copy)
			return React.createElement(InternalTextInput, {
				size = v16.size,
				variant = if not Flags.FoundationTextAreaVariant then nil else v16.variant,
				numLines = v16.numLines,
				focusBehavior = if not Flags.FoundationTextInputFocusBehavior then nil else v16.focusBehavior,
				onFocus = v16.onFocusGained,
				onFocusLost = v16.onFocusLost,
				onChanged = v16.onChanged,
				text = v16.text,
				hasError = v16.hasError,
				isDisabled = v16.isDisabled,
				hasClearButton = if not Flags.FoundationInternalTextInputClearButton then nil else v16.hasClearButton,
				placeholder = v16.placeholder,
				horizontalPadding = {
					left = ((if not Flags.FoundationInputVariantsConsolidateContainer then v18.innerContainer else v18.container)).horizontalPadding,
					right = ((if not Flags.FoundationInputVariantsConsolidateContainer then v18.innerContainer else v18.container)).horizontalPadding - UDim.new(0, v17.Size.Size_150)
				},
				LayoutOrder = 2,
				ref = p3,
				testId = `{ v16.testId }--input`
			})
		end,
		textBoxRef = v16.textBoxRef,
		ref = p2
	}))
end))
