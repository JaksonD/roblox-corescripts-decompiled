local Parent = script:FindFirstAncestor("Foundation").Parent
local React = require(Parent.React)
local FullBleed = require(script.Parent.FullBleed)

return function(p1) --[[ childrenHasFullBleed ]] -- line: 15
	-- upvalues: React (copy), FullBleed (copy)
	local u6 = false

	React.Children.forEach(p1, function(p2) -- line: 17
		-- upvalues: FullBleed (copy), u6 (ref)
		if ((if type(p2) == "table" then p2.type else nil)) == FullBleed then
			u6 = true
		end
	end)

	return u6
end
