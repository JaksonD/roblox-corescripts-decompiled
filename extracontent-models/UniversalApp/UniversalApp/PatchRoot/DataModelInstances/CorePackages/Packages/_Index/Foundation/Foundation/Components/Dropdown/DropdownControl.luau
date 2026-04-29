local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Components = Foundation.Components

require(Components.BaseMenu)

local View = require(Components.View)
local Icon = require(Components.Icon)
local InputField = require(Components.InputField)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)
local Text = require(Components.Text)

require(Foundation.Components.Types)

local Flags = require(Foundation.Utility.Flags)
local getInputTextSize = require(Foundation.Utility.getInputTextSize)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local useDropdownVariants = require(script.Parent.useDropdownVariants)

require(Foundation.Enums.InputSize)

local ControlState = require(Foundation.Enums.ControlState)

require(Foundation.Enums.CursorType)

local BuilderIcons = require(FoundationParent.BuilderIcons)
local ChevronLargeUp = BuilderIcons.Icon.ChevronLargeUp
local ChevronLargeDown = BuilderIcons.Icon.ChevronLargeDown
local t1 = {
	isMenuOpen = false,
	placeholder = ""
}

return React.memo(React.forwardRef(function(p1, p2) --[[ DropdownControl ]] -- line: 56
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), React (copy), ControlState (copy), useDropdownVariants (copy), InputField (copy), withCommonProps (copy), getInputTextSize (copy), View (copy), StateLayerAffordance (copy), Text (copy), Icon (copy), ChevronLargeUp (copy), ChevronLargeDown (copy), Flags (copy)
	local v23 = withDefaults(p1, t1)
	local v24 = useTokens()
	local v25, v26 = React.useState(ControlState.Initialize)
	local v27 = v23.item == nil
	local v28 = useDropdownVariants(v24, v23.size, v25, v27, v23.hasError or false)
	local v29 = React.useMemo(function() -- line: 64
		-- upvalues: v24 (copy)
		return {
			radius = UDim.new(0, v24.Radius.Small),
			offset = v24.Size.Size_200,
			borderWidth = v24.Stroke.Thicker
		}
	end, { v24 })

	return React.createElement(InputField, withCommonProps(v23, {
		size = getInputTextSize(v23.size),
		hasError = v23.hasError,
		isDisabled = v23.isDisabled,
		label = v23.label,
		hint = v23.hint,
		ref = p2,
		width = v23.width,
		input = function(_) --[[ input ]] -- line: 82
			-- upvalues: React (copy), View (copy), v26 (copy), v23 (copy), v29 (copy), StateLayerAffordance (copy), v28 (copy), Text (copy), Icon (copy), ChevronLargeUp (copy), ChevronLargeDown (copy), Flags (copy), v24 (copy)
			return React.createElement(View, {
				onStateChanged = v26,
				isDisabled = v23.isDisabled,
				onActivated = v23.onActivated,
				selection = {
					Selectable = not v23.isDisabled
				},
				cursor = v29,
				stateLayer = {
					affordance = StateLayerAffordance.None
				},
				tag = v28.container.tag,
				ref = v23.inputRef,
				testId = `{ v23.testId }--control`
			}, {
				Text = React.createElement(Text, {
					LayoutOrder = 1,
					Text = if not v23.item then v23.placeholder else v23.item.text,
					tag = v28.text.tag
				}),
				Arrow = React.createElement(Icon, {
					LayoutOrder = 2,
					name = if not v23.isMenuOpen then ChevronLargeDown else ChevronLargeUp,
					size = v28.arrow.size,
					style = if not Flags.FoundationMutedDropdownArrow or not v23.isDisabled then nil else v24.Color.Content.Muted,
					tag = v28.text.tag,
					testId = if not Flags.FoundationMutedDropdownArrow then nil else `{ v23.testId }--arrow`
				})
			})
		end
	}))
end))
