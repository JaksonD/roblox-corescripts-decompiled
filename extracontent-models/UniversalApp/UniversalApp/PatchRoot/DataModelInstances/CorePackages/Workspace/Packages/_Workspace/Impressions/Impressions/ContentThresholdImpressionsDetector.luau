local Parent = script:FindFirstAncestor("Impressions").Parent
local React = require(Parent.React)
local useViewportBounds = require(Parent.ViewportUtils).useViewportBounds

return function(t1: {[any]: any}) --[[ ContentThresholdImpressionsDetector ]] -- line: 24
	-- upvalues: useViewportBounds (copy), React (copy)
	local v5 = useViewportBounds()
	local v6 = React.useRef({})
	local v7 = React.useRef(0)
	local v8 = React.useRef(nil)
	local v9 = React.useRef(t1.impressionsTag)
	local v10 = React.useCallback(function() -- line: 32
		-- upvalues: t1 (copy), v5 (copy), v7 (copy), v6 (copy)
		local current = t1.containerRef.current

		if not current then
			return
		end

		local v13 = math.floor(t1.fullContentHeight)

		if v13 <= 0 then
			return
		end

		if current.AbsoluteSize.Y == 0 then
			return
		end

		local AbsolutePositionY = current.AbsolutePosition.Y
		local v15 = AbsolutePositionY + current.AbsoluteSize.Y
		local maxY = ((if not t1.viewportBoundsOffset then v5 else {
			min = v5.min + t1.viewportBoundsOffset.min,
			max = v5.max + t1.viewportBoundsOffset.max
		})).max.Y

		if maxY <= 0 then
			return
		end

		local v17 = math.clamp(math.min(v15, maxY) - AbsolutePositionY, 0, v13) / v13

		v7.current = math.max(v7.current, v17)

		local t2 = {}

		for v19, v20 in t1.thresholds do
			if not v6.current[v19] and v20 <= v7.current then
				v6.current[v19] = true
				table.insert(t2, t1.thresholds[v19])
			end
		end

		if #t2 > 0 then
			t1.sendImpressions(t2)
		end
	end, {
		t1.containerRef,
		t1.fullContentHeight,
		t1.thresholds,
		t1.viewportBoundsOffset,
		t1.sendImpressions,
		v5
	})
	local v11 = React.useCallback(function() -- line: 89
		-- upvalues: v8 (copy), v10 (copy)
		if v8.current then
			task.cancel(v8.current)
		end

		v8.current = task.delay(0.2, function() -- line: 93
			-- upvalues: v8 (copy), v10 (copy)
			v8.current = nil
			v10()
		end)
	end, { v10 })

	React.useEffect(function() -- line: 99
		-- upvalues: v9 (copy), t1 (copy), v6 (copy), v7 (copy), v11 (copy)
		if v9.current ~= t1.impressionsTag then
			v9.current = t1.impressionsTag
			v6.current = {}
			v7.current = 0
			v11()
		end
	end, {
		t1.impressionsTag,
		v11
	})
	React.useEffect(function() -- line: 108
		-- upvalues: t1 (copy), v11 (copy), v8 (copy)
		local current = t1.containerRef.current

		if not current then
			return nil
		end

		v11()

		local connection = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(v11)
		local connection2 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v11)

		return function() -- line: 118
			-- upvalues: v8 (copy), connection (copy), connection2 (copy)
			if v8.current then
				task.cancel(v8.current)
				v8.current = nil
			end

			connection:Disconnect()
			connection2:Disconnect()
		end
	end, {
		t1.containerRef,
		v11
	})

	return nil
end
