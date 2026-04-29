local Foundation = script:FindFirstAncestor("Foundation")

require(Foundation.Components.Types)

local function collectTokens(p1, s1: string, s2: string?, b1: boolean?) -- line: 76
	-- upvalues: collectTokens (copy)
	local t1 = {}

	for v44, v45 in p1 do
		local v46 = if not s2 then v44 else `{ s2 }.{ v44 }`

		if type(v45) == "table" and not getmetatable(v45) and (not b1 or (type(v45) ~= "table" or (v45.Color3 == nil or (typeof(v45.Color3) ~= "Color3" or (v45.Transparency == nil or typeof(v45.Transparency) ~= "number"))))) then
			for _, v48 in (collectTokens(v45, s1, v46, b1)) do
				table.insert(t1, v48)
			end
		else
			table.insert(t1, {
				key = v44,
				value = v45,
				category = s1,
				fullPath = v46
			})
		end
	end

	return t1
end

return {
	isColorStyle = function(p2) --[[ isColorStyle ]] -- line: 18
		return type(p2) == "table" and (p2.Color3 ~= nil and (typeof(p2.Color3) == "Color3" and (p2.Transparency ~= nil and typeof(p2.Transparency) == "number")))
	end,
	formatColorPreviewHTML = function(color3: Color3, n1: number?) --[[ formatColorPreviewHTML ]] -- line: 38
		local v12 = math.round(color3.R * 255)
		local v13 = math.round(color3.G * 255)
		local v14 = math.round(color3.B * 255)
		local v15

		if n1 then
			v15 = math.round((1 - n1) * 1000) / 1000
		else
			v15 = nil
		end

		return `<span class="color-preview" style="background-color: rgba({ v12 },{ v13 },{ v14 },{ v15 or 1 });"></span>`
	end,
	formatTokenValue = function(p3) --[[ formatTokenValue ]] -- line: 44
		if typeof(p3) == "Color3" then
			return `rgb({ math.round(p3.R * 255) }, { math.round(p3.G * 255) }, { math.round(p3.B * 255) })`
		end

		if typeof(p3) == "number" then
			return (tostring(math.round(p3 * 1000) / 1000))
		end

		if type(p3) == "table" and (p3.Color3 ~= nil and (typeof(p3.Color3) == "Color3" and (p3.Transparency ~= nil and typeof(p3.Transparency) == "number"))) then
			local p3Color3 = p3.Color3
			local p3Transparency = p3.Transparency
			local v19 = math.round(p3Color3.R * 255)
			local v20 = math.round(p3Color3.G * 255)
			local v21 = math.round(p3Color3.B * 255)
			local v22

			if p3Transparency then
				v22 = math.round((1 - p3Transparency) * 1000) / 1000
			else
				v22 = nil
			end

			return `rgba({ v19 }, { v20 }, { v21 }, { v22 })`
		end

		return (tostring(p3))
	end,
	formatTokenValueHTML = function(p4) --[[ formatTokenValueHTML ]] -- line: 59
		if typeof(p4) == "Color3" then
			local v24 = math.round(p4.R * 255)
			local v25 = math.round(p4.G * 255)
			local v26 = math.round(p4.B * 255)

			return `<span class="color">{ `<span class="color-preview" style="background-color: rgba({ math.round(p4.R * 255) },{ math.round(p4.G * 255) },{ math.round(p4.B * 255) },{ nil or 1 });"></span>` } rgb({ v24 }, { v25 }, { v26 })</span>`
		end

		if typeof(p4) == "number" then
			return (tostring(math.round(p4 * 1000) / 1000))
		end

		if type(p4) == "table" and (p4.Color3 ~= nil and (typeof(p4.Color3) == "Color3" and (p4.Transparency ~= nil and typeof(p4.Transparency) == "number"))) then
			local p4Color3 = p4.Color3
			local p4Transparency = p4.Transparency
			local v29 = math.round(p4Color3.R * 255)
			local v30 = math.round(p4Color3.G * 255)
			local v31 = math.round(p4Color3.B * 255)
			local v32

			if p4Transparency then
				v32 = math.round((1 - p4Transparency) * 1000) / 1000
			else
				v32 = nil
			end

			local p4Color3_2 = p4.Color3
			local p4Transparency2 = p4.Transparency
			local v35 = math.round(p4Color3_2.R * 255)
			local v36 = math.round(p4Color3_2.G * 255)
			local v37 = math.round(p4Color3_2.B * 255)
			local v38

			if p4Transparency2 then
				v38 = math.round((1 - p4Transparency2) * 1000) / 1000
			else
				v38 = nil
			end

			return `<span class="color">{ `<span class="color-preview" style="background-color: rgba({ v35 },{ v36 },{ v37 },{ v38 or 1 });"></span>` } rgba({ v29 }, { v30 }, { v31 }, { v32 })</span>`
		end

		return (tostring(p4))
	end,
	collectTokens = collectTokens,
	collectTokensWithSubcategories = function(p5, s3: string, s4: string?, b2: boolean?) --[[ collectTokensWithSubcategories ]] -- line: 103
		-- upvalues: collectTokens (copy)
		local t2 = {}

		for v54, v55 in p5 do
			local v56 = if not s4 then v54 else `{ s4 }.{ v54 }`

			if type(v55) == "table" then
				if b2 and (type(v55) == "table" and (v55.Color3 ~= nil and (typeof(v55.Color3) == "Color3" and (v55.Transparency ~= nil and typeof(v55.Transparency) == "number")))) then
					local v57 = not s4 and "Default" or s4:split(".")[1]

					if not t2[v57] then
						t2[v57] = {}
					end

					table.insert(t2[v57], {
						key = v54,
						value = v55,
						category = s3,
						fullPath = v56
					})
				elseif not s4 then
					local v58 = collectTokens(v55, s3, v54, b2)

					if #v58 > 0 then
						t2[v54] = v58
					end
				else
					local v59 = collectTokens(v55, s3, v56, b2)
					local v60 = s4:split(".")[1]

					if not t2[v60] then
						t2[v60] = {}
					end

					for _, v62 in v59 do
						table.insert(t2[v60], v62)
					end
				end
			else
				local v63 = not s4 and "Default" or s4:split(".")[1]

				if not t2[v63] then
					t2[v63] = {}
				end

				table.insert(t2[v63], {
					key = v54,
					value = v55,
					category = s3,
					fullPath = v56
				})
			end
		end

		return t2
	end,
	hasSubcategories = function(p6) --[[ hasSubcategories ]] -- line: 167
		for _, v66 in p6 do
			if type(v66) ~= "table" then
				continue
			end

			local v67 = false

			for _, v69 in v66 do
				if type(v69) == "table" or typeof(v69) == "Color3" or typeof(v69) == "number" then
					v67 = true

					break
				end
			end

			if v67 then
				return true
			end
		end

		return false
	end,
	sortTokens = function(s5: string, s6: string, b3: boolean?) --[[ sortTokens ]] -- line: 195
		if s5:find("(%u%a+)_(%d+)%.?(%u?%w*)") and s6:find("(%u%a+)_(%d+)%.?(%u?%w*)") then
			local v73, v74, v75 = s5:match("(%u%a+)_(%d+)%.?(%u?%w*)")
			local v76, v77, v78 = s6:match("(%u%a+)_(%d+)%.?(%u?%w*)")

			if v73 == v76 then
				if v74 == v77 then
					return v75 < v78
				end

				return tonumber(v74) < tonumber(v77)
			end

			return s5 < s6
		end

		if b3 then
			local v79 = s5:match("| (%-?[%d.]+) |$")
			local v80 = s6:match("| (%-?[%d.]+) |$")

			return tonumber(v79) < tonumber(v80)
		end

		return s5 < s6
	end,
	orderedTokenCategories = {
		"Color",
		"Stroke",
		"Size",
		"Radius",
		"Padding",
		"Margin",
		"Gap",
		"Typography",
		"FontSize",
		"FontWeight",
		"LineHeight",
		"Ease",
		"Time",
		"Inverse",
		"DarkMode",
		"LightMode",
		"Config"
	},
	getTokenValue = function(p7, s7: string) --[[ getTokenValue ]] -- line: 242
		for _, v84 in string.split(s7, ".") do
			if p7 == nil or type(p7) ~= "table" then
				return nil
			end

			p7 = p7[v84]
		end

		return p7
	end,
	setTokenValue = function(p8, s8: string, p9) --[[ setTokenValue ]] -- line: 255
		local parts = string.split(s8, ".")

		for i = 1, #parts - 1 do
			local v90 = parts[i]

			if p8[v90] == nil then
				return
			end

			p8 = p8[v90]
		end

		local v91 = parts[#parts]

		if p8 and v91 then
			p8[v91] = p9
		end
	end
}
