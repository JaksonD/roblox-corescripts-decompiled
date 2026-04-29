local Parent = script:FindFirstAncestor("ViewportUtils").Parent
local Display = require(Parent.Display)
local React = require(Parent.React)
local Signals = require(Parent.Signals)
local SignalsReact = require(Parent.SignalsReact)
local v6 = game:DefineFastFlag("LuaAppFixFrameBoundsImpressions", false)
local v7 = game:DefineFastInt("LuaAppUpdateImpressionsViewportBoundsPositionThreshold", 50)
local v8 = game:DefineFastFlag("LuaAppThrottleViewportBoundsScreenSize", false)
local v9 = game:DefineFastInt("LuaAppViewportBoundsScreenSizeThreshold", 50)

local function screenSizeBoundsEqual(t1: {[any]: any}, t2: {[any]: any}) -- line: 30
	-- upvalues: v9 (copy)
	local v17 = v9

	return v17 > math.abs(t1.max.X - t2.max.X) and (v17 > math.abs(t1.max.Y - t2.max.Y) and (t1.min.X == t2.min.X and t1.min.Y == t2.min.Y))
end

local t3 = {
	min = Vector2.zero,
	max = Vector2.zero
}

local function calculateClampedViewportBounds(vector2: Vector2?, vector2_2: Vector2?, t4: {[any]: any}) -- line: 40
	-- upvalues: v6 (copy), t3 (copy)
	local v21 = vector2 or Vector2.zero
	local v22 = v21 + (vector2_2 or Vector2.zero)
	local v23 = math.max(t4.min.X, v21.X)
	local v24 = math.min(t4.max.X, v22.X)
	local v25 = math.max(t4.min.Y, v21.Y)
	local v26 = math.min(t4.max.Y, v22.Y)

	if v6 and (v24 <= v23 or v26 <= v25) then
		return t3
	end

	return {
		min = Vector2.new(v23, v25),
		max = Vector2.new(v24, v26)
	}
end

return function(t5: {[any]: any}?) -- line: 61
	-- upvalues: v8 (copy), React (copy), Signals (copy), Display (copy), screenSizeBoundsEqual (copy), SignalsReact (copy), t3 (copy), v6 (copy), calculateClampedViewportBounds (copy), v7 (copy), v9 (copy)
	local u29

	if v8 then
		local v28 = React.useMemo(function() -- line: 65
			-- upvalues: Signals (copy), Display (copy), screenSizeBoundsEqual (copy)
			return Signals.createComputed(function(p1) -- line: 66
				-- upvalues: Display (copy)
				local v47 = Display.GetDisplayStore(p1)
				local v48 = v47.getViewportSize(p1)
				local v49 = v47.getTopBarHeight(p1)
				local v50 = v47.getGuiInset(p1)

				return {
					min = Vector2.new(0, v49),
					max = Vector2.new(v48.X, v48.Y - v50.bottom)
				}
			end, screenSizeBoundsEqual)
		end, {})

		u29 = SignalsReact.useSignalState(v28)
	else
		local v30 = SignalsReact.useSignalState(function(p2) -- line: 80
			-- upvalues: Display (copy)
			return Display.GetDisplayStore(p2).getViewportSize(p2)
		end)
		local v31 = SignalsReact.useSignalState(function(p3) -- line: 83
			-- upvalues: Display (copy)
			return Display.GetDisplayStore(p3).getTopBarHeight(p3)
		end)
		local v32 = SignalsReact.useSignalState(function(p4) -- line: 86
			-- upvalues: Display (copy)
			return Display.GetDisplayStore(p4).getGuiInset(p4)
		end)

		u29 = React.useMemo(function() -- line: 90
			-- upvalues: v31 (copy), v30 (copy), v32 (copy)
			return {
				min = Vector2.new(0, v31),
				max = Vector2.new(v30.X, v30.Y - v32.bottom)
			}
		end, {
			v31,
			v30,
			v32
		})
	end

	local v33, v34 = React.useState(t3)
	local v35 = if not v6 then v34 else React.useCallback(function(t6: {[any]: any}) -- line: 101
		-- upvalues: v34 (copy)
		v34(function(t7: {[any]: any}) -- line: 102
			-- upvalues: t6 (copy)
			local v52 = t6

			if t7.min == v52.min and t7.max == v52.max then
				return t7
			end

			return t6
		end)
	end, {})

	React.useEffect(function() -- line: 111
		-- upvalues: t5 (copy), v6 (copy), v8 (copy), v35 (copy), calculateClampedViewportBounds (copy), u29 (ref), v7 (copy), v9 (copy)
		local t8 = {}
		local current = nil

		if t5 then
			current = t5.current
		end

		if current then
			local AbsolutePosition = current.AbsolutePosition
			local AbsoluteSize = current.AbsoluteSize
			local u44 = if not v6 then nil else AbsolutePosition
			local u45 = if not v8 then nil else AbsoluteSize

			v35((calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, u29)))
			table.insert(t8, current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() -- line: 134
				-- upvalues: AbsolutePosition (ref), current (ref), v6 (copy), v7 (copy), u44 (ref), v35 (copy), calculateClampedViewportBounds (copy), AbsoluteSize (ref), u29 (ref)
				AbsolutePosition = current.AbsolutePosition

				if v6 then
					local v53 = v7
					local v54 = AbsolutePosition - u44

					if v53 > math.abs(v54.X) and v53 > math.abs(v54.Y) then
						return
					end

					u44 = AbsolutePosition
				end

				v35((calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, u29)))
			end))
			table.insert(t8, current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() -- line: 157
				-- upvalues: AbsoluteSize (ref), current (ref), v8 (copy), v9 (copy), u45 (ref), v35 (copy), calculateClampedViewportBounds (copy), AbsolutePosition (ref), u29 (ref)
				AbsoluteSize = current.AbsoluteSize

				if v8 then
					local v55 = v9
					local v56 = AbsoluteSize - u45

					if v55 > math.abs(v56.X) and v55 > math.abs(v56.Y) then
						return
					end

					u45 = AbsoluteSize
				end

				v35((calculateClampedViewportBounds(AbsolutePosition, AbsoluteSize, u29)))
			end))
		else
			v35(u29)
		end

		return function() -- line: 178
			-- upvalues: t8 (copy)
			for _, v58 in t8 do
				v58:Disconnect()
			end
		end
	end, {
		t5,
		u29
	})

	return v33
end
