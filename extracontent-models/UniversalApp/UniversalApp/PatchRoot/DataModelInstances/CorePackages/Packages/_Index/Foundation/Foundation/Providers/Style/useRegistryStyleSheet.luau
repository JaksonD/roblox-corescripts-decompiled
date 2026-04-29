local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent

require(Foundation.Enums.Device)

local React = require(FoundationParent.React)

require(Foundation.Enums.Theme)
require(Foundation.Providers.Style.Tokens)

local StyleSheetRegistry = require(Foundation.StyleSheet.StyleSheetRegistry)

return function(p1, p2, n1: number, p3) --[[ useRegistryStyleSheet ]] -- line: 14
	-- upvalues: React (copy), StyleSheetRegistry (copy)
	local v9 = React.useRef({})
	local v10 = React.useMemo(function() -- line: 21
		-- upvalues: StyleSheetRegistry (copy), p1 (copy), p2 (copy), n1 (copy), p3 (copy)
		return StyleSheetRegistry.getStyleSheet(p1, p2, n1, p3)
	end, {
		p1,
		p2,
		n1,
		p3
	})
	local v11 = React.useRef(v10)

	v11.current = v10

	local v12 = React.useCallback(function(p4) -- line: 27
		-- upvalues: v9 (copy), StyleSheetRegistry (copy), v11 (copy)
		for _, v15 in p4 do
			v9.current[v15] = true
		end

		StyleSheetRegistry.addStyleTags(v11.current, p4)
	end, {})

	React.useLayoutEffect(function() -- line: 34
		-- upvalues: v9 (copy), StyleSheetRegistry (copy), v10 (copy)
		local t1 = {}

		for v17 in v9.current do
			table.insert(t1, v17)
		end

		StyleSheetRegistry.addStyleTags(v10, t1)
	end, { v10 })

	return v10, v12
end
