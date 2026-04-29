local AvatarExperienceTTIPerformanceManager = require(script.AvatarExperienceTTIPerformanceManager)
local TTIMetricNames = require(script.TTIMetricNames)
local WidgetsPercievedTTIManager = require(script.WidgetsPercievedTTIManager)
local OrganicTTIMilestoneManager = require(script.OrganicTTIMilestoneManager)
local EditorInventoryTTIMilestoneManager = require(script.EditorInventoryTTIMilestoneManager)
local FFlagAXTTIEnableMilestones = require(script.Parent.SharedFlags).FFlagAXTTIEnableMilestones
local FFlagAXTTIEditorEnableMilestones = require(script.Parent.AvatarExperienceFlags).FFlagAXTTIEditorEnableMilestones

return {
	TTIPerformanceManager = AvatarExperienceTTIPerformanceManager,
	TTIMetricNames = TTIMetricNames,
	WidgetsPercievedTTIManager = if not FFlagAXTTIEnableMilestones then nil else WidgetsPercievedTTIManager,
	OrganicTTIMilestoneManager = if not FFlagAXTTIEnableMilestones then nil else OrganicTTIMilestoneManager,
	EditorInventoryTTIMilestoneManager = if not FFlagAXTTIEditorEnableMilestones then nil else EditorInventoryTTIMilestoneManager,
	["jest.config"] = script["jest.config"]
}
