local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent

require(FoundationParent.BuilderIcons)
require(FoundationParent.Otter)

local React = require(FoundationParent.React)
local ReactOtter = require(FoundationParent.ReactOtter)
local Divider = require(Foundation.Components.Divider)
local Icon = require(Foundation.Components.Icon)
local Text = require(Foundation.Components.Text)
local Flags = require(Foundation.Utility.Flags)

require(Foundation.Components.Types)

local View = require(Foundation.Components.View)
local usePreferences = require(Foundation.Providers.Preferences.usePreferences)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local useAccordion = require(script.Parent.Parent.useAccordion)
local useTokens = require(Foundation.Providers.Style.useTokens)

require(Foundation.Enums.InputSize)
require(Foundation.Providers.Style.Tokens)

local useAccordionItemVariants = require(script.Parent.Parent.useAccordionItemVariants)
local t1 = {
	hasDivider = true,
	isExpanded = false
}

return React.memo(React.forwardRef(function(p1, p2) --[[ AccordionItem ]] -- line: 67
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), Flags (copy), usePreferences (copy), React (copy), ReactOtter (copy), useAccordion (copy), useAccordionItemVariants (copy), View (copy), withCommonProps (copy), Icon (copy), Text (copy), Divider (copy)
	local v20 = withDefaults(p1, t1)
	local v21 = useTokens()
	local v22 = if not Flags.FoundationReducedMotionAccordion then nil else usePreferences()
	local v23 = not not Flags.FoundationReducedMotionAccordion and v22.reducedMotion
	local v24 = React.useMemo(function() -- line: 72
		-- upvalues: v21 (copy)
		local v41 = v21

		return {
			easingStyle = v41.Ease.StandardOut,
			duration = v41.Time.Time_300
		}
	end, { v21 })
	local v25, v26 = React.useState(v20.isExpanded)
	local v27 = React.useRef(false)
	local v28, v29 = ReactOtter.useAnimatedBinding(0)
	local v30, v31 = ReactOtter.useAnimatedBinding(0, function() -- line: 80
		-- upvalues: v27 (copy), v26 (copy)
		if v27.current then
			v26(false)
			v27.current = false
		end
	end)
	local v32 = React.useRef(nil)
	local v33 = React.useCallback(function() -- line: 87
		-- upvalues: v23 (copy), v31 (copy), ReactOtter (copy), v29 (copy), v26 (copy), v27 (copy), v24 (copy)
		if v23 then
			v31((ReactOtter.instant(0)))
			v29((ReactOtter.instant(0)))
			v26(false)
			v27.current = false

			return
		end

		v27.current = true
		v31(ReactOtter.ease(0, v24))
		v29(ReactOtter.ease(0, v24))
	end, {
		v23,
		v24
	})
	local v34 = React.useCallback(function() -- line: 101
		-- upvalues: v32 (copy), v25 (copy), v23 (copy), v31 (copy), ReactOtter (copy), v24 (copy)
		if v32 and (v32.current and v25) then
			if v23 then
				v31((ReactOtter.instant(v32.current.AbsoluteSize.Y)))

				return
			end

			v31(ReactOtter.ease(v32.current.AbsoluteSize.Y, v24))
		end
	end, {
		v32,
		v25,
		v23,
		v24
	})

	React.useEffect(function() -- line: 111
		-- upvalues: v25 (copy), v20 (copy), v33 (copy), v26 (copy)
		if v25 and not v20.isExpanded then
			v33()

			return
		end

		v26(v20.isExpanded)
	end, { v20.isExpanded })
	React.useEffect(function() -- line: 119
		-- upvalues: v25 (copy), v23 (copy), v29 (copy), ReactOtter (copy), v24 (copy)
		if v25 then
			if v23 then
				v29((ReactOtter.instant(-180)))

				return
			end

			v29(ReactOtter.ease(-180, v24))
		end
	end, {
		v25,
		v23,
		v24
	})

	local v35 = useAccordion()
	local onAccordionItemActivated = v35.onAccordionItemActivated
	local itemSize = v35.itemSize
	local v38 = useAccordionItemVariants(v21, itemSize, false)
	local v39 = React.useCallback(function() -- line: 134
		-- upvalues: v25 (copy), v33 (copy), v26 (copy)
		if v25 then
			v33()

			return
		end

		v26(true)
	end, { v25 })
	local v40 = if not v20.onActivated then if not onAccordionItemActivated then v39 else onAccordionItemActivated(v20.id, v25) else v20.onActivated

	v20.testId = `{ v35.testId }--item-{ v20.id }`

	return React.createElement(View, withCommonProps(v20, {
		tag = v38.container.tag,
		AutomaticSize = Enum.AutomaticSize.Y,
		stateLayer = v38.container.stateLayer,
		ref = p2
	}), {
		Header = React.createElement(View, {
			LayoutOrder = 1,
			tag = v38.header.tag,
			onActivated = v40,
			testId = `{ v20.testId }--header`
		}, {
			LeadingIcon = if not v20.leadingIcon then nil else React.createElement(Icon, {
				LayoutOrder = 1,
				name = if type(v20.leadingIcon) ~= "table" then v20.leadingIcon else v20.leadingIcon.name,
				variant = if type(v20.leadingIcon) ~= "table" then nil else v20.leadingIcon.variant,
				style = v38.icon.style,
				size = v38.icon.size,
				testId = `{ v20.testId }--leading-icon`
			}),
			Title = React.createElement(Text, {
				LayoutOrder = 2,
				Text = v20.text,
				tag = v38.text.tag,
				testId = `{ v20.testId }--title`
			}),
			CollapseIcon = React.createElement(View, {
				tag = "auto-xy",
				LayoutOrder = 3
			}, {
				Icon = React.createElement(Icon, {
					name = "chevron-large-down",
					Rotation = v28,
					style = v38.icon.style,
					size = v38.icon.size,
					testId = `{ v20.testId }--collapse-icon`
				})
			})
		}),
		Content = if not v25 then nil else React.createElement(View, {
			tag = "col",
			LayoutOrder = 2,
			testId = `{ v20.testId }--content`,
			Size = if not v30 then nil else v30:map(function(p3) -- line: 200
				return UDim2.new(1, 0, 0, p3)
			end),
			ClipsDescendants = true
		}, {
			AnimatedContainer = React.createElement(View, {
				tag = v38.content.tag,
				ref = v32,
				onAbsoluteSizeChanged = v34,
				flexItem = {
					FlexMode = Enum.UIFlexMode.None
				},
				testId = `{ v20.testId }--animated-content`
			}, { v20.children })
		}),
		Divider = if not v20.hasDivider then nil else React.createElement(Divider, {
			LayoutOrder = 3,
			testId = `{ v20.testId }--divider`
		})
	})
end))
