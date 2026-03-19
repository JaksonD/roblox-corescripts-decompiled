local v0 = require(script.Constants);
local l_isInExperienceUIVREnabled_0 = require(script.Parent.SharedExperimentDefinition).isInExperienceUIVREnabled;
return {
    UIManager = require(script.UIManager), 
    Constants = v0, 
    registerRoactPanel = require(script.registerRoactPanel), 
    Panel3DInSpatialUI = if l_isInExperienceUIVREnabled_0 then require(script.Panel3DInSpatialUI) else nil, 
    ["jest.config"] = script["jest.config"]
};