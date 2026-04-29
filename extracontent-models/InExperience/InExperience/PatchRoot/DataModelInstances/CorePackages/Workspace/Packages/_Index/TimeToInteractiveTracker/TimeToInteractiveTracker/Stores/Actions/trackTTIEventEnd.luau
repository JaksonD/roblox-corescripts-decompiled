local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local TimeToInteractiveTrackerParent = TimeToInteractiveTracker.Parent
local v3 = require(TimeToInteractiveTracker.Logger):new(script.Name)
local SharedFlags = require(TimeToInteractiveTrackerParent.SharedFlags)
local FFlagAXTTIEnableMilestones = SharedFlags.FFlagAXTTIEnableMilestones
local FFlagLuaAppPerfTrackerUseLogger = SharedFlags.FFlagLuaAppPerfTrackerUseLogger

require(script.Parent.Parent.types)

local now = require(script.Parent.Parent.Parent.Utils.now)
local sendTTIStat = require(TimeToInteractiveTracker.Utils.sendTTIStat)
local mergeTTIEventMetadata = require(TimeToInteractiveTracker.Utils.mergeTTIEventMetadata)
local Util = require(TimeToInteractiveTracker.Utils.Util)

return function(p1) -- line: 23
	-- upvalues: FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), now (copy), mergeTTIEventMetadata (copy), FFlagAXTTIEnableMilestones (copy), Util (copy), sendTTIStat (copy)
	return function(s1: string, p2) -- line: 24
		-- upvalues: p1 (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), now (copy), mergeTTIEventMetadata (copy), FFlagAXTTIEnableMilestones (copy), Util (copy), sendTTIStat (copy)
		local u14 = nil
		local u15 = nil
		local milestones = nil
		local u17 = false
		local v18 = not p2 or (p2.cleanupAfterSend == nil or p2.cleanupAfterSend)
		local v19 = if not p2 then nil else p2.samplingRateOverride

		p1(function(p3) -- line: 34
			-- upvalues: s1 (copy), FFlagLuaAppPerfTrackerUseLogger (copy), v3 (copy), now (copy), u14 (ref), u17 (ref), u15 (ref), mergeTTIEventMetadata (copy), FFlagAXTTIEnableMilestones (copy), milestones (ref), v18 (copy), Util (copy)
			local v21 = p3[s1]

			if v21 == nil then
				if FFlagLuaAppPerfTrackerUseLogger then
					v3:warning(`called before trackStart for eventName={ s1 }`)

					return p3
				end

				warn(`TimeToInteractiveTracker.trackEnd called before trackStart for eventName={ s1 }`)

				return p3
			end

			if v21.startTime == nil then
				if FFlagLuaAppPerfTrackerUseLogger then
					v3:warning(`called before trackStart for eventName={ s1 }`)

					return p3
				end

				warn(`TimeToInteractiveTracker.trackEnd called before trackStart for eventName={ s1 }`)

				return p3
			end

			local v22 = now()

			u14 = (v22 - v21.startTime) * 1000
			u17 = v21.sent ~= true

			if u17 then
				local startTime = v21.startTime
				local v24 = u14

				u15 = mergeTTIEventMetadata(v21.metadata, {
					startTime = startTime,
					endTime = v22,
					deltaMs = v24
				})

				if FFlagAXTTIEnableMilestones and v21.milestones then
					milestones = v21.milestones
				end
			end

			local v25 = table.clone(p3)

			if u17 and v18 then
				v25[s1] = nil

				return v25
			end

			v25[s1] = {
				startTime = v21.startTime,
				endTime = v22,
				deltaMs = u14,
				sent = true,
				metadata = table.clone(v21.metadata),
				milestones = if not FFlagAXTTIEnableMilestones or not v21.milestones then nil else Util.deepCloneMilestones(v21.milestones)
			}

			return v25
		end)

		if u17 and (u14 ~= nil and u15 ~= nil) then
			sendTTIStat({
				statName = s1,
				deltaMs = u14,
				metaData = u15,
				samplingRateOverride = v19,
				milestones = if not FFlagAXTTIEnableMilestones then nil else milestones
			})
		end
	end
end
