local Parent = script:FindFirstAncestor("Foundation").Parent
local React = require(Parent.React)
local v3 = React.createContext({
	testId = ""
})

return {
	Context = v3,
	Provider = function(t1: {[any]: any}) --[[ HeaderBarProvider ]] -- line: 15
		-- upvalues: React (copy), v3 (copy)
		local v5 = React.useMemo(function() -- line: 16
			-- upvalues: t1 (copy)
			return {
				testId = t1.testId
			}
		end, { t1.testId })

		return React.createElement(v3.Provider, {
			value = v5
		}, t1.children)
	end
}
