local Foundation = script:FindFirstAncestor("Foundation")
local colorScopeKeepPrefix = require(script.Parent.colorScopeKeepPrefix)

require(Foundation.Providers.Style.Tokens)
require(script.Parent.Rules.Types)

local function pascalToKebab(s1: string) -- line: 10
	local v5 = s1:gsub("_", "-")
	local v6 = string.gsub(v5, "(%u)", function(p1) -- line: 15
		return "-" .. p1:lower()
	end)

	if v6:sub(1, 1) == "-" then
		v6 = v6:sub(2, #v6)
	end

	return v6
end

return function(p2) --[[ formatTokens ]] -- line: 28
	-- upvalues: pascalToKebab (copy), colorScopeKeepPrefix (copy)
	local t1 = {}
	local t2 = {}
	local t3 = {}
	local t4 = {}
	local t5 = {}
	local t6 = {}
	local t7 = {}
	local t8 = {}
	local t9 = {}
	local t10 = {}
	local t11 = {
		colors = t1,
		variants = t2,
		strokes = t3,
		gaps = t4,
		radii = t5,
		sizes = t6,
		typography = t7,
		paddings = t8,
		margins = t9,
		gutters = t10
	}

	if p2 == nil or next(p2) == nil then
		return t11
	end

	for v19, v20 in p2.Color do
		if v20.Background then
			t2[pascalToKebab(v19)] = v20
		else
			t1[v19] = {}

			for v21, v22 in v20 do
				local v23 = if not colorScopeKeepPrefix[v19] then v21 else v19 .. v21

				t1[v19][pascalToKebab(v23)] = v22
			end
		end
	end

	for v24, v25 in p2.Inverse do
		if v24 == "Content" then
			for v26, v27 in v25 do
				local v28 = if not colorScopeKeepPrefix[v24] then v26 else v24 .. v26

				t1[v24][`inverse-{ pascalToKebab(v28) }`] = v27
			end
		end
	end

	for v29, v30 in p2.Stroke do
		table.insert(t3, {
			name = pascalToKebab(v29),
			size = v30
		})
	end

	table.insert(t3, {
		name = "none",
		size = 0
	})
	table.sort(t3, function(p3, p4) -- line: 86
		return p3.size < p4.size
	end)

	for v31, v32 in p2.Gap do
		table.insert(t4, {
			name = string.lower(v31),
			size = UDim.new(0, v32)
		})
	end

	table.sort(t4, function(p5, p6) -- line: 94
		return p5.size.Offset < p6.size.Offset
	end)

	for v33, v34 in p2.Radius do
		table.insert(t5, {
			name = string.lower(v33),
			size = UDim.new(0, v34)
		})
	end

	table.sort(t5, function(p7, p8) -- line: 102
		return p7.size.Offset < p8.size.Offset
	end)

	for v35, v36 in p2.Size do
		local v37 = string.split(v35, "_")[2]

		table.insert(t6, {
			name = pascalToKebab(v37),
			size = UDim.new(0, v36)
		})
	end

	table.insert(t6, {
		name = "full",
		size = UDim.new(1, 0)
	})
	table.sort(t6, function(p9, p10) -- line: 114
		return p9.size.Offset < p10.size.Offset
	end)

	for v38, v39 in p2.Typography do
		t7[pascalToKebab(v38)] = {
			Font = v39.Font,
			TextSize = v39.FontSize,
			LineHeight = v39.LineHeight
		}
	end

	for v40, v41 in p2.Padding do
		table.insert(t8, {
			name = string.lower(v40),
			size = UDim.new(0, v41)
		})
	end

	table.sort(t8, function(p11, p12) -- line: 130
		return p11.size.Offset < p12.size.Offset
	end)

	for v42, v43 in p2.Margin do
		table.insert(t9, {
			name = string.lower(v42),
			size = UDim.new(0, v43)
		})
	end

	table.sort(t9, function(p13, p14) -- line: 138
		return p13.size.Offset < p14.size.Offset
	end)

	for v44, v45 in p2.Gutter do
		table.insert(t10, {
			name = string.lower(v44),
			size = UDim.new(0, v45)
		})
	end

	table.sort(t10, function(p15, p16) -- line: 146
		return p15.size.Offset < p16.size.Offset
	end)

	return t11
end
