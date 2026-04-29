local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("ScrollTelemetry").Parent
local React = require(Parent.React)
local FFlagLuaAppScrollDetectorLifecycleHardening = require(Parent.SharedFlags).FFlagLuaAppScrollDetectorLifecycleHardening
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay

game:DefineFastInt("ScrollDetectorTimeThresholdMillis", 300000)
game:DefineFastInt("ScrollDetectorDelayMillis", 250)

return function(t1: {[any]: any}) -- line: 28
	-- upvalues: React (copy), FFlagLuaAppHomeTouchAutoplay (copy), FFlagLuaAppScrollDetectorLifecycleHardening (copy), RunService (copy)
	local v7 = React.useRef(0)
	local v8 = React.useRef(0)
	local v9 = React.useRef(nil)
	local v10 = React.useRef(nil)
	local v11 = React.useRef(0)
	local v12 = React.useRef(0)
	local v13 = React.useRef(nil)
	local u14 = nil
	local u15 = nil

	if FFlagLuaAppHomeTouchAutoplay then
		u14 = React.useRef(t1.onScrollStart)
		u14.current = t1.onScrollStart
		u15 = React.useRef(t1.onScrollSettled)
		u15.current = t1.onScrollSettled
	end

	if FFlagLuaAppScrollDetectorLifecycleHardening then
		local v16 = React.useRef(t1.sendScrollEvent)

		v16.current = t1.sendScrollEvent
		React.useEffect(function() -- line: 56
			-- upvalues: v7 (copy), v8 (copy), FFlagLuaAppHomeTouchAutoplay (copy), v16 (copy), v11 (copy), t1 (copy), v12 (copy), v9 (copy), v13 (copy), u15 (ref), u14 (ref), RunService (copy), v10 (copy)
			local function v19() -- line: 80
				-- upvalues: t1 (copy), v12 (copy), v7 (copy), v8 (copy), FFlagLuaAppHomeTouchAutoplay (copy), v16 (copy), v11 (copy), v9 (copy), v13 (copy), u15 (ref)
				if not t1.scrollingFrameRef or not t1.scrollingFrameRef.current then
					local current = v12.current
					local v42 = v7.current - v8.current

					if v42 ~= 0 then
						if FFlagLuaAppHomeTouchAutoplay then
							if v16.current then
								v16.current(v42, current - v11.current, v8.current)
							end
						else
							v16.current(v42, current - v11.current, v8.current)
						end
					end

					if v9.current then
						v9.current:Disconnect()
					end

					v9.current = nil

					return
				end

				local v43 = nil
				local v44 = time()
				local v45 = v44 - v11.current

				if t1.scrollingFrameRef and t1.scrollingFrameRef.current then
					v43 = if t1.scrollingFrameRef.current.ScrollingDirection ~= Enum.ScrollingDirection.Y then t1.scrollingFrameRef.current.CanvasPosition.X else t1.scrollingFrameRef.current.CanvasPosition.Y
				end

				local v46 = v7.current - v8.current
				local v47 = v43 - v7.current

				if not v13.current and v47 == 0 then
					v13.current = v12.current
				elseif v13.current and v47 ~= 0 then
					v13.current = nil
				end

				if v13.current and v44 > v13.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 then
					v7.current = v43

					local current = v13.current
					local v49 = v7.current - v8.current

					if v49 ~= 0 then
						if FFlagLuaAppHomeTouchAutoplay then
							if v16.current then
								v16.current(v49, current - v11.current, v8.current)
							end
						else
							v16.current(v49, current - v11.current, v8.current)
						end
					end

					if FFlagLuaAppHomeTouchAutoplay and u15.current then
						local v50 = v7.current - v8.current

						u15.current(v50)
					end

					v8.current = v43

					local current2 = v9.current

					if current2 then
						current2:Disconnect()
					end

					v9.current = nil

					return
				end

				if v46 ~= 0 and v47 ~= 0 and math.sign(v46) ~= math.sign(v47) then
					local current = v12.current
					local v53 = v7.current - v8.current

					if v53 ~= 0 then
						if FFlagLuaAppHomeTouchAutoplay then
							if v16.current then
								v16.current(v53, current - v11.current, v8.current)
							end
						else
							v16.current(v53, current - v11.current, v8.current)
						end
					end

					v8.current = v7.current
					v11.current = v12.current
				elseif not v13.current and v45 >= game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 then
					v7.current = v43

					local v54 = v7.current - v8.current

					if v54 ~= 0 then
						if FFlagLuaAppHomeTouchAutoplay then
							if v16.current then
								v16.current(v54, v44 - v11.current, v8.current)
							end
						else
							v16.current(v54, v44 - v11.current, v8.current)
						end
					end

					v8.current = v43
					v11.current = v44
				end

				v7.current = v43
				v12.current = v44
			end
			local function v20() -- line: 154
				-- upvalues: v9 (copy), v11 (copy), v12 (copy), v8 (copy), v7 (copy), FFlagLuaAppHomeTouchAutoplay (copy), v13 (copy), u14 (ref), RunService (copy), v19 (copy)
				if not v9.current then
					v11.current = time()
					v12.current = v11.current
					v8.current = v7.current

					if FFlagLuaAppHomeTouchAutoplay then
						v13.current = nil

						if u14.current then
							u14.current()
						end
					end

					v9.current = RunService.Stepped:Connect(function() -- line: 169
						-- upvalues: v19 (copy)
						v19()
					end)
				end
			end

			local connection = nil

			if t1.scrollingFrameRef and (t1.scrollingFrameRef.current and v10.current ~= t1.scrollingFrameRef.current) then
				v7.current = if t1.scrollingFrameRef.current.ScrollingDirection ~= Enum.ScrollingDirection.Y then t1.scrollingFrameRef.current.CanvasPosition.X else t1.scrollingFrameRef.current.CanvasPosition.Y
				connection = t1.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() -- line: 187
					-- upvalues: v20 (copy)
					v20()
				end)
				v10.current = t1.scrollingFrameRef.current
			end

			return function() -- line: 194
				-- upvalues: v9 (copy), v12 (copy), v7 (copy), v8 (copy), FFlagLuaAppHomeTouchAutoplay (copy), v16 (copy), v11 (copy), u15 (ref), connection (ref), t1 (copy), v10 (copy)
				if v9.current then
					local current = v12.current
					local v56 = v7.current - v8.current

					if v56 ~= 0 then
						if FFlagLuaAppHomeTouchAutoplay then
							if v16.current then
								v16.current(v56, current - v11.current, v8.current)
							end
						else
							v16.current(v56, current - v11.current, v8.current)
						end
					end

					v9.current:Disconnect()

					if FFlagLuaAppHomeTouchAutoplay and u15.current then
						local v57 = v7.current - v8.current

						u15.current(v57)
					end
				end

				v9.current = nil

				if connection then
					connection:Disconnect()
				end

				connection = nil

				if not t1.scrollingFrameRef or not t1.scrollingFrameRef.current then
					v10.current = nil
				end
			end
		end, { t1.scrollingFrameRef })
	else
		local function v17() -- line: 239
			-- upvalues: t1 (copy), v12 (copy), v7 (copy), v8 (copy), FFlagLuaAppHomeTouchAutoplay (copy), v11 (copy), v9 (copy), v13 (copy), u15 (ref)
			if not t1.scrollingFrameRef or not t1.scrollingFrameRef.current then
				local current = v12.current
				local v25 = v7.current - v8.current

				if v25 ~= 0 then
					if FFlagLuaAppHomeTouchAutoplay then
						if t1.sendScrollEvent then
							t1.sendScrollEvent(v25, current - v11.current, v8.current)
						end
					else
						t1.sendScrollEvent(v25, current - v11.current, v8.current)
					end
				end

				if v9.current then
					v9.current:Disconnect()
				end

				v9.current = nil

				return
			end

			local v26 = nil
			local v27 = time()
			local v28 = v27 - v11.current

			if t1.scrollingFrameRef and t1.scrollingFrameRef.current then
				v26 = if t1.scrollingFrameRef.current.ScrollingDirection ~= Enum.ScrollingDirection.Y then t1.scrollingFrameRef.current.CanvasPosition.X else t1.scrollingFrameRef.current.CanvasPosition.Y
			end

			local v29 = v7.current - v8.current
			local v30 = v26 - v7.current

			if not v13.current and v30 == 0 then
				v13.current = v12.current
			elseif v13.current and v30 ~= 0 then
				v13.current = nil
			end

			if v13.current and v27 > v13.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 then
				v7.current = v26

				local current = v13.current
				local v32 = v7.current - v8.current

				if v32 ~= 0 then
					if FFlagLuaAppHomeTouchAutoplay then
						if t1.sendScrollEvent then
							t1.sendScrollEvent(v32, current - v11.current, v8.current)
						end
					else
						t1.sendScrollEvent(v32, current - v11.current, v8.current)
					end
				end

				if FFlagLuaAppHomeTouchAutoplay and u15.current then
					local v33 = v7.current - v8.current

					u15.current(v33)
				end

				v8.current = v26

				local current3 = v9.current

				if current3 then
					current3:Disconnect()
				end

				v9.current = nil

				return
			end

			if v29 ~= 0 and v30 ~= 0 and math.sign(v29) ~= math.sign(v30) then
				local current = v12.current
				local v36 = v7.current - v8.current

				if v36 ~= 0 then
					if FFlagLuaAppHomeTouchAutoplay then
						if t1.sendScrollEvent then
							t1.sendScrollEvent(v36, current - v11.current, v8.current)
						end
					else
						t1.sendScrollEvent(v36, current - v11.current, v8.current)
					end
				end

				v8.current = v7.current
				v11.current = v12.current
			elseif not v13.current and v28 >= game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 then
				v7.current = v26

				local v37 = v7.current - v8.current

				if v37 ~= 0 then
					if FFlagLuaAppHomeTouchAutoplay then
						if t1.sendScrollEvent then
							t1.sendScrollEvent(v37, v27 - v11.current, v8.current)
						end
					else
						t1.sendScrollEvent(v37, v27 - v11.current, v8.current)
					end
				end

				v8.current = v26
				v11.current = v27
			end

			v7.current = v26
			v12.current = v27
		end
		local function v18() -- line: 313
			-- upvalues: v9 (copy), v11 (copy), v12 (copy), v8 (copy), v7 (copy), FFlagLuaAppHomeTouchAutoplay (copy), v13 (copy), u14 (ref), RunService (copy), v17 (copy)
			if not v9.current then
				v11.current = time()
				v12.current = v11.current
				v8.current = v7.current

				if FFlagLuaAppHomeTouchAutoplay then
					v13.current = nil

					if u14.current then
						u14.current()
					end
				end

				v9.current = RunService.Stepped:Connect(function() -- line: 328
					-- upvalues: v17 (copy)
					v17()
				end)
			end
		end

		React.useEffect(function() -- line: 334
			-- upvalues: t1 (copy), v10 (copy), v7 (copy), v18 (copy), v9 (copy), v12 (copy), v8 (copy), FFlagLuaAppHomeTouchAutoplay (copy), v11 (copy), u15 (ref)
			local connection = nil

			if t1.scrollingFrameRef and (t1.scrollingFrameRef.current and v10.current ~= t1.scrollingFrameRef.current) then
				v7.current = if t1.scrollingFrameRef.current.ScrollingDirection ~= Enum.ScrollingDirection.Y then t1.scrollingFrameRef.current.CanvasPosition.X else t1.scrollingFrameRef.current.CanvasPosition.Y
				connection = t1.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() -- line: 347
					-- upvalues: v18 (copy)
					v18()
				end)
				v10.current = t1.scrollingFrameRef.current
			end

			return function() -- line: 354
				-- upvalues: v9 (copy), v12 (copy), v7 (copy), v8 (copy), FFlagLuaAppHomeTouchAutoplay (copy), t1 (copy), v11 (copy), u15 (ref), connection (ref), v10 (copy)
				if v9.current then
					local current = v12.current
					local v59 = v7.current - v8.current

					if v59 ~= 0 then
						if FFlagLuaAppHomeTouchAutoplay then
							if t1.sendScrollEvent then
								t1.sendScrollEvent(v59, current - v11.current, v8.current)
							end
						else
							t1.sendScrollEvent(v59, current - v11.current, v8.current)
						end
					end

					v9.current:Disconnect()

					if FFlagLuaAppHomeTouchAutoplay and u15.current then
						local v60 = v7.current - v8.current

						u15.current(v60)
					end
				end

				v9.current = nil

				if connection then
					connection:Disconnect()
				end

				connection = nil

				if not t1.scrollingFrameRef or not t1.scrollingFrameRef.current then
					v10.current = nil
				end
			end
		end, { t1.scrollingFrameRef })
	end

	return nil
end
