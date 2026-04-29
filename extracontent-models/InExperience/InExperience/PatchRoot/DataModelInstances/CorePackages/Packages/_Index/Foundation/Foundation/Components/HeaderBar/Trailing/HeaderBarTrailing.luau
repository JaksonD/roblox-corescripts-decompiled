local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local View = require(Foundation.Components.View)
local useHeaderBarContext = require(Foundation.Components.HeaderBar.useHeaderBarContext)

return function(t1: {[any]: any}) --[[ HeaderBarTrailing ]] -- line: 13
	-- upvalues: useHeaderBarContext (copy), React (copy), View (copy)
	local v7 = useHeaderBarContext()

	return React.createElement(View, {
		tag = "row align-x-right align-y-center shrink gap-small size-full",
		testId = `{ v7.testId }--trailing`
	}, t1.children)
end
