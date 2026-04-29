local Parent = script:FindFirstAncestor("AvatarExperienceTTIPerformance").Parent
local FFlagAXTTIEditorEnableMilestones = require(Parent.AvatarExperienceFlags).FFlagAXTTIEditorEnableMilestones
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local v5 = "AvatarExperience_" .. require(script.Parent.TTIMetricNames).Editor.InventoryThumbnails
local t1 = {
	GetUserInventoryV2Started = "GetUserInventoryV2Started",
	GetUserInventoryV2Completed = "GetUserInventoryV2Completed",
	GetUserInventoryStarted = "GetUserInventoryStarted",
	GetUserInventoryCompleted = "GetUserInventoryCompleted",
	GetOutfitsStarted = "GetOutfitsStarted",
	GetOutfitsCompleted = "GetOutfitsCompleted"
}
local t2 = {
	GetUprankedItems = "GetUprankedItems",
	BatchGetOutfits = "BatchGetOutfits",
	GetRecommendedItems = "GetRecommendedItems",
	GetAvatarData = "GetAvatarData"
}

if FFlagAXTTIEditorEnableMilestones then
	return {
		CustomSubphases = t1,
		Requests = t2,
		Hooks = {
			useRenderAndMountedTracking = function() --[[ useRenderAndMountedTracking ]] -- line: 36
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy)
				TimeToInteractiveTracker.Hooks.useTTIRenderAndMountedTracking(v5)
			end
		},
		L2 = {
			primaryDataStarted = function() --[[ primaryDataStarted ]] -- line: 42
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackMilestone(v5, Milestone.PrimaryDataStarted.Name)
			end,
			primaryDataReady = function() --[[ primaryDataReady ]] -- line: 45
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackMilestone(v5, Milestone.PrimaryDataReady.Name)
			end,
			dataProcessingStarted = function() --[[ dataProcessingStarted ]] -- line: 48
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackMilestone(v5, Milestone.DataProcessingStarted.Name)
			end,
			dataProcessingCompleted = function() --[[ dataProcessingCompleted ]] -- line: 51
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackMilestone(v5, Milestone.DataProcessingCompleted.Name)
			end,
			functionallyReady = function() --[[ functionallyReady ]] -- line: 54
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackMilestone(v5, Milestone.FunctionallyReady)
			end,
			surfaceReady = function() --[[ surfaceReady ]] -- line: 57
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackMilestone(v5, Milestone.SurfaceReady)
			end
		},
		L3 = {
			networkFetch = function() --[[ networkFetch ]] -- line: 64
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, Milestone.PrimaryDataStarted.Subphase.NetworkFetch)
			end,
			responseReceived = function() --[[ responseReceived ]] -- line: 71
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, Milestone.PrimaryDataStarted.Subphase.ResponseReceived)
			end,
			getInventoryV2Started = function() --[[ getInventoryV2Started ]] -- line: 80
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t1 (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, t1.GetUserInventoryV2Started)
			end,
			getInventoryV2Completed = function() --[[ getInventoryV2Completed ]] -- line: 87
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t1 (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, t1.GetUserInventoryV2Completed)
			end,
			getInventoryStarted = function() --[[ getInventoryStarted ]] -- line: 96
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t1 (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, t1.GetUserInventoryStarted)
			end,
			getInventoryCompleted = function() --[[ getInventoryCompleted ]] -- line: 103
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t1 (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, t1.GetUserInventoryCompleted)
			end,
			getOutfitsStarted = function() --[[ getOutfitsStarted ]] -- line: 112
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t1 (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, t1.GetOutfitsStarted)
			end,
			getOutfitsCompleted = function() --[[ getOutfitsCompleted ]] -- line: 119
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t1 (copy)
				TimeToInteractiveTracker.trackSubphase(v5, Milestone.PrimaryDataStarted.Name, t1.GetOutfitsCompleted)
			end,
			requestGetUprankedItems = function() --[[ requestGetUprankedItems ]] -- line: 128
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t2 (copy)
				TimeToInteractiveTracker.trackRequest(v5, Milestone.PrimaryDataReady.Name, t2.GetUprankedItems)
			end,
			requestBatchGetOutfits = function() --[[ requestBatchGetOutfits ]] -- line: 135
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t2 (copy)
				TimeToInteractiveTracker.trackRequest(v5, Milestone.PrimaryDataReady.Name, t2.BatchGetOutfits)
			end,
			requestGetRecommendedItems = function() --[[ requestGetRecommendedItems ]] -- line: 142
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t2 (copy)
				TimeToInteractiveTracker.trackRequest(v5, Milestone.PrimaryDataReady.Name, t2.GetRecommendedItems)
			end,
			requestGetAvatarData = function() --[[ requestGetAvatarData ]] -- line: 149
				-- upvalues: TimeToInteractiveTracker (copy), v5 (copy), Milestone (copy), t2 (copy)
				TimeToInteractiveTracker.trackRequest(v5, Milestone.PrimaryDataReady.Name, t2.GetAvatarData)
			end
		}
	}
end

return nil
