local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Components = Foundation.Components
local HintText = require(Components.HintText)
local InputLabel = require(Components.InputLabel)

require(Components.Types)

local View = require(Components.View)
local Flags = require(Foundation.Utility.Flags)
local useScaledValue = require(Foundation.Utility.useScaledValue)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local Constants = require(Foundation.Constants)
local t1 = {
	size = require(Foundation.Enums.InputLabelSize).Small,
	testId = "--foundation-input-field"
}

return React.memo(React.forwardRef(function(p1, p2) --[[ InputField ]] -- line: 46
	-- upvalues: withDefaults (copy), t1 (copy), useScaledValue (copy), Constants (copy), React (copy), View (copy), withCommonProps (copy), InputLabel (copy), Flags (copy), HintText (copy)
	local v16 = withDefaults(p1, t1)
	local v17 = useScaledValue(Constants.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)
	local v18 = React.useRef(nil)
	local v19 = React.useCallback(function() -- line: 51
		-- upvalues: v18 (copy)
		if v18.current and not v18.current.getIsFocused() then
			v18.current.focus()
		end
	end, {})
	local v20 = React.useCallback(function(p3) -- line: 57
		-- upvalues: v18 (copy)
		if v18.current then
			v18.current.setHover(p3)
		end
	end, {})

	React.useImperativeHandle(v16.textBoxRef, function() -- line: 63
		-- upvalues: v18 (copy)
		if not v18.current then
			return nil
		end

		return {
			focus = v18.current.focus,
			releaseFocus = v18.current.releaseFocus,
			getIsFocused = v18.current.getIsFocused,
			getCursorPosition = v18.current.getCursorPosition,
			getSelectionStart = v18.current.getSelectionStart,
			setCursorPosition = v18.current.setCursorPosition,
			setSelectionStart = v18.current.setSelectionStart
		}
	end, {})

	return React.createElement(View, withCommonProps(v16, {
		Size = if v16.width then UDim2.new(v16.width, UDim.new(0, 0)) else UDim2.fromOffset(v17, 0),
		tag = "col gap-small auto-y",
		ref = p2
	}), {
		Label = if not (#v16.label > 0) then nil else React.createElement(InputLabel, {
			Text = v16.label,
			size = v16.size,
			isRequired = v16.isRequired,
			isDisabled = if not Flags.FoundationInputFieldFixDisabled then nil else v16.isDisabled,
			onActivated = v19,
			onHover = v20,
			LayoutOrder = 1,
			testId = `{ v16.testId }--label`
		}),
		InputWrapper = React.createElement(View, {
			tag = "size-full-0 auto-y",
			LayoutOrder = 2,
			testId = `{ v16.testId }--input-wrapper`
		}, {
			Input = v16.input(v18)
		}),
		Hint = if not v16.hint then nil else React.createElement(HintText, {
			text = v16.hint,
			hasError = v16.hasError,
			isDisabled = if not Flags.FoundationInputFieldFixDisabled then nil else v16.isDisabled,
			LayoutOrder = 3,
			testId = `{ v16.testId }--hint`
		})
	})
end))
