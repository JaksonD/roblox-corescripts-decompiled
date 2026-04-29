local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local TimeToInteractiveTrackerParent = TimeToInteractiveTracker.Parent
local v3 = require(TimeToInteractiveTracker.Logger):new(script.Name)
local FFlagLuaAppPerfTrackerUseLogger = require(TimeToInteractiveTrackerParent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger

require(script.Parent.Parent.types)

local now = require(TimeToInteractiveTracker.Utils.now)

return function(p1, p2) -- line: 19
	-- upvalues: now (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy)
	return function(s1: string, p3, p4) -- line: 20
		-- upvalues: now (copy), p1 (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), p2 (copy)
		local v11 = now()
		local v12 = p1(false)[s1]

		if not v12 or not v12.startTime then
			if FFlagLuaAppPerfTrackerUseLogger then
				v3:warning(`called before trackStart for eventName={ s1 }`)

				return
			end

			warn(`TimeToInteractiveTracker.trackMilestone called before trackStart for eventName={ s1 }`)

			return
		end

		local v13 = (v11 - v12.startTime) * 1000
		local t1 = {
			name = p3,
			id = if not p4 then nil else p4.id,
			timestamp = v11,
			deltaMs = v13
		}

		p2(function(p5) -- line: 42
			-- upvalues: s1 (copy), t1 (copy)
			local v16 = p5[s1]

			if not v16 then
				return p5
			end

			local v17 = table.clone(p5)
			local v18 = table.clone(v16)
			local v19 = if not v18.milestones then {} else table.clone(v18.milestones)

			table.insert(v19, t1)
			v18.milestones = v19
			v17[s1] = v18

			return v17
		end)
	end
end
