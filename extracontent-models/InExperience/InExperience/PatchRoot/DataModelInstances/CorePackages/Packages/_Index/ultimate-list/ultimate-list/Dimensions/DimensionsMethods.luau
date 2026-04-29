local ancestor = script:FindFirstAncestor("ultimate-list")
local DataSourceMethods = require(ancestor.DataSources.DataSourceMethods)

require(ancestor.DataSources)
require(script.Parent)

local exhaustiveMatch = require(ancestor.Util.exhaustiveMatch)
local t1 = {}

function t1.getCanvasSize(p1, p2, vector2: Vector2, p3) -- line: 11
	-- upvalues: DataSourceMethods (copy), t1 (copy), exhaustiveMatch (copy)
	local v11 = DataSourceMethods.back(p2)

	if v11 == nil then
		return UDim2.new()
	end

	local v12 = t1.getUDimRect(p1, v11, DataSourceMethods.length(p2), vector2, p3)

	if p3 == "x" then
		return (UDim2.fromOffset(v12.position.X.Offset + v12.size.X.Offset, 0))
	end

	if p3 == "y" then
		return (UDim2.fromOffset(0, v12.position.Y.Offset + v12.size.Y.Offset))
	end

	return (exhaustiveMatch(p3))
end

local function getPositionForConsistentUDim2(uDim2: UDim2, n1: number, vector2: Vector2, p4) -- line: 50
	-- upvalues: t1 (copy), exhaustiveMatch (copy)
	local v22 = t1.getAmountPerNonDominantInGrid(uDim2, vector2, p4)

	if p4 == "x" then
		return UDim2.new(0, (math.ceil(n1 / v22) - 1) * uDim2.X.Offset, uDim2.Y.Scale * ((n1 - 1) % v22), uDim2.Y.Offset * ((n1 - 1) % v22))
	end

	if p4 == "y" then
		return UDim2.new(uDim2.X.Scale * ((n1 - 1) % v22), uDim2.X.Offset * ((n1 - 1) % v22), 0, (math.ceil(n1 / v22) - 1) * uDim2.Y.Offset)
	end

	return exhaustiveMatch(p4)
end

function t1.getAmountPerNonDominantInGrid(uDim2: UDim2, vector2: Vector2, p5) -- line: 79
	-- upvalues: exhaustiveMatch (copy)
	if p5 == "x" then
		return vector2.Y // (uDim2.Y.Offset + uDim2.Y.Scale * vector2.Y)
	end

	if p5 == "y" then
		return vector2.X // (uDim2.X.Offset + uDim2.X.Scale * vector2.X)
	end

	return exhaustiveMatch(p5)
end
function t1.getDominantAxis(vector2: Vector2, p6) -- line: 93
	-- upvalues: exhaustiveMatch (copy)
	if p6 == "x" then
		return vector2.X
	end

	if p6 == "y" then
		return vector2.Y
	end

	return exhaustiveMatch(p6)
