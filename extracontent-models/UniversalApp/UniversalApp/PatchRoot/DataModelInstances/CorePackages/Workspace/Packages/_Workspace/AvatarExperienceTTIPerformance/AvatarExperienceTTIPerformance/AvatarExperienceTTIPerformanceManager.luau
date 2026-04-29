local Parent = script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local FFlagAXTTIEnableMilestones = require(Parent.SharedFlags).FFlagAXTTIEnableMilestones
local FFlagAXTTIEditorEnableMilestones = require(Parent.AvatarExperienceFlags).FFlagAXTTIEditorEnableMilestones
local TTIMetricNames = require(script.Parent.TTIMetricNames)

local function createSurface(t1: {[any]: any}) -- line: 49
	-- upvalues: TimeToInteractiveTracker (copy), FFlagAXTTIEnableMilestones (copy)
	local function batchStart(b1: boolean?, p1) -- line: 50
		-- upvalues: t1 (copy), TimeToInteractiveTracker (copy)
		for _, v20 in t1 do
			local v21 = "AvatarExperience_" .. v20

			if b1 then
				v21 ..= "_Percieved"
			end

			TimeToInteractiveTracker.trackStart(v21)

			if p1 then
				TimeToInteractiveTracker.updateMetadata(v21, p1)
			end
		end
	end

	return {
		eventNames = t1,
		startTracking = function(p2) --[[ startTracking ]] -- line: 70
			-- upvalues: batchStart (copy)
			batchStart(false, p2)
		end,
		startPerceivedTracking = function(p3) --[[ startPerceivedTracking ]] -- line: 74
			-- upvalues: batchStart (copy)
			batchStart(true, p3)
		end,
		endTracking = function(p4, p5) --[[ endTracking ]] -- line: 78
			-- upvalues: TimeToInteractiveTracker (copy)
			local v31 = "AvatarExperience_" .. p4

			if p5 then
				TimeToInteractiveTracker.updateMetadata(v31, p5)
			end

			TimeToInteractiveTracker.trackEnd(v31, nil)
		end,
		endPerceivedTracking = function(p6, p7) --[[ endPerceivedTracking ]] -- line: 82
			-- upvalues: TimeToInteractiveTracker (copy)
			local v34 = ("AvatarExperience_" .. p6) .. "_Percieved"
			local v35 = TimeToInteractiveTracker.getEvents()

			if v35 == nil or v35[v34] == nil then
				return
			end

			if p7 then
				TimeToInteractiveTracker.updateMetadata(v34, p7)
			end

			TimeToInteractiveTracker.trackEnd(v34, {
				cleanupAfterSend = false
			})
		end,
		updateMetadata = function(p8, p9) --[[ updateMetadata ]] -- line: 86
			-- upvalues: TimeToInteractiveTracker (copy)
			local v38 = "AvatarExperience_" .. p8

			if p9 then
				TimeToInteractiveTracker.updateMetadata(v38, p9)
			end
		end,
		trackMilestone = if not FFlagAXTTIEnableMilestones or not TimeToInteractiveTracker.trackMilestone then nil else function(p10, p11, p12) -- line: 91
			-- upvalues: TimeToInteractiveTracker (copy)
			TimeToInteractiveTracker.trackMilestone("AvatarExperience_" .. p10, p11, p12)
		end,
		trackSubphase = if not FFlagAXTTIEnableMilestones or not TimeToInteractiveTracker.trackSubphase then nil else function(p13, p14, p15) -- line: 97
			-- upvalues: TimeToInteractiveTracker (copy)
			TimeToInteractiveTracker.trackSubphase("AvatarExperience_" .. p13, p14, p15)
		end,
		trackRequest = if not FFlagAXTTIEnableMilestones or not TimeToInteractiveTracker.trackRequest then nil else function(p16, p17, s1: string) -- line: 103
			-- upvalues: TimeToInteractiveTracker (copy)
			TimeToInteractiveTracker.trackRequest("AvatarExperience_" .. p16, p17, s1)
		end
	}
end

return {
	Surface = {
		Marketplace = {
			Root = createSurface({
				TTIMetricNames.Marketplace.OrganicTiles,
				TTIMetricNames.Marketplace.OrganicThumbnails,
				TTIMetricNames.Marketplace.WidgetTiles,
				TTIMetricNames.Marketplace.WidgetThumbnails
			})
		},
		AvatarEditor = if not FFlagAXTTIEditorEnableMilestones then nil else {
			Root = createSurface({
				TTIMetricNames.Editor.InventoryTiles,
				TTIMetricNames.Editor.InventoryThumbnails
			})
		}
	},
	Milestone = Milestone,
	TTIMetricNames = TTIMetricNames
}
