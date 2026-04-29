local ancestor = script:FindFirstAncestor("ultimate-list")
local exhaustiveMatch = require(ancestor.Util.exhaustiveMatch)

return function(uDim2: UDim2, n1: number, p1) --[[ adjustPositionToScrollAxis ]] -- line: 5
	-- upvalues: exhaustiveMatch (copy)
	if p1 == "x" then
		return UDim2.new(0, uDim2.X.Offset - n1, uDim2.Y.Scale, uDim2.Y.Offset)
	end

	if p1 == "y" then
		return UDim2.new(uDim2.X.Scale, uDim2.X.Offset, 0, uDim2.Y.Offset - n1)
	end

	return exhaustiveMatch(p1)
end