end
function t1.getUDimRect(p7, p8, n2: number, vector2: Vector2, p9) -- line: 103
	-- upvalues: exhaustiveMatch (copy), getPositionForConsistentUDim2 (copy)
	if p7.type == "consistentSize" then
		local t2 = {}
		local size = p7.size

		t2.size = if p9 ~= "x" then if p9 ~= "y" then exhaustiveMatch(p9) else UDim2.new(1, 0, 0, size) else UDim2.new(0, size, 1, 0)

		local size2 = p7.size

		t2.position = if p9 ~= "x" then if p9 ~= "y" then exhaustiveMatch(p9) else UDim2.fromOffset(0, size2 * (n2 - 1)) else UDim2.fromOffset(size2 * (n2 - 1), 0)

		return t2
	end

	if p7.type == "consistentUDim2" then
		return {
			size = p7.udim2,
			position = getPositionForConsistentUDim2(p7.udim2, n2, vector2, p9)
		}
	end

	if p7.type == "getter" then
		return p7.callback(p8, n2)
	end

	if p7.type == "spaced" then
		if p7.inner.type == "consistentSize" then
			local t3 = {}
			local size = p7.inner.size

			t3.size = if p9 ~= "x" then if p9 ~= "y" then exhaustiveMatch(p9) else UDim2.new(1, 0, 0, size) else UDim2.new(0, size, 1, 0)

			local v38 = p7.inner.size + p7.spacing

			t3.position = if p9 ~= "x" then if p9 ~= "y" then exhaustiveMatch(p9) else UDim2.fromOffset(0, v38 * (n2 - 1)) else UDim2.fromOffset(v38 * (n2 - 1), 0)

			return t3
		end

		if p7.inner.type == "consistentUDim2" then
			return {
				size = p7.inner.udim2,
				position = getPositionForConsistentUDim2(p7.inner.udim2 + UDim2.fromOffset(p9 ~= "x" and 0 or p7.spacing, p9 ~= "y" and 0 or p7.spacing), n2, vector2, p9)
			}
		end

		if p7.inner.type == "getter" or p7.inner.type == "spaced" then
			error("Unsupported spaced dimensions")

			return
		end

		return exhaustiveMatch(p7.inner.type)
	end

	return exhaustiveMatch(p7.type)
end

local function getElementsDisplayedForUDim2(uDim2: UDim2, vector2: Vector2, p10) -- line: 152
	-- upvalues: t1 (copy), exhaustiveMatch (copy)
	local v42 = t1.getAmountPerNonDominantInGrid(uDim2, vector2, p10)

	if p10 == "x" then
		return v42 * (vector2.X // uDim2.Y.Offset + 2)
	end

	if p10 == "y" then
		return v42 * (vector2.Y // uDim2.X.Offset + 2)
	end

	return exhaustiveMatch(p10)
end

function t1.elementsDisplayedHint(p11, vector2: Vector2, p12) -- line: 165
	-- upvalues: t1 (copy), getElementsDisplayedForUDim2 (copy), exhaustiveMatch (copy)
	if p11.type == "consistentSize" then
		return t1.getDominantAxis(vector2, p12) // p11.size + 2
	end

	if p11.type == "consistentUDim2" then
		return getElementsDisplayedForUDim2(p11.udim2, vector2, p12)
	end

	if p11.type == "getter" then
		return nil
	end

	if p11.type == "spaced" then
		if p11.inner.type == "consistentSize" then
			return t1.getDominantAxis(vector2, p12) // (p11.inner.size + p11.spacing) + 2
		end

		if p11.inner.type == "consistentUDim2" then
			return getElementsDisplayedForUDim2(p11.inner.udim2 + UDim2.fromOffset(p12 ~= "x" and 0 or p11.spacing, p12 ~= "y" and 0 or p11.spacing), vector2, p12)
		end

		if p11.inner.type == "spaced" or p11.inner.type == "getter" then
			error("Unsupported spaced dimensions")

			return
		end

		return exhaustiveMatch(p11.inner.type)
	end

	return exhaustiveMatch(p11.type)
end
function t1.equals(p13, p14) -- line: 203
	-- upvalues: exhaustiveMatch (copy)
	if p13.type ~= p14.type then
		return false
	end

	if p13.type == "getter" then
		assert(p14.type == "getter", "Luau")

		return p13.callback == p14.callback
	end

	if p13.type == "consistentSize" then
		assert(p14.type == "consistentSize", "Luau")

		return p13.size == p14.size
	end

	if p13.type == "consistentUDim2" then
		assert(p14.type == "consistentUDim2", "Luau")

		return p13.udim2 == p14.udim2
	end

	if p13.type == "spaced" then
		assert(p14.type == "spaced", "Luau")

		return p13.spacing == p14.spacing
	end

	return exhaustiveMatch(p13.type)
end

return t1
