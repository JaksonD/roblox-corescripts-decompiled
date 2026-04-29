local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local View = require(Foundation.Components.View)
local useHeaderBarContext = require(Foundation.Components.HeaderBar.useHeaderBarContext)

return function(t1: {[any]: any}) --[[ HeaderBarContent ]] -- line: 13
	-- upvalues: useHeaderBarContext (copy), React (copy), View (copy)
	local v7 = useHeaderBarContext()

	return React.createElement(View, {
		tag = "align-y-center grow size-0-full auto-x",
		testId = `{ v7.testId }--content`
	}, t1.children)
end
