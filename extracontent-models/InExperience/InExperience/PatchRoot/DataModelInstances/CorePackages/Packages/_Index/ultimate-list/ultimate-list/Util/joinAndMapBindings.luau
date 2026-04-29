local ancestor = script:FindFirstAncestor("ultimate-list")
local React = require(ancestor.Parent.React)

return function(p1: ((...any) -> ...any), p2, p3, p4) --[[ joinAndMapBindings ]] -- line: 6
	-- upvalues: React (copy)
	return React.joinBindings({
		p2,
		p3,
		p4
	}):map(function(p5) -- line: 12
		-- upvalues: p1 (copy)
		return p1(unpack(p5))
	end)
end
