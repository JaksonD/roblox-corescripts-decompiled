local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local Text = require(Foundation.Components.Text)
local Flags = require(Foundation.Utility.Flags)

require(Foundation.Components.Types)

local withCommonProps = require(Foundation.Utility.withCommonProps)

return React.memo(React.forwardRef(function(p1, p2) --[[ HintText ]] -- line: 21
	-- upvalues: React (copy), Text (copy), withCommonProps (copy), Flags (copy)
	return React.createElement(Text, withCommonProps(p1, {
		Text = p1.text,
		tag = {
			["size-full-0 auto-y text-caption-small text-align-x-left text-align-y-top text-wrap"] = true,
			["content-action-alert"] = p1.hasError,
			["content-muted"] = Flags.FoundationInputFieldFixDisabled and (p1.isDisabled and not p1.hasError),
			["content-default"] = (not Flags.FoundationInputFieldFixDisabled or not p1.isDisabled) and not p1.hasError
		},
		ref = p2
	}))
end))
