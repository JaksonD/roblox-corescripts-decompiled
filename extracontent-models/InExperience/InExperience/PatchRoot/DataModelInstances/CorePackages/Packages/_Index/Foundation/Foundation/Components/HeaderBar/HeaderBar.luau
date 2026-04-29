local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local HeaderBarContext = require(script.Parent.HeaderBarContext)
local React = require(FoundationParent.React)

require(Foundation.Components.Types)

local View = require(Foundation.Components.View)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local t1 = {
	isCompact = false,
	hasBackground = true,
	testId = "--foundation-header-bar"
}

return React.memo(function(p1) --[[ HeaderBar ]] -- line: 24
	-- upvalues: withDefaults (copy), t1 (copy), React (copy), View (copy), withCommonProps (copy), HeaderBarContext (copy)
	local v10 = withDefaults(p1, t1)

	return React.createElement(View, withCommonProps(v10, {
		tag = {
			["row flex-between gap-small padding-medium"] = true,
			["bg-surface-0"] = v10.hasBackground,
			["size-full-1400"] = v10.isCompact,
			["size-full-1600"] = not v10.isCompact
		}
	}), React.createElement(HeaderBarContext.Provider, {
		testId = v10.testId
	}, v10.children))
end)
