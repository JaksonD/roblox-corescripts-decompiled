local ancestor = script:FindFirstAncestor("ultimate-list")

require(ancestor.Dimensions)

local DimensionsMethods = require(ancestor.Dimensions.DimensionsMethods)
local React = require(ancestor.Parent.React)

require(ancestor.Renderers)

local adjustPositionToScrollAxis = require(ancestor.Dimensions.adjustPositionToScrollAxis)

require(ancestor.createVirtualizedListController)

local joinAndMapBindings = require(ancestor.Util.joinAndMapBindings)
local createElement = React.createElement

local function getKeyDefault(_, n1: number) -- line: 13
	return (tostring(n1))
end

return function(t1: {[any]: any}) --[[ ReactStateRenderer ]] -- line: 23
	-- upvalues: React (copy), getKeyDefault (copy), DimensionsMethods (copy), createElement (copy), joinAndMapBindings (copy), adjustPositionToScrollAxis (copy)
	local v11, v12 = React.useState(t1.virtualizedListController.get)
	local v13, v14 = React.useBinding(nil)

	React.useEffect(function() -- line: 39
		-- upvalues: v11 (copy), t1 (copy), v14 (copy), v12 (copy)
		local u22 = v11

		return t1.virtualizedListController.bindToUpdate(function() -- line: 42
			-- upvalues: v14 (copy), u22 (ref), t1 (copy), v12 (copy)
			v14({
				lockedTo = u22,
				scrollAxis = t1.scrollAxisBinding:getValue()
			})
			u22 = t1.virtualizedListController.get()
			v12(u22)
		end)
	end, {
		t1.virtualizedListController,
		t1.scrollAxisBinding
	})

	local t2 = {}
	local v16 = t1.getKey or getKeyDefault
	local v17 = t1.virtualizedListController.getRange()

	for v18, v19 in v11 do
		local v20 = v17.X + (v18 - 1)
		local v21 = DimensionsMethods.getUDimRect(t1.dimensions, v19, v20, t1.virtualizedListController.getWindowSize(), t1.direction)

		t2[v16(v19, v20)] = createElement("Frame", {
			BackgroundTransparency = 1,
			Position = joinAndMapBindings(function(n2: number, t3: {[any]: any}?) -- line: 70
				-- upvalues: t1 (copy), v11 (copy), adjustPositionToScrollAxis (copy), v21 (copy)
				if t1.config.freezeViewWhileScrolling ~= false and (t3 ~= nil and t3.lockedTo == v11) then
					return adjustPositionToScrollAxis(v21.position, t3.scrollAxis, t1.direction)
				end

				return adjustPositionToScrollAxis(v21.position, n2, t1.direction)
			end, t1.scrollAxisBinding, v13),
			Size = v21.size
		}, t1.callback(v19))
	end

	return createElement(React.Fragment, nil, t2)
end
