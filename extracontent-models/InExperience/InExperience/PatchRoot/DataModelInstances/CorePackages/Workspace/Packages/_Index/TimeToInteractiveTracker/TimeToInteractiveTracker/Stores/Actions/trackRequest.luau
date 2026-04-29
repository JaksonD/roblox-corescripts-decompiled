local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local TimeToInteractiveTrackerParent = TimeToInteractiveTracker.Parent
local v3 = require(TimeToInteractiveTracker.Logger):new(script.Name)
local FFlagLuaAppPerfTrackerUseLogger = require(TimeToInteractiveTrackerParent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger

require(script.Parent.Parent.types)

local now = require(TimeToInteractiveTracker.Utils.now)
local Util = require(TimeToInteractiveTracker.Utils.Util)

return function(p1, p2) -- line: 20
	-- upvalues: now (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), Util (copy)
	return function(s1: string, p3, s2: string) -- line: 21
		-- upvalues: now (copy), p1 (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), p2 (copy), Util (copy)
		local v12 = now()
		local v13 = p1(false)[s1]

		if not v13 or not v13.startTime then
			if FFlagLuaAppPerfTrackerUseLogger then
				v3:warning(`called before trackStart for eventName={ s1 }`)

				return
			end

			warn(`TimeToInteractiveTracker.trackRequest called before trackStart for eventName={ s1 }`)

			return
		end

		local v14 = (v12 - v13.startTime) * 1000
		local t1 = {
			name = s2,
			timestamp = v12,
			deltaMs = v14
		}

		p2(function(p4) -- line: 42
			-- upvalues: s1 (copy), Util (copy), p3 (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), t1 (copy)
			local v17 = p4[s1]

			if not v17 or not v17.milestones then
				return p4
			end

			local v18 = Util.findLastMilestoneIndex(v17.milestones, p3)

			if not v18 then
				if FFlagLuaAppPerfTrackerUseLogger then
					v3:warning(`no milestone "{ p3 }" found for eventName={ s1 }`)

					return p4
				end

				warn(`TimeToInteractiveTracker.trackRequest: no milestone "{ p3 }" found for eventName={ s1 }`)

				return p4
			end

			local v19 = table.clone(p4)
			local v20 = table.clone(v17)
			local v21 = table.clone(v17.milestones)
			local v22 = table.clone(v21[v18])
			local v23 = if not v22.requests then {} else table.clone(v22.requests)

			table.insert(v23, t1)
			v22.requests = v23
			v21[v18] = v22
			v20.milestones = v21
			v19[s1] = v20

			return v19
		end)
	end
end
