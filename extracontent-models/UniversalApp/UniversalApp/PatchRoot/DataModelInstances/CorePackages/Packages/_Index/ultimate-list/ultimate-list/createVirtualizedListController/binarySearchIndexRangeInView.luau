local ancestor = script:FindFirstAncestor("ultimate-list")
local DataSourceMethods = require(ancestor.DataSources.DataSourceMethods)

require(ancestor.DataSources)
require(ancestor.Dimensions)

local exhaustiveMatch = require(ancestor.Util.exhaustiveMatch)

return function(p1, p2: ((...any) -> ...any), n1: number, n2: number, p3) --[[ binarySearchIndexRangeInView ]] -- line: 8
	-- upvalues: exhaustiveMatch (copy), DataSourceMethods (copy)
	local function compareInView(p4) -- line: 18
		-- upvalues: p3 (copy), exhaustiveMatch (copy), n1 (copy), n2 (copy)
		local v19 = if p3 ~= "x" then if p3 ~= "y" then exhaustiveMatch(p3) else p4.position.Y.Offset else p4.position.X.Offset

		if v19 + (if p3 ~= "x" then (if p3 ~= "y" then exhaustiveMatch(p3) else p4.size.Y.Offset) else p4.size.X.Offset) < n1 then
			return "before"
		end

		if v19 > n1 + n2 then
			return "after"
		end

		return "inside"
	end

	local n3 = 1
	local v11 = DataSourceMethods.length(p1)
	local v12 = v11

	while n3 <= v12 do
		local v13 = (n3 + v12) // 2
		local v14 = DataSourceMethods.get(p1, v13)

		assert(v14 ~= nil, "get() returned nil, meaning the length is inaccurate")

		local v15 = compareInView((p2(v14.value, v13)))

		if v15 ~= "after" then
			if v15 == "before" then
				n3 = v13 + 1

				continue
			end

			if v15 == "inside" then
				local v16 = v13
				local v17 = v14

				while v16 > 1 do
					v17 = v17.before()

					if v17 == nil or compareInView(p2(v17.value, v16 - 1)) ~= "inside" then
						break
					end

					v16 -= 1
				end

				while v13 < v11 do
					v14 = v14.after()

					if v14 == nil or compareInView(p2(v14.value, v13 + 1)) ~= "inside" then
						return (Vector3.new(v16, v13))
					end

					v13 += 1
				end

				return (Vector3.new(v16, v13))
			end

			exhaustiveMatch(v15)

			continue
		end

		v12 = v13 - 1
	end

	return (Vector3.new(0, 0, 0))
end
