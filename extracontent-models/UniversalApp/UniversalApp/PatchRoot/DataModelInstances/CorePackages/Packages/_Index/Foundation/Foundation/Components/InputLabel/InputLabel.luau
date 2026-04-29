local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Text = require(Foundation.Components.Text)
local React = require(FoundationParent.React)
local Translator = require(Foundation.Utility.Localization.Translator)
local Flags = require(Foundation.Utility.Flags)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)

require(Foundation.Components.Types)

local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local ControlState = require(Foundation.Enums.ControlState)
local InputLabelSize = require(Foundation.Enums.InputLabelSize)
local t1 = {
	size = InputLabelSize.Medium,
	testId = "--foundation-input-label"
}

return React.memo(React.forwardRef(function(p1, p2) --[[ InputLabel ]] -- line: 59
	-- upvalues: withDefaults (copy), t1 (copy), React (copy), ControlState (copy), Text (copy), withCommonProps (copy), Translator (copy), Flags (copy), StateLayerAffordance (copy), InputLabelSize (copy)
	local v17 = withDefaults(p1, t1)
	local v18 = React.useMemo(function() -- line: 61
		-- upvalues: v17 (copy), ControlState (copy)
		if v17.onHover ~= nil then
			return function(p3) -- line: 63
				-- upvalues: v17 (copy), ControlState (copy)
				v17.onHover(p3 == ControlState.Hover)
			end
		end

		return nil
	end, { v17.onHover })
	local createElement = React.createElement
	local v20 = Text
	local v21 = withCommonProps
	local t2 = {}
	local Text2 = v17.Text
	local isRequired = v17.isRequired

	t2.Text = if isRequired ~= nil and isRequired ~= React.None then if not isRequired then Translator:FormatByKey("CommonUI.Controls.Input.Optional", {
		inputLabel = Text2
	}) else Text2 .. "*" else Text2
	t2.RichText = v17.RichText
	t2.selection = {
		Selectable = false
	}
	t2.onActivated = if not not Flags.FoundationInputFieldFixDisabled and v17.isDisabled then nil else v17.onActivated
	t2.onStateChanged = if not not Flags.FoundationInputFieldFixDisabled and v17.isDisabled then nil else v18
	t2.stateLayer = {
		affordance = StateLayerAffordance.None
	}
	t2.textStyle = v17.textStyle
	t2.tag = {
		["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
		["content-muted"] = Flags.FoundationInputFieldFixDisabled and v17.isDisabled,
		["content-default"] = not Flags.FoundationInputFieldFixDisabled or not v17.isDisabled,
		["text-title-small"] = v17.size == InputLabelSize.Small,
		["text-title-medium"] = v17.size == InputLabelSize.Medium,
		["text-title-large"] = v17.size == InputLabelSize.Large
	}
	t2.ref = p2

	return createElement(v20, v21(v17, t2))
end))
