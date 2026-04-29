local RunService = game:GetService("RunService")
local ancestor = script:FindFirstAncestor("ultimate-list")

require(ancestor.DataSources)
require(ancestor.Dimensions)

local React = require(ancestor.Parent.React)
local ReactBindingsRenderer = require(ancestor.Renderers.ReactBindingsRenderer)
local ReactStateRenderer = require(ancestor.Renderers.ReactStateRenderer)

require(ancestor.Renderers)

local createVirtualizedListController = require(ancestor.createVirtualizedListController)
local exhaustiveMatch = require(ancestor.Util.exhaustiveMatch)
local createElement = React.createElement

return function(t1: {[any]: any}) --[[ ScrollingFrame ]] -- line: 15
	-- upvalues: React (copy), createVirtualizedListController (copy), exhaustiveMatch (copy), RunService (copy), createElement (copy), ReactStateRenderer (copy), ReactBindingsRenderer (copy)
	local v10 = React.useState(function() -- line: 34
		-- upvalues: createVirtualizedListController (copy), t1 (copy)
		return createVirtualizedListController(t1.dataSource, t1.dimensions, t1.direction)
	end)

	React.useEffect(function() -- line: 38
		-- upvalues: v10 (copy)
		return function() -- line: 39
			-- upvalues: v10 (copy)
			return v10.destroy()
		end
	end, {})

	local v11, v12 = React.useBinding(v10.getCanvasSize())
	local v13, v14 = React.useBinding(Vector2.zero)
	local v15, v16 = React.useBinding(0)

	React.useEffect(function() -- line: 48
		-- upvalues: v10 (copy), v12 (copy)
		return v10.bindToUpdate(function() -- line: 49
			-- upvalues: v12 (copy), v10 (copy)
			v12(v10.getCanvasSize())
		end)
	end, {})

	local v17 = React.useCallback(function(p1) -- line: 54
		-- upvalues: v14 (copy), v10 (copy), t1 (copy)
		v14(p1.AbsoluteWindowSize)
		v10.setWindowSize(p1.AbsoluteWindowSize)

		if t1.onAbsoluteWindowSizeChanged ~= nil then
			t1.onAbsoluteWindowSizeChanged(p1.AbsoluteWindowSize)
		end
	end, {
		t1.direction,
		t1.onAbsoluteWindowSizeChanged
	})
	local v18 = React.useCallback(function(p2) -- line: 63
		-- upvalues: t1 (copy), exhaustiveMatch (copy), RunService (copy), v10 (copy), v16 (copy)
		local v24 = if t1.direction ~= "x" then if t1.direction ~= "y" then exhaustiveMatch(t1.direction) else p2.CanvasPosition.Y else p2.CanvasPosition.X

		RunService.Heartbeat:Once(function() -- line: 71
			-- upvalues: v10 (copy), v24 (copy), v16 (copy), t1 (copy)
			v10.setScrollAxis(v24)
			v16(v24)

			if t1.onScrollAxisChanged ~= nil then
				t1.onScrollAxisChanged(v24)
			end
		end)
	end, {
		t1.direction,
		t1.onScrollAxisChanged
	})

	React.useEffect(function() -- line: 81
		-- upvalues: v10 (copy), t1 (copy)
		v10.setDataSource(t1.dataSource)
	end, { t1.dataSource })
	React.useEffect(function() -- line: 85
		-- upvalues: v10 (copy), t1 (copy)
		v10.setDimensions(t1.dimensions)
	end, { t1.dimensions })

	local t2 = {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = v11,
		[React.Change.AbsoluteWindowSize] = v17,
		[React.Change.CanvasPosition] = v18,
		[React.Tag] = t1.tag,
		ref = t1.scrollingFrameRef
	}

	if t1.native ~= nil then
		for v20, v21 in t1.native do
			if t2[v20] ~= nil then
				error(`{ v20 } is already used by UltimateList`)
			end

			t2[v20] = v21
		end
	end

	return createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1)
	}, {
		ScrollingFrame = createElement("ScrollingFrame", t2),
		RendererOverlay = createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = v13:map(function(vector2: Vector2) -- line: 124
				return UDim2.fromOffset(vector2.X, vector2.Y)
			end),
			ZIndex = 2
		}, {
			Renderer = if t1.renderer.type ~= "byState" then if t1.renderer.type ~= "byBinding" then exhaustiveMatch(t1.renderer.type) else createElement(ReactBindingsRenderer, {
				virtualizedListController = v10,
				scrollAxisBinding = v15,
				dimensions = t1.dimensions,
				direction = t1.direction,
				callback = t1.renderer.callback,
				getKey = t1.getKey
			}) else createElement(ReactStateRenderer, {
				virtualizedListController = v10,
				config = t1.renderer.config,
				dimensions = t1.dimensions,
				direction = t1.direction,
				callback = t1.renderer.callback,
				getKey = t1.getKey,
				scrollAxisBinding = v15
			})
		})
	})
end
