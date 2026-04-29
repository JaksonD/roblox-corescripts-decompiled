local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local TimeToInteractiveTrackerParent = TimeToInteractiveTracker.Parent
local v3 = require(TimeToInteractiveTracker.Logger):new(script.Name)
local SharedFlags = require(TimeToInteractiveTrackerParent.SharedFlags)
local FFlagAXTTIEnableMilestones = SharedFlags.FFlagAXTTIEnableMilestones
local FFlagLuaAppPerfTrackerUseLogger = SharedFlags.FFlagLuaAppPerfTrackerUseLogger

require(script.Parent.Parent.types)

local mergeTTIEventMetadata = require(script.Parent.Parent.Parent.Utils.mergeTTIEventMetadata)

return function(p1) -- line: 18
	-- upvalues: FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), FFlagAXTTIEnableMilestones (copy), mergeTTIEventMetadata (copy)
	return function(s1: string, p2) -- line: 19
		-- upvalues: p1 (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), FFlagAXTTIEnableMilestones (copy), mergeTTIEventMetadata (copy)
		p1(function(p3) -- line: 20
			-- upvalues: s1 (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), FFlagAXTTIEnableMilestones (copy), mergeTTIEventMetadata (copy), p2 (copy)
			local v12 = p3[s1]

			if v12 == nil then
				if FFlagLuaAppPerfTrackerUseLogger then
					v3:warning(`called before trackStart for eventName={ s1 }`)

					return p3
				end

				warn(`TimeToInteractiveTracker.updateMetadata called before trackStart for eventName={ s1 }`)

				return p3
			end

			local v13 = table.clone(p3)

			if FFlagAXTTIEnableMilestones then
				local v14 = table.clone(v12)

				v14.metadata = mergeTTIEventMetadata(v12.metadata, p2)
				v13[s1] = v14

				return v13
			end

			v13[s1] = {
				startTime = v12.startTime,
				endTime = v12.endTime,
				deltaMs = v12.deltaMs,
				sent = v12.sent,
				metadata = mergeTTIEventMetadata(v12.metadata, p2)
			}

			return v13
		end)
	end
end
