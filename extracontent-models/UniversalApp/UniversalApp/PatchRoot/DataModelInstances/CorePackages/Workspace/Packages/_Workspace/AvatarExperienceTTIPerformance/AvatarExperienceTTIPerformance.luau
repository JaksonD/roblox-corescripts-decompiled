local v0 = require(script.AvatarExperienceTTIPerformanceManager);
local v1 = require(script.TTIMetricNames);
local v2 = require(script.WidgetsPercievedTTIManager);
local v3 = require(script.OrganicTTIMilestoneManager);
local l_FFlagAXTTIEnableMilestones_0 = require(script.Parent.SharedFlags).FFlagAXTTIEnableMilestones;
return {
    TTIPerformanceManager = v0, 
    TTIMetricNames = v1, 
    WidgetsPercievedTTIManager = if l_FFlagAXTTIEnableMilestones_0 then v2 else nil, 
    OrganicTTIMilestoneManager = if l_FFlagAXTTIEnableMilestones_0 then v3 else nil, 
    ["jest.config"] = script["jest.config"]
};