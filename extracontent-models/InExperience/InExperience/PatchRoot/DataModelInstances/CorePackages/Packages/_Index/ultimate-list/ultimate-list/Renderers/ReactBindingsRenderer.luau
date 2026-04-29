local ancestor = script:FindFirstAncestor("ultimate-list")

require(ancestor.Dimensions)

local DimensionsMethods = require(ancestor.Dimensions.DimensionsMethods)
local React = require(ancestor.Parent.React)
local adjustPositionToScrollAxis = require(ancestor.Dimensions.adjustPositionToScrollAxis)
local createDebugLogger = require(ancestor.Util.createDebugLogger)

require(ancestor.createVirtualizedListController)

local joinAndMapBindings = require(ancestor.Util.joinAndMapBindings)
local createElement = React.createElement
local v8 = createDebugLogger("ReactBindingsRenderer")

local function getKeyDefault(_, n1: number) -- line: 15
	return (tostring(n1))
end

return (React.memo(function(t1: {[any]: any}) --[[ ReactBindingsRenderer ]] -- line: 35
	-- upvalues: React (copy), DimensionsMethods (copy), getKeyDefault (copy), v8 (copy), createElement (copy), joinAndMapBindings (copy), adjustPositionToScrollAxis (copy)
	local v13, v14 = React.useState(function() -- line: 48
		-- upvalues: DimensionsMethods (copy), t1 (copy), React (copy)
		local t2 = {}
		local v22 = DimensionsMethods.elementsDisplayedHint(t1.dimensions, t1.virtualizedListController.getWindowSize(), t1.direction)

		if v22 == nil then
			return t2
		end

		for _ = 1, v22 do
			local v24, v25 = React.createBinding({
				contents = {
					type = "vacant"
				}
			})

			table.insert(t2, {
				binding = v24,
				set = v25
			})
		end

		return t2
	end)
	local v15 = t1.getKey or getKeyDefault

	React.useEffect(function() -- line: 79
		-- upvalues: t1 (copy), v15 (copy), v13 (copy), v8 (copy), React (copy), v14 (copy)
		return t1.virtualizedListController.bindToUpdate(function() -- line: 80
			-- upvalues: t1 (copy), v15 (copy), v13 (copy), v8 (copy), React (copy), v14 (copy)
			local v32 = t1.virtualizedListController.get()
			local v33 = t1.virtualizedListController.getRange()
			local t3 = {}

			for v35, v36 in v32 do
				t3[v15(v36, v35 + (v33.X - 1))] = v35
			end

			local t4 = {}
			local t5 = {}
			local t6 = {}

			for _, v41 in v13 do
				local v42 = v41.binding:getValue()

				if v42.contents.type == "vacant" then
					table.insert(t5, v41.set)
				else
					local key = v42.contents.key
					local v44 = t3[key]

					if v44 == nil then
						v8("%s is now dead", key)
						table.insert(t4, v41.set)
					else
						t3[key] = nil

						local v45 = v32[v44]

						if v45 ~= v42.contents.value then
							v8("%s existed, but changed", key)
							v41.set({
								contents = {
									type = "full",
									index = v44 + (v33.X - 1),
									key = key,
									value = v45
								}
							})
						end
					end
				end
			end

			v8("%d total setters, %d dead setters, %d vacant setters", #v13, #t4, #t5)

			for v46, v47 in t3 do
				assert(v47 ~= nil, "Luau")

				local v48 = v32[v47]
				local t7 = {
					contents = {
						type = "full",
						index = v47 + (v33.X - 1),
						key = v46,
						value = v48
					}
				}
				local v50 = table.remove(t4)

				if v50 ~= nil then
					v8("%s is filling dead spot", v46)
					v50(t7)
				else
					local v51 = table.remove(t5)

					if v51 ~= nil then
						v8("%s is filling vacant spot", v46)
						v51(t7)
					else
						local v52, v53 = React.createBinding(t7)

						table.insert(t6, {
							binding = v52,
							set = v53
						})
					end
				end
			end

			if #t6 > 0 then
				v8("Needed to create %d more bindings to fit, there will be %d setters", #t6, #t6 + #v13)
				v14(function(p2) -- line: 177
					-- upvalues: t6 (copy)
					local v57 = table.clone(p2)

					table.move(t6, 1, #t6, #v57 + 1, v57)

					return v57
				end)
			end

			for _, v55 in t4 do
				v55({
					contents = {
						type = "vacant"
					}
				})
			end
		end)
	end, {
		t1.virtualizedListController,
		v15,
		v13
	})

	local t8 = {}

	for v17, v18 in v13 do
		local binding = v18.binding
		local v20 = binding:map(function(t9: {[any]: any}) -- line: 199
			-- upvalues: DimensionsMethods (copy), t1 (copy)
			if t9.contents.type == "vacant" then
				return {
					size = UDim2.new(),
					position = UDim2.new()
				}
			end

			return DimensionsMethods.getUDimRect(t1.dimensions, t9.contents.value, t9.contents.index, t1.virtualizedListController.getWindowSize(), t1.direction)
		end)

		t8[`Item{ v17 }`] = createElement("Frame", {
			BackgroundTransparency = 1,
			Position = joinAndMapBindings(function(p3, n2: number) -- line: 219
				-- upvalues: adjustPositionToScrollAxis (copy), t1 (copy)
				return adjustPositionToScrollAxis(p3.position, n2, t1.direction)
			end, v20, t1.scrollAxisBinding),
			Size = v20:map(function(p4) -- line: 223
				return p4.size
			end),
			Visible = binding:map(function(t10: {[any]: any}) -- line: 227
				return t10.contents.type == "full"
			end)
		}, {
			Content = t1.callback(binding:map(function(t11: {[any]: any}) -- line: 231
				if t11.contents.type == "full" then
					return t11.contents.value
				end

				return nil
			end))
		})
	end

	return createElement(React.Fragment, {}, t8)
end))
